using System.Windows.Controls;
using Prosperity.ViewModel;
using Prosperity.Model.DataBase;
using Prosperity.Controls.Tables.Disciplines;
using Prosperity.Controls.Tables.Specialities;
using Prosperity.Controls.Tables.Conformity;
using System.Runtime.CompilerServices;
using System.ComponentModel;
//using static System.GC;

namespace Prosperity.Controls.MainForm
{
    /// <summary>
    /// Логика взаимодействия для MainPart.xaml
    /// </summary>
    public partial class MainPart : UserControl, INotifyPropertyChanged
    {
        public GlobalViewModel ViewModel = new GlobalViewModel();

        public MainPart()
        {
            InitializeComponent();
            DataContext = ViewModel;
            FillDisciplines();
        }

        public void FillDisciplines()
        {
            CurrentView.Children.Clear();
            DisciplineRow.AddElements(CurrentView, Data.Disciplines);
            RefreshCount();
        }

        public void FillSpecialities()
        {
            CurrentView.Children.Clear();
            SpecialityRow.AddElements(CurrentView, Data.Specialities);
            RefreshCount();
        }

        public void FillConformity()
        {
            CurrentView.Children.Clear();
            ConformityRow.AddElements(CurrentView, Data.Conformity);
            RefreshCount();
        }

        public void RefreshCount()
        {
            CountRecords.GetBindingExpression(TextBlock.TextProperty).UpdateTarget();
        }

        public ProgramData Data = new ProgramData();

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}