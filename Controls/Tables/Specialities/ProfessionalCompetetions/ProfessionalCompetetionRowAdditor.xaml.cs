﻿using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Prosperity.Controls.Tables.Specialities.ProfessionalCompetetions
{
    /// <summary>
    /// Логика взаимодействия для ProfessionalCompetetionRowAdditor.xaml
    /// </summary>
    public partial class ProfessionalCompetetionRowAdditor : UserControl
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

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public ProfessionalCompetetionRowAdditor()
        {
            InitializeComponent();
        }

        public ProfessionalCompetetionRowAdditor(int no) : this()
        {
            SetElement(no);
        }

        public void SetElement(int no)
        {
            No = no;
        }

        public static void AddElement(StackPanel table, int no)
        {
            ProfessionalCompetetionRowAdditor row = new ProfessionalCompetetionRowAdditor(no);
            _ = table.Children.Add(row);
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
