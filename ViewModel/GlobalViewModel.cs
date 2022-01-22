using System.Windows;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Prosperity.Model;
using Prosperity.Model.DataBase;
using Prosperity.Controls.Tables;
using System.Windows.Controls;

namespace Prosperity.ViewModel
{
    public class GlobalViewModel : INotifyPropertyChanged
    {
        public GlobalViewModel()
        {
            ViewTools = new Pair<TransitionBase, MarkBase>
            {
                Name = _defaultState,
                Value = new MarkBase()
            };
            CurrentState = _defaultState;
            Transitions = new Stack();
            SelectedRowIndexes = new Dictionary<ushort, ulong>();
        }

        private static readonly TransitionBase _defaultState = new TransitionBase(null, "Пополнений стека:", 0);

        private TransitionBase _currentState;
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

        private Stack _transitions;
        public Stack Transitions
        {
            get => _transitions;
            set
            {
                _transitions = value;
                OnPropertyChanged();
            }
        }

        public int SelectedRows => SelectedRowIndexes.Count;

        private Dictionary<ushort, ulong> _selectedRowIndexes;
        public Dictionary<ushort, ulong> SelectedRowIndexes
        {
            get => _selectedRowIndexes;
            set
            {
                _selectedRowIndexes = value;
                OnPropertyChanged();
            }
        }


        public bool CanBeAffected => SelectedRows > 0;

        public void SelectRow(ushort key)
        {
            SelectedRowIndexes.Add(key, key);
            OnPropertyChanged(nameof(SelectedRows));
        }

        public void DeSelectRow(ushort key)
        {
            _ = SelectedRowIndexes.Remove(key);
            OnPropertyChanged(nameof(SelectedRows));
        }

        public void NullifySelection()
        {
            SelectedRowIndexes.Clear();
            OnPropertyChanged(nameof(SelectedRows));
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

        public void BackTransition()
        {
            _ = PopTransition();
            GetTransition().MakeTransition();
            if (!IsTopTransition)
                _ = PopTransition();
        }

        public void TransitionStateChanged()
        {
            if (!IsTopTransition)
                CurrentState = GetTransition();
            OnPropertyChanged(nameof(BackOperations));
        }

        public Pair<TransitionBase, MarkBase> ViewTools;

        public void ChangeMarkMethod(MarkBase.Action toolMethod,
            TransitionBase.Transition refreshTransition, string name, uint id)
        {
            ViewTools.Value.ActionMethod = toolMethod;
            ViewTools.Name.TransitionMethod = refreshTransition;
            ViewTools.Name.Name = name;
            ViewTools.Name.Id = id;
        }

        public void ChangeMarkMethod(MarkBase.Action toolMethod)
        {
            TransitionBase transition = GetTransition();
            ChangeMarkMethod(toolMethod, transition.TransitionMethod,
                transition.Name, transition.Id);
        }

        internal void EditRows(StackPanel view)
        {
            foreach (KeyValuePair<ushort, ulong> pair in SelectedRowIndexes)
            {
                int index = pair.Key;
                IRedactable row = view.Children[index] as IRedactable;
                if (row != null && row.CanBeEdited)
                    row.EditConfirm();
            }
        }

        private void PrepareMarks(StackPanel view)
        {
            foreach (KeyValuePair<ushort, ulong> pair in SelectedRowIndexes)
            {
                int index = pair.Key;
                IRedactable row = view.Children[index] as IRedactable;
                if (row != null && row.CanBeEdited)
                    row.MarkPrepare();
            }
        }

        private void ConfirmMarks(StackPanel view)
        {
            foreach (KeyValuePair<ushort, ulong> pair in SelectedRowIndexes)
            {
                int index = pair.Key;
                IRedactable row = view.Children[index] as IRedactable;
                if (row != null && row.CanBeEdited)
                    row.MarkConfirm();
            }
            ViewTools.Name.MakeTransition();
        }

        private void DenyMarks(StackPanel view)
        {
            foreach (KeyValuePair<ushort, ulong> pair in SelectedRowIndexes)
            {
                int index = pair.Key;
                IRedactable row = view.Children[index] as IRedactable;
                if (row != null && row.CanBeEdited)
                    row.UnMark();
            }
        }

        internal void MarkRows(StackPanel view)
        {
            PrepareMarks(view);
            if (RowsAffectedDialog("помечено"))
                ConfirmMarks(view);
            else
                DenyMarks(view);
        }

        internal bool RowsAffectedDialog(string operation)
        {
            string message = $"Будет {operation} записей: {SelectedRows}\nПродолжить?";
            MessageBoxResult result = MessageBox.Show(message, "Подтверждение операции",
                MessageBoxButton.YesNo, MessageBoxImage.Warning);
            return result == MessageBoxResult.Yes;
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