using System.Collections.Generic;

namespace Prosperity.Model.Tools.DataBase.Edit
{
    internal class Edit : DataTool
    {
        public Edit(Sql connector) : base(connector)
        {
        }

        public void Conformity(uint id, uint discipline, uint speciality)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("conformity_id", id);
            parameters.AddRange(ConformityFields(discipline, speciality));
            DataBase.SetConformity(parameters);
        }

        public void Speciality(uint id, uint code, string name)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("speciality_id", id);
            parameters.AddRange(SpecialityFields(code, name));
            DataBase.SetSpeciality(parameters);
        }

        public void SpecialityCode(uint id, string code)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>
            {
                { "code_id", id },
                { "speciality_code", code }
            };
            DataBase.SetSpecialityCode(parameters);
        }

        public void GeneralCompetetion(uint id, uint speciality,
            ushort no, string name, string knowledge, string skills)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("comp_id", id);
            parameters.AddRange(GeneralCompetetionFields(
                speciality, no, name, knowledge, skills));
            DataBase.SetGeneralCompetetion(parameters);
        }

        public void ProfessionalCompetetion(uint id, uint speciality, ushort no1,
            ushort no2, string name, string knowledge, string skills, string experience)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("comp_id", id);
            parameters.AddRange(ProfessionalCompetetionFields(speciality,
                no1, no2, name, knowledge, skills, experience));
            DataBase.SetProfessionalCompetetion(parameters);
        }

        public void Discipline(uint id, uint code, string name)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("discipline_id", id);
            parameters.AddRange(DisciplineFields(code, name));
            DataBase.SetDiscipline(parameters);
        }

        public void DisciplineCode(uint id, string code)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "code_id", id },
                    { "discipline_code", code }
                };
            DataBase.SetDisciplineCode(parameters);
        }

        public void TotalHour(uint id, uint discipline, uint workType, ushort count)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("hour_id", id);
            parameters.AddRange(TotalHourFields(discipline, workType, count));
            DataBase.SetTotalHour(parameters);
        }

        public void Topic(uint id, uint discipline, ushort no, string name, ushort hours)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("section_id", id);
            parameters.AddRange(TopicFields(discipline, no, name, hours));
            DataBase.SetTopic(parameters);
        }

        public void Theme(uint id, uint topic, ushort masteringLevel,
            ushort no, string name, ushort hours)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("theme_id", id);
            parameters.AddRange(ThemeFields(topic, masteringLevel, no, name, hours));
            DataBase.SetTheme(parameters);
        }

        public void Work(ulong id, uint theme, uint type)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("work_id", id);
            parameters.AddRange(WorkFields(theme, type));
            DataBase.SetWork(parameters);
        }

        public void WorkType(uint id, string name)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "type_id", id },
                    { "type_name", name }
                };
            DataBase.SetWorkType(parameters);
        }

        public void Task(ulong id, ulong work, string name, ushort hours)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("task_id", id);
            parameters.AddRange(TaskFields(work, name, hours));
            DataBase.SetTask(parameters);
        }

        public void MetaData(uint id, uint discipline, uint type, string name)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("data_id", id);
            parameters.AddRange(MetaDataFields(discipline, type, name));
            DataBase.SetMetaData(parameters);
        }

        public void MetaType(uint id, string name)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "type_id", id },
                    { "type_name", name }
                };
            DataBase.SetMetaType(parameters);
        }

        public void Source(uint id, uint discipline, uint type, string name)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("source_id", id);
            parameters.AddRange(SourceFields(discipline, type, name));
            DataBase.SetSource(parameters);
        }

        public void SourceType(uint id, string name)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "type_id", id },
                    { "type_name", name }
                };
            DataBase.SetSourceType(parameters);
        }

        public void GeneralMastering(uint id, uint discipline, uint generalCompetetion)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("mastering_id", id);
            parameters.AddRange(GeneralMasteringFields(discipline, generalCompetetion));
            DataBase.SetGeneralMastering(parameters);
        }

        public void ProfessionalMastering(uint id, uint discipline, uint professionalCompetetion)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("mastering_id", id);
            parameters.AddRange(ProfessionalMasteringFields(discipline, professionalCompetetion));
            DataBase.SetProfessionalMastering(parameters);
        }

        public void GeneralSelection(uint id, uint theme, uint selection)
        {
            Dictionary<string, object> parameters = GeneralSelectionFields(
                theme, selection);
            parameters.Add("selection_id", id);
            DataBase.SetGeneralSelection(parameters);
        }

        public void ProfessionalSelection(uint id, uint theme, uint selection)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("selection_id", id);
            parameters.AddRange(ProfessionalSelectionFields(theme, selection));
            DataBase.SetProfessionalSelection(parameters);
        }

        public void Level(uint id, string name, string description)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("level_id", id);
            parameters.AddRange(LevelFields(name, description));
            DataBase.SetLevel(parameters);
        }
    }
}