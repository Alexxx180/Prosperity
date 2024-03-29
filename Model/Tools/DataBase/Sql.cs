﻿using System;
using System.Windows;
using System.Collections.Generic;
using Serilog;

namespace Prosperity.Model.Tools.DataBase
{
    /// <summary>
    /// Class containing necessary methods to work with database
    /// </summary>
    public abstract class Sql : IDataViewer, IDataRedactor
    {
        #region Configuration Members
        public string UserName { get; set; }

        public bool IndependentMode { get; set; }

        internal abstract void SetConfiguration(in string dbName, in string host);

        public abstract bool TestConnection(in string login, in string pass);

        internal abstract bool Connect();
        #endregion

        public abstract void Procedure(in string name);

        #region WorkWithParameters Members
        public abstract void PassParameter(in string ParamName, in object newParam);

        public void PassParameters(Dictionary<string, object> parameters)
        {
            foreach (KeyValuePair<string, object> entry in parameters)
            {
                PassParameter(entry.Key, entry.Value);
            }
        }

        public abstract void ClearParameters();
        #endregion

        #region ProcedureExecuteOnly Members
        public abstract void OnlyExecute();

        public void ExecuteProcedure(string name)
        {
            Procedure(name);
            OnlyExecute();
        }

        public void ExecuteProcedure(string name, string paramName, object value)
        {
            Procedure(name);
            PassParameter(paramName, value);
            OnlyExecute();
            ClearParameters();
        }

        public void ExecuteProcedure(string name, Dictionary<string, object> parameters)
        {
            Procedure(name);
            PassParameters(parameters);
            OnlyExecute();
            ClearParameters();
        }
        #endregion

        #region ReadRecords Members
        public abstract object ReadScalar();

        public abstract List<object[]> ReadData();

        public object GetRecord(string name)
        {
            Procedure(name);
            object field = ReadScalar();
            return field;
        }

        public object GetRecord(string name, string paramName, object value)
        {
            Procedure(name);
            PassParameter(paramName, value);
            object field = ReadScalar();
            ClearParameters();
            return field;
        }

        public List<object[]> GetRecords(string name)
        {
            Procedure(name);
            List<object[]> records = ReadData();
            ClearParameters();
            return records;
        }

        public List<object[]> GetRecords(string name, string paramName, object value)
        {
            Procedure(name);
            PassParameter(paramName, value);
            List<object[]> records = ReadData();
            ClearParameters();
            return records;
        }

        public List<object[]> GetRecords(string name, Dictionary<string, object> parameters)
        {
            Procedure(name);
            PassParameters(parameters);
            List<object[]> records = ReadData();
            ClearParameters();
            return records;
        }
        #endregion


        #region Data view methods
        public List<object[]> ConformityList()
        {
            return GetRecords("get_conformity_full_unmarked");
        }

        // Specialities
        public List<object[]> SpecialitiesList()
        {
            return GetRecords("get_specialities_unmarked");
        }

        public List<object[]> SpecialityCodes()
        {
            return GetRecords("get_speciality_codes_unmarked");
        }

        public List<object[]> GeneralCompetetions(uint value)
        {
            return GetRecords("get_speciality_general_unmarked", "speciality_id", value);
        }

        public List<object[]> ProfessionalCompetetions(uint value)
        {
            return GetRecords("get_speciality_professional_unmarked", "speciality_id", value);
        }

        // Disciplines
        public List<object[]> DisciplinesList()
        {
            return GetRecords("get_disciplines_unmarked");
        }

        public List<object[]> DisciplineCodes()
        {
            return GetRecords("get_discipline_codes_unmarked");
        }

        public List<object[]> TotalHours(uint value)
        {
            return GetRecords("get_discipline_total_hours_unmarked", "discipline_id", value);
        }

        public List<object[]> ThemePlan(uint value)
        {
            return GetRecords("get_theme_plan_by_discipline_unmarked", "discipline_id", value);
        }

        public List<object[]> Themes(uint value)
        {
            return GetRecords("get_themes_by_section_unmarked", "section_id", value);
        }

        public List<object[]> Works(uint value)
        {
            return GetRecords("get_work_by_theme_unmarked", "theme_id", value);
        }

        public List<object[]> WorkTypes()
        {
            return GetRecords("get_work_types_unmarked");
        }

        public List<object[]> Tasks(ulong value)
        {
            return GetRecords("get_task_by_work_unmarked", "work_id", value);
        }

        public List<object[]> MetaData(uint value)
        {
            return GetRecords("get_discipline_meta_data_unmarked", "discipline_id", value);
        }

