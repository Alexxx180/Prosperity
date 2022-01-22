﻿using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;
using static Prosperity.Model.DataBase.RedactorTools;

namespace Prosperity.Controls.Tables.Disciplines.DisciplineCodes
{
    /// <summary>
    /// Discipline codes table special row to add new rows
    /// </summary>
    public partial class DisciplineCodeRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private string _disciplineCode = "";
        public string DisciplineCode
        {
            get => _disciplineCode;
            set
            {
                _disciplineCode = value;
                OnPropertyChanged();
            }
        }

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public DisciplineCodeRowAdditor()
        {
            InitializeComponent();
        }

        private MainPart _tables;
        public void SetTools(StackPanel table)
        {
            _tables = GetMainPart(table);
        }

        private void AddNewRow(object sender, RoutedEventArgs e)
        {
            Add.DisciplineCode(DisciplineCode);
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