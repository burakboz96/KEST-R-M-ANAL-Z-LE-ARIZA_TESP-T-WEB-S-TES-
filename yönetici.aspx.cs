using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Arıza_Tespit_web_sitesi_projesi
{
    public partial class yönetici : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Kullanıcı girişi kontrolü buraya eklenir
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Bağlantı dizesini al
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=arıza_tespit;Integrated Security=True";
            // SQL bağlantısı ve sorgusu
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM yönetici WHERE Username = @Username AND Password = @Password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    connection.Close();

                    if (count > 0)
                    {
                        // Giriş başarılı, yönlendirme yap
                        Response.Redirect("yöneticianasayfa.aspx");
                    }
                    else
                    {
                        // Giriş başarısız, hata mesajı göster
                        lblMessage.Text = "Geçersiz kullanıcı adı veya şifre.";
                    }
                }
            }
        }
    }
}