        public List<object[]> MetaTypes()
        {
            return GetRecords("get_meta_types_unmarked");
        }

        public List<object[]> Sources(uint value)
        {
            return GetRecords("get_discipline_sources_unmarked", "discipline_id", value);
        }

        public List<object[]> SourceTypes()
        {
            return GetRecords("get_source_types_unmarked");
        }

        public List<object[]> DisciplineGeneralMastering(uint value)
        {
            return GetRecords("get_discipline_general_mastering_unmarked", "discipline_id", value);
        }

        public List<object[]> DisciplineProfessionalMastering(uint value)
        {
            return GetRecords("get_discipline_professional_mastering_unmarked", "discipline_id", value);
        }

        public List<object[]> ThemeGeneralMastering(uint value)
        {
            return GetRecords("get_theme_general_mastering_selection_unmarked", "theme_id", value);
        }

        public List<object[]> ThemeProfessionalMastering(uint value)
        {
            return GetRecords("get_theme_professional_mastering_selection_unmarked", "theme_id", value);
        }

        public List<object[]> Levels()
        {
            return GetRecords("get_all_levels_unmarked");
        }


        public List<object[]> ConformityGeneralCompetetions(uint value)
        {
            return GetRecords("get_conformity_general_competetions_unmarked", "discipline_id", value);
        }

        public List<object[]> ConformityProfessionalCompetetions(uint value)
        {
            return GetRecords("get_conformity_professional_competetions_unmarked", "discipline_id", value);
        }

        public object DisciplineByTheme(uint value)
        {
            return GetRecord("get_discipline_by_theme", "theme_id", value);
        }
        #endregion


        #region Data adding methods
        public void AddConformity(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_conformity", parameters);
        }

        // Specialities
        public void AddSpeciality(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_speciality", parameters);
        }

        public void AddSpecialityCode(string value)
        {
            ExecuteProcedure("add_speciality_code", "speciality_code", value);
        }

        public void AddGeneralCompetetion(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_general_competetion", parameters);
        }

        public void AddProfessionalCompetetion(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_professional_competetion", parameters);
        }

        // Disciplines
        public void AddDiscipline(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_discipline", parameters);
        }

        public void AddDisciplineCode(string value)
        {
            ExecuteProcedure("add_discipline_code", "discipline_code", value);
        }

        public void AddTotalHour(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_hour", parameters);
        }

        public void AddTopic(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_section", parameters);
        }

        public void AddTheme(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_theme", parameters);
        }

        public void AddWork(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_work", parameters);
        }

        public void AddWorkType(string value)
        {
            ExecuteProcedure("add_work_type", "type_name", value);
        }

        public void AddTask(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_task", parameters);
        }

        public void AddMetaData(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_meta_data", parameters);
        }

        public void AddMetaType(string value)
        {
            ExecuteProcedure("add_meta_type", "type_name", value);
        }

        public void AddSource(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_source", parameters);
        }

        public void AddSourceType(string value)
        {
            ExecuteProcedure("add_source_type", "type_name", value);
        }

        public void AddGeneralMastering(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_general_mastering", parameters);
        }

        public void AddProfessionalMastering(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_professional_mastering", parameters);
        }

        public void AddGeneralSelection(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_general_selection", parameters);
        }

        public void AddProfessionalSelection(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_professional_selection", parameters);
        }

        public void AddLevel(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("add_level", parameters);
        }
        #endregion

        #region Data updating methods
        public void SetConformity(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_conformity", parameters);
        }

        // Specialities
        public void SetSpeciality(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_speciality", parameters);
        }

        public void SetSpecialityCode(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_speciality_code", parameters);
        }

        public void SetGeneralCompetetion(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_general_competetion", parameters);
        }

        public void SetProfessionalCompetetion(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_professional_competetion", parameters);
        }

        // Disciplines
        public void SetDiscipline(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_discipline", parameters);
        }

        public void SetDisciplineCode(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_discipline_code", parameters);
        }

        public void SetTotalHour(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_hour", parameters);
        }

        public void SetTopic(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_section", parameters);
        }

        public void SetTheme(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_theme", parameters);
        }

        public void SetWork(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_work", parameters);
        }

        public void SetWorkType(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_work_type", parameters);
        }

        public void SetTask(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_task", parameters);
        }

        public void SetMetaData(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_meta_data", parameters);
        }

        public void SetMetaType(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_meta_type", parameters);
        }

        public void SetSource(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_source", parameters);
        }

