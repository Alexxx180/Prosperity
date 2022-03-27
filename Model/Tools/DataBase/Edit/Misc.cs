using System.Collections.Generic;

namespace Prosperity.Model.Tools.DataBase.Edit
{
    internal class Misc : Tool
    {
        public Misc(Sql connector) : base(connector)
        {
        }

        public void SendReport(string commentary)
        {
            Dictionary<string, object>
                parameters = new Dictionary<string, object>
            {
                { "redactor_name", DataBase.UserName },
                { "commentary", commentary }
            };
            DataBase.SendReport(parameters);
        }

        public ulong GetLastImportId()
        {
            return DataBase.GetLastImportId();
        }
    }
}