using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes
{
    /// <summary>
    /// Themes table row component
    /// </summary>
    public partial class ThemeRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private uint _themeLevel = 1;
        public uint ThemeLevel
        {
            get => _themeLevel;
            set
            {
                _themeLevel = value;
                OnPropertyChanged();
            }
        }

        private string _themeNo = "1";
        public string ThemeNo
        {
            get => _themeNo;
            set
            {
                _themeNo = value;
                OnPropertyChanged();
            }
        }


        private string _themeName = "";
        public string ThemeName
        {
            get => _themeName;
            set
            {
                _themeName = value;
                OnPropertyChanged();
            }
        }

        private string _hoursCount = "0";
        public string ThemeHours
        {
            get => _hoursCount;
            set
            {
                _hoursCount = value;
                OnPropertyChanged();
            }
        }

        public ushort ThemeNumber => ToUInt16(ThemeNo);
        public ushort HoursCount => ToUInt16(ThemeHours);

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public ThemeRowAdditor()
        {
            InitializeComponent();
        }

        public ThemeRowAdditor(int no) : this()
        {
            SetElement(no);
        }

        private void SetElement(int no)
        {
            No = no;
        }

        public static void AddElement(StackPanel table, int no)
        {
            ThemeRowAdditor row = new ThemeRowAdditor(no);
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

        private void Hours(object sender, TextCompositionEventArgs e)
        {
            CheckForHours(sender, e);
        }
        private void PastingHours(object sender, DataObjectPastingEventArgs e)
        {
            CheckForPastingHours(sender, e);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}