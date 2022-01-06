using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Prosperity.Controls.Tables.Specialities.GeneralCompetetions
{
    /// <summary>
    /// Логика взаимодействия для GeneralCompetetionAdditor.xaml
    /// </summary>
    public partial class GeneralCompetetionRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private int _generalNo = 1;
        public int GeneralNo
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

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public GeneralCompetetionRowAdditor()
        {
            InitializeComponent();
        }

        public GeneralCompetetionRowAdditor(int no) : this()
        {
            SetElement(no);
        }

        private void SetElement(int no)
        {
            No = no;
        }

        public static void AddElement(StackPanel table)
        {
            GeneralCompetetionRowAdditor row = new GeneralCompetetionRowAdditor();
            _ = table.Children.Add(row);
            row.OnPropertyChanged(nameof(CanBeEdited));
        }

        public static void AddElement(StackPanel table, int no)
        {
            GeneralCompetetionRowAdditor row = new GeneralCompetetionRowAdditor(no);
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
