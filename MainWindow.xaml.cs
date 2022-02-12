using System.Windows;
using System.ComponentModel;
using static Prosperity.Model.Tools.DataBase.UserConnectionHelper;

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

        private void SessionEnded(object sender, CancelEventArgs e)
        {
            ReportWindow report = new ReportWindow();
            if (report.ShowDialog().Value)
            {
                RowView.ViewModel.TableView.Tools.Do.SendReport(report.Message);
            }
        }
    }
}