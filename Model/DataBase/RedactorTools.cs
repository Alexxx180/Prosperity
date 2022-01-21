using System.Collections.Generic;

namespace Prosperity.Model.DataBase
{
    public class RedactorTools
    {
        public RedactorTools(Sql connector)
        {
            _dataBase = connector;
        }

        protected static Dictionary<string, object> ConformityFields(
            uint discipline, uint speciality) => new Dictionary<string, object>
        {
            { "conformity_discipline", discipline },
            { "conformity_speciality", speciality }
        };

        protected static Dictionary<string, object> SpecialityFields(
            uint code, string name) => new Dictionary<string, object>
        {
            { "speciality_code", code },
            { "speciality_name", name }
        };

        protected static Dictionary<string, object> GeneralCompetetionFields(
            uint speciality, ushort no, string name, string knowledge,
            string skills) => new Dictionary<string, object>
        {
            { "comp_speciality", speciality },
            { "comp_no", no },
            { "comp_name", name },
            { "comp_knowledge", knowledge },
            { "comp_skills", skills }
        };

        protected static Dictionary<string, object> ProfessionalCompetetionFields(
            uint speciality, ushort no1, ushort no2, string name, string knowledge,
            string skills, string experience) => new Dictionary<string, object>
        {
            { "comp_speciality", speciality },
            { "comp_no1", no1 },
            { "comp_no2", no2 },
            { "comp_name", name },
            { "comp_knowledge", knowledge },
            { "comp_skills", skills },
            { "comp_experience", experience }
        };

        protected static Dictionary<string, object> DisciplineFields(
            uint code, string name) => new Dictionary<string, object>
        {
            { "discipline_code", code },
            { "discipline_name", name }
        };

        protected static Dictionary<string, object> TotalHourFields(uint discipline,
            uint workType, ushort count) => new Dictionary<string, object>
        {
            { "discipline_id", discipline },
            { "work_type_id", workType },
            { "hours_count", count }
        };

        protected static Dictionary<string, object> TopicFields(uint discipline,
            ushort no, string name, ushort hours) => new Dictionary<string, object>
        {
            { "section_discipline", discipline },
            { "section_no", no },
            { "section_name", name },
            { "section_hours", hours }
        };

        protected static Dictionary<string, object> ThemeFields(
            uint topic, ushort masteringLevel, ushort no, string name,
            ushort hours) => new Dictionary<string, object>
        {
            { "theme_topic", topic },
            { "theme_mastering_level", masteringLevel },
            { "theme_no", no },
            { "theme_name", name },
            { "theme_hours", hours }
        };

        protected static Dictionary<string, object> WorkFields(
            uint theme, uint type) => new Dictionary<string, object>
        {
            { "work_theme", theme },
            { "work_type", type }
        };

        protected static Dictionary<string, object> TaskFields(ulong work,
            string name, ushort hours) => new Dictionary<string, object>
        {
            { "task_work_id", work },
            { "task_name", name },
            { "task_hours", hours }
        };

        protected static Dictionary<string, object> MetaDataFields(uint discipline,
            uint type, string name) => new Dictionary<string, object>
        {
            { "data_discipline", discipline },
            { "data_type_id", type },
            { "data_name", name }
        };

        protected static Dictionary<string, object> SourceFields(uint discipline,
            uint type, string name) => new Dictionary<string, object>
        {
            { "discipline_id", discipline },
            { "type_id", type },
            { "source_name", name }
        };

        protected static Dictionary<string, object> GeneralMasteringFields(
            uint discipline, uint generalCompetetion) => new Dictionary<string, object>
        {
            { "mastering_discipline", discipline },
            { "general_id", generalCompetetion }
        };

        protected static Dictionary<string, object> ProfessionalMasteringFields(
            uint discipline, uint professionalCompetetion) => new Dictionary<string, object>
        {
            { "mastering_discipline", discipline },
            { "professional_id", professionalCompetetion }
        };

        protected static Dictionary<string, object> GeneralSelectionFields(
            uint theme, uint selection) => new Dictionary<string, object>
        {
            { "selection_theme", theme },
            { "mastering_selection", selection }
        };

