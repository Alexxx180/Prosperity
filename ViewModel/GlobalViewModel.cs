using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Collections;
using Prosperity.Model;

namespace Prosperity.ViewModel
{
    public class GlobalViewModel : INotifyPropertyChanged
    {
        public Pair<string, int> CurrentState => GetTransition();

        private Stack _transitions = new Stack();
        public Stack Transitions
        {
            get => _transitions;
            set
            {
                _transitions = value;
                OnPropertyChanged();
            }
        }

        private int _selectedRows = 0;
        public int SelectedRows
        {
            get => _selectedRows;
            set
            {
                _selectedRows = value;
                OnPropertyChanged();
            }
        }

        public bool CanBeAffected => _selectedRows > 0;
        //public int RecordCount => ;

        public void AddTransition(string name, int id)
        {
            Pair<string, int> transition = new Pair<string, int>($"- {name} -", id);
            Transitions.Push(transition);
            OnPropertyChanged(nameof(CurrentState));
        }

        private Pair<string, int> GetTransition()
        {
            Pair<string, int> transition = (Pair<string, int>)Transitions.Peek();
            return transition ?? new Pair<string, int>("- Верхний уровень -", 0);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}