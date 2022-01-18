using System;
using System.Windows;
using System.Collections.Generic;

namespace Prosperity.Model.DataBase
{
    /// <summary>
    /// Class containing necessary methods to work with database
    /// </summary>
    public abstract class Sql
    {
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
            ConnectionMessage(problem, fullMessage);
        }

        public abstract void PassParameter(in string ParamName, in object newParam);

        public void PassParameters(Dictionary<string, object> parameters)
        {
            foreach (KeyValuePair<string, object> entry in parameters)
                PassParameter(entry.Key, entry.Value);
        }

        public abstract void OnlyExecute();

        public abstract void Procedure(in string name);

        public void ExecuteProcedure(string name)
        {
            Procedure(name);
            OnlyExecute();
        }

        public abstract List<object[]> ReadData();

        public abstract List<object> ReadData(in int column);

        public abstract List<object[]> ReadData(in byte StartValue, in byte EndValue);

        public abstract void ClearParameters();

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

        public List<object[]> DisciplineGeneralMasteringByTheme(uint value)
        {
            return GetRecords("get_discipline_general_by_theme_unmarked", "theme_id", value);
        }

        public List<object[]> DisciplineProfessionalMasteringByTheme(uint value)
        {
            return GetRecords("get_discipline_professional_by_theme_unmarked", "theme_id", value);
        }
    }
}