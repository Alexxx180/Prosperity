﻿using System.Collections.Generic;
using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Specialities.GeneralCompetetions
{
    /// <summary>
    /// General competetons table row component
    /// </summary>
    public partial class GeneralCompetetionRow : UserControl, INotifyPropertyChanged, IRedactable
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

        private string _generalNo = "1";
        public string GeneralNo
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

        public ushort CompetetionNo => ToUInt16(GeneralNo);

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

        public GeneralCompetetionRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(string[] row)
        {
            Id = ToUInt32(row[0]);
            GeneralNo = row[1];
            GeneralName = row[2];
            Knowledge = row[3];
            Skills = row[4];
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
            System.Diagnostics.Trace.WriteLine("OK");

            System.Diagnostics.Trace.WriteLine(CompetetionNo
                + GeneralName + Knowledge + Skills);

            _tables.Tools.EditRow.GeneralCompetetion(Id, specialityId,
                CompetetionNo, GeneralName, Knowledge, Skills);
        }

        public void MarkPrepare()
        {
            Selection = _marked;
        }

        public void MarkConfirm()
        {
            _tables.Tools.MarkRow.GeneralCompetetion(Id);
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
                    { "Название", GeneralName },
                    { "Умения", Skills },
                    { "Знания", Knowledge },
                }
            );
            if (fields.ShowDialog().Value)
            {
                Dictionary<string, string> result = fields.FieldsView.Fields;
                GeneralName = result["Название"];
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