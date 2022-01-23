using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Model.DataBase.RedactorTools;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes
{
    /// <summary>
    /// Work types table row component
    /// </summary>
    public partial class WorkTypesRow : UserControl, INotifyPropertyChanged, IRedactable
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

        private string _workType = "";
        public string WorkType
        {
            get => _workType;
            set
            {
                _workType = value;
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

        public WorkTypesRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(string[] row)
        {
            Id = ToUInt32(row[0]);
            WorkType = row[1];
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

        public void SetTools(StackPanel table)
        {
        }

        public void EditConfirm()
        {
            Edit.WorkType(Id, WorkType);
        }

        public void MarkPrepare()
        {
            Selection = _marked;
        }

        public void MarkConfirm()
        {
            Mark.WorkType(Id);
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