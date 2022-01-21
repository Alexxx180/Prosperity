namespace Prosperity.Controls.Tables
{
    public interface IRedactable
    {
        public bool CanBeEdited { get; }

        public void EditConfirm();
        public uint MarkPrepare();
        public void UnMark();
    }
}