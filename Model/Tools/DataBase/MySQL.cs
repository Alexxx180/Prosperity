using System;
using System.Collections.Generic;
using System.Data;
using MySqlConnector;
using Serilog;
using ControlMaterials;
using static ControlMaterials.Tools.Security.Encryption;
using static Prosperity.Writers.Processors;

namespace Prosperity.Model.Tools.DataBase
{
    /// <summary>
    /// Connection to database via MySQL
    /// </summary>
    public class MySQL : Sql
    {
        private static string _dataBaseName;
        private static string _hostName;

        public MySQL()
        {
            ResetConfiguration();
        }

        #region Configuration Members
        private void ResetConfiguration()
        {
            Pair<string, string> config = LoadRuntime<string>("Config.json");
            SetConfiguration(config.Name, config.Value);
        }

        internal void NewConfiguration(string host, string dbName)
        {
            SaveRuntime("Config.json",
                new Pair<string, string>
                (host, dbName));
            ResetConfiguration();
        }

        private void LoginMemory(string login, string pass)
        {
            SaveRuntime("Data.json",
                new Pair<string, byte[]>
                (login, ProtectData(pass)));
        }
        #endregion

        #region Connection Members
        private bool FileConnection()
        {
            Pair<string, byte[]>
                initials = LoadRuntime<byte[]>("Data.json");

            bool connectionSuccessful =
                !(initials is null ||
                (initials.Name is null) ||
                (initials.Value is null))
                && TestConnection(
                    initials.Name,
                    UnprotectData(initials.Value)
                );

            return connectionSuccessful;
        }

        internal override bool Connect()
        {
            if (FileConnection())
                return true;

            bool userAgreement, connectionSuccessful = false;
            EntryWindow entry;

            do
            {
                entry = new EntryWindow();
                userAgreement = entry.ShowDialog().Value;

                if (entry.NewConfig)
                {
                    NewConfiguration(entry.Login, entry.Pass);
                    entry = new EntryWindow();
                    continue;
                }

                if (!userAgreement)
                {
                    IndependentMode = true;
                    break;
                }

                connectionSuccessful =
                    TestConnection
                    (entry.Login, entry.Pass);
            }
            while (!connectionSuccessful);

            if (entry.MemberMe)
            {
                LoginMemory(entry.Login, entry.Pass);
            }

            return connectionSuccessful;
        }
        #endregion

        internal override void SetConfiguration
            (in string dataBase, in string host)
        {
            _dataBaseName = dataBase;
            _hostName = host;
        }

        private static void ConnectionFault(string message)
        {
            Log.Warning("Tried to connect to DB, no sucess: " + message);
        }

        public override bool TestConnection
            (in string login, in string password)
        {
            MySqlConnection test = EnterConnection(login, password);
            try
            {
                test.Open();
                _connection = test;
                UserName = login;
            }
            catch (MySqlException dbException)
            {
                ConnectionFault(dbException.HelpLink);
            }
            catch (InvalidOperationException operationException)
            {
                ConnectionFault(operationException.HelpLink);
            }
            catch (Exception exception)
            {
                ConnectionFault(exception.HelpLink);
            }
            finally
            {
                test.Close();
            }
            return !(_connection is null);
        }

        public static MySqlConnection NewConnection(string path)
        {
            return new MySqlConnection(path);
        }

        // Server connection
        private static MySqlConnection EnterConnection(
            string login, string password)
        {
            string source = "SERVER=" + _hostName + ";";
            string catalog = "DATABASE=" + _dataBaseName + ";";
            string user = "UID=" + login + ";";
            string pass = "PASSWORD=" + password + ";";
            return NewConnection(source + catalog + user + pass);
        }

        public override void Procedure(in string name)
        {
            Cmd = new MySqlCommand(name, _connection)
            {
                CommandType = CommandType.StoredProcedure
            };
        }

        #region ProcessData Members
        public override void OnlyExecute()
        {
            try
            {
                Cmd.Connection.Open();
                _ = Cmd.ExecuteNonQuery();
            }
            catch (MySqlException dbException)
            {
                MySqlMessage(dbException, "выборочные данные в источнике");
            }
            catch (InvalidOperationException operationException)
            {
                NetMessage(operationException, "неподдерживаемая операция");
            }
            catch (Exception exception)
            {
                NetMessage(exception, "программный сбой");
            }
            finally
            {
                Cmd.Connection.Close();
            }
        }

        public override object ReadScalar()
        {
            Log.Debug("Reading aggregate value from DB table...");
            object field = null;
            try
            {
                Cmd.Connection.Open();
                field = Cmd.ExecuteScalar();
            }
            catch (MySqlException dbException)
            {
                MySqlMessage(dbException, "агрегатное значение из источника");
            }
            catch (InvalidOperationException operationException)
            {
                NetMessage(operationException, "неподдерживаемая операция");
            }
            catch (Exception exception)
            {
                NetMessage(exception, "программный сбой");
            }
            finally
            {
                Cmd.Connection.Close();
            }
            return field;
        }

        public override List<object[]> ReadData()
        {
            List<object[]> table = new List<object[]>();
            try
            {
                Cmd.Connection.Open();
                using (DataReader = Cmd.ExecuteReader())
                {
                    if (DataReader.HasRows)
                        while (DataReader.Read())
                        {
                            object[] row = new object[DataReader.FieldCount];
                            for (int i = 0; i < DataReader.FieldCount; i++)
                                row[i] = DataReader.GetValue(i);
                            table.Add(row);
                        }
                }
            }
            catch (MySqlException dbException)
            {
                MySqlMessage(dbException, "полные данные из источника");
            }
            catch (InvalidOperationException operationException)
            {
                NetMessage(operationException, "неподдерживаемая операция");
            }
            catch (Exception exception)
            {
                NetMessage(exception, "программный сбой");
            }
            finally
            {
                Cmd.Connection.Close();
            }
            return table;
        }
        #endregion

        public override void PassParameter(in string ParamName, in object newParam)
        {
            Dictionary<string, MySqlDbType> types = new Dictionary<string, MySqlDbType>()
            {
                { "Boolean", MySqlDbType.Bit }, { "UInt16", MySqlDbType.UInt16 },
                { "Byte", MySqlDbType.UByte }, { "String", MySqlDbType.VarChar },
                { "UInt32", MySqlDbType.UInt32 }, { "UInt64", MySqlDbType.UInt64 }
            };
            Cmd.Parameters.Add(ParamName, types[newParam.GetType().Name]).Value = newParam;
        }

        public override void ClearParameters()
        {
            Cmd.Parameters.Clear();
        }

        private static void MySqlMessage(MySqlException exception, string problem)
        {
            string fullMessage = $"Error: {exception.ErrorCode}\n{exception.HelpLink}\n{exception.Message}";
            Log.Error("Operation was interrupted: " + exception.Message);
            ConnectionMessage(problem, fullMessage);
        }

        public MySqlCommand Cmd { get; set; }
        public MySqlDataReader DataReader { get; set; }
        private MySqlConnection _connection { get; set; }
    }
}