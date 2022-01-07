using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using static System.Convert;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables.Specialities.ProfessionalCompetetions
{
    /// <summary>
    /// Professional competetions table special row to add new rows
    /// </summary>
    public partial class ProfessionalCompetetionRowAdditor : UserControl, INotifyPropertyChanged, IAutoIndexing
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

        private string _professionalNo1 = "1";
        public string ProfessionalNo1
        {
            get => _professionalNo1;
            set
            {
                _professionalNo1 = value;
                OnPropertyChanged();
            }
        }

        private string _professionalNo2 = "1";
        public string ProfessionalNo2
        {
            get => _professionalNo2;
            set
            {
                _professionalNo2 = value;
                OnPropertyChanged();
            }
        }

        private string _name = "";
        public string ProfessionalName
        {
            get => _name;
            set
            {
                _name = value;
                OnPropertyChanged();
            }
        }

        private string _experience = "";
        public string Experience
        {
            get => _experience;
            set
            {
                _experience = value;
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

        public int CompetetionNo1 => ToUInt16(ProfessionalNo1);
        public int CompetetionNo2 => ToUInt16(ProfessionalNo2);

        public ProfessionalCompetetionRowAdditor()
        {
            InitializeComponent();
        }

        public ProfessionalCompetetionRowAdditor(int no) : this()
        {
            SetElement(no);
        }

        public void SetElement(int no)
        {
            No = no;
        }

        public static void AddElement(StackPanel table, int no)
        {
            ProfessionalCompetetionRowAdditor row = new ProfessionalCompetetionRowAdditor(no);
            _ = table.Children.Add(row);
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