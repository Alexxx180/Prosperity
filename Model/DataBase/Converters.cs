using System;
using System.Collections.Generic;

namespace Prosperity.Model.DataBase
{
    public static class Converters
    {
        public static void Connect(Sql connector)
        {
            _dataBase = connector;
        }

        public static TOutput[] ConvertAll<TInput, TOutput>(TInput[] array, Func<TInput, TOutput> converter)
        {
            TOutput[] result = new TOutput[array.Length];
            for (int i = 0; i < array.Length; i++)
                result[i] = converter(array[i]);
            return result;
        }

        public static List<TOutput> ConvertAll<TInput, TOutput>(List<TInput> array, Func<TInput, TOutput> converter)
        {
            List<TOutput> result = new List<TOutput>(array.Count);
            for (int i = 0; i < array.Count; i++)
                result[i] = converter(array[i]);
            return result;
        }

        private static string ElementToString(object value) => value.ToString();
        private static string[] ElementsToString(object[] values) => ConvertAll(values, ElementToString);

        // Overall tables: 21

        public static List<string[]> Specialities => ConvertAll(_dataBase.SpecialitiesList(), ElementsToString);

        public static List<string[]> SpecialityCodes => ConvertAll(_dataBase.SpecialityCodes(), ElementsToString);

        public static List<string[]> GeneralCompetetions(uint specialityId) => ConvertAll(_dataBase.GeneralCompetetions(specialityId), ElementsToString);

        public static List<string[]> ProfessionalCompetetions(uint specialityId) => ConvertAll(_dataBase.ProfessionalCompetetions(specialityId), ElementsToString);


        public static List<string[]> Disciplines => ConvertAll(_dataBase.DisciplinesList(), ElementsToString);

        public static List<string[]> DisciplineCodes => ConvertAll(_dataBase.DisciplineCodes(), ElementsToString);

        public static List<string[]> TotalHours(uint disciplineId) => ConvertAll(_dataBase.TotalHours(disciplineId), ElementsToString);

        public static List<string[]> ThemePlan(uint disciplineId) => ConvertAll(_dataBase.ThemePlan(disciplineId), ElementsToString);

        public static List<string[]> Themes(uint topicId) => ConvertAll(_dataBase.Themes(topicId), ElementsToString);

        public static List<string[]> Works(uint themeId) => ConvertAll(_dataBase.Works(themeId), ElementsToString);

        public static List<string[]> WorkTypes => ConvertAll(_dataBase.WorkTypes(), ElementsToString);

        public static List<string[]> Tasks(ulong workId) => ConvertAll(_dataBase.Tasks(workId), ElementsToString);

        public static List<string[]> MetaData(uint topicId) => ConvertAll(_dataBase.MetaData(topicId), ElementsToString);

        public static List<string[]> MetaTypes => ConvertAll(_dataBase.MetaTypes(), ElementsToString);

        public static List<string[]> Sources(uint disciplineId) => ConvertAll(_dataBase.Sources(disciplineId), ElementsToString);

        public static List<string[]> SourceTypes => ConvertAll(_dataBase.SourceTypes(), ElementsToString);

        public static List<string[]> DisciplineGeneralMastering(uint disciplineId) => ConvertAll(_dataBase.DisciplineGeneralMastering(disciplineId), ElementsToString);

        public static List<string[]> DisciplineProfessionalMastering(uint disciplineId) => ConvertAll(_dataBase.DisciplineProfessionalMastering(disciplineId), ElementsToString);

        public static List<string[]> ThemeGeneralMastering(uint themeId) => ConvertAll(_dataBase.ThemeGeneralMastering(themeId), ElementsToString);

        public static List<string[]> ThemeProfessionalMastering(uint themeId) => ConvertAll(_dataBase.ThemeProfessionalMastering(themeId), ElementsToString);

        public static List<string[]> Levels => ConvertAll(_dataBase.Levels(), ElementsToString);

        private static Sql _dataBase;
    }
}