﻿using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.Works
{
    /// <summary>
    /// Works table special row to add new rows
    /// </summary>
    public partial class WorkRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private uint _type = 1;
        public uint WorkType
        {
            get => _type;
            set
            {
                _type = value;
                OnPropertyChanged();
            }
        }

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public WorkRowAdditor()
        {
            InitializeComponent();
        }

        public WorkRowAdditor(int no) : this()
        {
            Index(no);
        }

        public static void AddElement(StackPanel table, int no = 1)
        {
            WorkRowAdditor row = new WorkRowAdditor(no);
            _ = table.Children.Add(row);
            row.SetTables(table);
            row.OnPropertyChanged(nameof(CanBeEdited));
        }

        private MainPart _tables;
        public void SetTables(StackPanel table)
        {
            _tables = GetMainPart(table);
        }

        public void SetCode(uint id)
        {
            WorkType = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            SelectionFields(0, _tables.ViewModel.Data.WorkTypes,
                "Типы работ:", "Работа", _tables.FillWorkTypes, SetCode);
            e.Handled = true;
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