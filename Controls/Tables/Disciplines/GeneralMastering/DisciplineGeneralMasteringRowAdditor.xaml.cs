using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;
using static Prosperity.Model.DataBase.RedactorTools;

namespace Prosperity.Controls.Tables.Disciplines.GeneralMastering
{
    /// <summary>
    /// General mastering special row component to add new rows
    /// </summary>
    public partial class DisciplineGeneralMasteringRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        public DisciplineGeneralMasteringRowAdditor()
        {
            InitializeComponent();
        }

        public DisciplineGeneralMasteringRowAdditor(int no) : this()
        {
            Index(no);
        }

        public static void AddElement(StackPanel table, int no = 1)
        {
            DisciplineGeneralMasteringRowAdditor row = new DisciplineGeneralMasteringRowAdditor(no);
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
            Code = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            uint disciplineId = _tables.ViewModel.CurrentState.Id;
            List<string[]> rows = _tables.ViewModel.Data.ConformityGeneralCompetetions(disciplineId);
            if (rows.Count > 0)
                SelectionFields(disciplineId, rows, "Общие компетенции:",
                    "Освоение общей компетенции", _tables.FillGeneralFromMastering, SetCode);
            e.Handled = true;
        }

        private void AddNewRow(object sender, RoutedEventArgs e)
        {
            if (Code == null)
                return;
            uint disciplineId = _tables.ViewModel.CurrentState.Id;
            Add.GeneralMastering(disciplineId, Code.Value);
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