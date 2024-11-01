using System;
using System.Collections.Generic;
using System.IO;
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
    public partial class EditPage : Page
    {
        Data.Product item;
        string fioPage = "";
        public EditPage(string fio)
        {
            InitializeComponent();
            fioPage = fio;
        }

        private void backBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Classes.Manager.frameHelper.Navigate(new Pages.AdminListViewPage(fioPage));
            }
            catch (Exception ex)
            {
                return;
            }
        }

        private void acceptBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();

                // basic checks


                if (errors.Length <= 0)
                {
                    // get and rewrite data to item

                    // save
                    //Data.Trade_KT6_Entities.GetContext().Product.Add(item);
                    Data.Trade_KT6_Entities.GetContext().SaveChanges();
                }
                if (errors.Length > 0)
                {
                    MessageBox.Show($"{errors.ToString()}", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                return;
            }
        }
    }
}
