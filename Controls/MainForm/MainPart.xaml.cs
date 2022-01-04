using System.Windows.Controls;
using Prosperity.ViewModel;
using Prosperity.Model.DataBase;
using Prosperity.Controls.Tables.Disciplines;

namespace Prosperity.Controls.MainForm
{
    /// <summary>
    /// Логика взаимодействия для MainPart.xaml
    /// </summary>
    public partial class MainPart : UserControl
    {
        public MainPart()
        {
            InitializeComponent();
            GlobalViewModel model = new GlobalViewModel();
            DataContext = model;
            DisciplineRow.AddElements(CurrentView, Data.Disciplines);
            //model.AddTransition("ЛООЛ", 1);
        }

        public void FillDisciplines()
        {

        }

        public void FillSpecialities()
        {

        }

        public void FillConformity()
        {

        }

        public ProgramData Data = new ProgramData();
    }
}