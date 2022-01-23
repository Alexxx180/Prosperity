﻿using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.Works
{
    /// <summary>
    /// Works table row component
    /// </summary>
    public partial class WorkRow : UserControl, INotifyPropertyChanged, IRedactable
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

        private uint? _type = null;
        public uint? WorkType
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
        private Style _marked;

        private void SetStyles()
        {
            _unselected = TryFindResource("Impact1") as Style;
            _selected = TryFindResource("Impact2") as Style;
            _marked = TryFindResource("Impact2") as Style;
            Selection = _unselected;
        }

        public WorkRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(string[] row)
        {
            Id = ToUInt32(row[0]);
            WorkType = ToUInt32(row[1]);
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

        private LayoutMaster _tables;
        public void SetTools(StackPanel table)
        {
            _tables = GetLayout(table);
        }

        public void SetCode(uint id)
        {
            WorkType = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            SelectionFields(Id, _tables.Data.WorkTypes,
                "Типы работ:", "Работа", _tables.FillWorkTypes, SetCode);
            e.Handled = true;
        }

        private void GoToTasks(object sender, RoutedEventArgs e)
        {
            _tables.FillTasks(Id);
        }

        public void EditConfirm()
        {
            if (WorkType == null)
                return;
            uint themeId = _tables.ViewModel.CurrentState.Id;
            _tables.Tools.EditRow.Work(Id, themeId, WorkType.Value);
        }

        public void MarkPrepare()
        {
            Selection = _marked;
        }

        public void MarkConfirm()
        {
            _tables.Tools.MarkRow.Work(Id);
        }

        public void UnMark()
        {
            Selection = _selected;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}