namespace Prosperity.Controls.Tables
{
    public interface IAutoIndexing
    {
        public int No { get; set; }

        public void Index(int no);
    }
}