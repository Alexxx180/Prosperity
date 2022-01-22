using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Controls;

namespace Prosperity.Controls.Tables
{
    public class LayoutMaster : INotifyPropertyChanged
    {
        public LayoutMaster()
        {
            Records = new StackPanel();
        }

        private StackPanel _records;
        public StackPanel Records
        {
            get => _records;
            set
            {
                _records = value;
                OnPropertyChanged();
            }
        }

        public int Count => Records.Children.Count;

        public void AddElements<T>(List<string[]> records, IAutoIndexing rowAdditor)
        {
            Records.Children.Clear();
            ushort i = 0;
            for (; i < records.Count; i++)
                AddElement<T>(records[i]).Index(i + 1);
            rowAdditor.Index(i + 1);
            _ = Records.Children.Add(rowAdditor as UserControl);
            OnPropertyChanged(nameof(Records));
            OnPropertyChanged(nameof(Count));
        }

        public IRedactable AddElement<T>(string[] record)
        {
            IRedactable row = Activator.CreateInstance(typeof(T)) as IRedactable;
            row.SetElement(record);
            _ = Records.Children.Add(row as UserControl);
            return row;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}