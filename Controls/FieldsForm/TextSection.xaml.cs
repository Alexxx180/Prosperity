using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows;

namespace Prosperity.Controls.FieldsForm
{
    /// <summary>
    /// Button field section
    /// </summary>
    public partial class TextSection : UserControl, INotifyPropertyChanged
    {
        private string _headerText;
        public string HeaderText
        {
            get => _headerText;
            set
            {
                _headerText = value;
                OnPropertyChanged();
            }
        }

        private MainPart _view;

        public TextSection()
        {
            InitializeComponent();
        }

        public TextSection(string name) : this()
        {
            HeaderText = name;
        }

        public void SetTextLabel(MainPart textView)
        {
            _view = textView;
        }

        private void SetText(object sender, RoutedEventArgs e)
        {
            _view.Current = HeaderText;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}