using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using Prosperity.Controls.MainForm;
using static Prosperity.Controls.Tables.EditHelper;
using static Prosperity.Model.DataBase.RedactorTools;

namespace Prosperity.Controls.Tables.Conformity
{
    /// <summary>
    /// Conformity table row component
    /// </summary>
    public partial class ConformityRow : UserControl, INotifyPropertyChanged, IRedactable
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

        private uint? _discipline = null;
        public uint? Discipline
        {
            get => _discipline;
            set
            {
                _discipline = value;
                OnPropertyChanged();
            }
        }

        private uint? _speciality = null;
        public uint? Speciality
        {
            get => _speciality;
            set
            {
                _speciality = value;
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
        private Style _marked;

        private void SetStyles()
        {
            _unselected = TryFindResource("Impact1") as Style;
            _selected = TryFindResource("Impact2") as Style;
            _marked = TryFindResource("Impact3") as Style;
            Selection = _unselected;
        }

        public ConformityRow()
        {
            InitializeComponent();
            SetStyles();
        }

        public ConformityRow(int no, uint id, uint disciplineNo, uint specialityNo) : this()
        {
            SetElement(no, id, disciplineNo, specialityNo);
        }

        public void SetElement(string[] row)
        {
            Id = ToUInt32(row[0]);
            Discipline = ToUInt32(row[1]);
            Speciality = ToUInt32(row[2]);
        }

        public void SetElement(int no, uint id, uint disciplineNo, uint specialityNo)
        {
            No = no;
            Id = id;
            Discipline = disciplineNo;
            Speciality = specialityNo;
        }

        public static void AddElements(StackPanel table, List<string[]> rows, uint selected)
        {
            ushort no = 0;
            for (; no < rows.Count; no++)
            {
                string[] row = rows[no];
                uint id = ToUInt32(row[0]);
                uint disciplineNo = ToUInt32(row[1]);
                uint specialityNo = ToUInt32(row[2]);
                AddElement(table, no + 1, id, disciplineNo, specialityNo, selected);
            }
            ConformityRowAdditor.AddElement(table, no + 1);
        }

        public static void AddElement(StackPanel table, int no,
            uint id, uint disciplineNo, uint specialityNo, uint selected)
        {
            ConformityRow row = new ConformityRow(no, id, disciplineNo, specialityNo);
            if (id == selected)
                row.Select();
            _ = table.Children.Add(row);
            row.SetTables(table);
        }

        public void Select()
        {
            CanBeEdited = !CanBeEdited;
            Selection = CanBeEdited ? _selected : _unselected;
        }

        private void Select(object sender, RoutedEventArgs e)
        {
            Select();
        }

        private MainPart _tables;
        public void SetTables(StackPanel table)
        {
            _tables = GetMainPart(table);
        }

        private void SetDisciplineId(uint id)
        {
            Discipline = id;
        }

        private void SetSpecialityId(uint id)
        {
            Speciality = id;
        }

        private void SelectDiscipline(object sender, RoutedEventArgs e)
        {
            SelectionFields(Id, _tables.ViewModel.Data.Disciplines,
                "Дисциплины:", "Соответствие", _tables.FillDisciplines, SetDisciplineId);
            e.Handled = true;
        }

        private void SelectSpeciality(object sender, RoutedEventArgs e)
        {
            SelectionFields(Id, _tables.ViewModel.Data.Specialities,
                "Специальности:", "Соответствие", _tables.FillSpecialities, SetSpecialityId);
            e.Handled = true;
        }

        public void Index(int no)
        {
            No = no;
        }

        public void EditConfirm()
        {
            if (Discipline == null || Speciality == null)
                return;
            Edit.Conformity(Id, Discipline.Value, Speciality.Value);
        }

        public uint MarkPrepare()
        {
            Selection = _marked;
            return Id;
        }

        public void UnMark()
        {
            Selection = _selected;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}