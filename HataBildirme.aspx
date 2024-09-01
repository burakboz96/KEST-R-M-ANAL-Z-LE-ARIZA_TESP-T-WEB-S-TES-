<%@ Page Title="Hata Bildirme" Language="C#" MasterPageFile="~/Anasayfa.Master" AutoEventWireup="true" CodeBehind="HataBildirme.aspx.cs" Inherits="Arıza_Tespit_web_sitesi_projesi.HataBildirme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-container input,
        .form-container textarea,
        .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .customButton {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .customButton:hover {
            background-color: #0056b3;
        }

        .hidden-section {
            display: none;
            background-color: #f8f9fa;
            padding: 15px;
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Hata Bildirme</h2>
        <div>
            <label for="email">E-posta Adresi:</label>
            <asp:TextBox ID="email" runat="server" CssClass="textBox" TextMode="Email" required="required"></asp:TextBox>
        </div>
        <div>
            <label for="description">Hata Açıklaması:</label>
            <asp:TextBox ID="description" runat="server" CssClass="textBox" TextMode="MultiLine" required="required"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="submitReport" runat="server" Text="Gönder" OnClick="SubmitReport_Click" CssClass="customButton" />
        </div>

        <div class="hidden-section" id="confirmationMessage">
            Hata bildiriminiz başarıyla gönderildi. E-posta adresinize bir onay mesajı gönderilmiştir.
        </div>
    </div>

    <script type="text/javascript">
        function showConfirmationMessage() {
            document.getElementById('confirmationMessage').style.display = 'block';
        }

        // Form gönderildiğinde gösterilecek mesaj
        document.getElementById('<%= submitReport.ClientID %>').onclick = function () {
            showConfirmationMessage();
        }
    </script>
</asp:Content>
