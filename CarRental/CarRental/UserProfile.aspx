<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CarRental.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col text-center">
                        
                           <img width="100" src="images/user1.jpg"/>
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col text-center">                       
                          <h4>Your Profile</h4>
                            <span >Account status - </span>
                            <asp:Label class="badge badge-pill badge-info"  ID="Label2" runat="server" Text="Your status"></asp:Label>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-6">
                         <label>Full Name</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name" ReadOnly="true"></asp:TextBox>
                         </div>
                        
                     </div>
                     
                      <div class="col-md-6">
                          <label>Date Of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"  TextMode="Date" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                     </div>  
                  </div>
                  
                   <div class="row">
                     <div class="col-md-6">
                         <label>Contact Number</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Example:01XXX.." ReadOnly="true" ></asp:TextBox>
                         </div>
                        
                     </div>
                     
                      <div class="col-md-6">
                          <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Email ID" TextMode="Email" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                     </div>  
                  </div>
                   <div class="row">
                     <div class="col-md-4">
                         <label>NID Number</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Example:1X0X04XXX" ReadOnly="true"></asp:TextBox>
                         </div>
                        
                     </div>
                     
                      <div class="col-md-4">
                          <label>Location</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder=" Location" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                     </div>  
                       <div class="col-md-4">
                          <label>Gender</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder=" Gender" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                     </div>  
                  </div>
                   <div class="row">
                     <div class="col">
                         <label>Full Address</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder=" Full Address" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                         </div>
                        
                     </div>
                  </div>

                   <div class="row">
                     <div class="col-md-6">
                         <label>Occupation</label>
                         <div class="form-group"> 
                             <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder=" Occupation"  ReadOnly="true"></asp:TextBox>
                         </div>
                        
                     </div>
                     
                      <div class="col-md-6">
                          <label>Nationality</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Nationality" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                     </div>  
                  </div>
                   <div class="row">
                       <div class="col text-center">                           
                               <span class="badge badge-pill badge-primary ">Login Credentials</span>
                               &nbsp;
                               &nbsp;
                       </div>
                   </div>

                    <div class="row">
                     <div class="col-md-4">
                         <label> New User ID</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="User ID" ></asp:TextBox>
                         </div>
                        
                     </div>
                     
                      <div class="col-md-4">
                          <label>Old Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Old Password" TextMode="Password"></asp:TextBox>
                        </div>
                        
                     </div>  
                     
                      <div class="col-md-4">
                          <label>New Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox19" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                        </div>
                        
                     </div>  
                  </div>

                   <div class="row">
                       <div class="col-8 mx-auto">
                           <div class="form-group">
                               <asp:Button CssClass="btn btn-primary btn-block btn-lg" ID="Button1" runat="server"  OnClick="Button1_Click"                           
                                   Text="Update" />
                           </div>
                       </div>
                   </div>
                  
               </div>
            </div>
            <a href="Homepage.aspx"><< Back to Home</a><br><br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col text-center">
                       
                           <img width="100" src="images/car.jpg"/>
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col text-center">
                       
                           <h4> Rented Cars Info</h4>
                            <asp:Label class="badge badge-pill badge-info"  ID="Label3" runat="server" Text="Your Rented Cars"></asp:Label>
                       
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>  
                   <div class="row">
                       <div class="col">
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalConnectionString %>" DeleteCommand="DELETE FROM [OrderDetails] WHERE [Orderid] = @Orderid" InsertCommand="INSERT INTO [OrderDetails] ([Orderid], [Userid], [Carid], [pickupdate], [returndate], [Ordertime], [Servicetaken], [rentaldays]) VALUES (@Orderid, @Userid, @Carid, @pickupdate, @returndate, @Ordertime, @Servicetaken, @rentaldays)" SelectCommand="SELECT [Orderid], [Userid], [Carid], [pickupdate], [returndate], [Ordertime], [Servicetaken], [rentaldays] FROM [OrderDetails] WHERE ([Userid] = @Userid)" UpdateCommand="UPDATE [OrderDetails] SET [Userid] = @Userid, [Carid] = @Carid, [pickupdate] = @pickupdate, [returndate] = @returndate, [Ordertime] = @Ordertime, [Servicetaken] = @Servicetaken, [rentaldays] = @rentaldays WHERE [Orderid] = @Orderid">
                               <DeleteParameters>
                                   <asp:Parameter Name="Orderid" Type="String" />
                               </DeleteParameters>
                               
                               
                               
                               <SelectParameters>
                                   <asp:SessionParameter Name="Userid" SessionField="username" Type="String" />
                               </SelectParameters>
                               
                               
                               
                           </asp:SqlDataSource>
                           <asp:GridView ID="GridView1" class="table table-bordered table-striped table-dark" runat="server" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False" DataKeyNames="Orderid" DataSourceID="SqlDataSource1">
                               <Columns>
                                   
                                  
                                   
                                   <asp:BoundField DataField="Orderid" HeaderText="Orderid" ReadOnly="True" SortExpression="Orderid" />
                                   <asp:BoundField DataField="Userid" HeaderText="Userid" SortExpression="Userid" />
                                   <asp:BoundField DataField="Carid" HeaderText="Carid" SortExpression="Carid" />
                                   <asp:BoundField DataField="pickupdate" HeaderText="pickupdate" SortExpression="pickupdate" />
                                   <asp:BoundField DataField="returndate" HeaderText="returndate" SortExpression="returndate" />
                                   <asp:BoundField DataField="Ordertime" HeaderText="Ordertime" SortExpression="Ordertime" />
                                   <asp:BoundField DataField="Servicetaken" HeaderText="Servicetaken" SortExpression="Servicetaken" />
                                   <asp:BoundField DataField="rentaldays" HeaderText="rentaldays" SortExpression="rentaldays" />
                                    <asp:CommandField ShowDeleteButton="True" />
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
