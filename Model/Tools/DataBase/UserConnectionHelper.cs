using System;
using System.Collections.Generic;
using System.IO;
using Microsoft.Win32;
using Serilog;

namespace Prosperity.Model.Tools.DataBase
{
    internal static class UserConnectionHelper
    {
        private static string _appDirectory => Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName;
        private const string LoginFile = "/Resources/Data/Login.txt";
        private const string PathFile = "/Resources/Data/Path.txt";

        internal static bool FileConnection()
        {
            bool connectionSuccessful = false;
            string name = _appDirectory + LoginFile;
            if (File.Exists(name))
            {
                Pair<string, string> initials = ReadFromTextFile(name);
                connectionSuccessful = MySQL.TestConnection(initials.Name, initials.Value);
            }
            return connectionSuccessful;
        }

        internal static bool Connect()
        {
            bool connectionSuccessful = false;
            EntryWindow entry = new EntryWindow();
            while (!connectionSuccessful && entry.ShowDialog().Value)
            {
                connectionSuccessful = MySQL.TestConnection(entry.Login, entry.Pass);
                if (!connectionSuccessful)
                    entry = new EntryWindow();
            }
            if (entry.MemberMe)
                WriteLogin(entry.Login, entry.Pass);
            return connectionSuccessful;
        }

        internal static void ResetConfiguration()
        {
            OpenFileDialog fileDialog = new OpenFileDialog();
            if (fileDialog.ShowDialog().Value)
            {
                WriteConfigPath(fileDialog.FileName);
            }
            SetConfiguration();
        }

        internal static void SetConfiguration()
        {
            string pathFile = _appDirectory + PathFile;
            if (!File.Exists(pathFile))
                return;
            string fileName = PathFromFile(pathFile);
            if (!File.Exists(fileName))
                return;
            Pair<string, string> config = ReadFromTextFile(fileName);
            MySQL.SetConfig(config.Name, config.Value);
        }

        private static string PathFromFile(string name)
        {
            string path = "";
            List<string> lines = new List<string>();
            try
            {
                using (StreamReader reader = new StreamReader(name))
                {
                    string line;
                    while ((line = reader.ReadLine()) != null)
                        lines.Add(line);
                }
                if (lines.Count >= 1)
                    path = lines[0];
            }
            catch (IOException exception)
            {
                Log.Error("Wrong configuration path: " + exception.Message);
            }
            return path;
        }

        private static Pair<string, string> ReadFromTextFile(string name)
        {
            Pair<string, string> initials = new Pair<string, string>();
            List<string> lines = new List<string>();
            try
            {
                using (StreamReader reader = new StreamReader(name))
                {
                    string line;
                    while ((line = reader.ReadLine()) != null)
                        lines.Add(line);
                }
                if (lines.Count >= 2)
                {
                    initials.Name = lines[0];
                    initials.Value = lines[1];
                }
            }
            catch (IOException exception)
            {
                Log.Error("Unable to read user data from file: " + exception.Message);
            }
            return initials;
        }

        private static void WriteConfigPath(string path)
        {
            WriteToTextFile(_appDirectory + PathFile, new List<string> { path });
        }

        private static void WriteLogin(string name, string pass)
        {
            WriteToTextFile(_appDirectory + LoginFile, new List<string> { name, pass });
        }

        private static void WriteToTextFile(string fullPath, List<string> lines)
        {
            try
            {
                File.WriteAllLines(fullPath, lines);
            }
            catch (IOException exception)
            {
                Log.Error("Unable to write user data in file: " + exception.Message);
            }
        }
    }
}