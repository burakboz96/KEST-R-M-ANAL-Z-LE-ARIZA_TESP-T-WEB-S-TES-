using System;
using System.Web;
using System.Web.UI;

namespace Arıza_Tespit_web_sitesi_projesi
{
    public partial class Anasayfa2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kullanıcının oturum açıp açmadığını kontrol edin
            if (Session["Kullanici"] == null)
            {
                // Kullanıcı oturum açmamışsa, LoginPage1.aspx sayfasına yönlendir
                Response.Redirect("LoginPage1.aspx");
            }
        }
    }
}
