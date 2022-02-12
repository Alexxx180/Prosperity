namespace Prosperity.Model.Tools.DataBase.Edit
{
    public class RedactorTools
    {
        public RedactorTools(Sql connector)
        {
            AddRow = new Add(connector);
            EditRow = new Edit(connector);
            MarkRow = new Mark(connector);
            Do = new Misc(connector);
        }

        internal Add AddRow { get; }
        internal Edit EditRow { get; }
        internal Mark MarkRow { get; }
        internal Misc Do { get; }
    }
}