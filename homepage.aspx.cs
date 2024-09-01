using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Arıza_Tespit_web_sitesi_projesi
{
    public partial class homepage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Sayfa ilk yüklendiğinde çalışacak kodlar buraya gelebilir.
            }
        }

        protected void submitForm(object sender, EventArgs e)
        {
            // Form verilerini al
            string firstName = Request.Form["firstName"];
            string lastName = Request.Form["lastName"];
            string workplace = Request.Form["workplace"];
            string tcNumber = Request.Form["tcNumber"];
            string faultDescription = Request.Form["faultDescription"];
            string latitude = Request.Form["latitude"];
            string longitude = Request.Form["longitude"];
            string faultDate = Request.Form["datepicker"]; // Takvimden gelen tarih
            HttpPostedFile photoUpload = Request.Files["photoUpload"];
            string photoPath = null;

            // Fotoğrafı kaydet
            if (photoUpload != null && photoUpload.ContentLength > 0)
            {
                photoPath = "~/Uploads/" + photoUpload.FileName;
                string serverPath = Server.MapPath(photoPath);
                photoUpload.SaveAs(serverPath);
            }

            // Veritabanı bağlantı dizesi
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=arıza_tespit;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Şikayetler (İsim, Soyisim, Çalıştığınız_İş, TC_Numara, Arıza_Bildirme_Metni, Enlem, Boylam, Fotoğraf_Yolu, Arıza_Tarihi) " +
                               "VALUES (@FirstName, @LastName, @Workplace, @TCNumber, @FaultDescription, @Latitude, @Longitude, @PhotoPath, @FaultDate)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Parametreleri ekle
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Workplace", workplace);
                    cmd.Parameters.AddWithValue("@TCNumber", tcNumber);
                    cmd.Parameters.AddWithValue("@FaultDescription", faultDescription);
                    cmd.Parameters.AddWithValue("@Latitude", latitude);
                    cmd.Parameters.AddWithValue("@Longitude", longitude);
                    cmd.Parameters.AddWithValue("@PhotoPath", photoPath ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@FaultDate", faultDate);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Arıza bildiriminiz başarıyla gönderildi!');</script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Arıza bildirimi gönderilirken bir hata oluştu: " + ex.Message + "');</script>");
                    }
                }
            }
        }
    }
}
