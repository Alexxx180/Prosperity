using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;

namespace Prosperity.Controls.Tables.Conformity
{
    /// <summary>
    /// Conformity table row component
    /// </summary>
    public partial class ConformityRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private int _id = 1;
        public int Id
        {
            get => _id;
            set
            {
                _id = value;
                OnPropertyChanged();
            }
        }

        private int _discipline = 1;
        public int Discipline
        {
            get => _discipline;
            set
            {
                _discipline = value;
                OnPropertyChanged();
            }
        }

        private int _speciality = 1;
        public int Speciality
        {
            get => _speciality;
            set
            {
                _speciality = value;
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

        public ConformityRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public ConformityRow(int no, int id, int disciplineNo, int specialityNo) : this()
        {
            SetElement(no, id, disciplineNo, specialityNo);
        }

        public void SetElement(int no, int id, int disciplineNo, int specialityNo)
        {
            No = no;
            Id = id;
            Discipline = disciplineNo;
            Speciality = specialityNo;
        }

        public static void AddElements(StackPanel table, List<string[]> rows)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                int id = ToInt32(row[0]);
                int disciplineNo = ToInt32(row[1]);
                int specialityNo = ToInt32(row[2]);
                AddElement(table, no + 1, id, disciplineNo, specialityNo);
            }
            ConformityRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no, int id, int disciplineNo, int specialityNo)
        {
            ConformityRow row = new ConformityRow(no, id, disciplineNo, specialityNo);
            _ = table.Children.Add(row);
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            CanBeEdited = !CanBeEdited;
            Selection = CanBeEdited ? _selected : _unselected;
        }

        private void SelectDiscipline(object sender, RoutedEventArgs e)
        {
            e.Handled = true;
        }

        private void SelectSpeciality(object sender, RoutedEventArgs e)
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
