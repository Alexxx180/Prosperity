namespace Prosperity.Model.Tools.DataBase.Edit
{
    internal class Mark : Tool
    {
        public Mark(Sql connector) : base(connector)
        {
        }

        public void Conformity(ulong id)
        {
            DataBase.MarkConformity(id);
        }

        public void Speciality(ulong id)
        {
            DataBase.MarkSpeciality(id);
        }

        public void SpecialityCode(ulong id)
        {
            DataBase.MarkSpecialityCode(id);
        }

        public void GeneralCompetetion(ulong id)
        {
            DataBase.MarkGeneralCompetetion(id);
        }

        public void ProfessionalCompetetion(ulong id)
        {
            DataBase.MarkProfessionalCompetetion(id);
        }

        public void Discipline(ulong id)
        {
            DataBase.MarkDiscipline(id);
        }

        public void DisciplineCode(ulong id)
        {
            DataBase.MarkDisciplineCode(id);
        }

        public void TotalHour(ulong id)
        {
            DataBase.MarkTotalHour(id);
        }

        public void Topic(ulong id)
        {
            DataBase.MarkTopic(id);
        }

        public void Theme(ulong id)
        {
            DataBase.MarkTheme(id);
        }

        public void Work(ulong id)
        {
            DataBase.MarkWork(id);
        }

        public void WorkType(ulong id)
        {
            DataBase.MarkWorkType(id);
        }

        public void Task(ulong id)
        {
            DataBase.MarkTask(id);
        }

        public void MetaData(ulong id)
        {
            DataBase.MarkMetaData(id);
        }

        public void MetaType(ulong id)
        {
            DataBase.MarkMetaType(id);
        }

        public void Source(ulong id)
        {
            DataBase.MarkSource(id);
        }

        public void SourceType(ulong id)
        {
            DataBase.MarkSourceType(id);
        }

        public void GeneralMastering(ulong id)
        {
            DataBase.MarkGeneralMastering(id);
        }

        public void ProfessionalMastering(ulong id)
        {
            DataBase.MarkProfessionalMastering(id);
        }

        public void GeneralSelection(ulong id)
        {
            DataBase.MarkGeneralSelection(id);
        }

        public void ProfessionalSelection(ulong id)
        {
            DataBase.MarkProfessionalSelection(id);
        }

        public void Level(ulong id)
        {
            DataBase.MarkLevel(id);
        }
    }
}