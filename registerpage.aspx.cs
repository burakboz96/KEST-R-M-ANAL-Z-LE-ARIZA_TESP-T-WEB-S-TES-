using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace Arıza_Tespit_web_sitesi_projesi
{
    public partial class registerpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Kullanıcıdan alınan bilgileri değişkenlere aktar
            string username = txtName.Text;
            string isimSoyisim = txtSurname.Text;
            string adres = txtAddress.Text;
            string telefon = txtPhone.Text;
            string sehir = ddlCity.SelectedValue;
            string calistigiIsYeri = ddlCompany.SelectedValue;
            string password = txtPassword.Text;

            // Eksik bilgi kontrolü yap
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(isimSoyisim) || string.IsNullOrEmpty(adres) || string.IsNullOrEmpty(telefon) || string.IsNullOrEmpty(password))
            {
                // Eksik bilgi varsa kullanıcıya uyarı mesajı göster ve kayıt işlemi iptal edilsin
                Response.Write("<script>alert('Lütfen tüm bilgileri eksiksiz giriniz.')</script>");
                return;
            }

            // Veritabanına bağlanmak için bağlantı dizesini al
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=arıza_tespit;Integrated Security=True";

            // Veritabanına bağlantı oluştur
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Veritabanı bağlantısını aç
                connection.Open();

                // Kullanıcı bilgilerini eklemek için SQL sorgusu oluştur
                string query = "INSERT INTO registers (username, isimSoyisim, adres, telefon, sehir, calistigiIsYeri,password) VALUES (@username, @isimSoyisim, @adres, @telefon, @sehir, @calistigiIsYeri,@password)";

                // SQL komutunu oluştur
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Parametreleri ekle
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@isimSoyisim", isimSoyisim);
                    command.Parameters.AddWithValue("@adres", adres);
                    command.Parameters.AddWithValue("@telefon", telefon);
                    command.Parameters.AddWithValue("@sehir", sehir);
                    command.Parameters.AddWithValue("@calistigiIsYeri", calistigiIsYeri);
                    command.Parameters.AddWithValue("@password", password);

                    // Komutu çalıştır
                    command.ExecuteNonQuery();
                }

                // Kullanıcı adı ve şifreyi başka bir tabloya kaydetmek için başka bir SQL sorgusu oluşturabilirsiniz
                // Bu kısmı kendi veritabanı yapınıza ve gereksinimlerinize göre uyarlayabilirsiniz
                string usersQuery = "INSERT INTO users (username, password) VALUES (@username, @password)";
                using (SqlCommand usersCommand = new SqlCommand(usersQuery, connection))
                {
                    usersCommand.Parameters.AddWithValue("@username", username);
                    usersCommand.Parameters.AddWithValue("@password", password);

                    usersCommand.ExecuteNonQuery();
                }
            }

            // Başarılı kayıt mesajını kullanıcıya göster
            Response.Write("<script>alert('Kayıt başarıyla tamamlandı.')</script>");

            // Giriş ekranına yönlendir
            Response.Redirect("anasayfa.aspx");
        }
    }
}
