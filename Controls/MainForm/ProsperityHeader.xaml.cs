using System.Windows.Input;
using System.Windows.Controls;
using System.Runtime.CompilerServices;
using System.ComponentModel;
using Prosperity.Model.Tools.DataBase;
using Prosperity.ViewModel;
using System.Windows;

namespace Prosperity.Controls.MainForm
{
    /// <summary>
    /// Part responsible for primary tables selection
    /// </summary>
    public partial class ProsperityHeader : UserControl, INotifyPropertyChanged
    {
        public static readonly DependencyProperty
            ViewModelProperty = DependencyProperty.Register(nameof(ViewModel),
                typeof(GlobalViewModel), typeof(ProsperityHeader));

        internal GlobalViewModel ViewModel
        {
            get => GetValue(ViewModelProperty) as GlobalViewModel;
            set => SetValue(ViewModelProperty, value);
        }

        // Set table by default
        public void SetTables(in int id)
        {
            //if (Sql.IsConnected)
                TableSelector.SelectedIndex = id;
        }

        public ProsperityHeader()
        {
            //if (Sql.IsConnected)
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