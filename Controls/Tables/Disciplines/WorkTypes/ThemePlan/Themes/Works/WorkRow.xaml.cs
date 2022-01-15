using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.Works
{
    /// <summary>
    /// Works table row component
    /// </summary>
    public partial class WorkRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        public WorkRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public WorkRow(int no, uint id, uint type) : this()
        {
            SetElement(no, id, type);
        }

        public void SetElement(int no, uint id, uint type)
        {
            No = no;
            Id = id;
            WorkType = type;
        }

        public static void AddElements(StackPanel table, List<string[]> rows)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                uint id = ToUInt32(row[0]);
                uint type = ToUInt32(row[1]);
                AddElement(table, no + 1, id, type);
            }
            WorkRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no, uint id, uint type)
        {
            WorkRow row = new WorkRow(no, id, type);
            _ = table.Children.Add(row);
            row.SetTables(table);
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            CanBeEdited = !CanBeEdited;
            Selection = CanBeEdited ? _selected : _unselected;
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
            WorkType = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            SelectionFields(Id, _tables.ViewModel.Data.WorkTypes,
                "Типы работ:", "Работа", _tables.FillWorkTypes, SetCode);
            e.Handled = true;
        }

        private void GoToTasks(object sender, RoutedEventArgs e)
        {
            _tables.FillTasks(Id);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
