using System;
using System.IO;
using System.Web;

namespace Arıza_Tespit_web_sitesi_projesi
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Uygulama başladığında yapılacak işlemler buraya yazılır
            Application["OnlineKullaniciSayisi"] = 0; // Online kullanıcı sayısını tutmak için uygulama değişkeni
            Application["ToplamKullaniciSayisi"] = 0; // Toplam kullanıcı sayısını tutmak için uygulama değişkeni
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Yeni bir oturum başlatıldığında yapılacak işlemler buraya yazılır
            int onlineKullaniciSayisi = Convert.ToInt32(Application["OnlineKullaniciSayisi"]);
            onlineKullaniciSayisi++; // Her kullanıcı giriş yaptığında 1 artar
            Application.Lock();
            Application["OnlineKullaniciSayisi"] = onlineKullaniciSayisi;
            Application.UnLock();

            int toplamKullaniciSayisi = Convert.ToInt32(Application["ToplamKullaniciSayisi"]);
            toplamKullaniciSayisi++; // Her oturum başladığında 1 artar
            Application.Lock();
            Application["ToplamKullaniciSayisi"] = toplamKullaniciSayisi;
            Application.UnLock();
        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Bir oturum sonlandırıldığında yapılacak işlemler buraya yazılır
            int onlineKullaniciSayisi = Convert.ToInt32(Application["OnlineKullaniciSayisi"]);
            onlineKullaniciSayisi--;
            Application.Lock();
            Application["OnlineKullaniciSayisi"] = onlineKullaniciSayisi;
            Application.UnLock();
        }
    }
}
