﻿using System.Collections.Generic;
using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Specialities.ProfessionalCompetetions
{
    /// <summary>
    /// Professional competetions table row component
    /// </summary>
    public partial class ProfessionalCompetetionRow : UserControl, INotifyPropertyChanged, IRedactable
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

        private int _rowKey;
        public int RowKey
        {
            get => _rowKey;
            set
            {
                _rowKey = value;
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

        private string _professionalNo1 = "1";
        public string ProfessionalNo1
        {
            get => _professionalNo1;
            set
            {
                _professionalNo1 = value;
                OnPropertyChanged();
            }
        }

        private string _professionalNo2 = "1";
        public string ProfessionalNo2
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

        public ushort CompetetionNo1 => ToUInt16(ProfessionalNo1);
        public ushort CompetetionNo2 => ToUInt16(ProfessionalNo2);

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
        private Style _marked;

        private void SetStyles()
        {
            _unselected = TryFindResource("UnSelected") as Style;
            _selected = TryFindResource("Selected") as Style;
            _marked = TryFindResource("Marked") as Style;
            Selection = _unselected;
        }

        public ProfessionalCompetetionRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(string[] row)
        {
            Id = ToUInt32(row[0]);
            ProfessionalNo1 = row[1];
            ProfessionalNo2 = row[2];
            ProfessionalName = row[3];
            Knowledge = row[4];
            Skills = row[5];
            Experience = row[6];
        }

        public void Select()
        {
            CanBeEdited = !CanBeEdited;
            if (CanBeEdited)
            {
                _tables.ViewModel.SelectRow(RowKey, Id);
                Selection = _selected;
            }
            else
            {
                _tables.ViewModel.DeSelectRow(RowKey);
                Selection = _unselected;
            }
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            Select();
        }

        public void Index(int no)
        {
            No = no;
        }

        private LayoutMaster _tables;
        public void SetTools(StackPanel table)
        {
            _tables = GetLayout(table);
        }

        public void EditConfirm()
        {
            uint specialityId = _tables.ViewModel.CurrentState.Id;
            _tables.Tools.EditRow.ProfessionalCompetetion(Id, specialityId,
                CompetetionNo1, CompetetionNo2, ProfessionalName,
                Knowledge, Skills, Experience);
            
        }

        public void MarkPrepare()
        {
            Selection = _marked;
        }

        public void MarkConfirm()
        {
            _tables.Tools.MarkRow.ProfessionalCompetetion(Id);
        }

        public void UnMark()
        {
            Selection = _selected;
        }

        private void FastSelect(object sender, MouseEventArgs e)
        {
            if (Keyboard.IsKeyDown(Key.LeftShift))
                Select();
        }

        private void CallFieldsForm(object sender, MouseButtonEventArgs e)
        {
            RecordFields fields = new RecordFields(
                new Dictionary<string, string> {
                    { "Название", ProfessionalName },
                    { "Опыт", Experience },
                    { "Умения", Skills },
                    { "Знания", Knowledge },
                }
            );
            if (fields.ShowDialog().Value)
            {
                Dictionary<string, string> result = fields.FieldsView.Fields;
                ProfessionalName = result["Название"];
                Experience = result["Опыт"];
                Skills = result["Умения"];
                Knowledge = result["Знания"];
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}