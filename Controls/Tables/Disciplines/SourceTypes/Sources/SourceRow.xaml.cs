using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Disciplines.SourceTypes.Sources
{
    /// <summary>
    /// Sources table row component
    /// </summary>
    public partial class SourceRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private uint _sourceType = 1;
        public uint SourceType
        {
            get => _sourceType;
            set
            {
                _sourceType = value;
                OnPropertyChanged();
            }
        }

        private string _source = "";
        public string Source
        {
            get => _source;
            set
            {
                _source = value;
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

        public SourceRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public SourceRow(int no, uint id, uint type, string value) : this()
        {
            SetElement(no, id, type, value);
        }

        public void SetElement(int no, uint id, uint type, string value)
        {
            No = no;
            Id = id;
            SourceType = type;
            Source = value;
        }

        public static void AddElements(StackPanel table, List<string[]> rows)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                uint id = ToUInt32(row[0]);
                string value = row[1];
                uint type = ToUInt32(row[2]);
                AddElement(table, no + 1, id, type, value);
            }
            SourceRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no, uint id, uint type, string value)
        {
            SourceRow row = new SourceRow(no, id, type, value);
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
            SourceType = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            SelectionFields(Id, _tables.ViewModel.Data.SourceTypes,
                "Типы источников:", "Источник", _tables.FillSourceTypes, SetCode);
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