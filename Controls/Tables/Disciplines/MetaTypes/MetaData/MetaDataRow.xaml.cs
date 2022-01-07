using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;

namespace Prosperity.Controls.Tables.Disciplines.MetaTypes.MetaData
{
    /// <summary>
    /// Metadata table row component
    /// </summary>
    public partial class MetaDataRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private uint _metaType = 1;
        public uint MetaType
        {
            get => _metaType;
            set
            {
                _metaType = value;
                OnPropertyChanged();
            }
        }

        private string _metaValue = "";
        public string MetaValue
        {
            get => _metaValue;
            set
            {
                _metaValue = value;
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

        public MetaDataRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public MetaDataRow(int no, uint id, uint type, string value) : this()
        {
            SetElement(no, id, type, value);
        }

        public void SetElement(int no, uint id, uint type, string value)
        {
            No = no;
            Id = id;
            MetaType = type;
            MetaValue = value;
        }

        public static void AddElements(StackPanel table, List<string[]> rows)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                uint id = ToUInt32(row[0]);
                uint type = ToUInt32(row[2]);
                string value = row[3];
                AddElement(table, no + 1, id, type, value);
            }
            MetaDataRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no, uint id, uint type, string value)
        {
            MetaDataRow row = new MetaDataRow(no, id, type, value);
            _ = table.Children.Add(row);
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            CanBeEdited = !CanBeEdited;
            Selection = CanBeEdited ? _selected : _unselected;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
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