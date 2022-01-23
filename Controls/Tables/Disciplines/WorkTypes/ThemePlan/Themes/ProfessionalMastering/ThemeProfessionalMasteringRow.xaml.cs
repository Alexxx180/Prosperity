using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Controls.Tables.EditHelper;
using static Prosperity.Model.DataBase.RedactorTools;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.ProfessionalMastering
{
    /// <summary>
    /// Professional selection table row component
    /// </summary>
    public partial class ThemeProfessionalMasteringRow : UserControl, INotifyPropertyChanged, IRedactable
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
            _unselected = TryFindResource("Impact1") as Style;
            _selected = TryFindResource("Impact2") as Style;
            _marked = TryFindResource("Impact2") as Style;
            Selection = _unselected;
        }

        public ThemeProfessionalMasteringRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(string[] row)
        {
            Id = ToUInt32(row[0]);
            Code = ToUInt32(row[1]);
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            CanBeEdited = !CanBeEdited;
            Selection = CanBeEdited ? _selected : _unselected;
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
            List<string[]> rows = _tables.Data.DisciplineProfessionalMasteringByTheme(themeId);
            if (rows.Count > 0)
                SelectionFields(themeId, rows, "Профессиональные компетенции дисциплины:",
                    "Освоение профессиональной компетенции",
                    _tables.FillDisciplineProfessionalFromMastering, SetCode);
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
            Edit.ProfessionalSelection(Id, themeId, Code.Value);
        }

        public void MarkPrepare()
        {
            Selection = _marked;
        }

        public void MarkConfirm()
        {
            Mark.ProfessionalSelection(Id);
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