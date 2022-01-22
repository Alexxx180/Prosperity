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
using Prosperity.Model;
using Prosperity.Controls.Tables;

namespace Prosperity.Controls.MainForm
{
    /// <summary>
    /// Part responsible for viewing and editing data
    /// </summary>
    public partial class MainPart : UserControl, INotifyPropertyChanged
    {
        public GlobalViewModel ViewModel { get; } = new GlobalViewModel();
        public LayoutMaster TableView;

        private UserControl _tableHeader;

        public MainPart()
        {
            InitializeComponent();
            DataContext = ViewModel;
            TableView = TableViewControl.DataContext as LayoutMaster;
            _tableHeader = DisciplineHeader;
            FillDisciplines();
        }

        private string Before(string name) => "Ранее смотрели: " + name;

        private void Back(object sender, RoutedEventArgs e)
        {
            ViewModel.BackTransition();
        }

        private void EditRows(object sender, RoutedEventArgs e)
        {

        }

        private void MarkRows(object sender, RoutedEventArgs e)
        {
            
        }

        private void ResetHeaders(UserControl currentHeader)
        {
            _tableHeader.Visibility = Visibility.Collapsed;
            _tableHeader = currentHeader;
            _tableHeader.Visibility = Visibility.Visible;
        }

        private void FillTables<T>(uint id, string name,
            MarkBase.Action markAction, TransitionBase.Transition transition,
            UserControl header, List<string[]> rows, IAutoIndexing additor)
        {
            ViewModel.ChangeMarkMethod(markAction, transition, name, id);
            ResetHeaders(header);
            TableView.AddElements<T>(rows, additor);
        }
        
        private void FillPrimaryTables<T>(uint id, string name,
            MarkBase.Action markAction, TransitionBase.Transition transition,
            UserControl header, List<string[]> rows, IAutoIndexing additor)
        {
            ViewModel.CleanBuffer();
            FillTables<T>(id, name, markAction, transition, header, rows, additor);
        }

        private void FillSecondaryTables<T>(uint id, string name,
            MarkBase.Action markAction, TransitionBase.Transition transition,
            UserControl header, List<string[]> rows, IAutoIndexing additor)
        {
            ViewModel.AddTransition(transition, name, id);
            FillTables<T>(id, name, markAction, transition, header, rows, additor);
        }

        public void FillConformity(uint id = 0)
        {
            FillPrimaryTables<ConformityRow>(id, Before("Соответствие - ID"), Mark.Conformity,
                FillConformity, ConformityHeader, ViewModel.Data.Conformity, new ConformityRowAdditor());
        }


        public void FillSpecialities(uint id = 0)
        {
            FillPrimaryTables<SpecialityRow>(id, Before("Специальность - ID"), Mark.Speciality,
                FillConformity, SpecialityHeader, ViewModel.Data.Specialities, new SpecialityRowAdditor());
        }


        public void FillGeneral(List<string[]> records, uint id,
            string name, TransitionBase.Transition transition)
        {
            FillSecondaryTables<GeneralCompetetionRow>(id, name, Mark.GeneralCompetetion,
                transition, GeneralCompetetionHeader, records, new GeneralCompetetionRowAdditor());
        }

        public void FillGeneralCompetetions(uint id)
        {
            FillGeneral(ViewModel.Data.GeneralCompetetions(id),
                id, "Специальность - ID", FillGeneralCompetetions);
        }

        public void FillGeneralFromMastering(uint id)
        {
            FillGeneral(ViewModel.Data.ConformityGeneralCompetetions(id),
                id, "Дисциплина - ID", FillGeneralFromMastering);
        }


        public void FillProfessional(List<string[]> records, uint id,
            string name, TransitionBase.Transition transition)
        {
            FillSecondaryTables<ProfessionalCompetetionRow>(id, name, Mark.ProfessionalCompetetion,
                transition, ProfessionalCompetetionHeader, records, new ProfessionalCompetetionRowAdditor());
        }

        public void FillProfessionalCompetetions(uint id)
        {
            FillProfessional(ViewModel.Data.ProfessionalCompetetions(id),
                id, "Специальность - ID", FillProfessionalCompetetions);
        }

        public void FillProfessionalFromMastering(uint id)
        {
            FillProfessional(ViewModel.Data.ConformityProfessionalCompetetions(id),
                id, "Специальность - ID", FillProfessionalFromMastering);
        }


        public void FillDisciplines(uint id = 0)
        {
            FillPrimaryTables<DisciplineRow>(id, Before("Дисциплина - ID"), Mark.Discipline,
                FillDisciplines, DisciplineHeader, ViewModel.Data.Disciplines, new DisciplineRowAdditor());
        }


        public void FillDisciplineGeneral(List<string[]> records, uint id,
            string name, TransitionBase.Transition transition)
        {
            FillSecondaryTables<DisciplineGeneralMasteringRow>(id, name, Mark.GeneralMastering,
                transition, GeneralMasteringHeader, records, new DisciplineGeneralMasteringRowAdditor());
        }

        public void FillDisciplineGeneralCompetetions(uint id)
        {
            FillDisciplineGeneral(ViewModel.Data.DisciplineGeneralMastering(id),
                id, "Дисциплина - ID", FillDisciplineGeneralCompetetions);
        }

        public void FillDisciplineGeneralFromMastering(uint id)
        {
            FillDisciplineGeneral(ViewModel.Data.DisciplineGeneralMasteringByTheme(id),
                id, "Дисциплина - ID", FillDisciplineGeneralFromMastering);
        }


