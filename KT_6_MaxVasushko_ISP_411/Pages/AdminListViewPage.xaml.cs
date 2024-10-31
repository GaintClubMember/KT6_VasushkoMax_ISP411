using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace KT_6_MaxVasushko_ISP_411.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdminListViewPage.xaml
    /// </summary>
    public partial class AdminListViewPage : Page
    {
        public AdminListViewPage()
        {
            InitializeComponent();
            loadListView();
        }

        private void backBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Classes.Manager.frameHelper.CanGoBack == true)
                {
                    Classes.Manager.frameHelper.GoBack();
                }
                else
                {
                    return;
                }
            }
            catch (Exception ex)
            {
                return;
            }
        }

        private void addBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void sortDESCRadioBtn_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void sortASCRadioBtn_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void findBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }


        // METHODS
        private void loadListView()
        {
            listViewPlace.ItemsSource = Data.Trade_KT6_Entities.GetContext().Product.ToList();

        }

    }
}
