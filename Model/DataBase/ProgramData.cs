using System.Collections.Generic;

namespace Prosperity.Model.DataBase
{
    public class ProgramData
    {
        public ProgramData() : this(new MySQL())
        {
        }

        public ProgramData(Sql connector)
        {
            Converters.Connect(connector);
        }

        public static List<string[]> Specialities => Converters.Specialities;

        public static List<string[]> SpecialityCodes => Converters.SpecialityCodes;

        public static List<string[]> GeneralCompetetions(uint specialityId) => Converters.GeneralCompetetions(specialityId);

        public static List<string[]> ProfessionalCompetetions(uint specialityId) => Converters.ProfessionalCompetetions(specialityId);

        public static List<string[]> Disciplines => Converters.Disciplines;

        public static List<string[]> DisciplineCodes => Converters.DisciplineCodes;

        public static List<string[]> TotalHours(uint disciplineId) => Converters.TotalHours(disciplineId);

        public static List<string[]> ThemePlan(uint disciplineId) => Converters.ThemePlan(disciplineId);

        public static List<string[]> Themes(uint topicId) => Converters.Themes(topicId);

        public static List<string[]> Works(uint themeId) => Converters.Works(themeId);

        public static List<string[]> WorkTypes => Converters.WorkTypes;

        public static List<string[]> Tasks(ulong workId) => Converters.Tasks(workId);

        public static List<string[]> MetaData(uint topicId) => Converters.MetaData(topicId);

        public static List<string[]> MetaTypes => Converters.MetaTypes;

        public static List<string[]> Sources(uint disciplineId) => Converters.Sources(disciplineId);

        public static List<string[]> SourceTypes => Converters.SourceTypes;

        public static List<string[]> DisciplineGeneralMastering(uint disciplineId) => Converters.DisciplineGeneralMastering(disciplineId);

        public static List<string[]> DisciplineProfessionalMastering(uint disciplineId) => Converters.DisciplineProfessionalMastering(disciplineId);

        public static List<string[]> ThemeGeneralMastering(uint themeId) => Converters.ThemeGeneralMastering(themeId);

        public static List<string[]> ThemeProfessionalMastering(uint themeId) => Converters.ThemeProfessionalMastering(themeId);

        public static List<string[]> Levels => Converters.Levels;
    }
}