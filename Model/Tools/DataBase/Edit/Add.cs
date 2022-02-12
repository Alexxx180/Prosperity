using System.Collections.Generic;

namespace Prosperity.Model.Tools.DataBase.Edit
{
    internal class Add : DataTool
    {
        public Add(Sql connector) : base(connector)
        {
        }

        public void Conformity(uint discipline, uint speciality)
        {
            Dictionary<string, object> parameters = ConformityFields(discipline, speciality);
            DataBase.AddConformity(parameters);
        }

        public void Speciality(uint code, string name)
        {
            Dictionary<string, object> parameters = SpecialityFields(code, name);
            DataBase.AddSpeciality(parameters);
        }

        public void SpecialityCode(string code)
        {
            DataBase.AddSpecialityCode(code);
        }

        public void GeneralCompetetion(uint speciality,
            ushort no, string name, string knowledge, string skills)
        {
            Dictionary<string, object> parameters = GeneralCompetetionFields(
                speciality, no, name, knowledge, skills);
            DataBase.AddGeneralCompetetion(parameters);
        }

        public void ProfessionalCompetetion(uint speciality, ushort no1, ushort no2,
            string name, string knowledge, string skills, string experience)
        {
            Dictionary<string, object> parameters = ProfessionalCompetetionFields(
                speciality, no1, no2, name, knowledge, skills, experience);
            DataBase.AddProfessionalCompetetion(parameters);
        }

        public void Discipline(uint code, string name)
        {
            Dictionary<string, object> parameters = DisciplineFields(code, name);
            DataBase.AddDiscipline(parameters);
        }

        public void DisciplineCode(string code)
        {
            DataBase.AddDisciplineCode(code);
        }

        public void TotalHour(uint discipline, uint workType, ushort count)
        {
            Dictionary<string, object> parameters = TotalHourFields(discipline, workType, count);
            DataBase.AddTotalHour(parameters);
        }

        public void Topic(uint discipline, ushort no, string name, ushort hours)
        {
            Dictionary<string, object> parameters = TopicFields(discipline, no, name, hours);
            DataBase.AddTopic(parameters);
        }

        public void Theme(uint topic, ushort masteringLevel,
            ushort no, string name, ushort hours)
        {
            Dictionary<string, object> parameters = ThemeFields(
                topic, masteringLevel, no, name, hours);
            DataBase.AddTheme(parameters);
        }

        public void Work(uint theme, uint type)
        {
            Dictionary<string, object> parameters = WorkFields(theme, type);
            DataBase.AddWork(parameters);
        }

        public void WorkType(string name)
        {
            DataBase.AddWorkType(name);
        }

        public void Task(ulong work, string name, ushort hours)
        {
            Dictionary<string, object> parameters = TaskFields(work, name, hours);
            DataBase.AddTask(parameters);
        }

        public void MetaData(uint discipline, uint type, string name)
        {
            Dictionary<string, object> parameters = MetaDataFields(discipline, type, name);
            DataBase.AddMetaData(parameters);
        }

        public void MetaType(string name)
        {
            DataBase.AddMetaType(name);
        }

        public void Source(uint discipline, uint type, string name)
        {
            Dictionary<string, object> parameters = SourceFields(discipline, type, name);
            DataBase.AddSource(parameters);
        }

        public void SourceType(string name)
        {
            DataBase.AddSourceType(name);
        }

        public void GeneralMastering(uint discipline, uint generalCompetetion)
        {
            Dictionary<string, object> parameters = GeneralMasteringFields(
                discipline, generalCompetetion);
            DataBase.AddGeneralMastering(parameters);
        }

        public void ProfessionalMastering(uint discipline, uint professionalCompetetion)
        {
            Dictionary<string, object> parameters = ProfessionalMasteringFields(
                discipline, professionalCompetetion);
            DataBase.AddProfessionalMastering(parameters);
        }

        public void GeneralSelection(uint theme, uint selection)
        {
            Dictionary<string, object> parameters = GeneralSelectionFields(
                theme, selection);
            DataBase.AddGeneralSelection(parameters);
        }

        public void ProfessionalSelection(uint theme, uint selection)
        {
            Dictionary<string, object> parameters = ProfessionalSelectionFields(
                theme, selection);
            DataBase.AddProfessionalSelection(parameters);
        }

        public void Level(string name, string description)
        {
            Dictionary<string, object> parameters = LevelFields(name, description);
            DataBase.AddLevel(parameters);
        }
    }
}