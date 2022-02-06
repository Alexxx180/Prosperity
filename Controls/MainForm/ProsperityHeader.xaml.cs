using System.Windows.Input;
using System.Windows.Controls;
using System.Runtime.CompilerServices;
using System.ComponentModel;
using Prosperity.Model.DataBase;
using Prosperity.ViewModel;

namespace Prosperity.Controls.MainForm
{
    /// <summary>
    /// Part responsible for primary tables selection
    /// </summary>
    public partial class ProsperityHeader : UserControl, INotifyPropertyChanged
    {
        private GlobalViewModel _viewModel;
        internal GlobalViewModel ViewModel
        {
            get => _viewModel;
            set
            {
                _viewModel = value;
                SetTables(0);
                OnPropertyChanged();
            }
        }

        // Set table by default
        public void SetTables(in int id)
        {
            if (Sql.IsConnected)
                TableSelector.SelectedIndex = id;
        }

        public ProsperityHeader()
        {
            if (Sql.IsConnected)
                InitializeComponent();
        }

        private void CheckSelection(ComboBox selector)
        {
            if (ViewModel.TableView == null)
                return;
            switch (selector.SelectedIndex)
            {
                case 0:
                    ViewModel.TableView.FillDisciplines();
                    break;
                case 1:
                    ViewModel.TableView.FillSpecialities();
                    break;
                case 2:
                    ViewModel.TableView.FillConformity();
                    break;
                default:
                    break;
            }
        }

        private void PrimaryTables_Select(object sender, SelectionChangedEventArgs e)
        {
            ComboBox selector = sender as ComboBox;
            CheckSelection(selector);
        }

        private void PrimaryTables_Click(object sender, MouseButtonEventArgs e)
        {
            ComboBox selector = sender as ComboBox;
            CheckSelection(selector);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}