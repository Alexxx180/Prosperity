﻿using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;
using static Prosperity.Model.DataBase.RedactorTools;

namespace Prosperity.Controls.Tables.Disciplines.ProfessionalMastering
{
    /// <summary>
    /// Professional mastering special row to add new rows
    /// </summary>
    public partial class DisciplineProfessionalMasteringRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private uint? _code = null;
        public uint? Code
        {
            get => _code;
            set
            {
                _code = value;
                OnPropertyChanged();
            }
        }

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public DisciplineProfessionalMasteringRowAdditor()
        {
            InitializeComponent();
        }

        public DisciplineProfessionalMasteringRowAdditor(int no) : this()
        {
            Index(no);
        }

        public static void AddElement(StackPanel table, int no = 1)
        {
            DisciplineProfessionalMasteringRowAdditor row = new DisciplineProfessionalMasteringRowAdditor(no);
            _ = table.Children.Add(row);
            row.SetTables(table);
            row.OnPropertyChanged(nameof(CanBeEdited));
        }

        public void Index(int no)
        {
            No = no;
        }

        private MainPart _tables;
        public void SetTables(StackPanel table)
        {
            _tables = GetMainPart(table);
        }

        public void SetCode(uint id)
        {
            Code = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            uint disciplineId = _tables.ViewModel.CurrentState.Id;
            List<string[]> rows = _tables.ViewModel.Data.ConformityProfessionalCompetetions(disciplineId);
            if (rows.Count > 0)
                SelectionFields(disciplineId, rows, "Профессиональные компетенции:",
                    "Освоение профессиональной компетенции", _tables.FillProfessionalFromMastering, SetCode);
            e.Handled = true;
        }

        private void AddNewRow(object sender, RoutedEventArgs e)
        {
            if (Code == null)
                return;
            uint disciplineId = _tables.ViewModel.CurrentState.Id;
            Add.ProfessionalMastering(disciplineId, Code.Value);
            _tables.ViewModel.RefreshTransition();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}