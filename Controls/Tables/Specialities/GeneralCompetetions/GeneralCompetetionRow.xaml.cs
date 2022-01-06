using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;

namespace Prosperity.Controls.Tables.Specialities.GeneralCompetetions
{
    /// <summary>
    /// Логика взаимодействия для GeneralCompetetionRow.xaml
    /// </summary>
    public partial class GeneralCompetetionRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private int _generalNo = 1;
        public int GeneralNo
        {
            get => _generalNo;
            set
            {
                _generalNo = value;
                OnPropertyChanged();
            }
        }

        private string _name = "";
        public string GeneralName
        {
            get => _name;
            set
            {
                _name = value;
                OnPropertyChanged();
            }
        }

        private string _skills = "";
        public string Skills
        {
            get => _skills;
            set
            {
                _skills = value;
                OnPropertyChanged();
            }
        }

        private string _knowledge = "";
        public string Knowledge
        {
            get => _knowledge;
            set
            {
                _knowledge = value;
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

        public GeneralCompetetionRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(int no, int id, int generalNo, string name, string skills, string knowledge)
        {
            No = no;
            Id = id;
            GeneralNo = generalNo;
            GeneralName = name;
            Skills = skills;
            Knowledge = knowledge;
        }

        public static void AddElements(StackPanel table, List<string[]> rows)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                int id = ToInt32(row[0]);
                int generalNo = ToInt32(row[2]);
                string name = row[3];
                string knowledge = row[4];
                string skills = row[5];
                AddElement(table, no + 1, id, generalNo, name, skills, knowledge);
            }
            GeneralCompetetionRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no, int id,
            int generalNo, string name, string skills, string knowledge)
        {
            GeneralCompetetionRow row = new GeneralCompetetionRow();
            row.SetElement(no, id, generalNo, name, skills, knowledge);
            _ = table.Children.Add(row);
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

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}