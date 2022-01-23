﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Controls;
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
using Prosperity.Model;
using Prosperity.ViewModel;
using Prosperity.Model.DataBase;

namespace Prosperity.Controls.Tables
{
    public class LayoutMaster : INotifyPropertyChanged
    {
        private GlobalViewModel _viewModel;
        public GlobalViewModel ViewModel
        {
            get => _viewModel;
            set
            {
                _viewModel = value;
                OnPropertyChanged();
            }
        }

        public LayoutMaster()
        {
            Records = new StackPanel
            {
                Tag = this
            };
        }

        public LayoutMaster(GlobalViewModel viewModel) : this()
        {
            ViewModel = viewModel;
            _connector = new MySQL();
            Tools = new RedactorTools(_connector);
            Data = new ProgramData(_connector);
            FillDisciplines();
        }

        private UserControl _header;
        public UserControl Header
        {
            get => _header;
            set
            {
                _header = value;
                OnPropertyChanged();
            }
        }

        private StackPanel _records;
        public StackPanel Records
        {
            get => _records;
            set
            {
                _records = value;
                OnPropertyChanged();
            }
        }

        public int Count => Records.Children.Count;

        public void AddElements<T>(List<string[]> records, IAutoIndexing rowAdditor)
        {
            Records.Children.Clear();
            ushort i = 0;
            for (; i < records.Count; i++)
                AddElement<T>(records[i]).Index(i + 1);
            rowAdditor.Index(i + 1);
            _ = Records.Children.Add(rowAdditor as UserControl);
            OnPropertyChanged(nameof(Records));
            OnPropertyChanged(nameof(Count));
        }

        public IRedactable AddElement<T>(string[] record)
        {
            IRedactable row = Activator.CreateInstance(typeof(T)) as IRedactable;
            row.SetElement(record);
            _ = Records.Children.Add(row as UserControl);
            row.SetTools(Records);
            return row;
        }

        private void ResetHeaders(UserControl currentHeader)
        {
            Header = null;
            Header = currentHeader;
        }

        private string Before(string name) => "Ранее смотрели: " + name;

        private void FillTables<T>(uint id, string name, TransitionBase.Transition transition,
            UserControl header, List<string[]> rows, IAutoIndexing additor)
        {
            ViewModel.ChangeMarkMethod(transition, name, id);
            ResetHeaders(header);
            AddElements<T>(rows, additor);
        }

        private void FillPrimaryTables<T>(uint id, string name, TransitionBase.Transition transition,
            UserControl header, List<string[]> rows, IAutoIndexing additor)
        {
            ViewModel.CleanBuffer();
            FillTables<T>(id, name, transition, header, rows, additor);
        }

        private void FillSecondaryTables<T>(uint id, string name, TransitionBase.Transition transition,
            UserControl header, List<string[]> rows, IAutoIndexing additor)
        {
            ViewModel.AddTransition(transition, name, id);
            FillTables<T>(id, name, transition, header, rows, additor);
        }

        public void FillConformity(uint id = 0)
        {
            FillPrimaryTables<ConformityRow>(id, Before("Соответствие - ID"), FillConformity,
                new ConformityColumns(), Data.Conformity, new ConformityRowAdditor());
        }


        public void FillSpecialities(uint id = 0)
        {
            FillPrimaryTables<SpecialityRow>(id, Before("Специальность - ID"), FillConformity,
                new SpecialityColumns(), Data.Specialities, new SpecialityRowAdditor());
        }


        public void FillGeneral(List<string[]> records, uint id,
            string name, TransitionBase.Transition transition)
        {
            FillSecondaryTables<GeneralCompetetionRow>(id, name,
                transition, new GeneralCompetetionColumns(),
                records, new GeneralCompetetionRowAdditor());
        }

        public void FillGeneralCompetetions(uint id)
        {
            FillGeneral(Data.GeneralCompetetions(id),
                id, "Специальность - ID", FillGeneralCompetetions);
        }

        public void FillGeneralFromMastering(uint id)
        {
            FillGeneral(Data.ConformityGeneralCompetetions(id),
                id, "Дисциплина - ID", FillGeneralFromMastering);
        }


        public void FillProfessional(List<string[]> records, uint id,
            string name, TransitionBase.Transition transition)
        {
            FillSecondaryTables<ProfessionalCompetetionRow>(id, name,
                transition, new ProfessionalCompetetionColumns(),
                records, new ProfessionalCompetetionRowAdditor());
        }

        public void FillProfessionalCompetetions(uint id)
        {
            FillProfessional(Data.ProfessionalCompetetions(id),
                id, "Специальность - ID", FillProfessionalCompetetions);
        }

        public void FillProfessionalFromMastering(uint id)
        {
            FillProfessional(Data.ConformityProfessionalCompetetions(id),
                id, "Дисциплина - ID", FillProfessionalFromMastering);
        }


        public void FillDisciplines(uint id = 0)
        {
            FillPrimaryTables<DisciplineRow>(id, Before("Дисциплина - ID"), FillDisciplines,
                new DisciplineColumns(), Data.Disciplines, new DisciplineRowAdditor());
        }


        public void FillDisciplineGeneral(List<string[]> records, uint id,
            string name, TransitionBase.Transition transition)
        {
            FillSecondaryTables<DisciplineGeneralMasteringRow>(id, name,
                transition, new DisciplineGeneralMasteringColumns(),
                records, new DisciplineGeneralMasteringRowAdditor());
        }

