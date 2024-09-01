<%@ Page Title="" Language="C#" MasterPageFile="~/Anasayfa.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Arıza_Tespit_web_sitesi_projesi.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- Swiper.js CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    
    <!-- Swiper.js JavaScript -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script>
        $(function () {
            $("#datepicker").datepicker({
                dateFormat: "yy-mm-dd"
            });
        });

        function initMap() {
            var map = L.map('map').setView([39.9334, 32.8597], 13);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
            }).addTo(map);

            var marker = L.marker([51.505, -0.09], { draggable: true }).addTo(map);

            marker.on('dragend', function (event) {
                var position = marker.getLatLng();
                document.getElementById('latitude').value = position.lat;
                document.getElementById('longitude').value = position.lng;
            });

            document.getElementById('findLocation').onclick = function () {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        var lat = position.coords.latitude;
                        var lng = position.coords.longitude;
                        map.setView([lat, lng], 13);
                        marker.setLatLng([lat, lng]);
                        document.getElementById('latitude').value = lat;
                        document.getElementById('longitude').value = lng;
                    }, function () {
                        alert('Geolocation failed.');
                    });
                } else {
                    alert('Your browser does not support geolocation.');
                }
            };
        }

        document.addEventListener('DOMContentLoaded', function () {
            initMap();

            // Initialize Swiper
            var swiper = new Swiper('.swiper-container', {
                loop: true, // Döngü için
                autoplay: {
                    delay: 3000, // 3 saniyede bir geçiş
                },
                effect: 'fade', // Geçiş efekti
                fadeEffect: {
                    crossFade: true
                },
                pagination: {
                    el: '.swiper-pagination', // Eğer sayfalama göstermek isterseniz
                    clickable: true,
                },
                navigation: {
                    nextEl: '.swiper-button-next', // Eğer navigasyon butonları eklemek isterseniz
                    prevEl: '.swiper-button-prev',
                },
            });
        });

        function scrollAnnouncements() {
            var container = document.getElementById('announcements');
            var first = container.firstElementChild;
            container.appendChild(first.cloneNode(true));
            first.style.marginTop = '-50px';
            first.style.transition = 'margin-top 1s ease-in-out';
            setTimeout(function () {
                container.removeChild(first);
            }, 1000);
        }

        $(function () {
            $("#datepicker").datepicker({
                dateFormat: "yy-mm-dd",
                defaultDate: new Date(), // Takvim açıldığında bugünkü tarihi seç
                onSelect: function (dateText) { // Tarih seçildiğinde
                    var selectedDate = $(this).datepicker('getDate'); // Seçilen tarihi al
                    var day = selectedDate.getDate(); // Seçilen tarihin gününü al
                    var month = selectedDate.getMonth() + 1; // Seçilen tarihin ayını al (0-based olduğu için +1)
                    var year = selectedDate.getFullYear(); // Seçilen tarihin yılını al
                    $(this).val(dateText + ' (' + day + '/' + month + '/' + year + ')'); // Tarihi inputa yaz
                }
            });
            $("#datepicker").datepicker("show"); // Takvimi otomatik olarak aç
        });

        setInterval(scrollAnnouncements, 3000);
    </script>

    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f0f2f5;
    margin: 0;
    padding: 0;
}

.header {
    text-align: center;
    background-color: #ff4b4b;
    color: white;
    padding: 15px;
    margin-bottom: 20px;
}

#datepicker {
    position: fixed;
    top: 100px;
    right: 70px;
    z-index: 9999;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 10px;
    width: 280px; /* Genişlik ayarı */
}

.header .logo {
    position: absolute;
    top: 700px; /* Üstten mesafe */
    right: 750px; /* Sağdan mesafe */
    width: 600px; /* Logonun genişliği */
    height: 190px; /* Yüksekliği otomatik ayarla */
    border-radius: 5px; /* Köşe yuvarlama (isteğe bağlı) */
}

.container {

    display: flex;
    justify-content: space-between;
    padding: 0 10px;
    box-sizing: border-box; /* Box-sizing tüm öğeleri kapsar */
}

.form-section {
    width: 400px; /* Genişliği ayarla */
    height: 930px;
    flex-shrink: 0; /* Küçülmesini engelle */
    margin-right: 20px;
    background-color: #ffffff;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    border-radius: 8px;
    box-sizing: border-box; /* Padding ve border genişliğe dahil edilir */
}

.form-section label {
    display: block;
    margin: 10px 0 5px;
    font-weight: bold;
}

.form-section input, 
.form-section textarea, 
.form-section button, 
.form-section select {
    width: 350px; /* Genişliği konteynerin genişliğine göre ayarla */
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box; /* Padding ve border genişliğe dahil edilir */
}

#map {
    height: 350px;
    width: 500px;
    left:-130px;
    margin-left: 140px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    box-sizing: border-box; /* Box-sizing ayarla */
}

button {
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #0056b3;
}

.customButton {
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    padding: 10px 20px;
    border-radius: 5px;
}

.customButton:hover {
    background-color: #0056b3;
}

#findLocation {
    display: block;
    width: 100px;
    left:-100px;
    margin-top: 10px;
    margin-left: 20px;
}

