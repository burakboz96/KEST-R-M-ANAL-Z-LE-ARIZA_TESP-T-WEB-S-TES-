<%@ Page Title="" Language="C#" MasterPageFile="~/Anasayfa.Master" AutoEventWireup="true" CodeBehind="yönetici.aspx.cs" Inherits="Arıza_Tespit_web_sitesi_projesi.yönetici" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Genel sayfa stilini ayarla */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            background-image: url("C:\Users\burak bozoğlu\OneDrive\Masaüstü\91ce552608ac76b33642d4a22058ac93.gif"); /* GIF arka planı ekleyin */
            background-size: cover;
            background-position: center;
        }

        /* Başlık stilini ayarla */
        .header {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            font-size: 20px;
            margin-bottom: 20px;
        }

        /* Container stilini ayarla */
        .container {
            max-width: 400px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Form elementlerinin stilini ayarla */
        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Buton stilini ayarla */
        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .header .logo {
        position: absolute;
    
        top: 500px; /* Üstten mesafe */
        right: 750px; /* Sağdan mesafe */
        width: 600px; /* Logonun genişliği */
        height: 190px; /* Yüksekliği otomatik ayarla */
        border-radius: 5px; /* Köşe yuvarlama (isteğe bağlı) */
        }
        
        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
        }

        .btn-secondary:hover {
            background-color: #495057;
        }

        .btn-link {
            background-color: transparent;
            color: #007bff;
            text-decoration: none;
        }

        .btn-link:hover {
            text-decoration: underline;
        }

        /* Mesaj etiketi stilini ayarla */
        .text-danger {
            color: #dc3545;
        }

        /* Footer stili */
        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: -25px;
            position: fixed;
            bottom: 0px;
            width: 100%;
        }

        .social-icons {
            margin: 10px 0;
        }

        .social-icons a {
            color: #fff;
            margin: 0 10px;
            text-decoration: none;
            font-size: 20px;
        }

        .social-icons a:hover {
            color: #007bff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">
       Elazığ Belediyesi Arıza Tespit Sitesi
        <img src="ımages\unnamed.png" alt="Elazığ Belediyesi Logosu" class="logo" />
    </div>

    <div class="container">
        <h2>Giriş Yap</h2>
        <div class="form-group">
            <label for="txtUsername">Kullanıcı Adı:</label>
            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtPassword">Şifre:</label>
            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
       
        <asp:Button ID="btnAdminLogin" Text="Yönetici Girişi" CssClass="btn btn-secondary" OnClick="btnAdminLogin_Click" runat="server" />
        <asp:Label ID="lblMessage" CssClass="text-danger" runat="server"></asp:Label>
    </div>
    <div class="footer">
        <div class="social-icons">
            <a href="https://www.instagram.com" target="_blank"><i class="fa fa-instagram"></i> Instagram</a>
            <a href="https://www.x.com" target="_blank"><i class="fa fa-twitter"></i> X</a>
            <a href="https://www.facebook.com" target="_blank"><i class="fa fa-facebook"></i> Facebook</a>
        </div>
        <p>Bize Ulaşın</p>
    </div>
</asp:Content>
