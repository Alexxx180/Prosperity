using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using Prosperity.Controls.MainForm;

namespace Prosperity.Controls.Tables.Specialities
{
    /// <summary>
    /// Specialities table row component
    /// </summary>
    public partial class SpecialityRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private string _name = "";
        public string SpecialityName
        {
            get => _name;
            set
            {
                _name = value;
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

        public SpecialityRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public SpecialityRow(int no, uint id, uint code, string name) : this()
        {
            SetElement(no, id, code, name);
        }

        public void SetElement(int no, uint id, uint code, string name)
        {
            No = no;
            Id = id;
            Code = code;
            SpecialityName = name;
        }

        public static void AddElements(StackPanel table, List<string[]> rows, uint selected)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                uint id = ToUInt32(row[0]);
                uint code = ToUInt32(row[1]);
                string name = row[2];
                AddElement(table, no + 1, id, code, name, selected);
            }
            SpecialityRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no, uint id, uint code, string name, uint selected)
        {
            SpecialityRow row = new SpecialityRow(no, id, code, name);
            if (id == selected)
                row.Select();
            _ = table.Children.Add(row);
        }

        public void Select()
        {
            CanBeEdited = !CanBeEdited;
            Selection = CanBeEdited ? _selected : _unselected;
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            Select();
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            e.Handled = true;
        }

        public void Index(int no)
        {
            No = no;
        }

        private MainPart _tables;
        private MainPart GetMainPart()
        {
            StackPanel mainStack = Parent as StackPanel;
            return mainStack.Tag as MainPart;
        }

        private void CheckSelection(ComboBox selector)
        {
            _tables = GetMainPart();
            switch (selector.SelectedIndex)
            {
                case 0:
                    SpecialitiesTransition();
                    _tables.FillGeneralCompetetions(Id);
                    break;
                case 1:
                    SpecialitiesTransition();
                    _tables.FillProfessionalCompetetions(Id);
                    break;
                default:
                    break;
            }
        }

        private void SpecialitiesTransition()
        {
            _tables.ViewModel.AddTransition(_tables.FillSpecialities, "Ранее смотрели: Специальность - ID", Id);
        }

        private void SecondaryTables_Select(object sender, SelectionChangedEventArgs e)
        {
            ComboBox selector = sender as ComboBox;
            CheckSelection(selector);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}