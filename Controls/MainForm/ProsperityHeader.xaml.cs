﻿using System.Windows.Input;
using System.Windows.Controls;

namespace Prosperity.Controls.MainForm
{
    /// <summary>
    /// Part responsible for primary tables selection
    /// </summary>
    public partial class ProsperityHeader : UserControl
    {
        private MainPart _tables => GetMainPart();
        private MainPart GetMainPart()
        {
            Grid mainGrid = Parent as Grid;
            MainWindow window = mainGrid.Parent as MainWindow;
            return window.RowView;
        }

        public ProsperityHeader()
        {
            InitializeComponent();
        }

        private void CheckSelection(ComboBox selector)
        {
            switch (selector.SelectedIndex)
            {
                case 0:
                    _tables.FillDisciplines();
                    break;
                case 1:
                    _tables.FillSpecialities();
                    break;
                case 2:
                    _tables.FillConformity();
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
    }
}