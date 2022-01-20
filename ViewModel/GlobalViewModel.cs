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
        private static TransitionBase _defaultState = new TransitionBase(null, "Пополнений стека:", 0);

        private TransitionBase _currentState = _defaultState;
        public TransitionBase CurrentState
        {
            get => _currentState;
            set
            {
                _currentState = value;
                OnPropertyChanged();
            }
        }

        public bool IsTopTransition => IsTop(Transitions.Count, 0);
        public static bool IsTop(int original, int toCompare) => original <= toCompare;
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

        public void Select(bool selected)
        {
            SelectedRows += selected ? 1 : -1;
        }

        public void NullifySelection()
        {
            SelectedRows = 0;
        }

        public void CleanBuffer()
        {
            Transitions.Clear();
            TransitionStateChanged();
        }

        public void AddTransition(TransitionBase.Transition way, string name, uint id)
        {
            TransitionBase transition = new TransitionBase(way, name, id);
            Transitions.Push(transition);
            TransitionStateChanged();
        }

        public void RefreshTransition()
        {
            if (IsTopTransition)
                return;
            TransitionBase transition = PopTransition();
            transition.MakeTransition();
        }

        public TransitionBase GetTransition()
        {
            TransitionBase transition = Transitions.Peek() as TransitionBase;
            return transition;
        }

        public TransitionBase PopTransition()
        {
            TransitionBase transition = Transitions.Pop() as TransitionBase;
            TransitionStateChanged();
            return transition;
        }

        public void TransitionStateChanged()
        {
            if (!IsTopTransition)
                CurrentState = GetTransition();
            OnPropertyChanged(nameof(BackOperations));
        }

        private static readonly Sql _connector = new MySQL();
        public ProgramData Data = new ProgramData(_connector);
        public RedactorTools Tools = new RedactorTools(_connector);

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}