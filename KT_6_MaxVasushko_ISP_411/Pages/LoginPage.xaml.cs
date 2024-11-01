using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
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
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();

            loginBox.Text = "pixil59@gmail.com";
            passwordBox.Password = "2L6KZG";
        }

        private void acceptBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();

                string login = loginBox.Text;
                string password = passwordBox.Password;

                bool userExists = Data.Trade_KT6_Entities.GetContext().User.Any(d => d.UserLogin == login);
                bool userSuccessAuth = Data.Trade_KT6_Entities.GetContext().User.Any(d => d.UserLogin == login && d.UserPassword == password);

                //// if (captcha right answer != user answer)
                //{
                //    block boxes from manager
                //} else {
                //    nothing because capthca is valid
                //}

                if (userExists == false)
                {
                    errors.AppendLine("Пользователя не существует");
                    // increse counter for CAPTCHA
                    return;
                }

                if (userSuccessAuth == false)
                {
                    errors.AppendLine("Неправильный логин или пароль");
                    // increse counter for CAPTCHA
                    return;
                }
                if (String.IsNullOrEmpty(login))
                {
                    errors.AppendLine("Поле Логин: не должно быть пустым");
                }
                if (String.IsNullOrEmpty(password))
                {
                    errors.AppendLine("Поле Пароль: не должно быть пустым");
                }

                if (errors.Length <= 0)
                {
                    if (userSuccessAuth == true)
                    {
                        StringBuilder roleString = new StringBuilder();
                        var authentificatedUserData = Data.Trade_KT6_Entities.GetContext().User.Where(d => d.UserLogin == login && d.UserPassword == password).FirstOrDefault();

                        string fioBuild = authentificatedUserData.UserName.ToString() + " " + authentificatedUserData.UserName.ToString() + " " + authentificatedUserData.UserPatronymic.ToString();

                        if (authentificatedUserData.Role.RoleName == "Администратор")
                        {
                            Classes.Manager.frameHelper.Navigate(new Pages.AdminListViewPage(fioBuild));
                            roleString.AppendLine("Администратор");
                            MessageBox.Show($"Успешная авторизация.\nВы {roleString.ToString()}", "Успешно авторизировано", MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                        if (authentificatedUserData.Role.RoleName == "Менеджер")
                        {
                            Classes.Manager.frameHelper.Navigate(new Pages.ViewPage(fioBuild));
                            roleString.AppendLine("Менеджер");
                            MessageBox.Show($"Успешная авторизация.\nВы {roleString.ToString()}", "Успешно авторизировано", MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                        if (authentificatedUserData.Role.RoleName == "Клиент")
                        {
                            Classes.Manager.frameHelper.Navigate(new Pages.ViewPage(fioBuild));
                            roleString.AppendLine("Клиент");
                            MessageBox.Show($"Успешная авторизация.\nВы {roleString.ToString()}", "Успешно авторизировано", MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                    }
                }
                //if (captha counter > 3){
                //    invoke captcha
                //}
            }
            catch (Exception ex)
            {
                return;
            }
        }

        private void guestBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string fioNULL = null;
                Classes.Manager.frameHelper.Navigate(new Pages.ViewPage(fioNULL));
            }
            catch(Exception ex)
            {
                return;
            }
        }
    }
}
