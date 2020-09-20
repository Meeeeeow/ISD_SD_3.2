<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PaymentAdmin.aspx.cs" Inherits="CarRental.PaymentAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Payment mb-5 mx-auto text-bold font-weight-bolder h6 text-center">Payment Details</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalConnectionString %>" SelectCommand="SELECT [paymentid], [userid], [orderid], [ordertime], [fullname], [city], [location], [mobile], [totalpaid], [address] FROM [PaymentDetail]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="paymentid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="paymentid" HeaderText="paymentid" InsertVisible="False" ReadOnly="True" SortExpression="paymentid" />
            <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
            <asp:BoundField DataField="orderid" HeaderText="orderid" SortExpression="orderid" />
            <asp:BoundField DataField="ordertime" HeaderText="ordertime" SortExpression="ordertime" />
            <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
            <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
            <asp:BoundField DataField="totalpaid" HeaderText="totalpaid" SortExpression="totalpaid" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
        </Columns>

    </asp:GridView>
    <div class="orders mt-5 mb-5">
         <div class="Payment mb-5 mx-auto text-bold font-weight-bolder h6 text-center">Order Details</div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalConnectionString %>" SelectCommand="SELECT [Orderid], [Userid], [Carid], [pickupdate], [returndate], [Grandtotal], [Ordertime], [Servicetaken], [rentaldays] FROM [OrderDetails]"></asp:SqlDataSource>
        <asp:GridView ID="GridView2" class="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Orderid" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Orderid" HeaderText="Orderid" ReadOnly="True" SortExpression="Orderid" />
                <asp:BoundField DataField="Userid" HeaderText="Userid" SortExpression="Userid" />
                <asp:BoundField DataField="Carid" HeaderText="Carid" SortExpression="Carid" />
                <asp:BoundField DataField="pickupdate" HeaderText="pickupdate" SortExpression="pickupdate" />
                <asp:BoundField DataField="returndate" HeaderText="returndate" SortExpression="returndate" />
                <asp:BoundField DataField="Grandtotal" HeaderText="Grandtotal" SortExpression="Grandtotal" />
                <asp:BoundField DataField="Ordertime" HeaderText="Ordertime" SortExpression="Ordertime" />
                <asp:BoundField DataField="Servicetaken" HeaderText="Servicetaken" SortExpression="Servicetaken" />
                <asp:BoundField DataField="rentaldays" HeaderText="rentaldays" SortExpression="rentaldays" />
            </Columns>
         </asp:GridView>
    </div>
</asp:Content>
