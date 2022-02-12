using System.Collections.Generic;
using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.GeneralMastering
{
    /// <summary>
    /// General selection table row component
    /// </summary>
    public partial class ThemeGeneralMasteringRow : UserControl, INotifyPropertyChanged, IRedactable
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

        private uint? _code = null;
        public uint? Code
        {
            get => _code;
            set
            {
                _code = value;
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
            _unselected = TryFindResource("UnSelected") as Style;
            _selected = TryFindResource("Selected") as Style;
            _marked = TryFindResource("Marked") as Style;
            Selection = _unselected;
        }

        public ThemeGeneralMasteringRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(string[] row)
        {
            Id = ToUInt32(row[0]);
            Code = ToUInt32(row[1]);
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

        private LayoutMaster _tables;
        public void SetTools(StackPanel table)
        {
            _tables = GetLayout(table);
        }

        public void SetCode(uint id)
        {
            Code = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            uint themeId = _tables.ViewModel.CurrentState.Id;
            uint disciplineId = ToUInt32(_tables.Data.DisciplineByTheme(themeId));
            List<string[]> rows = _tables.Data.DisciplineGeneralMastering(disciplineId);
            SelectionFields(disciplineId, rows,
                "Общие компетенции дисциплины:", "Освоение общей компетенции",
                _tables.FillDisciplineGeneralCompetetions, SetCode);
            e.Handled = true;
        }

        public void Index(int no)
        {
            No = no;
        }

        public void EditConfirm()
        {
            if (Code == null)
                return;
            uint themeId = _tables.ViewModel.CurrentState.Id;
            _tables.Tools.EditRow.GeneralSelection(Id, themeId, Code.Value);
        }

        public void MarkPrepare()
        {
            Selection = _marked;
        }

        public void MarkConfirm()
        {
            _tables.Tools.MarkRow.GeneralSelection(Id);
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

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}