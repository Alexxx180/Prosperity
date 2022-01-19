using System.Collections.Generic;

namespace Prosperity.Model.DataBase
{
    public interface IDataRedactor
    {
        public void AddConformity(Dictionary<string, object> parameters);

        public void AddSpeciality(Dictionary<string, object> parameters);

        public void AddSpecialityCode(string value);

        public void AddGeneralCompetetion(Dictionary<string, object> parameters);

        public void AddProfessionalCompetetion(Dictionary<string, object> parameters);

        public void AddDiscipline(Dictionary<string, object> parameters);

        public void AddDisciplineCode(string value);

        public void AddTotalHour(Dictionary<string, object> parameters);

        public void AddTopic(Dictionary<string, object> parameters);

        public void AddTheme(Dictionary<string, object> parameters);

        public void AddWork(Dictionary<string, object> parameters);

        public void AddWorkType(string value);

        public void AddTask(Dictionary<string, object> parameters);

        public void AddMetaData(Dictionary<string, object> parameters);

        public void AddMetaType(string value);

        public void AddSource(Dictionary<string, object> parameters);

        public void AddSourceType(string value);

        public void AddGeneralMastering(Dictionary<string, object> parameters);

        public void AddProfessionalMastering(Dictionary<string, object> parameters);

        public void AddGeneralSelection(Dictionary<string, object> parameters);

        public void AddProfessionalSelection(Dictionary<string, object> parameters);

        public void AddLevel(Dictionary<string, object> parameters);


        public void SetConformity(Dictionary<string, object> parameters);

        public void SetSpeciality(Dictionary<string, object> parameters);

        public void SetSpecialityCode(Dictionary<string, object> parameters);

        public void SetGeneralCompetetion(Dictionary<string, object> parameters);

        public void SetProfessionalCompetetion(Dictionary<string, object> parameters);

        public void SetDiscipline(Dictionary<string, object> parameters);

        public void SetDisciplineCode(Dictionary<string, object> parameters);

        public void SetTotalHour(Dictionary<string, object> parameters);

        public void SetTopic(Dictionary<string, object> parameters);

        public void SetTheme(Dictionary<string, object> parameters);

        public void SetWork(Dictionary<string, object> parameters);

        public void SetWorkType(Dictionary<string, object> parameters);

        public void SetTask(Dictionary<string, object> parameters);

        public void SetMetaData(Dictionary<string, object> parameters);

        public void SetMetaType(Dictionary<string, object> parameters);

        public void SetSource(Dictionary<string, object> parameters);

        public void SetSourceType(Dictionary<string, object> parameters);

        public void SetGeneralMastering(Dictionary<string, object> parameters);

        public void SetProfessionalMastering(Dictionary<string, object> parameters);

        public void SetGeneralSelection(Dictionary<string, object> parameters);

        public void SetProfessionalSelection(Dictionary<string, object> parameters);

        public void SetLevel(Dictionary<string, object> parameters);


        public void MarkConformity(uint value);

        public void MarkSpeciality(uint value);

        public void MarkSpecialityCode(uint value);

        public void MarkGeneralCompetetion(uint value);

        public void MarkProfessionalCompetetion(uint value);

        public void MarkDiscipline(uint value);

        public void MarkDisciplineCode(uint value);

        public void MarkTotalHour(uint value);

        public void MarkTopic(uint value);

        public void MarkTheme(uint value);

        public void MarkWork(uint value);

        public void MarkWorkType(uint value);

        public void MarkTask(uint value);

        public void MarkMetaData(uint value);

        public void MarkMetaType(uint value);

        public void MarkSource(uint value);

        public void MarkSourceType(uint value);

        public void MarkGeneralMastering(uint value);

        public void MarkProfessionalMastering(uint value);

        public void MarkGeneralSelection(uint value);

        public void MarkProfessionalSelection(uint value);

        public void MarkLevel(uint value);
    }
}