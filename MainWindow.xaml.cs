using System.Windows;
using System.ComponentModel;
using Prosperity.ViewModel;
using System.Runtime.CompilerServices;

namespace Prosperity
{
    /// <summary>
    /// Redactor main window
    /// </summary>
    public partial class MainWindow : Window
    {
        private GlobalViewModel _totalViewModel;
        public GlobalViewModel TotalViewModel
        {
            get => _totalViewModel;
            set
            {
                _totalViewModel = value;
                OnPropertyChanged();
            }
        }

        public MainWindow()
        {
            TotalViewModel = new GlobalViewModel();

            if (TotalViewModel.Connect())
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
            OnPropertyChanged(nameof(TotalViewModel));
        }

        private void SessionEnded(object sender, CancelEventArgs e)
        {
            ReportWindow report = new ReportWindow();
            if (report.ShowDialog().Value)
            {
                RowView.ViewModel.TableView.Tools.Do.SendReport(report.Message);
            }
        }

        #region INotifyPropertyChanged Members
        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        /// Raises this object's PropertyChanged event.
        /// </summary>
        /// <param name="propertyName">The property that has a new value.</param>
        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                PropertyChangedEventArgs e = new PropertyChangedEventArgs(propertyName);
                handler(this, e);
            }
        }
        #endregion
    }
}