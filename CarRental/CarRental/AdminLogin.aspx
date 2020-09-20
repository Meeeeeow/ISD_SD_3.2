<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="CarRental.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                
                                    <img src="images/admin.png" width="150"  />
                                    
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                
                                    <h3>Admin Login</h3>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Admin ID</label>
                                 <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Admin ID"></asp:TextBox>
                                 </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Admin Password</label>
                                 <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Admin Password" TextMode="Password"></asp:TextBox>
                                 </div>

                                 <div class="form-group">
                                     <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Login" OnClick="Button1_Click" />
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="Homepage.aspx"><< Back To Home</a>
            </div>
        </div>
    </div>
</asp:Content>
