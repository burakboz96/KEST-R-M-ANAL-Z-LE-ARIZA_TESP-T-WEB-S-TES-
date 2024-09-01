<%@ Page Title="" Language="C#" MasterPageFile="~/Anasayfa.Master" AutoEventWireup="true" CodeBehind="registerpage.aspx.cs" Inherits="Arıza_Tespit_web_sitesi_projesi.registerpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Genel sayfa stilini ayarla */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
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

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Başlık stilini ayarla */
        .header {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
    </style>
    <div class="container">
        <h2>Kayıt Ol</h2>
        <div class="form-group">
            <label for="txtName">Kullancı Adı:</label>
            <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtSurname">İsİm Soyisim:</label>
            <asp:TextBox ID="txtSurname" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtAddress">Adres:</label>
            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtPhone">Telefon:</label>
            <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="ddlCity">Şehir:</label>
            <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server">
                <asp:ListItem Text="İstanbul" Value="Istanbul"></asp:ListItem>
                <asp:ListItem Text="Ankara" Value="Ankara"></asp:ListItem>
                <asp:ListItem Text="İzmir" Value="Izmir"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="ddlCompany">Çalıştığı İş Yeri:</label>
            <asp:DropDownList ID="ddlCompany" CssClass="form-control" runat="server">
                <asp:ListItem Text="Şirket 1" Value="Company1"></asp:ListItem>
                <asp:ListItem Text="Şirket 2" Value="Company2"></asp:ListItem>
                <asp:ListItem Text="Şirket 3" Value="Company3"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="txtPassword">Şifre:</label>
            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="btnRegister" Text="Kayıt Ol" CssClass="btn btn-primary" OnClick="btnRegister_Click" runat="server" />
    </div>
</asp:Content>
