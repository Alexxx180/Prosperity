using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;

namespace Prosperity.Controls.Tables.Disciplines
{
    /// <summary>
    /// Логика взаимодействия для DisciplineRow.xaml
    /// </summary>
    public partial class DisciplineRow : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private int _id = 1;
        public int Id
        {
            get => _id;
            set
            {
                _id = value;
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

        public DisciplineRow()
        {
            InitializeComponent();
        }

        public DisciplineRow(int no, int id, int code, string name) : this()
        {
            SetElement(no, id, code, name);
        }

        public void SetElement(int no, int id, int code, string name)
        {
            No = no;
            Id = id;
            Code = code;
            DisciplineName = name;
        }

        public static void AddElements(StackPanel table, List<string[]> rows)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                int id = ToInt32(row[0]);
                int code = ToInt32(row[1]);
                string name = row[2];
                AddElement(table, no + 1, id, code, name);
            }
            DisciplineRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no, int id, int code, string name)
        {
            DisciplineRow row = new DisciplineRow(no, id, code, name);
            _ = table.Children.Add(row);
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            CanBeEdited = !CanBeEdited;
            Style impact1 = (Style)TryFindResource("Impact1");
            Style impact2 = (Style)TryFindResource("Impact2");
            button.Style = CanBeEdited ? impact2 : impact1;
        }

        private void SelectCode(object sender, RoutedEventArgs e)
        {
            e.Handled = true;
        }

        public void Index(int no)
        {
            No = no;
        }

        public static void AutoIndexing(StackPanel rows)
        {
            for (ushort no = 0; no < rows.Children.Count; no++)
            {
                IAutoIndexing row = rows.Children[no] as IAutoIndexing;
                row.Index(no + 1);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
