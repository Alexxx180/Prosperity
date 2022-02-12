using System.Windows;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Prosperity
{
    /// <summary>
    /// Window applying report feature
    /// </summary>
    public partial class ReportWindow : Window, INotifyPropertyChanged
    {
        private string _message;
        public string Message
        {
            get => _message;
            set
            {
                _message = value;
                OnPropertyChanged();
            }
        }

        public ReportWindow()
        {
            InitializeComponent();
            _message = "";
        }

        public void Send(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
