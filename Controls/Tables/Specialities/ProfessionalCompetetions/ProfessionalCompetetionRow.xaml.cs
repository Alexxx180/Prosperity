﻿using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;

namespace Prosperity.Controls.Tables.Specialities.ProfessionalCompetetions
{
    /// <summary>
    /// Логика взаимодействия для ProfessionalCompetetionRow.xaml
    /// </summary>
    public partial class ProfessionalCompetetionRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private int _professionalNo1 = 1;
        public int ProfessionalNo1
        {
            get => _professionalNo1;
            set
            {
                _professionalNo1 = value;
                OnPropertyChanged();
            }
        }

        private int _professionalNo2 = 1;
        public int ProfessionalNo2
        {
            get => _professionalNo2;
            set
            {
                _professionalNo2 = value;
                OnPropertyChanged();
            }
        }

        private string _name = "";
        public string ProfessionalName
        {
            get => _name;
            set
            {
                _name = value;
                OnPropertyChanged();
            }
        }

        private string _experience = "";
        public string Experience
        {
            get => _experience;
            set
            {
                _experience = value;
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

        public ProfessionalCompetetionRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(int no, int id, int professionalNo1,
            int professionalNo2, string name, string experience,
            string skills, string knowledge)
        {
            No = no;
            Id = id;
            ProfessionalNo1 = professionalNo1;
            ProfessionalNo2 = professionalNo2;
            ProfessionalName = name;
            Experience = experience;
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
                int professionalNo1 = ToInt32(row[2]);
                int professionalNo2 = ToInt32(row[3]);
                string name = row[4];
                string knowledge = row[5];
                string skills = row[6];
                string experience = row[7];
                AddElement(table, no + 1, id, professionalNo1,
                    professionalNo2, name, experience, skills, knowledge);
            }
            ProfessionalCompetetionRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no,
            int id, int professionalNo1, int professionalNo2,
            string name, string experience, string skills,
            string knowledge)
        {
            ProfessionalCompetetionRow row = new ProfessionalCompetetionRow();
            row.SetElement(no, id, professionalNo1, professionalNo2,
                name, experience, skills, knowledge);
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