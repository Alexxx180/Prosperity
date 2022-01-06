using System.Windows.Controls;
using Prosperity.ViewModel;
using Prosperity.Controls.Tables.Disciplines;
using Prosperity.Controls.Tables.Specialities;
using Prosperity.Controls.Tables.Conformity;
using System.Runtime.CompilerServices;
using System.ComponentModel;

namespace Prosperity.Controls.MainForm
{
    /// <summary>
    /// Логика взаимодействия для MainPart.xaml
    /// </summary>
    public partial class MainPart : UserControl, INotifyPropertyChanged
    {
        private readonly GlobalViewModel ViewModel = new GlobalViewModel();

        public MainPart()
        {
            InitializeComponent();
            DataContext = ViewModel;
            FillDisciplines();
        }

        private void ResetHeaders(UserControl currentHeader)
        {
            for (byte i = 0; i < CurrentHeaders.Children.Count; i++)
            {
                UserControl header = CurrentHeaders.Children[i] as UserControl;
                header.Visibility = System.Windows.Visibility.Collapsed;
            }
            currentHeader.Visibility = System.Windows.Visibility.Visible;
        }

        public void FillDisciplines()
        {
            ResetHeaders(DisciplineHeader);
            CurrentView.Children.Clear();
            DisciplineRow.AddElements(CurrentView, ViewModel.Data.Disciplines);
            RefreshCount();
        }

        public void FillSpecialities()
        {
            ResetHeaders(SpecialityHeader);
            CurrentView.Children.Clear();
            SpecialityRow.AddElements(CurrentView, ViewModel.Data.Specialities);
            RefreshCount();
        }

        public void FillConformity()
        {
            ResetHeaders(ConformityHeader);
            CurrentView.Children.Clear();
            ConformityRow.AddElements(CurrentView, ViewModel.Data.Conformity);
            RefreshCount();
        }


        public void FillGeneralCompetetions()
        {
            CurrentView.Children.Clear();
            
            RefreshCount();
        }

        public void FillProfessionalCompetetions()
        {
            CurrentView.Children.Clear();

            RefreshCount();
        }

        public void RefreshCount()
        {
            CountRecords.GetBindingExpression(TextBlock.TextProperty).UpdateTarget();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}