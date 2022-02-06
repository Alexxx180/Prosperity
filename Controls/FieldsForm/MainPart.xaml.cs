using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Controls;

namespace Prosperity.Controls.FieldsForm
{
    /// <summary>
    /// Part responsible for record choosing
    /// </summary>
    public partial class MainPart : UserControl, INotifyPropertyChanged
    {
        public string FullText
        {
            get => Fields[Current];
            set
            {
                Fields[Current] = value;
                OnPropertyChanged();
            }
        }

        private string _current;
        public string Current
        {
            get => _current;
            set
            {
                _current = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(FullText));
            }
        }

        private Dictionary<string, string> _fields;
        public Dictionary<string, string> Fields
        {
            get => _fields;
            set
            {
                _fields = value;
                OnPropertyChanged();
            }
        }

        public MainPart()
        {
            string header = "Заголовок";
            Fields = new Dictionary<string, string>
            {
                { header, "Нет данных" }
            };
            Current = header;
            InitializeComponent();
        }

        public void SeparateFields(Dictionary<string, string> row)
        {
            Fields = row;
            foreach (KeyValuePair<string, string> pair in row)
                SeparateField(pair.Key);
        }

        private void SeparateField(string name)
        {
            Current = name;
            TextSection topic = new TextSection(name);
            topic.SetTextLabel(this);
            _ = Sections.Children.Add(topic);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}