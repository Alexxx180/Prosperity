using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Prosperity.Controls.Tables.Disciplines.DisciplineCodes
{
    /// <summary>
    /// Discipline codes table special row to add new rows
    /// </summary>
    public partial class DisciplineCodeRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private string _disciplineCode = "";
        public string DisciplineCode
        {
            get => _disciplineCode;
            set
            {
                _disciplineCode = value;
                OnPropertyChanged();
            }
        }

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public DisciplineCodeRowAdditor()
        {
            InitializeComponent();
        }

        public DisciplineCodeRowAdditor(int no) : this()
        {
            SetElement(no);
        }

        private void SetElement(int no)
        {
            No = no;
        }

        public static void AddElement(StackPanel table)
        {
            DisciplineCodeRowAdditor row = new DisciplineCodeRowAdditor();
            _ = table.Children.Add(row);
            row.OnPropertyChanged(nameof(CanBeEdited));
        }

        public static void AddElement(StackPanel table, int no)
        {
            DisciplineCodeRowAdditor row = new DisciplineCodeRowAdditor(no);
            _ = table.Children.Add(row);
            row.OnPropertyChanged(nameof(CanBeEdited));
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