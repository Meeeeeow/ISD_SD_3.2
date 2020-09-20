<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="SavedCart.aspx.cs" Inherits="CarRental.SavedCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });

        </script>
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="slogan h5 text-secondary pl-0 mt-5 text-dark font-weight-bold">
            Welcome back!Let us start from where we left off!
        </div>
    </div>
    <div class ="container w-75 mt-5">
        <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalConnectionString %>" SelectCommand="SELECT [UserID], [Carid], [CarImage], [RentalDays], [GrandTotal], [OrderId], [Service] FROM [SavedCart] WHERE ([UserID] = @UserID)" DeleteCommand="DELETE FROM [SavedCart] WHERE [OrderId] = @OrderId" InsertCommand="INSERT INTO [SavedCart] ([UserID], [Carid], [CarImage], [RentalDays], [GrandTotal], [OrderId], [Service]) VALUES (@UserID, @Carid, @CarImage, @RentalDays, @GrandTotal, @OrderId, @Service)" UpdateCommand="UPDATE [SavedCart] SET [UserID] = @UserID, [Carid] = @Carid, [CarImage] = @CarImage, [RentalDays] = @RentalDays, [GrandTotal] = @GrandTotal, [Service] = @Service WHERE [OrderId] = @OrderId">
                        
                          <SelectParameters>
                              <asp:SessionParameter Name="UserID" SessionField="username" Type="String" />
                          </SelectParameters>
                          <DeleteParameters>
                              <asp:Parameter Name="OrderId" Type="Int32" />
                         </DeleteParameters>
                         
                      </asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered table-hover" ID="GridView1" runat="server"  AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" style="margin-right: 0px" DataKeyNames="OrderId" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting"  >
                            <Columns>
                                
                                <asp:BoundField DataField="OrderId" HeaderText="OrderId" ReadOnly="True" SortExpression="OrderId" />
                                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" >
                                
                                </asp:BoundField>
                                <asp:BoundField DataField="Carid" HeaderText="Carid" SortExpression="Carid" >
                                
                                </asp:BoundField>
                                 <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />   
                                <asp:BoundField DataField="RentalDays" HeaderText="RentalDays" SortExpression="RentalDays" /> 
                               <asp:BoundField DataField="GrandTotal" HeaderText="GrandTotal" SortExpression="GrandTotal" />
                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-7  border-right text-dark " >
                                                    <asp:Image CssClass="img-fluid p-0 ml-1 " ID="carsimg" runat="server"  ImageUrl='<%# Eval("CarImage") %>' />  
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True"  ButtonType="Button"/>
                            </Columns>
                         </asp:GridView>
                         
                     </div>
                  </div>
        <div class="row float-right">
            <asp:Label runat="server" class=" h6  text-dark">You have to pay </asp:Label><asp:TextBox ID="TextBox1"  class=" text-primary font-weight-bold text-center ml-2" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="row">
           <a href="ViewCarsUser.aspx" id="backButton" class="btn btn-outline-dark btn-lg font-weight-bolder mb-5 p-2" runat="server">
                <i class="fas fa-angle-left"></i> Back To Cars List 
            </a>
           
           <!-- <asp:LinkButton ID="backbutton1" Cssclass="btn btn-outline-dark btn-lg font-weight-bolder mb-5 p-2" runat="server" >
               
            </asp:LinkButton> -->

          
        </div>
       
        <div class="row">
            <a href="PaymentgateWay.aspx" class="btn btn-outline-dark btn-lg font-weight-bolder mb-5 p-2">
                Checkout <i class="fas fa-angle-right"></i>
            </a>
        </div>
        
    </div>
</asp:Content>
