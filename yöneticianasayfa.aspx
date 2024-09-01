<%@ Page Title="" Language="C#" MasterPageFile="~/Anasayfa.Master" AutoEventWireup="true" CodeBehind="yöneticianasayfa.aspx.cs" Inherits="Arıza_Tespit_web_sitesi_projesi.yöneticianasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 0;
        }
        .header .logo {
            position: absolute;
            top: 600px; /* Üstten mesafe */
            right: 750px; /* Sağdan mesafe */
            width: 600px; /* Logonun genişliği */
            height: 190px; /* Yüksekliği otomatik ayarla */
            border-radius: 5px; /* Köşe yuvarlama (isteğe bağlı) */
        }
        .header {
            text-align: center;
            background-color: #007bff;
            color: white;
            padding: 15px;
            margin-bottom: 20px;
        }
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        .form-section {
            flex: 1;
            margin-right: 20px;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .form-section label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        .form-section input,
        .form-section button {
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
            padding: 10px 20px;
            border-radius: 5px;
        }
        .customButton:hover {
            background-color: #0056b3;
        }
        .dateTextBox {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-top: 10px;
        }
        .şikayetler-panel {
            margin-top: 20px;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }
        .gridview th,
        .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .announcements {
            margin-top: 20px;
            padding: 10px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            height: 150px;
            overflow: auto;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 10px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .download-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .download-btn:hover {
            background-color: #45a049;
        }
        .print-btn {
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .print-btn:hover {
            background-color: #0b79d0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">
        <h1>Yönetici Paneli</h1>
        <img src="ımages\unnamed.png" alt="Elazığ Belediyesi Logosu" class="logo" />
    </div>
    <div class="container">
        <div class="form-section">
            <div>
                <label for="BaslangicTarih">Başlangıç Tarihi:</label>
                <asp:TextBox ID="BaslangicTarih" runat="server" TextMode="Date" CssClass="dateTextBox"></asp:TextBox>
            </div>
            <div>
                <label for="BitisTarih">Bitiş Tarihi:</label>
                <asp:TextBox ID="BitisTarih" runat="server" TextMode="Date" CssClass="dateTextBox"></asp:TextBox>
            </div>
            <asp:Button ID="btnGetŞikayetler" runat="server" Text="Şikayetleri Getir" OnClick="btnGetŞikayetler_Click" CssClass="customButton" />
            <asp:Button ID="btnDownload" runat="server" Text="Şikayetleri İndir" OnClick="btnDownload_Click" CssClass="download-btn" />
            <button class="print-btn" onclick="printComplaints()">Şikayetlerin Çıktısını Al</button>
        </div>
        <div class="şikayetler-panel">
            <asp:GridView ID="GridViewŞikayetler" runat="server" AutoGenerateColumns="False" CssClass="gridview" OnRowCommand="GridViewŞikayetler_RowCommand">
                <Columns>
                    <asp:BoundField DataField="İsim" HeaderText="İsim" />
                    <asp:BoundField DataField="Soyisim" HeaderText="Soyisim" />
                    <asp:BoundField DataField="Çalıştığınız_İş" HeaderText="Çalıştığınız İş" />
                    <asp:BoundField DataField="TC_Numara" HeaderText="TC Numarası" />
                    <asp:BoundField DataField="Arıza_Bildirme_Metni" HeaderText="Arıza Bildirme Metni" />
                    <asp:BoundField DataField="Enlem" HeaderText="Enlem" />
                    <asp:BoundField DataField="Boylam" HeaderText="Boylam" />
                    <asp:BoundField DataField="Fotoğraf_Yolu" HeaderText="Fotoğraf Yolu" />
                    <asp:BoundField DataField="Arıza_Tarihi" HeaderText="Arıza Tarihi" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnReply" runat="server" Text="Cevap Ver" CommandName="Reply" CommandArgument='<%# Eval("ID") %>' CssClass="customButton" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- Cevap Ver Modal -->
    <div id="replyModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideReplyModal()">&times;</span>
            <h2>Şikayete Cevap Ver</h2>
            <asp:TextBox ID="txtReply" runat="server" TextMode="MultiLine" Rows="5" CssClass="dateTextBox" Width="100%"></asp:TextBox>
            <asp:Button ID="btnSendReply" runat="server" Text="Gönder" OnClick="btnSendReply_Click" CssClass="customButton" />
        </div>
    </div>

    <script type="text/javascript">
        function showReplyModal() {
            document.getElementById("replyModal").style.display = "block";
        }

        function hideReplyModal() {
            document.getElementById("replyModal").style.display = "none";
        }

        function printComplaints() {
            var printContents = document.getElementById('<%= GridViewŞikayetler.ClientID %>').outerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>
</asp:Content>
