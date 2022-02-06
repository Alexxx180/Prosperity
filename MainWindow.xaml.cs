using System.Windows;
using static Prosperity.Model.DataBase.UserConnectionHelper;

namespace Prosperity
{
    /// <summary>
    /// Redactor main window
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            if (FileConnection() || Connect())
            {
                ActivateAdmin();
            }
            else
            {
                Close();
            }
        }

        private void ActivateAdmin()
        {
            InitializeComponent();
        }
    }
}