        public void FillDisciplineGeneralCompetetions(uint id)
        {
            FillDisciplineGeneral(Data.DisciplineGeneralMastering(id),
                id, "Дисциплина - ID", FillDisciplineGeneralCompetetions);
        }

        public void FillDisciplineGeneralFromMastering(uint id)
        {
            FillDisciplineGeneral(Data.DisciplineGeneralMasteringByTheme(id),
                id, "Дисциплина - ID", FillDisciplineGeneralFromMastering);
        }


        public void FillDisciplineProfessional(List<string[]> records, uint id,
            string name, TransitionBase.Transition transition)
        {
            FillSecondaryTables<DisciplineProfessionalMasteringRow>(id, name,
                transition, new DisciplineProfessionalMasteringColumns(),
                records, new DisciplineProfessionalMasteringRowAdditor());
        }

        public void FillDisciplineProfessionalCompetetions(uint id)
        {
            FillDisciplineProfessional(Data.DisciplineProfessionalMastering(id),
                id, "Дисциплина - ID", FillDisciplineProfessionalCompetetions);
        }

        public void FillDisciplineProfessionalFromMastering(uint id)
        {
            FillDisciplineProfessional(Data.DisciplineProfessionalMasteringByTheme(id),
                id, "Дисциплина - ID", FillDisciplineProfessionalFromMastering);
        }


        public void FillSources(uint id)
        {
            FillSecondaryTables<SourceRow>(id, "Дисциплина - ID", FillSources,
                new SourceColumns(), Data.Sources(id), new SourceRowAdditor());
        }

        public void FillMetaData(uint id)
        {
            FillSecondaryTables<MetaDataRow>(id, "Дисциплина - ID", FillMetaData,
                new MetaDataColumns(), Data.MetaData(id), new MetaDataRowAdditor());
        }

        public void FillHours(uint id)
        {
            FillSecondaryTables<HoursRow>(id, "Дисциплина - ID", FillHours,
                new HoursColumns(), Data.TotalHours(id), new HoursRowAdditor());
        }

        public void FillTopics(uint id)
        {
            FillSecondaryTables<TopicRow>(id, "Дисциплина - ID", FillTopics,
                new TopicColumns(), Data.ThemePlan(id), new TopicRowAdditor());
        }

        public void FillThemes(uint id)
        {
            FillSecondaryTables<ThemeRow>(id, "Раздел - ID", FillThemes,
                new ThemeColumns(), Data.Themes(id), new ThemeRowAdditor());
        }

        public void FillThemeGeneralCompetetions(uint id)
        {
            FillSecondaryTables<ThemeGeneralMasteringRow>(id, "Тема - ID",
                FillThemeGeneralCompetetions, new ThemeGeneralMasteringColumns(),
                Data.ThemeGeneralMastering(id), new ThemeGeneralMasteringRowAdditor());
        }

        public void FillThemeProfessionalCompetetions(uint id)
        {
            FillSecondaryTables<ThemeProfessionalMasteringRow>(id, "Тема - ID",
                FillThemeProfessionalCompetetions, new ThemeProfessionalMasteringColumns(),
                Data.ThemeProfessionalMastering(id), new ThemeProfessionalMasteringRowAdditor());
        }

        public void FillWorks(uint id)
        {
            FillSecondaryTables<WorkRow>(id, "Тема - ID", FillWorks,
                new WorkColumns(), Data.Works(id), new WorkRowAdditor());
        }

        public void FillTasks(uint id)
        {
            FillSecondaryTables<TaskRow>(id, "Работа - ID", FillTasks,
                new TaskColumns(), Data.Tasks(id), new TaskRowAdditor());
        }


        public void FillSpecialityCodes(uint id)
        {
            ViewModel.AddTransition(FillSpecialities, Before("Специальность - ID"), id);
            FillSecondaryTables<SpecialityCodeRow>(id, Before("Специальность - ID"),
                FillSpecialityCodes, new SpecialityCodeColumns(), Data.SpecialityCodes,
                new SpecialityCodeRowAdditor());
        }

        public void FillDisciplineCodes(uint id)
        {
            ViewModel.AddTransition(FillDisciplines, "Ранее смотрели: Дисциплина - ID", id);
            FillSecondaryTables<DisciplineCodeRow>(id, Before("Дисциплина - ID"),
                FillDisciplineCodes, new DisciplineCodeColumns(), Data.DisciplineCodes,
                new DisciplineCodeRowAdditor());
        }

        public void FillWorkTypes(uint id)
        {
            FillSecondaryTables<WorkTypesRow>(id, Before("Работа | Час - ID"), FillWorkTypes,
                new WorkTypesColumns(), Data.WorkTypes, new WorkTypesRowAdditor());
        }

        public void FillMetaTypes(uint id)
        {
            FillSecondaryTables<MetaTypeRow>(id, Before("Метаданные - ID"), FillMetaTypes,
                new MetaTypeColumns(), Data.MetaTypes, new MetaTypeRowAdditor());
        }

        public void FillSourceTypes(uint id)
        {
            FillSecondaryTables<SourceTypeRow>(id, Before("Источник - ID"), FillSourceTypes,
                new SourceTypeColumns(), Data.SourceTypes, new SourceTypeRowAdditor());
        }

        public void FillCompetetionLevels(uint id)
        {
            FillSecondaryTables<LevelRow>(id, Before("Тема - ID"), FillCompetetionLevels,
                new LevelColumns(), Data.Levels, new LevelRowAdditor());
        }

        private readonly Sql _connector;
        public RedactorTools Tools { get; }
        public ProgramData Data { get; }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}