using System.Collections.Generic;
using System.Windows;

namespace Prosperity
{
    /// <summary>
    /// Record selection window dialog
    /// </summary>
    public partial class RecordSelection : Window
    {
        public bool EditsNeeded { get; set; }
        public uint Id { get; set; }

        public RecordSelection()
        {
            InitializeComponent();
        }

        public RecordSelection(List<string[]> records) : this()
        {
            ListTableView.FillRows(records);
        }

        public void NeedMoreRecords()
        {
            EditsNeeded = true;
            DialogResult = true;
        }

        public void SelectARecord(uint id)
        {
            Id = id;
            EditsNeeded = false;
            DialogResult = true;
        }
    }
}