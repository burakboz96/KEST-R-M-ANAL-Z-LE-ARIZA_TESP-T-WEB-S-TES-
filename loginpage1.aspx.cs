using System;
using System.Data.SqlClient;

namespace Arıza_Tespit_web_sitesi_projesi
{
    public partial class loginpage1 : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Sayfa yüklendiğinde online ve toplam kullanıcı sayısını göster
                lblOnlineKullanici.Text = Application["OnlineKullaniciSayisi"].ToString();
                lblToplamKullanici.Text = Application["ToplamKullaniciSayisi"].ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Kullanıcı adı ve şifreyi al
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // SQL Server bağlantı dizesi
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=arıza_tespit;Integrated Security=True";

            // SQL sorgusu
            string query = "SELECT COUNT(1) FROM Users WHERE Username=@Username AND Password=@Password";

            // Bağlantı nesnesi ve komut nesnesi oluştur
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Parametreleri ekle
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);

                // Bağlantıyı aç
                connection.Open();

                // Sorguyu çalıştır ve sonucu al
                int count = (int)command.ExecuteScalar();

                // Kullanıcı doğrulama
                if (count > 0)
                {
                    // Doğruysa ana sayfaya yönlendir
                    Response.Redirect("~/homepage.aspx");
                }
                else
                {
                    // Yanlışsa hata mesajı göster

                    lblMessage.Text = "Kullanıcı adı veya şifre yanlış. Lütfen tekrar deneyin.";
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Kayıt sayfasına yönlendir
            Response.Redirect("registerpage.aspx");
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            // Yönetici sayfasına yönlendir
            Response.Redirect("yönetici.aspx");
        }
    }
}
