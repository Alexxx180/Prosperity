using System.Windows.Controls;

namespace Prosperity.Controls.Tables
{
    public static class AutoHelper
    {
        public static void AutoIndexing(StackPanel rows)
        {
            for (ushort no = 0; no < rows.Children.Count; no++)
            {
                IAutoIndexing row = rows.Children[no] as IAutoIndexing;
                row.Index(no + 1);
            }
        }
    }
}
