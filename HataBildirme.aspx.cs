using System;
using System.Net.Mail;
using System.Web.UI;

namespace Arıza_Tespit_web_sitesi_projesi
{
    public partial class HataBildirme : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SubmitReport_Click(object sender, EventArgs e)
        {
            string userEmail = email.Text;
            string faultDescription = description.Text;

            try
            {
                // E-posta gönderme işlemi
                MailMessage mail = new MailMessage();
                SmtpClient smtpServer = new SmtpClient("smtp.gmail.com"); // SMTP sunucusunu belirtin
                mail.From = new MailAddress("burakbozoglu96@gmail.com"); // Gönderici e-posta adresi
                mail.To.Add(userEmail); // Alıcı e-posta adresi
                mail.Subject = "Hata Bildirimi Alındı";
                mail.Body = "Hata bildiriminiz başarıyla alındı. Hata açıklamanız: " + faultDescription;

                smtpServer.Port = 587; // SMTP sunucu portunu belirtin
                smtpServer.Credentials = new System.Net.NetworkCredential("burakbozoglu96@gmail.com", "**********"); // Gerekli kimlik bilgilerini belirtin
                smtpServer.EnableSsl = true;

                smtpServer.Send(mail);

                // Başarılı bildirim mesajı
                Response.Write("<script>showConfirmationMessage();</script>");
            }
            catch (Exception ex)
            {
                // Hata mesajı
                Response.Write("<script>alert('Hata bildirimi gönderilirken bir hata oluştu: " + ex.Message + "');</script>");
            }
        }
    }
}
