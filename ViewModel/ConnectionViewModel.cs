using Prosperity.Model.Tools.DataBase;

namespace Prosperity.ViewModel
{
    public class ConnectionViewModel
    {
        public ConnectionViewModel()
        {
            Connector = new MySQL();
        }

        internal readonly Sql Connector;
    }
}
