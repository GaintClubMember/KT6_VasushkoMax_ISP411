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
    public partial class AdminListViewPage : Page
    {
        string fioPage = "";
        public AdminListViewPage(string fio)
        {
            InitializeComponent();
            loadListView();

            fioPage = fio;
            fioLabel.Content = fio;
        }

        private void backBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Classes.Manager.frameHelper.Navigate(new Pages.LoginPage());
            }
            catch (Exception ex)
            {
                return;
            }
        }

        private void addBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Classes.Manager.frameHelper.Navigate(new Pages.AddPage(fioPage));
            }
            catch(Exception ex)
            {
                return;
            }
        }

        private void sortDESCRadioBtn_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                listViewPlace.ItemsSource = Data.Trade_KT6_Entities.GetContext().Product.OrderByDescending(d => d.ProductPrice).ToList();

            }
            catch (Exception ex)
            {
                return;
            }
        }

        private void sortASCRadioBtn_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                listViewPlace.ItemsSource = Data.Trade_KT6_Entities.GetContext().Product.OrderBy(d => d.ProductPrice).ToList();
            }
            catch (Exception ex)
            {
                return;
            }
        }

        private void findBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                listViewPlace.ItemsSource = (from item in Data.Trade_KT6_Entities.GetContext().Product
                                             where item.ProductId.ToString().ToLower().Contains(findBox.Text.ToLower()) ||
                                             item.ProductArticle.ToString().ToLower().Contains(findBox.Text.ToLower()) ||
                                             item.Names.NamesName.ToString().ToLower().Contains(findBox.Text.ToLower()) ||
                                             item.Units.UnitsName.ToString().ToLower().Contains(findBox.Text.ToLower()) ||
                                             item.ProductPrice.ToString().ToLower().Contains(findBox.Text.ToLower()) ||
                                             item.Manufacturer.ManufacturerName.ToString().ToLower().Contains(findBox.Text.ToLower()) ||
                                             item.Supplier.SupplierName.ToString().ToLower().Contains(findBox.Text.ToLower()) ||
                                             item.Categories.CategoriesName.ToString().ToLower().Contains(findBox.Text.ToLower()) ||
                                             item.ProductDescription.ToString().ToLower().Contains(findBox.Text.ToLower())
                                             select item).ToList();
            }
            catch (Exception ex)
            {
                return;
            }
        }


        private void loadListView()
        {
            try
            {
                listViewPlace.ItemsSource = Data.Trade_KT6_Entities.GetContext().Product.ToList();

            }
            catch (Exception ex)
            {
                return;
            }
        }

        private void listViewPlace_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            try
            {
                Classes.Manager.frameHelper.Navigate(new Pages.EditPage(fioPage));
                // here needs to be navigation which sends context to EditPage
            }
            catch (Exception ex)
            {
                return;
            }
        }
    }
}
