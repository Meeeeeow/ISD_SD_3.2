<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CarInventoryAdmin.aspx.cs" Inherits="CarRental.CarInventoryAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
      
          //$(document).ready(function () {
              //$('.table').DataTable();
         // });
      
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
          //$('.table1').DataTable();
      });
       //for file upload
       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();
 
               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };
 
               reader.readAsDataURL(input.files[0]);
           }
       }
 
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        
                           <h4 class="text-center">Car Details</h4>
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col text-center"> 
                           <img id="imgview" width="100"  src="images/car.jpg" />                 
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col">
                         <asp:FileUpload onchange="readURL(this);" CssClass="form-control" ID="FileUpload1" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Car ID</label>
                        <div class="form-group">
                            <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="CarID"></asp:TextBox>
                               <asp:LinkButton ID="LinkButton4" class="btn btn-primary mr-1" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                           
                        </div>
                     </div>
                      <div class="col-md-6">
                         <label>Arrival Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Arrival Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-4">
                        <label>Category</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="DropDownList4" runat="server">
                              <asp:ListItem Text="None" Value="None" />
                              <asp:ListItem Text="Basic" Value="Basic" />
                              <asp:ListItem Text="Standard" Value="Standard" />
                               <asp:ListItem Text="Luxury" Value="Luxury" />
                           </asp:DropDownList>
                           
                        </div>
                     </div>
                      <div class="col-md-4">
                         <label>Body Type</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="DropDownList8" runat="server">
                              <asp:ListItem Text="Sedan" Value="Sedan" />
                              <asp:ListItem Text="MUV" Value="MUV" />
                               <asp:ListItem Text="Coupe" Value="Coupe" />
                                <asp:ListItem Text="Convertible" Value="Convertible" />
                                <asp:ListItem Text="Wagon" Value="Wagon" />
                                <asp:ListItem Text="Van" Value="Van" />
                                <asp:ListItem Text="Jeep" Value="Jeep" />
                                <asp:ListItem Text="Crossovers" Value="Crossovers" />
                           </asp:DropDownList>
                        </div>
                     </div>
                       <div class="col-md-4">
                        <label>Bags</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="DropDownList9" runat="server">
                              <asp:ListItem Text="2" Value="2" />
                              <asp:ListItem Text="3" Value="3" />
                               <asp:ListItem Text="4" Value="4" />
                           </asp:DropDownList>
                           
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Brand Name </label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                              <asp:ListItem Text="Brand 1" Value="Brand 1" />
                              <asp:ListItem Text="Brand 2" Value="Brand 2" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Model Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Model 1" Value="Model 1" />
                              <asp:ListItem Text="Model 2" Value="Model 2" />
                           </asp:DropDownList>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Rent Options</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                              <asp:ListItem Text="Option 1" Value="Option 1" />
                              <asp:ListItem Text="Option 2" Value="Option 2" />
                           </asp:DropDownList>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Route</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Route Description"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Cost</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Cost"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-3">
                        <label>Doors</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Doors"  ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-6">
                        <label>Engine</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Engine"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Exterior</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Exterior"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-3">
                        <label>Interior</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Interior"></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>
                   <div class="row">
                      <div class="col-md-4">
                        <label>Seats</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList5" runat="server">
                              <asp:ListItem Text="4" Value="4" />
                              <asp:ListItem Text="5" Value="5" />
                              <asp:ListItem Text="6" Value="6" />
                              <asp:ListItem Text="7" Value="7" />
                              <asp:ListItem Text="8" Value="8" />
                              <asp:ListItem Text="9" Value="9" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Air Conditioned</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="DropDownList6" runat="server">
                              <asp:ListItem Text="Yes" Value="Yes" />
                              <asp:ListItem Text="No" Value="No" />
                           </asp:DropDownList>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Runs On</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList7" runat="server">
                              <asp:ListItem Text="Petrol" Value="Petrol" />
                              <asp:ListItem Text="Diesel" Value="Diesel" />
                           </asp:DropDownList>
                        </div>
                     </div>
                  </div>
                  
                   <div class="row">
                     <div class="col-md-4">
                        <label>Actual Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Current Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Rented Cars</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Rented" TextMode="Number" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>
                   <div class="row">
                     <div class="col-12">
                        <label>Car Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Car Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                       <div class="col-4 mx-auto">
                           <div class="form-group">
                               <asp:Button CssClass="btn btn-primary btn-block btn-lg" ID="Button1" runat="server"                            
                                   Text="Add" OnClick="Button1_Click" />
                           </div>
                       </div>
                       <div class="col-4 mx-auto">
                           <div class="form-group">
                               <asp:Button CssClass="btn btn-warning btn-block btn-lg" ID="Button3" runat="server"                            
                                   Text="Update" OnClick="Button3_Click" />
                           </div>
                       </div>
                       <div class="col-4 mx-auto">
                           <div class="form-group">
                               <asp:Button CssClass="btn btn-danger btn-block btn-lg" ID="Button4" runat="server"                            
                                   Text="Delete" OnClick="Button4_Click" />
                           </div>
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
                       
                           <h4 class="text-center">Car Inventory</h4>
                       
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                   <!-- adding car info ended here -->
                   <!-- gridview to show added cars -->
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalConnectionString %>" SelectCommand="SELECT * FROM [CarDetails]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CarID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="CarID" HeaderText="CarID" ReadOnly="True" SortExpression="CarID" >
                                    
                                
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RentOptions" HeaderText="Service" ReadOnly="True" SortExpression="CarID"  >
                                    
                                
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row ">
                                                <div class="col-lg-10">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ModelName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="row">
                                                        <div class="col-12">

                                                            Brand-<asp:Label ID="Label2" runat="server" Text='<%# Eval("BrandName") %>' Font-Bold="True"></asp:Label>

                                                            &nbsp; |&nbsp;&nbsp; &nbsp; Route-<asp:Label ID="Label4" runat="server" Text='<%# Eval("Route") %>' Font-Bold="True"></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">

                                                            Engine-<asp:Label ID="Label5" runat="server" Text='<%# Eval("Engine") %>' Font-Bold="True"></asp:Label>

                                                            &nbsp;</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">

                                                            

                                                            Exterior-<asp:Label ID="Label6" runat="server" Text='<%# Eval("Exterior") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp; |&nbsp; Interior-<asp:Label ID="Label7" runat="server" Text='<%# Eval("Interior") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12">  
                                                            Arrival Date-<asp:Label ID="Label8" runat="server" Text='<%# Eval("ArrivalDate") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp; |&nbsp; Runs On-<asp:Label ID="Label9" runat="server" Text='<%# Eval("RunsOn") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">  
                                                            Actual Stock-<asp:Label ID="Label10" runat="server" Text='<%# Eval("ActualStock") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp; |&nbsp; Available-<asp:Label ID="Label11" runat="server" Text='<%# Eval("currentStock") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 border-bottom border-dark mb-0 pt-1 mt-0 pb-0">  
                                                            Car Description-<asp:Label ID="Label12" runat="server" Text='<%# Eval("Description") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                                            &nbsp;
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12 mt-2">
                                                            <div class="fa-pull-left ml-2">
                                                                <i class="fas fa-arrows-alt"></i>
                                                                <span >Category</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label17" runat="server" Text='<%# Eval("Category") %>'></asp:Label></span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-car"></i>
                                                                <span >Body Style</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label16" runat="server" Text='<%# Eval("BodyStyle") %>'></asp:Label></span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="far fa-user"></i>
                                                                <span >Passengers</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label13" runat="server" Text='<%# Eval("Seats") %>'></asp:Label> max</span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-briefcase"></i>
                                                                <span >Bags</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label18" runat="server" Text='<%# Eval("Bags") %>'></asp:Label> max</span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-door-open"></i>
                                                                <span >Doors</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label14" runat="server" Text='<%# Eval("Doors") %>' ></asp:Label> max</span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-temperature-high"></i>
                                                                <span >Air Condition</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label15" runat="server" Text='<%# Eval("AirCon") %>'></asp:Label></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <asp:Image CssClass="img-fluid p-0 ml-1" ID="Image1" runat="server" ImageUrl='<%# Eval("CarImage") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
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
