using System.Windows;
using System.Windows.Input;
using static Prosperity.Controls.Tables.EditHelper;

namespace Prosperity.Controls.Tables
{
    public partial class EditEvents
    {
        private void Hours(object sender, TextCompositionEventArgs e)
        {
            CheckForHours(sender, e);
        }

        private void PastingHours(object sender, DataObjectPastingEventArgs e)
        {
            CheckForPastingHours(sender, e);
        }
    }
}