        public void FillDisciplineProfessional(List<string[]> records, uint id,
            string name, TransitionBase.Transition transition)
        {
            FillSecondaryTables<DisciplineProfessionalMasteringRow>(id, name, Mark.ProfessionalMastering,
                transition, ProfessionalMasteringHeader, records, new DisciplineProfessionalMasteringRowAdditor());
        }

        public void FillDisciplineProfessionalCompetetions(uint id)
        {
            FillDisciplineProfessional(ViewModel.Data.DisciplineProfessionalMastering(id),
                id, "Дисциплина - ID", FillDisciplineProfessionalCompetetions);
        }

        public void FillDisciplineProfessionalFromMastering(uint id)
        {
            FillDisciplineProfessional(ViewModel.Data.DisciplineProfessionalMasteringByTheme(id),
                id, "Дисциплина - ID", FillDisciplineProfessionalFromMastering);
        }


        public void FillSources(uint id)
        {
            FillSecondaryTables<SourceRow>(id, "Дисциплина - ID", Mark.ProfessionalMastering,
                FillSources, SourceHeader, ViewModel.Data.Sources(id), new SourceRowAdditor());
        }

        public void FillMetaData(uint id)
        {
            FillSecondaryTables<MetaDataRow>(id, "Дисциплина - ID", Mark.MetaData, FillMetaData,
                MetadataHeader, ViewModel.Data.MetaData(id), new MetaDataRowAdditor());
        }

        public void FillHours(uint id)
        {
            FillSecondaryTables<HoursRow>(id, "Дисциплина - ID", Mark.TotalHour, FillHours,
                HoursHeader, ViewModel.Data.TotalHours(id), new HoursRowAdditor());
        }

        public void FillTopics(uint id)
        {
            FillSecondaryTables<TopicRow>(id, "Дисциплина - ID", Mark.Topic, FillTopics,
                ThemePlanHeader, ViewModel.Data.ThemePlan(id), new TopicRowAdditor());
        }

        public void FillThemes(uint id)
        {
            FillSecondaryTables<ThemeRow>(id, "Раздел - ID", Mark.Theme, FillThemes,
                ThemesHeader, ViewModel.Data.Themes(id), new ThemeRowAdditor());
        }

        public void FillThemeGeneralCompetetions(uint id)
        {
            FillSecondaryTables<ThemeGeneralMasteringRow>(id, "Тема - ID", Mark.GeneralSelection,
                FillThemeGeneralCompetetions, GeneralSelectionHeader, ViewModel.Data.ThemeGeneralMastering(id),
                new ThemeGeneralMasteringRowAdditor());
        }

        public void FillThemeProfessionalCompetetions(uint id)
        {
            FillSecondaryTables<ThemeProfessionalMasteringRow>(id, "Тема - ID", Mark.ProfessionalSelection,
                FillThemeProfessionalCompetetions, ProfessionalSelectionHeader,
                ViewModel.Data.ThemeProfessionalMastering(id), new ThemeProfessionalMasteringRowAdditor());
        }

        public void FillWorks(uint id)
        {
            FillSecondaryTables<WorkRow>(id, "Тема - ID", Mark.Work, FillWorks,
                WorksHeader, ViewModel.Data.Works(id), new WorkRowAdditor());
        }

        public void FillTasks(uint id)
        {
            FillSecondaryTables<TaskRow>(id, "Работа - ID", Mark.Task, FillTasks,
                TasksHeader, ViewModel.Data.Tasks(id), new TaskRowAdditor());
        }


        public void FillSpecialityCodes(uint id)
        {
            ViewModel.AddTransition(FillSpecialities, Before("Специальность - ID"), id);
            FillSecondaryTables<SpecialityCodeRow>(id, Before("Специальность - ID"),
                Mark.SpecialityCode, FillSpecialityCodes, SpecialityCodesHeader,
                ViewModel.Data.SpecialityCodes, new SpecialityCodeRowAdditor());
        }

        public void FillDisciplineCodes(uint id)
        {
            ViewModel.AddTransition(FillDisciplines, "Ранее смотрели: Дисциплина - ID", id);
            FillSecondaryTables<DisciplineCodeRow>(id, Before("Дисциплина - ID"),
                Mark.DisciplineCode, FillDisciplineCodes, DisciplineCodesHeader,
                ViewModel.Data.DisciplineCodes, new DisciplineCodeRowAdditor());
        }

        public void FillWorkTypes(uint id)
        {
            FillSecondaryTables<WorkTypesRow>(id, Before("Работа | Час - ID"), Mark.WorkType,
                FillWorkTypes, WorkTypesHeader, ViewModel.Data.WorkTypes, new WorkTypesRowAdditor());
        }

        public void FillMetaTypes(uint id)
        {
            FillSecondaryTables<MetaTypeRow>(id, Before("Метаданные - ID"), Mark.MetaType,
                FillMetaTypes, MetaTypesHeader, ViewModel.Data.MetaTypes, new MetaTypeRowAdditor());
        }

        public void FillSourceTypes(uint id)
        {
            FillSecondaryTables<SourceTypeRow>(id, Before("Источник - ID"), Mark.SourceType,
                FillSourceTypes, SourceTypesHeader, ViewModel.Data.SourceTypes, new SourceTypeRowAdditor());
        }

        public void FillCompetetionLevels(uint id)
        {
            FillSecondaryTables<LevelRow>(id, Before("Тема - ID"), Mark.Level, FillCompetetionLevels,
                LevelsHeader, ViewModel.Data.Levels, new LevelRowAdditor());
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}