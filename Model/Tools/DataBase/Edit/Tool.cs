namespace Prosperity.Model.Tools.DataBase.Edit
{
    public class Tool
    {
        protected IDataRedactor DataBase { get; }

        public Tool(Sql connector)
        {
            DataBase = connector;
        }
    }
}