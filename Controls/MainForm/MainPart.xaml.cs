using System.Windows;
using System.Windows.Controls;
using System.Runtime.CompilerServices;
using System.ComponentModel;
using Prosperity.ViewModel;
using Prosperity.Controls.Tables.Conformity;
using Prosperity.Controls.Tables.Specialities;
using Prosperity.Controls.Tables.Specialities.SpecialityCodes;
using Prosperity.Controls.Tables.Specialities.GeneralCompetetions;
using Prosperity.Controls.Tables.Specialities.ProfessionalCompetetions;
using Prosperity.Controls.Tables.Disciplines;
using Prosperity.Controls.Tables.Disciplines.DisciplineCodes;
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
using System.Collections.Generic;
using static Prosperity.Model.DataBase.RedactorTools;
using Prosperity.Controls.Tables;

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
        }

        private void EditRows(object sender, RoutedEventArgs e)
        {

        }

        private void MarkRows(object sender, RoutedEventArgs e)
        {
            List<uint> ids = new List<uint>();
            for (ushort i = 0; i < CurrentView.Children.Count; i++)
            {
                IRedactable row = CurrentView.Children[i] as IRedactable;
                if (row != null && row.CanBeEdited)
                    ids.Add(row.MarkPrepare());
            }
            string message = "Будет помечено записей: " + ids.Count + "\nПродолжить?";
            MessageBoxResult result = MessageBox.Show(message, "Помечение",
                MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                for (ushort i = 0; i < ids.Count; i++)
                    ViewModel.ViewTools.Value.Do(ids[i]);
                ViewModel.ViewTools.Name.MakeTransition();
            }
            else
            {
                for (ushort i = 0; i < CurrentView.Children.Count; i++)
                {
                    IRedactable row = CurrentView.Children[i] as IRedactable;
                    if (row != null && row.CanBeEdited)
                        row.UnMark();
                }
            }
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

        private void ResetView(UserControl currentHeader)
        {
            ResetHeaders(currentHeader);
            CurrentView.Children.Clear();
        }

        public void FillConformity(uint id = 0)
        {
            ViewModel.CleanBuffer();
            ViewModel.ChangeMarkMethod(Mark.Conformity, FillConformity, "Ранее смотрели: Соответствие - ID", id);
            ResetView(ConformityHeader);
            ConformityRow.AddElements(CurrentView, ViewModel.Data.Conformity, id);
            RefreshCount();
        }

        public void FillSpecialities(uint id = 0)
        {
            ViewModel.CleanBuffer();
            ViewModel.ChangeMarkMethod(Mark.Speciality, FillSpecialities, "Ранее смотрели: Специальность - ID", id);
            ResetView(SpecialityHeader);
            SpecialityRow.AddElements(CurrentView, ViewModel.Data.Specialities, id);
            RefreshCount();
        }

        public void FillGeneralCompetetions(List<string[]> records)
        {
            ViewModel.ChangeMarkMethod(Mark.GeneralCompetetion);
            ResetView(GeneralCompetetionHeader);
            GeneralCompetetionRow.AddElements(CurrentView, records);
            RefreshCount();
        }

        public void FillGeneralCompetetions(uint id)
        {
            ViewModel.AddTransition(FillGeneralCompetetions, "Специальность - ID", id);
            FillGeneralCompetetions(ViewModel.Data.GeneralCompetetions(id));
        }

        public void FillGeneralFromMastering(uint id)
        {
            ViewModel.AddTransition(FillGeneralFromMastering, "Дисциплина - ID", id);
            FillGeneralCompetetions(ViewModel.Data.ConformityGeneralCompetetions(id));
        }

        public void FillProfessionalCompetetions(List<string[]> records)
        {
            ViewModel.ChangeMarkMethod(Mark.ProfessionalCompetetion);
            ResetView(ProfessionalCompetetionHeader);
            ProfessionalCompetetionRow.AddElements(CurrentView, records);
            RefreshCount();
        }

        public void FillProfessionalCompetetions(uint id)
        {
            ViewModel.AddTransition(FillProfessionalCompetetions, "Специальность - ID", id);
            FillProfessionalCompetetions(ViewModel.Data.ProfessionalCompetetions(id));
        }

        public void FillProfessionalFromMastering(uint id)
        {
            ViewModel.AddTransition(FillProfessionalFromMastering, "Дисциплина - ID", id);
            FillGeneralCompetetions(ViewModel.Data.ConformityProfessionalCompetetions(id));
        }

        public void FillDisciplines(uint id = 0)
        {
            ViewModel.CleanBuffer();
            ViewModel.ChangeMarkMethod(Mark.Discipline, FillDisciplines, "Ранее смотрели: Дисциплина - ID", id);
            ResetView(DisciplineHeader);
            DisciplineRow.AddElements(CurrentView, ViewModel.Data.Disciplines, id);
            RefreshCount();
        }

        public void FillDisciplineGeneralCompetetions(List<string[]> rows)
        {
            ViewModel.ChangeMarkMethod(Mark.GeneralMastering);
            ResetView(GeneralMasteringHeader);
            DisciplineGeneralMasteringRow.AddElements(CurrentView, rows);
            RefreshCount();
        }

        public void FillDisciplineGeneralCompetetions(uint id)
        {
            ViewModel.AddTransition(FillDisciplineGeneralCompetetions, "Дисциплина - ID", id);
            FillDisciplineGeneralCompetetions(ViewModel.Data.DisciplineGeneralMastering(id));
        }

        public void FillDisciplineGeneralFromMastering(uint id)
        {
            ViewModel.AddTransition(FillDisciplineGeneralFromMastering, "Дисциплина - ID", id);
            FillDisciplineGeneralCompetetions(ViewModel.Data.DisciplineGeneralMasteringByTheme(id));
        }

        public void FillDisciplineProfessionalCompetetions(List<string[]> rows)
        {
            ViewModel.ChangeMarkMethod(Mark.ProfessionalMastering);
            ResetView(ProfessionalMasteringHeader);
            DisciplineProfessionalMasteringRow.AddElements(CurrentView, rows);
            RefreshCount();
        }

        public void FillDisciplineProfessionalCompetetions(uint id)
        {
            ViewModel.AddTransition(FillDisciplineProfessionalCompetetions, "Дисциплина - ID", id);
            FillDisciplineProfessionalCompetetions(ViewModel.Data.DisciplineProfessionalMastering(id));
        }

        public void FillDisciplineProfessionalFromMastering(uint id)
        {
            ViewModel.AddTransition(FillDisciplineProfessionalFromMastering, "Дисциплина - ID", id);
            FillDisciplineProfessionalCompetetions(ViewModel.Data.DisciplineProfessionalMasteringByTheme(id));
        }

        public void FillSources(uint id)
        {
            ViewModel.AddTransition(FillSources, "Дисциплина - ID", id);
            ViewModel.ChangeMarkMethod(Mark.Source);
            ResetView(SourceHeader);
            SourceRow.AddElements(CurrentView, ViewModel.Data.Sources(id));
            RefreshCount();
        }

        public void FillMetaData(uint id)
        {
            ViewModel.AddTransition(FillMetaData, "Дисциплина - ID", id);
            ViewModel.ChangeMarkMethod(Mark.MetaData);
            ResetView(MetadataHeader);
            MetaDataRow.AddElements(CurrentView, ViewModel.Data.MetaData(id));
            RefreshCount();
        }

        public void FillHours(uint id)
        {
            ViewModel.AddTransition(FillHours, "Дисциплина - ID", id);
            ViewModel.ChangeMarkMethod(Mark.TotalHour);
            ResetView(HoursHeader);
            HoursRow.AddElements(CurrentView, ViewModel.Data.TotalHours(id));
            RefreshCount();
        }

        public void FillTopics(uint id)
        {
            ViewModel.AddTransition(FillTopics, "Дисциплина - ID", id);
            ViewModel.ChangeMarkMethod(Mark.Topic);
            ResetView(ThemePlanHeader);
            TopicRow.AddElements(CurrentView, ViewModel.Data.ThemePlan(id));
            RefreshCount();
        }

        public void FillThemes(uint id)
        {
            ViewModel.AddTransition(FillThemes, "Раздел - ID", id);
            ViewModel.ChangeMarkMethod(Mark.Theme);
            ResetView(ThemesHeader);
            ThemeRow.AddElements(CurrentView, ViewModel.Data.Themes(id));
            RefreshCount();
        }

        public void FillThemeGeneralCompetetions(uint id)
        {
            ViewModel.AddTransition(FillThemeGeneralCompetetions, "Тема - ID", id);
            ViewModel.ChangeMarkMethod(Mark.GeneralSelection);
            ResetView(GeneralSelectionHeader);
            ThemeGeneralMasteringRow.AddElements(CurrentView, ViewModel.Data.ThemeGeneralMastering(id));
            RefreshCount();
        }

        public void FillThemeProfessionalCompetetions(uint id)
        {
            ViewModel.AddTransition(FillThemeProfessionalCompetetions, "Тема - ID", id);
            ViewModel.ChangeMarkMethod(Mark.ProfessionalSelection);
            ResetView(ProfessionalSelectionHeader);
            ThemeProfessionalMasteringRow.AddElements(CurrentView, ViewModel.Data.ThemeProfessionalMastering(id));
            RefreshCount();
        }

        public void FillWorks(uint id)
        {
            ViewModel.AddTransition(FillWorks, "Тема - ID", id);
            ViewModel.ChangeMarkMethod(Mark.Work);
            ResetView(WorksHeader);
            WorkRow.AddElements(CurrentView, ViewModel.Data.Works(id));
            RefreshCount();
        }

        public void FillTasks(uint id)
        {
            ViewModel.AddTransition(FillTasks, "Работа - ID", id);
            ResetView(TasksHeader);
            TaskRow.AddElements(CurrentView, ViewModel.Data.Tasks(id));
            RefreshCount();
        }


        public void FillSpecialityCodes(uint id)
        {
            ViewModel.AddTransition(FillSpecialities, "Ранее смотрели: Специальность - ID", id);
            ViewModel.AddTransition(FillSpecialityCodes, "Ранее смотрели: Специальность - ID", id);
            ResetView(SpecialityCodesHeader);
            SpecialityCodeRow.AddElements(CurrentView, ViewModel.Data.SpecialityCodes);
            RefreshCount();
        }

        public void FillDisciplineCodes(uint id)
        {
            ViewModel.AddTransition(FillDisciplines, "Ранее смотрели: Дисциплина - ID", id);
            ViewModel.AddTransition(FillDisciplineCodes, "Ранее смотрели: Дисциплина - ID", id);
            ResetView(DisciplineCodesHeader);
            DisciplineCodeRow.AddElements(CurrentView, ViewModel.Data.DisciplineCodes);
            RefreshCount();
        }

        public void FillWorkTypes(uint id)
        {
            ViewModel.AddTransition(FillWorkTypes, "Ранее смотрели: Работа/Час - ID", id);
            ResetView(WorkTypesHeader);
            WorkTypesRow.AddElements(CurrentView, ViewModel.Data.WorkTypes);
            RefreshCount();
        }

        public void FillMetaTypes(uint id)
        {
            ViewModel.AddTransition(FillMetaTypes, "Ранее смотрели: Метаданные - ID", id);
            ResetView(MetaTypesHeader);
            MetaTypeRow.AddElements(CurrentView, ViewModel.Data.MetaTypes);
            RefreshCount();
        }

        public void FillSourceTypes(uint id)
        {
            ViewModel.AddTransition(FillSourceTypes, "Ранее смотрели: Источник - ID", id);
            ResetView(SourceTypesHeader);
            SourceTypeRow.AddElements(CurrentView, ViewModel.Data.SourceTypes);
            RefreshCount();
        }

        public void FillCompetetionLevels(uint id)
        {
            ViewModel.AddTransition(FillCompetetionLevels, "Ранее смотрели: Тема - ID", id);
            ResetView(LevelsHeader);
            LevelRow.AddElements(CurrentView, ViewModel.Data.Levels);
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