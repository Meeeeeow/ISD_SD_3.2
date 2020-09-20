<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="payment_success.aspx.cs" Inherits="CarRental.payment_success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/particles.js"></script>
    <script src="Scripts/index.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="Slogan text-center h5 mt-5 font-weight-bold">
        While you are eager to go away,please enjoy some artworks by Cipher,the Admin.
    </div>
    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-6 col-sm-12">
            <div class="image">
                <img class="img-thumbnail" src="images/moonlit night.jpg"/>
            </div>
                <div class="title text-center h6 font-weight-bold text-dark mt-2 mb-4">Night Sky</div>
            </div>
            <div class="col-md-6 col-sm-12">
            <div class="image">
                <img class="img-thumbnail" src="images/sunset.jpg"/>
            </div>
                <div class="title text-center h6 font-weight-bold text-dark mt-3 mb-4 ">Where dreams end</div>
            </div>
        </div>
        <div class="Message text-center h6 font-weight-bolder text-primary mt-1 mb-2">
            Thank you for visiting our website.We wish you a happy nice day.
        </div>
        <div class="row mt-4 mb-4">
            <div class="col-md-6 col-sm-12">
            <div class="image">
                <img class="img-thumbnail" src="images/midnight sky1.jpg"/>
            </div>
                <div class="title text-center h6 font-weight-bold text-dark mt-2 mb-4">A peaceful day</div>
            </div>
            <div class="col-md-6 col-sm-12">
            <div class="image">
                <img class="img-thumbnail" src="images/lost(1).jpg"/>
            </div>
                <div class="title text-center h6 font-weight-bold text-dark mt-2 mb-4">Lost in thoughts</div>
            </div>
        </div>
    </div>
</asp:Content>
