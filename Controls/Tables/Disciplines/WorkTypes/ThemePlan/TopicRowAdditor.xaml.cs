using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static Prosperity.Controls.Tables.EditHelper;
using static Prosperity.Model.DataBase.RedactorTools;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan
{
    /// <summary>
    /// Theme plan table specilai row to add new rows
    /// </summary>
    public partial class TopicRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private string _topicNo = "";
        public string TopicNo
        {
            get => _topicNo;
            set
            {
                _topicNo = value;
                OnPropertyChanged();
            }
        }


        private string _topicName = "";
        public string TopicName
        {
            get => _topicName;
            set
            {
                _topicName = value;
                OnPropertyChanged();
            }
        }

        private string _hoursCount = "";
        public string TopicHours
        {
            get => _hoursCount;
            set
            {
                _hoursCount = value;
                OnPropertyChanged();
            }
        }

        public ushort TopicNumber => ParseHours(TopicNo);
        public ushort HoursCount => ParseHours(TopicHours);

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public TopicRowAdditor()
        {
            InitializeComponent();
        }

        private LayoutMaster _tables;
        public void SetTools(StackPanel table)
        {
            _tables = GetLayout(table);
        }

        private void AddNewRow(object sender, RoutedEventArgs e)
        {
            uint disciplineId = _tables.ViewModel.CurrentState.Id;
            Add.Topic(disciplineId, TopicNumber, TopicName, HoursCount);
            _tables.ViewModel.RefreshTransition();
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