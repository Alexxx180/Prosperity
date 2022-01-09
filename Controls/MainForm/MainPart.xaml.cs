using System.Windows;
using System.Windows.Controls;
using System.Runtime.CompilerServices;
using System.ComponentModel;
using Prosperity.ViewModel;
using Prosperity.Controls.Tables.Conformity;
using Prosperity.Controls.Tables.Specialities;
using Prosperity.Controls.Tables.Specialities.GeneralCompetetions;
using Prosperity.Controls.Tables.Specialities.ProfessionalCompetetions;
using Prosperity.Controls.Tables.Disciplines;
using Prosperity.Controls.Tables.Disciplines.GeneralMastering;
using Prosperity.Controls.Tables.Disciplines.ProfessionalMastering;
using Prosperity.Controls.Tables.Disciplines.SourceTypes;
using Prosperity.Controls.Tables.Disciplines.SourceTypes.Sources;
using Prosperity.Controls.Tables.Disciplines.MetaTypes;
using Prosperity.Controls.Tables.Disciplines.MetaTypes.MetaData;
using Prosperity.Controls.Tables.Disciplines.WorkTypes;
using Prosperity.Controls.Tables.Disciplines.WorkTypes.Hours;
using Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan;
using Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes;
using Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.CompetetionLevels;
using Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.GeneralMastering;
using Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.ProfessionalMastering;
using Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.Works;
using Prosperity.Controls.Tables.Disciplines.WorkTypes.ThemePlan.Themes.Works.Tasks;
using static System.Diagnostics.Trace;

namespace Prosperity.Controls.MainForm
{
    /// <summary>
    /// Part responsible for viewing and editing data
    /// </summary>
    public partial class MainPart : UserControl, INotifyPropertyChanged
    {
        public GlobalViewModel ViewModel { get; } = new GlobalViewModel();

        public MainPart()
        {
            InitializeComponent();
            DataContext = ViewModel;
            FillDisciplines();
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            _ = ViewModel.PopTransition();
            ViewModel.GetTransition().MakeTransition();
            if (!ViewModel.IsTopTransition)
            _ = ViewModel.PopTransition();
            //WriteLine(ViewModel.GetTransition().Name);
        }

        private void ResetHeaders(UserControl currentHeader)
        {
            for (byte i = 0; i < CurrentHeaders.Children.Count; i++)
            {
                UserControl header = CurrentHeaders.Children[i] as UserControl;
                header.Visibility = Visibility.Collapsed;
            }
            currentHeader.Visibility = Visibility.Visible;
        }

        public void FillConformity(uint id = 0)
        {
            ViewModel.CleanBuffer();
            ResetHeaders(ConformityHeader);
            CurrentView.Children.Clear();
            ConformityRow.AddElements(CurrentView, ViewModel.Data.Conformity, id);
            RefreshCount();
        }

        public void FillSpecialities(uint id = 0)
        {
            ViewModel.CleanBuffer();
            ResetHeaders(SpecialityHeader);
            CurrentView.Children.Clear();
            SpecialityRow.AddElements(CurrentView, ViewModel.Data.Specialities, id);
            RefreshCount();
        }

        public void FillGeneralCompetetions(uint id)
        {
            ViewModel.AddTransition(FillGeneralCompetetions, "Специальность - ID", id);
            ResetHeaders(GeneralCompetetionHeader);
            CurrentView.Children.Clear();
            GeneralCompetetionRow.AddElements(CurrentView, ViewModel.Data.GeneralCompetetions(id));
            RefreshCount();
        }

        public void FillProfessionalCompetetions(uint id)
        {
            ViewModel.AddTransition(FillProfessionalCompetetions, "Специальность - ID", id);
            ResetHeaders(ProfessionalCompetetionHeader);
            CurrentView.Children.Clear();
            ProfessionalCompetetionRow.AddElements(CurrentView, ViewModel.Data.ProfessionalCompetetions(id));
            RefreshCount();
        }

        public void FillDisciplines(uint id = 0)
        {
            ViewModel.CleanBuffer();
            ResetHeaders(DisciplineHeader);
            CurrentView.Children.Clear();
            DisciplineRow.AddElements(CurrentView, ViewModel.Data.Disciplines, id);
            RefreshCount();
        }

