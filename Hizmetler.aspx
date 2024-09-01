<%@ Page Title="Hizmetler" Language="C#" MasterPageFile="~/Anasayfa.Master" AutoEventWireup="true" CodeBehind="Hizmetler.aspx.cs" Inherits="Arıza_Tespit_web_sitesi_projesi.Hizmetler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .services-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .services-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 40px;
            font-size: 36px;
        }

        .service-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .service-item img {
            max-width: 100px;
            margin-right: 20px;
            border-radius: 8px;
        }

        .service-item .service-content {
            flex: 1;
        }

        .service-item .service-content h3 {
            margin: 0;
            color: #007bff;
            font-size: 24px;
        }

        .service-item .service-content p {
            color: #666;
            margin: 10px 0 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="services-container">
        <h2>Hizmetlerimiz</h2>
        <div class="service-item">
            <img src="https://via.placeholder.com/100" alt="Service 1" />
            <div class="service-content">
                <h3>Hizmet 1</h3>
                <p>Bu hizmetimiz, kullanıcılarımıza en iyi deneyimi sunmak için tasarlanmıştır. Yüksek kalite ve güvenilirlik ile öne çıkar.</p>
            </div>
        </div>
        <div class="service-item">
            <img src="https://via.placeholder.com/100" alt="Service 2" />
            <div class="service-content">
                <h3>Hizmet 2</h3>
                <p>İkinci hizmetimiz, kapsamlı çözümler sunarak müşterilerimizin ihtiyaçlarını karşılamayı hedefler.</p>
            </div>
        </div>
        <div class="service-item">
            <img src="https://via.placeholder.com/100" alt="Service 3" />
            <div class="service-content">
                <h3>Hizmet 3</h3>
                <p>Bu hizmet, yenilikçi teknolojiler kullanarak verimliliği artırır ve maliyetleri düşürür.</p>
            </div>
        </div>
    </div>
</asp:Content>
