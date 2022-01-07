using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Prosperity.Controls.Tables.Disciplines
{
    /// <summary>
    /// Disciplines table special row to add new rows
    /// </summary>
    public partial class DisciplineRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private int _code = 1;
        public int Code
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

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public DisciplineRowAdditor()
        {
            InitializeComponent();
        }

        public DisciplineRowAdditor(int no) : this()
        {
            SetElement(no);
        }

        private void SetElement(int no)
        {
            No = no;
        }

        public static void AddElement(StackPanel table, int no = 1)
        {
            DisciplineRowAdditor row = new DisciplineRowAdditor(no);
            _ = table.Children.Add(row);
            row.OnPropertyChanged(nameof(CanBeEdited));
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            
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