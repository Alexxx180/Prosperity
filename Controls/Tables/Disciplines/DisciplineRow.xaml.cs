using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Disciplines
{
    /// <summary>
    /// Disciplines table row component
    /// </summary>
    public partial class DisciplineRow : UserControl, INotifyPropertyChanged, IRedactable
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

        private string _name = "";
        public string DisciplineName
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
        private Style _marked;

        private void SetStyles()
        {
            _unselected = TryFindResource("Impact1") as Style;
            _selected = TryFindResource("Impact2") as Style;
            _marked = TryFindResource("Impact2") as Style;
            Selection = _unselected;
        }

        public DisciplineRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(string[] row)
        {
            Id = ToUInt32(row[0]);
            Code = ToUInt32(row[1]);
            DisciplineName = row[2];
        }

        private LayoutMaster _tables;
        public void SetTools(StackPanel table)
        {
            _tables = GetLayout(table);
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            CanBeEdited = !CanBeEdited;
            Selection = CanBeEdited ? _selected : _unselected;
        }

        public void SetCode(uint id)
        {
            Code = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            SelectionFields(Id, _tables.Data.DisciplineCodes, "Коды дисциплин:",
                "Дисциплина", _tables.FillDisciplineCodes, SetCode);
            e.Handled = true;
        }

        public void Index(int no)
        {
            No = no;
        }

        private void CheckSelection(ComboBox selector)
        {
            switch (selector.SelectedIndex)
            {
                case 0:
                    DisciplinesTransition();
                    _tables.FillTopics(Id);
                    break;
                case 1:
                    DisciplinesTransition();
                    _tables.FillDisciplineGeneralCompetetions(Id);
                    break;
                case 2:
                    DisciplinesTransition();
                    _tables.FillDisciplineProfessionalCompetetions(Id);
                    break;
                case 3:
                    DisciplinesTransition();
                    _tables.FillSources(Id);
                    break;
                case 4:
                    DisciplinesTransition();
                    _tables.FillMetaData(Id);
                    break;
                case 5:
                    DisciplinesTransition();
                    _tables.FillHours(Id);
                    break;
                default:
                    break;
            }
        }

        public void EditConfirm()
        {
            if (Code == null)
                return;
            _tables.Tools.EditRow.Discipline(Id, Code.Value, DisciplineName);
        }

        public void MarkPrepare()
        {
            Selection = _marked;
        }

        public void MarkConfirm()
        {
            _tables.Tools.MarkRow.Discipline(Id);
        }

        public void UnMark()
        {
            Selection = _selected;
        }

        private void DisciplinesTransition()
        {
            _tables.ViewModel.AddTransition(_tables.FillDisciplines, "Ранее смотрели: Дисциплина - ID", Id);
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