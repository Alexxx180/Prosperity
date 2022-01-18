﻿using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.Works.Tasks
{
    /// <summary>
    /// Tasks table special row to add new rows
    /// </summary>
    public partial class TaskRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
    {
        private int _no = 1;
        public int No
        {
            get => _no;
            set
            {
                _no = value;
                OnPropertyChanged();
            }
        }

        private string _taskName = "";
        public string TaskName
        {
            get => _taskName;
            set
            {
                _taskName = value;
                OnPropertyChanged();
            }
        }

        private string _hoursCount = "0";
        public string TaskHours
        {
            get => _hoursCount;
            set
            {
                _hoursCount = value;
                OnPropertyChanged();
            }
        }

        public ushort HoursCount => ToUInt16(TaskHours);

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public TaskRowAdditor()
        {
            InitializeComponent();
        }

        public TaskRowAdditor(int no) : this()
        {
            Index(no);
        }

        public static void AddElement(StackPanel table, int no)
        {
            TaskRowAdditor row = new TaskRowAdditor(no);
            _ = table.Children.Add(row);
            row.SetTables(table);
            row.OnPropertyChanged(nameof(CanBeEdited));
        }

        private MainPart _tables;
        public void SetTables(StackPanel table)
        {
            _tables = GetMainPart(table);
        }

        private void AddNewRow(object sender, RoutedEventArgs e)
        {
            _tables.ViewModel.RefreshTransition();
        }

        public void Index(int no)
        {
            No = no;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
