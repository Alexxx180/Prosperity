﻿using System.Windows;
using Serilog;

namespace Prosperity
{
    /// <summary>
    /// App interaction logic
    /// </summary>
    public partial class App : Application
    {
        private void Application_Startup(object sender, StartupEventArgs e)
        {
            Log.Logger = new LoggerConfiguration().MinimumLevel.Debug()
                .WriteTo.File("Logs/log.txt", rollingInterval: RollingInterval.Day)
                .CreateLogger();

            Log.Information("Application started");
            Log.Debug("Collecting configuration info...");
        }
    }
}