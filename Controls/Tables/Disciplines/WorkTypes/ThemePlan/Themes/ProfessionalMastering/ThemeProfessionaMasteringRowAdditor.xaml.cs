using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.ProfessionalMastering
{
    /// <summary>
    /// Professional selection table special row to add new rows
    /// </summary>
    public partial class ThemeProfessionaMasteringRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private uint _code = 1;
        public uint Code
        {
            get => _code;
            set
            {
                _code = value;
                OnPropertyChanged();
            }
        }

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public ThemeProfessionaMasteringRowAdditor()
        {
            InitializeComponent();
        }

        public ThemeProfessionaMasteringRowAdditor(int no) : this()
        {
            SetElement(no);
        }

        private void SetElement(int no)
        {
            No = no;
        }

        public static void AddElement(StackPanel table, int no)
        {
            ThemeProfessionaMasteringRowAdditor row = new ThemeProfessionaMasteringRowAdditor(no);
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