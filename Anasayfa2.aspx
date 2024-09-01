<%@ Page Title="Ana Sayfa 2" Language="C#" MasterPageFile="~/Anasayfa.Master" AutoEventWireup="true" CodeBehind="anasayfa2.aspx.cs" Inherits="Arıza_Tespit_web_sitesi_projesi.Anasayfa2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Ana sayfa stil tanımları */
        .welcome-container {
            text-align: center;
            margin-top: 50px;
        }

        .welcome-container h1 {
            font-size: 36px;
            color: #333;
        }

        .welcome-container p {
            font-size: 18px;
            color: #666;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="welcome-container">
        <h1>Hoşgeldiniz!</h1>
        <p>Aşağıdaki menüyü kullanarak istediğiniz işlemi yapabilirsiniz.</p>
    </div>
</asp:Content>
