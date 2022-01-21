namespace Prosperity.Model
{
    /// <summary>
    /// Record marking class based on delegates
    /// </summary>
    public class MarkBase
    {
        public void Do(uint id)
        {
            ActionMethod(id);
        }

        public delegate void Action(ulong id);
        public Action ActionMethod { get; set; }
    }
}