using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;
using static Prosperity.Model.DataBase.RedactorTools;

namespace Prosperity.Controls.Tables.Specialities
{
    /// <summary>
    /// Specialities table special row to add new rows
    /// </summary>
    public partial class SpecialityRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private uint? _code = null;
        public uint? Code
        {
            get => _code;
            set
            {
                _code = value;
                OnPropertyChanged();
            }
        }

        private string _name = "";
        public string SpecialityName
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

        public SpecialityRowAdditor()
        {
            InitializeComponent();
        }

        public SpecialityRowAdditor(int no) : this()
        {
            Index(no);
        }

        public static void AddElement(StackPanel table, int no = 1)
        {
            SpecialityRowAdditor row = new SpecialityRowAdditor(no);
            _ = table.Children.Add(row);
            row.SetTables(table);
            row.OnPropertyChanged(nameof(CanBeEdited));
        }

        private MainPart _tables;
        public void SetTables(StackPanel table)
        {
            _tables = GetMainPart(table);
        }

        public void SetCode(uint id)
        {
            Code = id;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            SelectionFields(0, _tables.ViewModel.Data.SpecialityCodes,
                "Коды специальностей:", "Специальность", _tables.FillSpecialityCodes, SetCode);
            e.Handled = true;
        }

        private void AddNewRow(object sender, RoutedEventArgs e)
        {
            if (Code == null)
                return;
            Add.Speciality(Code.Value, SpecialityName);
            _tables.FillSpecialities();
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