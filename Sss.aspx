<%@ Page Title="Sıkça Sorulan Sorular" Language="C#" MasterPageFile="~/Anasayfa.Master" AutoEventWireup="true" CodeBehind="Sss.aspx.cs" Inherits="Arıza_Tespit_web_sitesi_projesi.Sss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .faq-container {
            margin: 20px auto;
            max-width: 800px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        .faq-item {
            margin-bottom: 20px;
        }

        .faq-question {
            font-weight: bold;
            cursor: pointer;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
        }

        .faq-answer {
            display: none;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 5px;
        }

        .faq-question:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function toggleAnswer(element) {
            var answer = element.nextElementSibling;
            if (answer.style.display === "none" || answer.style.display === "") {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="faq-container">
        <h2>Sıkça Sorulan Sorular</h2>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer(this)">Soru 1: Sistem nasıl çalışır?</div>
            <div class="faq-answer">
                <p>Sistem, kullanıcıların arıza bildirimlerini alır ve bu bildirimleri yöneticiye ileterek çözüm sürecini başlatır.</p>
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer(this)">Soru 2: Hata bildiriminde bulunmak için ne yapmalıyım?</div>
            <div class="faq-answer">
                <p>Hata bildiriminde bulunmak için 'Hata Bildirme' sayfasına giderek ilgili formu doldurup göndermeniz yeterlidir.</p>
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer(this)">Soru 3: Bildirimlerimi nasıl takip edebilirim?</div>
            <div class="faq-answer">
                <p>Bildiriminizi yaptıktan sonra, sistem üzerinden bildiriminizin durumunu takip edebilirsiniz.</p>
            </div>
        </div>
         <div class="faq-item">
     <div class="faq-question" onclick="toggleAnswer(this)">Soru 4: Bu Yazılımın amacı ne?</div>
     <div class="faq-answer">
         <p>Bu yazılımın amacı bir kurumdaki hata ve şikayetleri yönetebilecek bir arayüzün olması.</p>
     </div>
 </div>
        
    </div>
</asp:Content>
