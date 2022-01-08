using System.Windows;
using System.Collections;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Prosperity.Model;
using Prosperity.Model.DataBase;

namespace Prosperity.ViewModel
{
    public class GlobalViewModel : INotifyPropertyChanged
    {
        public TransitionBase CurrentState => GetTransition();

        public bool IsTopTransition => Transitions.Count <= 0;
        public Visibility BackOperations => IsTopTransition ? Visibility.Hidden : Visibility.Visible;

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

        public void CleanBuffer()
        {
            Transitions.Clear();
        }

        public void AddTransition(TransitionBase.Transition way, string name, uint id)
        {
            TransitionBase transition = new TransitionBase(way, name, id);
            Transitions.Push(transition);
            TransitionStateChanged();
        }

        public TransitionBase GetTransition()
        {
            TransitionBase transition = Transitions.Peek() as TransitionBase;
            return transition ?? new TransitionBase(null, "- Верхний уровень -", 0);
        }

        public TransitionBase PopTransition()
        {
            TransitionBase transition = Transitions.Pop() as TransitionBase;
            TransitionStateChanged();
            return transition;
        }

        public void TransitionStateChanged()
        {
            OnPropertyChanged(nameof(CurrentState));
            OnPropertyChanged(nameof(BackOperations));
        }

        public ProgramData Data = new ProgramData();

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}