        public void FillDisciplineGeneralCompetetions(uint id)
        {
            ViewModel.AddTransition(FillDisciplineGeneralCompetetions, "Дисциплина - ID", id);
            ResetHeaders(GeneralMasteringHeader);
            CurrentView.Children.Clear();
            DisciplineGeneralMasteringRow.AddElements(CurrentView,
                ViewModel.Data.DisciplineGeneralMastering(id));
            RefreshCount();
        }

        public void FillDisciplineProfessionalCompetetions(uint id)
        {
            ViewModel.AddTransition(FillDisciplineProfessionalCompetetions, "Дисциплина - ID", id);
            ResetHeaders(ProfessionalMasteringHeader);
            CurrentView.Children.Clear();
            DisciplineProfessionalMasteringRow.AddElements(CurrentView,
                ViewModel.Data.DisciplineProfessionalMastering(id));
            RefreshCount();
        }

        public void FillSources(uint id)
        {
            ViewModel.AddTransition(FillSources, "Дисциплина - ID", id);
            ResetHeaders(SourceHeader);
            CurrentView.Children.Clear();
            SourceRow.AddElements(CurrentView, ViewModel.Data.Sources(id));
            RefreshCount();
        }

        public void FillMetaData(uint id)
        {
            ViewModel.AddTransition(FillMetaData, "Дисциплина - ID", id);
            ResetHeaders(MetadataHeader);
            CurrentView.Children.Clear();
            MetaDataRow.AddElements(CurrentView, ViewModel.Data.MetaData(id));
            RefreshCount();
        }

        public void FillHours(uint id)
        {
            ViewModel.AddTransition(FillHours, "Дисциплина - ID", id);
            ResetHeaders(HoursHeader);
            CurrentView.Children.Clear();
            HoursRow.AddElements(CurrentView, ViewModel.Data.TotalHours(id));
            RefreshCount();
        }

        public void FillTopics(uint id)
        {
            ViewModel.AddTransition(FillTopics, "Дисциплина - ID", id);
            ResetHeaders(ThemePlanHeader);
            CurrentView.Children.Clear();
            TopicRow.AddElements(CurrentView, ViewModel.Data.ThemePlan(id));
            RefreshCount();
        }

        public void FillThemes(uint id)
        {
            ViewModel.AddTransition(FillThemes, "Раздел - ID", id);
            ResetHeaders(ThemesHeader);
            CurrentView.Children.Clear();
            ThemeRow.AddElements(CurrentView, ViewModel.Data.Themes(id));
            RefreshCount();
        }

        public void FillCompetetionLevels()
        {
            ResetHeaders(LevelsHeader);
            CurrentView.Children.Clear();
            LevelRow.AddElements(CurrentView, ViewModel.Data.Levels);
            RefreshCount();
        }

        public void FillThemeGeneralCompetetions(uint id)
        {
            ViewModel.AddTransition(FillThemeGeneralCompetetions, "Тема - ID", id);
            ResetHeaders(GeneralSelectionHeader);
            CurrentView.Children.Clear();
            ThemeGeneralMasteringRow.AddElements(CurrentView, ViewModel.Data.ThemeGeneralMastering(id));
            RefreshCount();
        }

        public void FillThemeProfessionalCompetetions(uint id)
        {
            ViewModel.AddTransition(FillThemeProfessionalCompetetions, "Тема - ID", id);
            ResetHeaders(ProfessionalSelectionHeader);
            CurrentView.Children.Clear();
            ThemeProfessionalMasteringRow.AddElements(CurrentView, ViewModel.Data.ThemeProfessionalMastering(id));
            RefreshCount();
        }

        public void FillWorks(uint id)
        {
            ViewModel.AddTransition(FillWorks, "Тема - ID", id);
            ResetHeaders(WorksHeader);
            CurrentView.Children.Clear();
            WorkRow.AddElements(CurrentView, ViewModel.Data.Works(id));
            RefreshCount();
        }

        public void FillTasks(uint id)
        {
            ViewModel.AddTransition(FillTasks, "Работа - ID", id);
            ResetHeaders(TasksHeader);
            CurrentView.Children.Clear();
            TaskRow.AddElements(CurrentView, ViewModel.Data.Tasks(id));
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