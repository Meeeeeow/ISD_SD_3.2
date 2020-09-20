<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Membermanagement.aspx.cs" Inherits="CarRental.Membermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
      $(document).ready(function () {
      
          //$(document).ready(function () {
              //$('.table').DataTable();
         // });
      
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
          //$('.table1').DataTable();
      });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col ">
                        
                           <h4 class="text-center">Member Details</h4>
                       
                     </div>
                  </div>
                  <div class="row">
                     <div class="col text-center">
                        
                           <img width="100" src="images/user1.jpg" />
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Member ID</label>
                        <div class="form-group">
                            <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="MemberID"></asp:TextBox>
                              <asp:LinkButton ID="LinkButton4" class="btn btn-success mr-1" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                           
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Full Name</label>
                        <div class="form-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                       <div class="col-md-5">
                        <label>Account Status</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="true"></asp:TextBox>
                              <asp:LinkButton ID="LinkButton1" class="btn btn-success mr-1 ml-1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                              <asp:LinkButton ID="LinkButton2" class="btn btn-warning mr-1" runat="server" OnClick="LinkButton2_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                              <asp:LinkButton ID="LinkButton3" class="btn btn-danger" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>NID </label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="NID" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Contact No.</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contact Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-5">
                        <label>DOB</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Date of Birth" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City"  ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Occupation</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Occupation"  ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-5">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Email"  ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-12">
                        <label>Full Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Full Address"  ReadOnly="true" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                     

                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanantly" OnClick="Button2_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        
                           <h4 class="text-center">User List</h4>
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalConnectionString %>" SelectCommand="SELECT * FROM [UserReg]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="UserID" HeaderText="User ID" ReadOnly="True" SortExpression="UserID" />
                                <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" />
                                <asp:BoundField DataField="AccStatus" HeaderText="Status" SortExpression="AccStatus" />
                                <asp:BoundField DataField="NidNumber" HeaderText="Nid Number" SortExpression="NidNumber" />
                                <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" SortExpression="ContactNumber" />
                                <asp:BoundField DataField="EmailID" HeaderText="Email ID" SortExpression="EmailID" />
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
