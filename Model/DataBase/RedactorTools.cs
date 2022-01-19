using System.Collections.Generic;

namespace Prosperity.Model.DataBase
{
    public class RedactorTools
    {
        public RedactorTools(Sql connector)
        {
            _dataBase = connector;
        }

        protected static class Add
        {
            public static void Conformity(uint discipline, uint speciality)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "conformity_discipline", discipline },
                    { "conformity_speciality", speciality }
                };
                _dataBase.AddConformity(parameters);
            }

            public static void Speciality(uint code, string name)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "speciality_code", code },
                    { "speciality_name", name }
                };
                _dataBase.AddSpeciality(parameters);
            }

            public static void SpecialityCode(string code)
            {
                _dataBase.AddSpecialityCode(code);
            }

            public static void GeneralCompetetion(uint speciality,
                ushort no, string name, string knowledge, string skills)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "comp_speciality", speciality },
                    { "comp_no", no },
                    { "comp_name", name },
                    { "comp_knowledge", knowledge },
                    { "comp_skills", skills }
                };
                _dataBase.AddGeneralCompetetion(parameters);
            }

            public static void ProfessionalCompetetion(uint speciality, ushort no1, ushort no2,
                string name, string knowledge, string skills, string experience)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "comp_speciality", speciality },
                    { "comp_no1", no1 },
                    { "comp_no2", no2 },
                    { "comp_name", name },
                    { "comp_knowledge", knowledge },
                    { "comp_skills", skills },
                    { "comp_experience", experience }
                };
                _dataBase.AddProfessionalCompetetion(parameters);
            }

            public static void Discipline(uint code, string name)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "discipline_code", code },
                    { "discipline_name", name }
                };
                _dataBase.AddDiscipline(parameters);
            }

            public static void DisciplineCode(string code)
            {
                _dataBase.AddDisciplineCode(code);
            }

            public static void TotalHour(uint discipline, uint workType, ushort count)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "discipline_id", discipline },
                    { "work_type_id", workType },
                    { "hours_count", count }
                };
                _dataBase.AddTotalHour(parameters);
            }

            public static void Topic(uint discipline, ushort no, string name, ushort hours)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "section_discipline", discipline },
                    { "section_no", no },
                    { "section_name", name },
                    { "section_hours", hours }
                };
                _dataBase.AddTopic(parameters);
            }

            public static void Theme(uint topic, ushort masteringLevel,
                ushort no, string name, ushort hours)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "theme_topic", topic },
                    { "theme_mastering_level", masteringLevel },
                    { "theme_no", no },
                    { "theme_name", name },
                    { "theme_hours", hours }
                };
                _dataBase.AddTheme(parameters);
            }

            public static void Work(ulong theme, uint type)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "work_theme", theme },
                    { "work_type", type }
                };
                _dataBase.AddWork(parameters);
            }

            public static void WorkType(string name)
            {
                _dataBase.AddWorkType(name);
            }

            public static void Task(ulong work, string name, ushort hours)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "task_work_id", work },
                    { "task_name", name },
                    { "task_hours", hours }
                };
                _dataBase.AddTask(parameters);
            }

            public static void MetaData(uint discipline, uint type, string name)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "data_discipline_id", discipline },
                    { "data_type_id", type },
                    { "data_name", name }
                };
                _dataBase.AddMetaData(parameters);
            }

            public static void MetaType(string name)
            {
                _dataBase.AddMetaType(name);
            }

            public static void Source(uint discipline, uint type, string name)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "discipline_id", discipline },
                    { "type_id", type },
                    { "source_name", name }
                };
                _dataBase.AddSource(parameters);
            }

            public static void SourceType(string name)
            {
                _dataBase.AddSourceType(name);
            }

            public static void GeneralMastering(uint discipline, uint generalCompetetion)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "mastering_discipline", discipline },
                    { "general_id", generalCompetetion }
                };
                _dataBase.AddGeneralMastering(parameters);
            }

            public static void ProfessionalMastering(uint discipline, uint professionalCompetetion)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "mastering_discipline", discipline },
                    { "professional_id", professionalCompetetion }
                };
                _dataBase.AddProfessionalMastering(parameters);
            }

            public static void GeneralSelection(uint theme, uint selection)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "selection_theme", theme },
                    { "mastering_selection", selection }
                };
                _dataBase.AddGeneralSelection(parameters);
            }

            public static void ProfessionalSelection(uint theme, uint selection)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "selection_theme", theme },
                    { "mastering_selection", selection }
                };
                _dataBase.AddProfessionalSelection(parameters);
            }

            public static void Level(string name, string description)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "level_name", name },
                    { "level_description", description }
                };
                _dataBase.AddLevel(parameters);
            }
        }

        protected static class Edit
        {

        }

        protected static class Drop
        {

        }

        private static IDataRedactor _dataBase;
    }
}