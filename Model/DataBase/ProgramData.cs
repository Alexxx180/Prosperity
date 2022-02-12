using System.Collections.Generic;
using static Prosperity.Model.DataBase.Converters;

namespace Prosperity.Model.DataBase
{
    /// <summary>
    /// Educational programs data from database
    /// </summary>
    public class ProgramData
    {
        public ProgramData(Sql connector)
        {
            _dataBase = connector;
        }

        public List<string[]> Conformity => ConvertAll(_dataBase.ConformityList(), ElementsToString);

        public List<string[]> Specialities => ConvertAll(_dataBase.SpecialitiesList(), ElementsToString);

        public List<string[]> SpecialityCodes => ConvertAll(_dataBase.SpecialityCodes(), ElementsToString);

        public List<string[]> GeneralCompetetions(uint specialityId)
        {
            return ConvertAll(_dataBase.GeneralCompetetions(specialityId), ElementsToString);
        }

        public List<string[]> ProfessionalCompetetions(uint specialityId)
        {
            return ConvertAll(_dataBase.ProfessionalCompetetions(specialityId), ElementsToString);
        }

        public List<string[]> Disciplines => ConvertAll(_dataBase.DisciplinesList(), ElementsToString);

        public List<string[]> DisciplineCodes => ConvertAll(_dataBase.DisciplineCodes(), ElementsToString);

        public List<string[]> TotalHours(uint disciplineId)
        {
            return ConvertAll(_dataBase.TotalHours(disciplineId), ElementsToString);
        }

        public List<string[]> ThemePlan(uint disciplineId)
        {
            return ConvertAll(_dataBase.ThemePlan(disciplineId), ElementsToString);
        }

        public List<string[]> Themes(uint topicId)
        {
            return ConvertAll(_dataBase.Themes(topicId), ElementsToString);
        }

        public List<string[]> Works(uint themeId)
        {
            return ConvertAll(_dataBase.Works(themeId), ElementsToString);
        }

        public List<string[]> WorkTypes => ConvertAll(_dataBase.WorkTypes(), ElementsToString);

        public List<string[]> Tasks(ulong workId)
        {
            return ConvertAll(_dataBase.Tasks(workId), ElementsToString);
        }

        public List<string[]> MetaData(uint disciplineId)
        {
            return ConvertAll(_dataBase.MetaData(disciplineId), ElementsToString);
        }

        public List<string[]> MetaTypes => ConvertAll(_dataBase.MetaTypes(), ElementsToString);

        public List<string[]> Sources(uint disciplineId)
        {
            return ConvertAll(_dataBase.Sources(disciplineId), ElementsToString);
        }

        public List<string[]> SourceTypes => ConvertAll(_dataBase.SourceTypes(), ElementsToString);

        public List<string[]> DisciplineGeneralMastering(uint disciplineId)
        {
            return ConvertAll(_dataBase.DisciplineGeneralMastering(disciplineId), ElementsToString);
        }

        public List<string[]> DisciplineProfessionalMastering(uint disciplineId)
        {
            return ConvertAll(_dataBase.DisciplineProfessionalMastering(disciplineId), ElementsToString);
        }

        public List<string[]> ThemeGeneralMastering(uint themeId)
        {
            return ConvertAll(_dataBase.ThemeGeneralMastering(themeId), ElementsToString);
        }

        public List<string[]> ThemeProfessionalMastering(uint themeId)
        {
            return ConvertAll(_dataBase.ThemeProfessionalMastering(themeId), ElementsToString);
        }

        public List<string[]> ConformityGeneralCompetetions(uint disciplineId)
        {
            return ConvertAll(_dataBase.ConformityGeneralCompetetions(disciplineId), ElementsToString);
        }

        public List<string[]> ConformityProfessionalCompetetions(uint disciplineId)
        {
            return ConvertAll(_dataBase.ConformityProfessionalCompetetions(disciplineId), ElementsToString);
        }

        //public List<string[]> DisciplineGeneralMasteringByTheme(uint themeId)
        //{
        //    return ConvertAll(_dataBase.DisciplineGeneralMasteringByTheme(themeId), ElementsToString);
        //}

        //public List<string[]> DisciplineProfessionalMasteringByTheme(uint themeId)
        //{
        //    return ConvertAll(_dataBase.DisciplineProfessionalMasteringByTheme(themeId), ElementsToString);
        //}

        public string DisciplineByTheme(uint themeId)
        {
            return _dataBase.DisciplineByTheme(themeId).ToString();
        }

        public List<string[]> Levels => ConvertAll(_dataBase.Levels(), ElementsToString);

        // Overall tables: 22
        private readonly IDataViewer _dataBase;
    }
}