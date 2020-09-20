<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="CarRental.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">      <!--login for u -->
                        <div class="row">
                            <div class="col text-center">
                                    <img src="images/user2.png" width="150"  />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                    <h3 class="text-center">User Login</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>User ID</label>
                                 <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="User ID" required=""></asp:TextBox>
                                 </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>User Password</label>
                                 <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="User Password" TextMode="Password" required=""></asp:TextBox>
                                 </div>
                                 <!--Buttons-->
                                 <div class="form-group">
                                     <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Login" OnClick="Button1_Click" />
                                 </div>
                                <div class="form-group">
                                    <a class= "text-decoration-none" href="UserSignUp.aspx"><input id="Button2"  class= "btn btn-info btn-block btn-lg" type="button" value="Sign Up" /></a>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="text-decoration-none " href="Homepage.aspx"><< Back To Home</a>
            </div>
        </div>
    </div>
</asp:Content>