        public void SetSourceType(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_source_type", parameters);
        }

        public void SetGeneralMastering(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_general_mastering", parameters);
        }

        public void SetProfessionalMastering(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_professional_mastering", parameters);
        }

        public void SetGeneralSelection(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_general_selection", parameters);
        }

        public void SetProfessionalSelection(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_professional_selection", parameters);
        }

        public void SetLevel(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("set_level", parameters);
        }
        #endregion

        #region Data marking methods
        public void MarkConformity(ulong value)
        {
            ExecuteProcedure("mark_conformity", "conformity_id", value);
        }

        // Specialities
        public void MarkSpeciality(ulong value)
        {
            ExecuteProcedure("mark_speciality", "speciality_id", value);
        }

        public void MarkSpecialityCode(ulong value)
        {
            ExecuteProcedure("mark_speciality_code", "code_id", value);
        }

        public void MarkGeneralCompetetion(ulong value)
        {
            ExecuteProcedure("mark_general_competetion", "comp_id", value);
        }

        public void MarkProfessionalCompetetion(ulong value)
        {
            ExecuteProcedure("mark_professional_competetion", "comp_id", value);
        }

        // Disciplines
        public void MarkDiscipline(ulong value)
        {
            ExecuteProcedure("mark_discipline", "discipline_id", value);
        }

        public void MarkDisciplineCode(ulong value)
        {
            ExecuteProcedure("mark_discipline_code", "code_id", value);
        }

        public void MarkTotalHour(ulong value)
        {
            ExecuteProcedure("mark_hour", "hour_id", value);
        }

        public void MarkTopic(ulong value)
        {
            ExecuteProcedure("mark_section", "section_id", value);
        }

        public void MarkTheme(ulong value)
        {
            ExecuteProcedure("mark_theme", "theme_id", value);
        }

        public void MarkWork(ulong value)
        {
            ExecuteProcedure("mark_work", "work_id", value);
        }

        public void MarkWorkType(ulong value)
        {
            ExecuteProcedure("mark_work_type", "type_id", value);
        }

        public void MarkTask(ulong value)
        {
            ExecuteProcedure("mark_task", "task_id", value);
        }

        public void MarkMetaData(ulong value)
        {
            ExecuteProcedure("mark_meta_data", "data_id", value);
        }

        public void MarkMetaType(ulong value)
        {
            ExecuteProcedure("mark_meta_type", "type_id", value);
        }

        public void MarkSource(ulong value)
        {
            ExecuteProcedure("mark_source", "source_id", value);
        }

        public void MarkSourceType(ulong value)
        {
            ExecuteProcedure("mark_source_type", "type_id", value);
        }

        public void MarkGeneralMastering(ulong value)
        {
            ExecuteProcedure("mark_general_mastering", "mastering_id", value);
        }

        public void MarkProfessionalMastering(ulong value)
        {
            ExecuteProcedure("mark_professional_mastering", "mastering_id", value);
        }

        public void MarkGeneralSelection(ulong value)
        {
            ExecuteProcedure("mark_general_selection", "selection_id", value);
        }

        public void MarkProfessionalSelection(ulong value)
        {
            ExecuteProcedure("mark_professional_selection", "selection_id", value);
        }

        public void MarkLevel(ulong value)
        {
            ExecuteProcedure("mark_level", "level_id", value);
        }
        #endregion


        #region Features
        public void SendReport(Dictionary<string, object> parameters)
        {
            ExecuteProcedure("send_report", parameters);
        }

        public ulong GetLastImportId()
        {
            return Convert.ToUInt64(GetRecord("get_last_import_id"));
        }
        #endregion


        #region BaseMessage Members
        public static void ConnectionMessage(string loadProblem, string exception)
        {
            string noLoad = "Не удалось обработать: ";
            string message = "\nОшибка подключения. Вы не можете продолжать работу.\n";
            string advice = "Свяжитесь с администратором насчет установления причины проблемы.\nПолное сообщение:\n";

            string caption = "Ошибка";
            string fullMessage = noLoad + loadProblem + message + advice + exception;
            _ = MessageBox.Show(fullMessage, caption, MessageBoxButton.OK, MessageBoxImage.Error);
            Application.Current.Shutdown();
        }

        public static void NetMessage(Exception exception, string problem)
        {
            string fullMessage = $"{exception.HelpLink}\n{exception.Message}";
            Log.Error("Operation is invalid or unstated: " + exception.Message);
            ConnectionMessage(problem, fullMessage);
        }
        #endregion
    }
}