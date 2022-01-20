using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;
using static Prosperity.Model.DataBase.RedactorTools;

namespace Prosperity.Controls.Tables.Specialities.SpecialityCodes
{
    /// <summary>
    /// Speciality codes table special row to add new rows
    /// </summary>
    public partial class SpecialityCodeRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private string _specialityCode = "";
        public string SpecialityCode
        {
            get => _specialityCode;
            set
            {
                _specialityCode = value;
                OnPropertyChanged();
            }
        }

        public bool CanBeEdited => HaveSpace();
        private StackPanel _table => Parent as StackPanel;

        private bool HaveSpace()
        {
            return (_table != null) && _table.Children.Count < ushort.MaxValue;
        }

        public SpecialityCodeRowAdditor()
        {
            InitializeComponent();
        }

        public SpecialityCodeRowAdditor(int no) : this()
        {
            Index(no);
        }

        public static void AddElement(StackPanel table, int no = 1)
        {
            SpecialityCodeRowAdditor row = new SpecialityCodeRowAdditor(no);
            _ = table.Children.Add(row);
            row.SetTables(table);
            row.OnPropertyChanged(nameof(CanBeEdited));
        }

        public void Index(int no)
        {
            No = no;
        }

        private MainPart _tables;
        public void SetTables(StackPanel table)
        {
            _tables = GetMainPart(table);
        }

        private void AddNewRow(object sender, RoutedEventArgs e)
        {
            Add.SpecialityCode(SpecialityCode);
            _tables.ViewModel.RefreshTransition();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}