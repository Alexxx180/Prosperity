namespace Prosperity.Controls.Tables
{
    public interface IAutoIndexing
    {
        public int RowKey { get; set; }
        public int No { get; set; }

        public void Index(int no);
    }
}