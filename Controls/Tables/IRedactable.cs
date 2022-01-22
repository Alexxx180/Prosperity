namespace Prosperity.Controls.Tables
{
    public interface IRedactable : IAutoIndexing
    {
        public bool CanBeEdited { get; }

        public void SetElement(string[] row);

        public void EditConfirm();
        public uint MarkPrepare();
        public void UnMark();
    }
}