<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="CarRental.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/StyleSheet2.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section>
        <img src="images/logo1.jpg" class="img-fluid"/>
    </section>
      
   <!-- MOdal to show saved cart -->
    <div class="container-fluid">
        
       <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        
                        <h4 class="modal-title"><asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                        <p>Follow <a href="SavedCart.aspx" class="tooltip-test" title="Tooltip"> this link</a> to go to your saved cart.</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
       <div class="row">
           <!--Left Side of Page-->

            <div class="col-md-5 col-sm-3" >
                    <!--=== LUXURY ===-->
                    <div id="luxury">
                        <p class="Space">
                            LUXURY
                            CARS 
                            <span class="offer">5% OFFER AT WEEKENDS 
                             OR WEEKDAYS
                            </span>
                            <asp:Button ID="Button1" runat="server" Text="READ MORE"  BackColor="#1B1B1B" 
                                ForeColor="wheat" Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" 
                                BorderWidth="1" white-space="pre-line" line-height="0px" 
                                Height="50px" OnClick="Button1_Click" />
                           
                        </p>
                       
                    </div>
                <br />
                <!--=== DEALS ===-->
                 <div id="luxury1">
                      
                        <p class="Space">
                            SPECIAL 
                            OFFERS 
                            <span class="offer">10% OFF AT FIRST
                             CHECKOUT
                            </span>
                            <asp:Button ID="Button2" runat="server" Text="READ MORE"  BackColor="#1B1B1B" ForeColor="wheat" 
                                Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" BorderWidth="1" white-space="pre-line" 
                                line-height="0px" Height="50px" />
                           
                        </p>
                    </div>
                
            </div>
           <!--Right Side of Page-->
           <div class="col-md-7 col-sm-9">
                <!--=== SERVICE DETAILS ===-->
               <div id="intro">
                   <p>
                       THE BEST PLACE FOR FINDING<br />
                       CAR SERVICES AND RENTAL<br />
                   </p>
                   <p class="place" style="line-height:25px;">
                      Your One way to stop to find and rent cars to your choice.
                       We are here for you.
                   </p>
                        <asp:Button ID="Button7" class ="mb-4" runat="server" Text="READ MORE"  BackColor="#1B1B1B" ForeColor="wheat" Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" BorderWidth="1" white-space="pre-line" line-height="0px" Height="50px" OnClick="Button7_Click" />

               </div>
                <!--=== CAR PRICE ===-->
               <div id="second_tag">
                   <img src ="images/ferrari2.jpg" class="img-fluid car-price" />
                    <div id ="top-left">
                       CAR PRICE
                       <p class="place" style="line-height:25px;">
                      Reasonable car price at your doorsteps.
                      Come and find what you need.
                      </p>
                        <asp:Button ID="Button3" runat="server" Text="READ MORE"  BackColor="#1B1B1B" ForeColor="wheat" Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" BorderWidth="1" white-space="pre-line" line-height="0px" Height="50px" OnClick="Button3_Click" />
                   </div>
                   
                  
               </div>   
               <!--=== ABOUT===-->
               <div id="third_tag">
                   <div id="about">
                       ABOUT US
                       <p class="place" style="line-height:25px;">
                           We are some bachelors students tryong to build a proto of car rental website.
                           There will be some bugs.Your consideration is much appreciated and please do let us know.
                       </p>
                        <asp:Button ID="Button4" runat="server" Text="READ MORE"  BackColor="red" ForeColor="FloralWhite" Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" BorderWidth="1" white-space="pre-line" line-height="0px" Height="50px" OnClick="Button4_Click" />

                   </div>
               </div>

           </div>
        </div>
    </div>

    
  
</asp:Content>