        protected static Dictionary<string, object> ProfessionalSelectionFields(
            uint theme, uint selection) => new Dictionary<string, object>
        {
            { "selection_theme", theme },
            { "mastering_selection", selection }
        };

        protected static Dictionary<string, object> LevelFields(string name,
            string description) => new Dictionary<string, object>
        {
            { "level_name", name },
            { "level_description", description }
        };

        internal static class Add
        {
            public static void Conformity(uint discipline, uint speciality)
            {
                Dictionary<string, object> parameters = ConformityFields(discipline, speciality);
                _dataBase.AddConformity(parameters);
            }

            public static void Speciality(uint code, string name)
            {
                Dictionary<string, object> parameters = SpecialityFields(code, name);
                _dataBase.AddSpeciality(parameters);
            }

            public static void SpecialityCode(string code)
            {
                _dataBase.AddSpecialityCode(code);
            }

            public static void GeneralCompetetion(uint speciality,
                ushort no, string name, string knowledge, string skills)
            {
                Dictionary<string, object> parameters = GeneralCompetetionFields(
                    speciality, no, name, knowledge, skills);
                _dataBase.AddGeneralCompetetion(parameters);
            }

            public static void ProfessionalCompetetion(uint speciality, ushort no1, ushort no2,
                string name, string knowledge, string skills, string experience)
            {
                Dictionary<string, object> parameters = ProfessionalCompetetionFields(
                    speciality, no1, no2, name, knowledge, skills, experience);
                _dataBase.AddProfessionalCompetetion(parameters);
            }

            public static void Discipline(uint code, string name)
            {
                Dictionary<string, object> parameters = DisciplineFields(code, name);
                _dataBase.AddDiscipline(parameters);
            }

            public static void DisciplineCode(string code)
            {
                _dataBase.AddDisciplineCode(code);
            }

            public static void TotalHour(uint discipline, uint workType, ushort count)
            {
                Dictionary<string, object> parameters = TotalHourFields(discipline, workType, count);
                _dataBase.AddTotalHour(parameters);
            }

            public static void Topic(uint discipline, ushort no, string name, ushort hours)
            {
                Dictionary<string, object> parameters = TopicFields(discipline, no, name, hours);
                _dataBase.AddTopic(parameters);
            }

            public static void Theme(uint topic, ushort masteringLevel,
                ushort no, string name, ushort hours)
            {
                Dictionary<string, object> parameters = ThemeFields(
                    topic, masteringLevel, no, name, hours);
                _dataBase.AddTheme(parameters);
            }

            public static void Work(uint theme, uint type)
            {
                Dictionary<string, object> parameters = WorkFields(theme, type);
                _dataBase.AddWork(parameters);
            }

            public static void WorkType(string name)
            {
                _dataBase.AddWorkType(name);
            }

            public static void Task(ulong work, string name, ushort hours)
            {
                Dictionary<string, object> parameters = TaskFields(work, name, hours);
                _dataBase.AddTask(parameters);
            }

            public static void MetaData(uint discipline, uint type, string name)
            {
                Dictionary<string, object> parameters = MetaDataFields(discipline, type, name);
                _dataBase.AddMetaData(parameters);
            }

            public static void MetaType(string name)
            {
                _dataBase.AddMetaType(name);
            }

            public static void Source(uint discipline, uint type, string name)
            {
                Dictionary<string, object> parameters = SourceFields(discipline, type, name);
                _dataBase.AddSource(parameters);
            }

            public static void SourceType(string name)
            {
                _dataBase.AddSourceType(name);
            }

            public static void GeneralMastering(uint discipline, uint generalCompetetion)
            {
                Dictionary<string, object> parameters = GeneralMasteringFields(
                    discipline, generalCompetetion);
                _dataBase.AddGeneralMastering(parameters);
            }

            public static void ProfessionalMastering(uint discipline, uint professionalCompetetion)
            {
                Dictionary<string, object> parameters = ProfessionalMasteringFields(
                    discipline, professionalCompetetion);
                _dataBase.AddProfessionalMastering(parameters);
            }

            public static void GeneralSelection(uint theme, uint selection)
            {
                Dictionary<string, object> parameters = GeneralSelectionFields(
                    theme, selection);
                _dataBase.AddGeneralSelection(parameters);
            }

