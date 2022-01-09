using System.Collections.Generic;
using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Controls.Tables.EditHelper;
using Prosperity.Controls.MainForm;

namespace Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes
{
    /// <summary>
    /// Themes table row component
    /// </summary>
    public partial class ThemeRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private void SetStyles()
        {
            _unselected = (Style)TryFindResource("Impact1");
            _selected = (Style)TryFindResource("Impact2");
            Selection = _unselected;
        }

        public ThemeRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public void SetElement(int no, uint id, uint themeLevel,
            string themeNo, string name, string hours)
        {
            No = no;
            Id = id;
            ThemeLevel = themeLevel;
            ThemeNo = themeNo;
            ThemeName = name;
            ThemeHours = hours;
        }

        public static void AddElements(StackPanel table, List<string[]> rows)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                uint id = ToUInt32(row[0]);
                string themeNo = row[1];
                string name = row[2];
                string hours = row[3];
                uint themeLevel = ToUInt32(row[4]);
                AddElement(table, no + 1, id, themeLevel, themeNo, name, hours);
            }
            ThemeRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no,
            uint id, uint themeLevel, string themeNo, string name, string hours)
        {
            ThemeRow row = new ThemeRow();
            row.SetElement(no, id, themeLevel, themeNo, name, hours);
            _ = table.Children.Add(row);
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            CanBeEdited = !CanBeEdited;
            Selection = CanBeEdited ? _selected : _unselected;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            e.Handled = true;
        }

        public void Index(int no)
        {
            No = no;
        }

        private MainPart _tables => GetMainPart();
        private MainPart GetMainPart()
        {
            StackPanel mainStack = Parent as StackPanel;
            return mainStack.Tag as MainPart;
        }

        private void CheckSelection(ComboBox selector)
        {
            switch (selector.SelectedIndex)
            {
                case 0:
                    _tables.FillWorks(Id);
                    break;
                case 1:
                    _tables.FillThemeGeneralCompetetions(Id);
                    break;
                case 2:
                    _tables.FillThemeProfessionalCompetetions(Id);
                    break;
                default:
                    break;
            }
        }

        private void SecondaryTables_Select(object sender, SelectionChangedEventArgs e)
        {
            ComboBox selector = sender as ComboBox;
            CheckSelection(selector);
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