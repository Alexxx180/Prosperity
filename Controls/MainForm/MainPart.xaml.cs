using System.Windows;
using System.Windows.Controls;
using System.Runtime.CompilerServices;
using System.ComponentModel;
using Prosperity.ViewModel;
using Prosperity.Model.Tools.DataBase;

namespace Prosperity.Controls.MainForm
{
    /// <summary>
    /// Part responsible for viewing and editing data
    /// </summary>
    public partial class MainPart : UserControl, INotifyPropertyChanged
    {
        private GlobalViewModel _viewModel;
        public GlobalViewModel ViewModel
        {
            get => _viewModel;
            set
            {
                _viewModel = value;
                OnPropertyChanged();
            }
        }

        public MainPart()
        {
            if (Sql.IsConnected)
            {
                InitializeComponent();
                ViewModel = DataContext as GlobalViewModel;
            }
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            ViewModel.BackTransition();
        }

        private void EditRows(object sender, RoutedEventArgs e)
        {
            ViewModel.EditRows(ViewModel.TableView.Records);
        }

        private void MarkRows(object sender, RoutedEventArgs e)
        {
            ViewModel.MarkRows(ViewModel.TableView.Records);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}