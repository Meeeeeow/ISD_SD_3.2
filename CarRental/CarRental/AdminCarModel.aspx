<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AdminCarModel.aspx.cs" Inherits="CarRental.AdminCarModel" %>
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
    <div class="container">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        
                           <h4 class="text-center">Model Details</h4>
                        
                     </div>
                  </div>
                   <div class="row">
                     <div class="col text-center">
                        
                           <img width="100" src="images/model.png"/>
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-4">
                         <label>Model ID</label>
                         <div class="form-group">
                             <div class="input-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="ID"></asp:TextBox>
                                 <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Go" OnClick="Button2_Click" />
                             </div>
                            
                         </div>
                        
                     </div>
                     
                      <div class="col-md-8">
                          <label>Model Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="ModelName" ></asp:TextBox>
                        </div>
                        
                     </div>  
                  </div>
                            
                   <div class="row">
                       <div class="col-4 mx-auto">
                           <div class="form-group">
                               <asp:Button CssClass="btn btn-primary btn-block btn-lg" ID="Button1" runat="server"                            
                                   Text="Add" OnClick="Button1_Click"  />
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
            <a href="Homepage.aspx"><< Back to Home</a><br><br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        
                           <h4 class="text-center"> Model List</h4>
                           
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>  
                   <div class="row">
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalConnectionString %>" SelectCommand="SELECT * FROM [ModelTable]"></asp:SqlDataSource>
                       <div class="col">
                           <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server"  AutoGenerateColumns="False" DataKeyNames="ModelID" DataSourceID="SqlDataSource1">
                               <Columns>
                                   <asp:BoundField DataField="ModelID" HeaderText="ModelID" ReadOnly="True" SortExpression="ModelID" />
                                   <asp:BoundField DataField="ModelName" HeaderText="ModelName" SortExpression="ModelName" />
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
