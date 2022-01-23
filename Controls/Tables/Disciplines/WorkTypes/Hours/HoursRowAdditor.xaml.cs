using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static Prosperity.Controls.Tables.EditHelper;
using static Prosperity.Model.DataBase.RedactorTools;

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

        private uint? _hoursType = null;
        public uint? HoursType
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

        public ushort Hours => ParseHours(HoursCount);

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

        private LayoutMaster _tables;
        public void SetTools(StackPanel table)
        {
            _tables = GetLayout(table);
        }

        public void SetCode(uint id)
        {
            HoursType = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            SelectionFields(0, _tables.Data.WorkTypes, "Тип работ:",
                "Общие часы", _tables.FillWorkTypes, SetCode);
            e.Handled = true;
        }

        private void AddNewRow(object sender, RoutedEventArgs e)
        {
            if (HoursType == null)
                return;
            uint disciplineId = _tables.ViewModel.CurrentState.Id;
            Add.TotalHour(disciplineId, HoursType.Value, Hours);
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