using System.Collections.Generic;
using System.Windows;

namespace Prosperity
{
    /// <summary>
    /// Record selection window dialog
    /// </summary>
    public partial class RecordFields : Window
    {
        public RecordFields()
        {
            InitializeComponent();
        }

        public RecordFields(Dictionary<string, string> record) : this()
        {
            FieldsView.SeparateFields(record);
        }

        private void Apply(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
        }

        private void Cancel(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}