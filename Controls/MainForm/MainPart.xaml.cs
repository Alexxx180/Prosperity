using System.Windows.Controls;
using Prosperity.ViewModel;
using Prosperity.Model.DataBase;
using Prosperity.Controls.Tables.Disciplines;
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
        public MainPart()
        {
            InitializeComponent();
            GlobalViewModel model = new GlobalViewModel();
            DataContext = model;
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
            DisciplineRow.AddElements(CurrentView, Data.Disciplines);
            RefreshCount();
        }

        public void FillConformity()
        {
            CurrentView.Children.Clear();
            DisciplineRow.AddElements(CurrentView, Data.Disciplines);
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