.announcements {
    width: 500px;
    padding: 10px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    height: 450px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    border-radius: 8px;
    margin-left: -80px; /* Sol kenarı otomatik ayarlayarak sağa hizalar */
    margin-right: 140px; /* Sağdan mesafe ekler */
}

.announcement {
    margin-bottom: 10px;
    padding: 15px;
    background-color: #007bff;
    color: white;
    border-radius: 4px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    height: 50px;
    display: flex;
    align-items: center;
}

.announcements h2 {
    text-align: center;
    margin-bottom: 10px;
    font-size: 1.5em;
    color: #007bff;
}



.swiper-container {
    width: 580px; /* Swiper genişliği */
    height: 440px; /* Swiper yüksekliği */
    margin: 0; /* Margin'i sıfırlayın */
    position: fixed; /* Sayfada sabit pozisyonda kalmasını sağlar */
    top: 180px; /* Üstten mesafe */
    right: 30px; /* Sağdan mesafe */
    z-index: 1000; /* Diğer elemanların üstünde görünmesini sağlar */
}

.swiper-wrapper {
    display: flex;
    transition: transform 0.5s ease; /* Geçişin yumuşak görünmesi için */
}

.swiper-slide {
    flex-shrink: 0;
    width: 580px; /* Slide genişliğini %100 ayarla */
    height: 440px; /* Slide yüksekliğini %100 ayarla */
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden; /* Taşmaları gizle */
}

.swiper-slide img {
    max-width: 100%; /* Resmi slide genişliğine göre sınırla */
    max-height: 100%; /* Resmi slide yüksekliğine göre sınırla */
    object-fit: cover; /* Resmi kapsayıcıya göre kırp */
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">
        <h1>Arıza Bildirme</h1>
        <img src="ımages\unnamed.png" alt="Elazığ Belediyesi Logosu" class="logo" />
    </div>
    <div class="container">
        <div class="form-section">
            <div>
                <label for="firstName">İsim:</label>
                <input type="text" id="firstName" name="firstName">
            </div>
            <div>
                <label for="lastName">Soyisim:</label>
                <input type="text" id="lastName" name="lastName">
            </div>
            <div>
                <label for="workplace">Çalıştığınız İş:</label>
                <select id="workplace" name="workplace">
                    <option value="">Seçiniz</option>
                    <option value="İşçi">İŞÇİ</option>
                    <option value="Memur">MEMUR</option>
                    <option value="Müdür">MÜDÜR</option>
                    <option value="Serbest Meslek">SERBEST MESLEK</option>
                </select>
            </div>
            <div>
                <label for="tcNumber">TC Numarası:</label>
                <input type="text" id="tcNumber" name="tcNumber">
            </div>
            <div>
                <label for="faultDescription">Arıza Bildirme Metni:</label>
                <textarea id="faultDescription" name="faultDescription" rows="13"></textarea>
            </div>
            <div>
                <label for="latitude">Enlem:</label>
                <input type="number" id="latitude" name="latitude">
            </div>
            <div>
                <label for="longitude">Boylam:</label>
                <input type="number" id="longitude" name="longitude">
            </div>
            <div>
                <label for="datepicker">Arıza Tarihi:</label>
                <input type="text" id="datepicker" name="datepicker">
            </div>
            <asp:Button ID="submitButton" runat="server" Text="Gönder" OnClick="submitForm" CssClass="customButton" />
            <br /><br />
            <label for="photoUpload">Fotoğraf Ekle (İSTEĞE BAĞLI):</label>
            <input type="file" id="photoUpload" name="photoUpload" accept="image/*">
        </div>
        <div>
            <div id="map"></div>
            <button id="findLocation">Konumumu Bul</button>
        </div>
        <!-- Swiper Karusel -->
       
        <div class="announcements" id="announcements">
            <h2>Duyurular</h2>
            <div class="announcement" id="announcement1">Duyuru 1: Proje geliştirme sürecindeyiz, yakında yeni özelliklerle karşınızda olacağız!</div>
            <div class="announcement" id="announcement2">Duyuru 2: Yeni kullanıcı kayıtları için form güncellendi, daha kullanıcı dostu hale getirildi.</div>
            <div class="announcement" id="announcement3">Duyuru 3: Veritabanı güncellendi, performans ve güvenlik iyileştirmeleri yapıldı.</div>
            <div class="announcement" id="announcement4">Duyuru 4: Yeni hizmetlerimizle ilgili anketimize katılın, görüşleriniz bizim için çok değerli.</div>
        </div>
         <div class="swiper-container">
     <div class="swiper-wrapper">
         <div class="swiper-slide"><img src="ımages\resim 1.jpg" alt="Fotoğraf 1" /></div>
         <div class="swiper-slide"><img src="ımages\resim2.jpg" alt="Fotoğraf 2" /></div>
         <div class="swiper-slide"><img src="ımages\resim3.jpg" alt="Fotoğraf 3" /></div>
         <div class="swiper-slide"><img src="ımages\resim4.jpg" alt="Fotoğraf 4" /></div>
     </div>
     <!-- If you want pagination -->
     <div class="swiper-pagination"></div>
     <!-- If you want navigation buttons -->
     <div class="swiper-button-next"></div>
     <div class="swiper-button-prev"></div>
 </div>
    </div>
</asp:Content>
