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
            SelectedTableCodes = new Dictionary<ushort, ulong>();
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

        public int SelectedRows => SelectedTableCodes.Count;

        private Dictionary<ushort, ulong> _seletedTableCodes;
        public Dictionary<ushort, ulong> SelectedTableCodes
        {
            get => _seletedTableCodes;
            set
            {
                _seletedTableCodes = value;
                OnPropertyChanged();
            }
        }


        public bool CanBeAffected => SelectedRows > 0;

        public void SelectRow(ushort key, ushort id)
        {
            SelectedTableCodes.Add(key, id);
            OnPropertyChanged(nameof(SelectedRows));
        }

        public void DeSelectRow(ushort key)
        {
            SelectedTableCodes.Remove(key);
            OnPropertyChanged(nameof(SelectedRows));
        }

        public void NullifySelection()
        {
            SelectedTableCodes.Clear();
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

        }

        internal void MarkRows(StackPanel view)
        {
            List<uint> ids = new List<uint>();
            for (ushort i = 0; i < view.Children.Count; i++)
            {
                IRedactable row = view.Children[i] as IRedactable;
                if (row != null && row.CanBeEdited)
                    ids.Add(row.MarkPrepare());
            }
            
            if (RowsAffectedDialog("помечено"))
            {
                for (ushort i = 0; i < ids.Count; i++)
                    ViewTools.Value.Do(ids[i]);
                ViewTools.Name.MakeTransition();
            }
            else
            {
                for (ushort i = 0; i < view.Children.Count; i++)
                {
                    IRedactable row = view.Children[i] as IRedactable;
                    if (row != null && row.CanBeEdited)
                        row.UnMark();
                }
            }
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