            public static void ProfessionalSelection(uint theme, uint selection)
            {
                Dictionary<string, object> parameters = ProfessionalSelectionFields(
                    theme, selection);
                _dataBase.AddProfessionalSelection(parameters);
            }

            public static void Level(string name, string description)
            {
                Dictionary<string, object> parameters = LevelFields(name, description);
                _dataBase.AddLevel(parameters);
            }
        }

        internal static class Edit
        {
            public static void Conformity(uint id, uint discipline, uint speciality)
            {
                Dictionary<string, object> parameters = ConformityFields(discipline, speciality);
                parameters.Add("conformity_id", id);
                _dataBase.SetConformity(parameters);
            }

            public static void Speciality(uint id, uint code, string name)
            {
                Dictionary<string, object> parameters = SpecialityFields(code, name);
                parameters.Add("speciality_id", id);
                _dataBase.SetSpeciality(parameters);
            }

            public static void SpecialityCode(uint id, string code)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "code_id", id },
                    { "speciality_code", code }
                };
                _dataBase.SetSpecialityCode(parameters);
            }

            public static void GeneralCompetetion(uint id, uint speciality,
                ushort no, string name, string knowledge, string skills)
            {
                Dictionary<string, object> parameters = GeneralCompetetionFields(
                    speciality, no, name, knowledge, skills);
                parameters.Add("comp_id", id);
                _dataBase.SetGeneralCompetetion(parameters);
            }

            public static void ProfessionalCompetetion(uint id, uint speciality, ushort no1,
                ushort no2, string name, string knowledge, string skills, string experience)
            {
                Dictionary<string, object> parameters = ProfessionalCompetetionFields(
                    speciality, no1, no2, name, knowledge, skills, experience);
                parameters.Add("comp_id", id);
                _dataBase.SetProfessionalCompetetion(parameters);
            }

            public static void Discipline(uint id, uint code, string name)
            {
                Dictionary<string, object> parameters = DisciplineFields(code, name);
                parameters.Add("discipline_id", id);
                _dataBase.SetDiscipline(parameters);
            }

            public static void DisciplineCode(uint id, string code)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "code_id", id },
                    { "discipline_code", code }
                };
                _dataBase.SetDisciplineCode(parameters);
            }

            public static void TotalHour(uint id, uint discipline, uint workType, ushort count)
            {
                Dictionary<string, object> parameters = TotalHourFields(discipline, workType, count);
                parameters.Add("hour_id", id);
                _dataBase.SetTotalHour(parameters);
            }

            public static void Topic(uint id, uint discipline, ushort no, string name, ushort hours)
            {
                Dictionary<string, object> parameters = TopicFields(discipline, no, name, hours);
                parameters.Add("section_id", id);
                _dataBase.SetTopic(parameters);
            }

            public static void Theme(uint id, uint topic, ushort masteringLevel,
                ushort no, string name, ushort hours)
            {
                Dictionary<string, object> parameters = ThemeFields(
                    topic, masteringLevel, no, name, hours);
                parameters.Add("theme_id", id);
                _dataBase.SetTheme(parameters);
            }

            public static void Work(ulong id, uint theme, uint type)
            {
                Dictionary<string, object> parameters = WorkFields(theme, type);
                parameters.Add("work_id", id);
                _dataBase.SetWork(parameters);
            }

            public static void WorkType(uint id, string name)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "type_id", id },
                    { "type_name", name }
                };
                _dataBase.SetWorkType(parameters);
            }

            public static void Task(ulong id, ulong work, string name, ushort hours)
            {
                Dictionary<string, object> parameters = TaskFields(work, name, hours);
                parameters.Add("task_id", id);
                _dataBase.SetTask(parameters);
            }

            public static void MetaData(uint id, uint discipline, uint type, string name)
            {
                Dictionary<string, object> parameters = MetaDataFields(discipline, type, name);
                parameters.Add("data_id", id);
                _dataBase.SetMetaData(parameters);
            }

            public static void MetaType(uint id, string name)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "type_id", id },
                    { "type_name", name }
                };
                _dataBase.SetMetaType(parameters);
            }

            public static void Source(uint id, uint discipline, uint type, string name)
            {
                Dictionary<string, object> parameters = SourceFields(discipline, type, name);
                parameters.Add("source_id", id);
                _dataBase.SetSource(parameters);
            }

            public static void SourceType(uint id, string name)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "type_id", id },
                    { "type_name", name }
                };
                _dataBase.SetSourceType(parameters);
            }

            public static void GeneralMastering(uint id, uint discipline, uint generalCompetetion)
            {
                Dictionary<string, object> parameters = GeneralMasteringFields(
                    discipline, generalCompetetion);
                parameters.Add("mastering_id", id);
                _dataBase.SetGeneralMastering(parameters);
            }

            public static void ProfessionalMastering(uint id, uint discipline, uint professionalCompetetion)
            {
                Dictionary<string, object> parameters = ProfessionalMasteringFields(
                    discipline, professionalCompetetion);
                parameters.Add("mastering_id", id);
                _dataBase.SetProfessionalMastering(parameters);
            }

            public static void GeneralSelection(uint id, uint theme, uint selection)
            {
                Dictionary<string, object> parameters = GeneralSelectionFields(
                    theme, selection);
                parameters.Add("selection_id", id);
                _dataBase.SetGeneralSelection(parameters);
            }

            public static void ProfessionalSelection(uint id, uint theme, uint selection)
            {
                Dictionary<string, object> parameters = ProfessionalSelectionFields(
                    theme, selection);
                parameters.Add("selection_id", id);
                _dataBase.SetProfessionalSelection(parameters);
            }

            public static void Level(uint id, string name, string description)
            {
                Dictionary<string, object> parameters = LevelFields(name, description);
                parameters.Add("level_id", id);
                _dataBase.SetLevel(parameters);
            }
        }

        internal static class Mark
        {
            public static void Conformity(ulong id)
            {
                _dataBase.MarkConformity(id);
            }

            public static void Speciality(ulong id)
            {
                _dataBase.MarkSpeciality(id);
            }

            public static void SpecialityCode(ulong id)
            {
                _dataBase.MarkSpecialityCode(id);
            }

            public static void GeneralCompetetion(ulong id)
            {
                _dataBase.MarkGeneralCompetetion(id);
            }

            public static void ProfessionalCompetetion(ulong id)
            {
                _dataBase.MarkProfessionalCompetetion(id);
            }

            public static void Discipline(ulong id)
            {
                _dataBase.MarkDiscipline(id);
            }

            public static void DisciplineCode(ulong id)
            {
                _dataBase.MarkDisciplineCode(id);
            }

            public static void TotalHour(ulong id)
            {
                _dataBase.MarkTotalHour(id);
            }

            public static void Topic(ulong id)
            {
                _dataBase.MarkTopic(id);
            }

            public static void Theme(ulong id)
            {
                _dataBase.MarkTheme(id);
            }

            public static void Work(ulong id)
            {
                _dataBase.MarkWork(id);
            }

            public static void WorkType(ulong id)
            {
                _dataBase.MarkWorkType(id);
            }

            public static void Task(ulong id)
            {
                _dataBase.MarkTask(id);
            }

            public static void MetaData(ulong id)
            {
                _dataBase.MarkMetaData(id);
            }

            public static void MetaType(ulong id)
            {
                _dataBase.MarkMetaType(id);
            }

            public static void Source(ulong id)
            {
                _dataBase.MarkSource(id);
            }

            public static void SourceType(ulong id)
            {
                _dataBase.MarkSourceType(id);
            }

            public static void GeneralMastering(ulong id)
            {
                _dataBase.MarkGeneralMastering(id);
            }

            public static void ProfessionalMastering(ulong id)
            {
                _dataBase.MarkProfessionalMastering(id);
            }

            public static void GeneralSelection(ulong id)
            {
                _dataBase.MarkGeneralSelection(id);
            }

            public static void ProfessionalSelection(ulong id)
            {
                _dataBase.MarkProfessionalSelection(id);
            }

            public static void Level(ulong id)
            {
                _dataBase.MarkLevel(id);
            }
        }

        private static IDataRedactor _dataBase;
    }
}