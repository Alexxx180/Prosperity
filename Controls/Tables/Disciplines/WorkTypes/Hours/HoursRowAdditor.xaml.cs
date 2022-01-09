using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.Hours
{
    /// <summary>
    /// Hours table special row to add new rows
    /// </summary>
    public partial class HoursRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private uint _hoursType = 1;
        public uint HoursType
        {
            get => _hoursType;
            set
            {
                _hoursType = value;
                OnPropertyChanged();
            }
        }

        private string _hoursCount = "";
        public string HoursCount
        {
            get => _hoursCount;
            set
            {
                _hoursCount = value;
                OnPropertyChanged();
            }
        }

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public HoursRowAdditor()
        {
            InitializeComponent();
        }

        public HoursRowAdditor(int no) : this()
        {
            SetElement(no);
        }

        private void SetElement(int no)
        {
            No = no;
        }

        public static void AddElement(StackPanel table, int no)
        {
            HoursRowAdditor row = new HoursRowAdditor(no);
            _ = table.Children.Add(row);
            row.OnPropertyChanged(nameof(CanBeEdited));
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            e.Handled = true;
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