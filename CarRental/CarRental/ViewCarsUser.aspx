<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ViewCarsUser.aspx.cs" Inherits="CarRental.ViewCarsUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class ="row mb-2 mx-auto">
                       <div class="col  border border-info m-2 p-3 text-info bg-light font-weight-bolder">   
                           <div class="text-center">Please read through these instructions before renting your car.</div>
                           <div class="rules">
                               <asp:Label class="font-weight-bold text-dark" runat="server">Car selection info</asp:Label>
                               <asp:BulletedList ID="BulletedList3" runat="server" BulletStyle="Square"> 
                                   <asp:ListItem >AC -- Airport Transfer</asp:ListItem>
                                   <asp:ListItem >HC -- Hourly Rate</asp:ListItem>
                                   <asp:ListItem>MC -- Monthly Transfer</asp:ListItem>
                                   <asp:ListItem>DC -- Daily Transfer</asp:ListItem>
                                   <asp:ListItem>IC -- Inside City Transfer</asp:ListItem>
                                   <asp:ListItem>OC -- Outside City Transfer</asp:ListItem>
                                   <asp:ListItem>Daily and monthly rent is given in per days and hourly is given in 4 hours.</asp:ListItem>
                                   <asp:ListItem>Please be noted that you are allowed to checkout 2 items and if a car is rented you are not allowed to rent anymore at that time.</asp:ListItem>
                               </asp:BulletedList>
                               <asp:Label class="font-weight-bold text-dark" runat="server">Airport Transfer Info</asp:Label>
                               <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Square"> 
                                   <asp:ListItem >Airport Transfer service is for one way.</asp:ListItem>
                                   <asp:ListItem >For round trip additional BDT 500 Taka will be added.</asp:ListItem>
                                   <asp:ListItem>All parking fees that are incurred for this service is included with this price.</asp:ListItem>
                               </asp:BulletedList>
                               <asp:Label class="font-weight-bold text-dark" runat="server">Hourly Transfer Info</asp:Label>
                               <asp:BulletedList ID="BulletedList2" runat="server" BulletStyle="Square"> 
                                   <asp:ListItem >This fee is for first 4 hours service including CNG/Fuel Cost. </asp:ListItem>
                                   <asp:ListItem >For every additional hour 250 taka will be added.</asp:ListItem>
                               </asp:BulletedList>
                               <asp:Label class="font-weight-bold text-dark" runat="server">Monthly Rental Info</asp:Label>
                               <asp:BulletedList ID="BulletedList4" runat="server" BulletStyle="Square"> 
                                   <asp:ListItem >For monthly you can rent for 5 days highest 2 times in a month</asp:ListItem>
                                   
                               </asp:BulletedList>
                           </div> 
                       </div>
                       
            </div>
            <!--Gridview-->
            <div class="col-sm-12">
                <div class=" h3 text-center">All Cars List</div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </asp:Panel>
            </div>
        </div>
        <br />
        <div class="row">
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
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalConnectionString %>" SelectCommand="SELECT * FROM [CarDetails]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CarID" DataSourceID="SqlDataSource1" style="margin-right: 0px" OnRowCommand="GridView1_RowCommand" >
                            <Columns>
                                <asp:BoundField DataField="CarID" HeaderText="CarID" ReadOnly="True" SortExpression="CarID" >
                                
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RentOptions" HeaderText="Service" ReadOnly="True" SortExpression="CarID" >
                                
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

                                                            &nbsp; |&nbsp;&nbsp;  Route-<asp:Label ID="Label4" runat="server" Text='<%# Eval("Route") %>' Font-Bold="True"></asp:Label>

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
                                                            &nbsp; |&nbsp; Available-<asp:Label ID="StockPresent" runat="server" Text='<%# Eval("currentStock") %>' Font-Bold="True"></asp:Label>
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
                                                                <span >Category</span><br /><span class="ml-4"> <asp:Label ID="Label17" runat="server" Text='<%# Eval("Category") %>'></asp:Label></span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-car"></i>
                                                                <span >Body Style</span><br /><span class="ml-4"> <asp:Label ID="Label16" runat="server" Text='<%# Eval("BodyStyle") %>'></asp:Label></span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="far fa-user"></i>
                                                                <span >Passengers</span><br /><span class="ml-4"> <asp:Label ID="Label13" runat="server" Text='<%# Eval("Seats") %>'></asp:Label> max</span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-briefcase"></i>
                                                                <span >Bags</span><br /><span class="ml-4"> <asp:Label ID="Label18" runat="server" Text='<%# Eval("Bags") %>'></asp:Label> max</span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-door-open"></i>
                                                                <span >Doors</span><br /><span class="ml-4"> <asp:Label ID="Label14" runat="server" Text='<%# Eval("Doors") %>' ></asp:Label> max</span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-temperature-high"></i>
                                                                <span >Air Condition</span><br /><span class="ml-4"> <asp:Label ID="Label15" runat="server" Text='<%# Eval("AirCon") %>'></asp:Label></span>
                                                            </div>
                                                           
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <asp:Image CssClass="img-fluid p-0 ml-1" ID="carsimg" runat="server" ImageUrl='<%# Eval("CarImage") %>' />  
                                                 </div>           
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-10"></div>
                                                <div class="col-lg-2 float-right">
                                                    <span class="ml-3  p-0"><asp:Label ID="Costing" runat="server" Text='<%# Eval("Cost") %>' Font-Bold="True" Font-Size="Large"></asp:Label> $</span>
                                                    <br />
                                                    <asp:Button ID="Bookbtn" class="btn btn-primary text-light text-center font-weight-bold" runat="server" Text="Book Now"  CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                                   <br />
                                                    
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
         <a href="Homepage.aspx"><< Back to Home</a><br><br>
    </div>
</asp:Content>
