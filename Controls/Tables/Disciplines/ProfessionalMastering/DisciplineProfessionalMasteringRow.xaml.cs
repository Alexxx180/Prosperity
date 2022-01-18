using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Disciplines.ProfessionalMastering
{
    /// <summary>
    /// Professional mastering table row component
    /// </summary>
    public partial class DisciplineProfessionalMasteringRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private uint _id = 1;
        public uint Id
        {
            get => _id;
            set
            {
                _id = value;
                OnPropertyChanged();
            }
        }

        private uint _code = 1;
        public uint Code
        {
            get => _code;
            set
            {
                _code = value;
                OnPropertyChanged();
            }
        }

        private bool _canBeEdited = false;
        public bool CanBeEdited
        {
            get => _canBeEdited;
            set
            {
                _canBeEdited = value;
                OnPropertyChanged();
            }
        }

        private Style _selection;
        public Style Selection
        {
            get => _selection;
            set
            {
                _selection = value;
                OnPropertyChanged();
            }
        }

        private Style _unselected;
        private Style _selected;

        private void SetStyles()
        {
            _unselected = (Style)TryFindResource("Impact1");
            _selected = (Style)TryFindResource("Impact2");
            Selection = _unselected;
        }

        public DisciplineProfessionalMasteringRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public DisciplineProfessionalMasteringRow(int no, uint id, uint code) : this()
        {
            SetElement(no, id, code);
        }

        public void SetElement(int no, uint id, uint code)
        {
            No = no;
            Id = id;
            Code = code;
        }

        public static void AddElements(StackPanel table, List<string[]> rows)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                uint id = ToUInt32(row[0]);
                uint code = ToUInt32(row[1]);
                AddElement(table, no + 1, id, code);
            }
            DisciplineProfessionalMasteringRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no, uint id, uint code)
        {
            DisciplineProfessionalMasteringRow row = new DisciplineProfessionalMasteringRow(no, id, code);
            _ = table.Children.Add(row);
            row.SetTables(table);
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            CanBeEdited = !CanBeEdited;
            Selection = CanBeEdited ? _selected : _unselected;
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