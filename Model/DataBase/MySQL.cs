﻿using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Reflection;
using System.Windows;
using MySql.Data.MySqlClient;

namespace Prosperity.Model.DataBase
{
    public class MySQL : Sql
    {
        private const string PublishSource =
            @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = ";
        private const string PublishLocation =
            @"\Resources\Database\DesertRageGame.mdf; Integrated Security = True";
        public MySQL()
        {
            Con = ParentServerConnection();
        }
        
        public static MySqlConnection NewConnection(string path)
        {
            return new MySqlConnection(path);
        }
        //[EN] Publishing experimental
        //[RU] Публикация-эксперимент
        public static MySqlConnection PublishExperimentalConnection()
        {
            return NewConnection(PublishSource +
                Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)
                + PublishLocation);
        }
        //[EN] Server connection
        //[RU] Подключение через сервер (ПК создателя)
        public static MySqlConnection ParentServerConnection()
        {
            string source = "SERVER=127.0.0.1;";
            string catalog = "DATABASE=prosperity;";
            string user = "UID=root;";
            string pass = "PASSWORD=;";
            return NewConnection(source + catalog + user + pass);
        }
        //[EN] Local connection
        //[RU] Подключение локально
        public static MySqlConnection LocalConnection()
        {
            return NewConnection(PublishSource +
                Directory.GetParent(Environment.CurrentDirectory)
                .Parent.Parent.FullName + PublishLocation);
        }
        //[EN] Publishing local connection
        //[RU] Публикация с локальным подключением
        public static MySqlConnection PublishLocalConnection()
        {
            return NewConnection(PublishSource +
                Environment.CurrentDirectory + PublishLocation);
        }

        public override void Procedure(in string name)
        {
            Cmd = new MySqlCommand(name, Con)
            {
                CommandType = CommandType.StoredProcedure
            };
        }

        public override void OnlyExecute()
        {
            try
            {
                Cmd.Connection.Open();
                _ = Cmd.ExecuteNonQuery();
            }
            catch (MySqlException exception)
            {
                string problem = "полные данные из источника";
                string fullMessage = $"{exception.ErrorCode} {exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            catch (InvalidOperationException exception)
            {
                string problem = "неподдерживаемая операция";
                string fullMessage = $"{exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            catch (Exception exception)
            {
                string problem = "программный сбой";
                string fullMessage = $"{exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            finally
            {
                Cmd.Connection.Close();
            }
        }

        public override List<object[]> ReadData()
        {
            List<object[]> table = new List<object[]>();
            try
            {
                Cmd.Connection.Open();
                DataReader = Cmd.ExecuteReader();
                if (DataReader.HasRows)
                    while (DataReader.Read())
                    {
                        object[] row = new object[DataReader.FieldCount];
                        for (int i = 0; i < DataReader.FieldCount; i++)
                            row[i] = DataReader.GetValue(i);
                        table.Add(row);
                    }
            }
            catch (MySqlException exception)
            {
                string problem = "полные данные из источника";
                string fullMessage = $"{exception.ErrorCode} {exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            catch (InvalidOperationException exception)
            {
                string problem = "неподдерживаемая операция";
                string fullMessage = $"{exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            catch (Exception exception)
            {
                string problem = "программный сбой";
                string fullMessage = $"{exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            finally
            {
                DataReader.Close();
                Cmd.Connection.Close();
            }
            return table;
        }

        public override List<object> ReadData(in int column)
        {
            List<object> table = new List<object>();
            try
            {
                Cmd.Connection.Open();
                DataReader = Cmd.ExecuteReader();
                if (DataReader.HasRows)
                    while (DataReader.Read())
                    {
                        object cell = DataReader.GetValue(column);
                        table.Add(cell);
                    }
            }
            catch (MySqlException exception)
            {
                string problem = "выборочные данные из источника";
                string fullMessage = $"{exception.ErrorCode} {exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            catch (InvalidOperationException exception)
            {
                string problem = "неподдерживаемая операция";
                string fullMessage = $"{exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            catch (Exception exception)
            {
                string problem = "программный сбой";
                string fullMessage = $"{exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            finally
            {
                DataReader.Close();
                Cmd.Connection.Close();
            }
            return table;
        }

        public override List<object[]> ReadData(in byte StartValue, in byte EndValue)
        {
            List<object[]> table = new List<object[]>();
            try
            {
                Cmd.Connection.Open();
                DataReader = Cmd.ExecuteReader();
                int count = EndValue - StartValue;
                if (DataReader.HasRows)
                    while (DataReader.Read())
                    {
                        object[] row = new object[count];
                        for (int i = 0, j = StartValue; j < EndValue; i++, j++)
                            row[i] = DataReader.GetValue(j);
                        table.Add(row);
                    }
            }
            catch(MySqlException exception)
            {
                string problem = "выборочные данные из источника";
                string fullMessage = $"{exception.ErrorCode} {exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            catch (InvalidOperationException exception)
            {
                string problem = "неподдерживаемая операция";
                string fullMessage = $"{exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            catch (Exception exception)
            {
                string problem = "программный сбой";
                string fullMessage = $"{exception.HelpLink}\n{exception.Message}";
                ConnectionMessage(problem, fullMessage);
            }
            finally
            {
                DataReader.Close();
                Cmd.Connection.Close();
            }
            
            return table;
        }

        public override void PassParameter(in string ParamName, in object newParam)
        {
            Dictionary<string, MySqlDbType> types = new Dictionary<string, MySqlDbType>()
            {
                { "Boolean", MySqlDbType.Bit }, { "UInt16", MySqlDbType.UInt16 }, //SqlDbType.SmallInt
                { "Byte", MySqlDbType.UByte }, { "String", MySqlDbType.VarChar }, //MySqlDbType.TinyInt
                { "UInt32", MySqlDbType.UInt32 }, { "UInt64", MySqlDbType.UInt64 }
            };
            Cmd.Parameters.Add(ParamName, types[newParam.GetType().Name]).Value = newParam;
        }

        public override void ClearParameters()
        {
            Cmd.Parameters.Clear();
        }

        private static void ConnectionMessage(string loadProblem, string exception)
        {
            string noLoad = "Не удалось обработать: ";
            string message = "\nОшибка подключения. Вы не можете продолжать работу.\n";
            string advice = "Свяжитесь с администратором насчет установления причины проблемы.\nПолное сообщение:\n";

            string caption = "Ошибка";
            string fullMessage = noLoad + loadProblem + message + advice + exception;
            _ = MessageBox.Show(fullMessage, caption, MessageBoxButton.OK, MessageBoxImage.Error);
        }

        public MySqlCommand Cmd { get; set; }
        public MySqlDataReader DataReader { get; set; }
        public MySqlConnection Con { get; set; }
    }
}