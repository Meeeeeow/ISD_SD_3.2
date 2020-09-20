<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DrivingOptions.aspx.cs" Inherits="CarRental.DrivingOptions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"/>
    <link href="css/StyleSheet7.css" type="text/css" rel="stylesheet"/>
    
     <script type ="text/javascript">
      
 //no need done it backend
  $(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    
    var maxDate = year + '-' + month + '-' + day;

    $('#Date1').attr('min', maxDate);
});
        
   
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
  <!--self driving-->
    <div class="container mt-5 mb-3" >
        <div class="row">
            <div class="col-md-6 col-sm-12" id="selfDriving" runat ="server">
                <div class ="card">
                    <div class="card-body">
                        <div class ="card-title text-center text-primary h3 font-weight-bold">Self Driving</div>
                        <div class="card-text text-center">
                             <label>Your 15 digit License No.</label>
                                 <input type ="text" id ="LicenseNo" runat ="server" /><br />
                        </div>
                        <div class="datetime mt-3">
                            <div class="row d-flex flex-row">
                                <div class="col-md-6 col-sm-6">
                                    <label>Enter Pick Up Date</label><br />
                                         <input type ="date" id ="Pickup" runat="server"  /><br />  
                                    
                                </div>
                                <div class="col-md-6 col-sm-6 text-center">
                                    <label>Pick Up Time</label><br />
                                         <input type ="time" id ="PickUpTime" runat ="server" /><br />
                                </div>
                            </div>
                           
                        </div>
                        <div class="returndatetime mt-3">
                            <div class="row d-flex flex-row">
                                <div class="col-md-6 col-sm-6" id="RetDate" runat="server">
                                    <label>Enter Return Date</label><br />
                                         <input type ="date" id ="returndate" runat="server" /><br />  
                                </div>
                                <div class="col-md-6 col-sm-6 text-center" id="RetTime" runat="server">
                                    <label>Return Time</label><br />
                                         <input type ="time" id ="ReturnTime" runat="server"/><br />
                                </div>
                            </div>
                            <div class="location mt-3">
                                <label>Enter PickUp Location</label><br />
                                <input type ="text" id ="location_self" runat="server"/>
                            </div>
                             <div class="mt-3" id="round_trip" runat="server">
                                 <asp:CheckBox id="CheckRound" class="ml-2 mb-1" AutoPostBack="True" OnCheckedChanged="check2_CheckedChanged"  runat="server" Text="Are you interested in taking a round trip?" ></asp:CheckBox>
                             </div>
                             <div class="mt-3" id="count_hours_1" runat="server">
                                 <asp:TextBox  ID="count_hours_text_1" runat="server" placeholder="Number of Hours" TextMode="Number" ></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" class="font-weight-bold h6" runat="server" controltovalidate="count_hours_text_1" ForeColor ="Red" validationexpression="^[4-9]$" ErrorMessage="Hours should be limited to 4 to 10"></asp:RegularExpressionValidator>
                         </div>
                           
                        </div>
                        <div class ="agreement mt-2 border border-primary rounded w-75  ml-5 mr-auto  mt-4 pr-2 pb-2">
                            <h6 class ="text-center">Please read through these rules</h6>
                            <div class="rules">
                                <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Disc">
                                    <asp:ListItem >Please arrive on time to pick up your car.</asp:ListItem>
                                    <asp:ListItem >You have to pay your own for car damage and petrol.</asp:ListItem>
                                    <asp:ListItem >Please donot eat inside the car.</asp:ListItem>
                                    <asp:ListItem >Please donot soil the car sheets.</asp:ListItem>
                                    <asp:ListItem >You are requested to abide all traffic rules. For any kind of illegal activity we will not be resposible.</asp:ListItem>
                                    <asp:ListItem >Always keep your driving license with you.</asp:ListItem>
                                    <asp:ListItem >Please donot make or take a phone call while driving.</asp:ListItem>
                                    <asp:ListItem >You are requested to return the car before your return date. If not there will be extra charge added.</asp:ListItem>
                                    <asp:ListItem >Donot use the car outside your services schedule.</asp:ListItem>
                                    <asp:ListItem >And above all Please be safe while driving.</asp:ListItem>
                                    <asp:ListItem >Parking fee not included.</asp:ListItem>
                                    <asp:ListItem >Additional hours will cost 400 Taka per hours.</asp:ListItem>
                                    <asp:ListItem>We cannot provide the car during the time of political strike and Natural disaster. </asp:ListItem>
                                    
                                </asp:BulletedList>
                                <asp:CheckBox id="check" class="ml-2 mb-1" AutoPostBack="True" OnCheckedChanged="check_CheckedChanged"  runat="server" Text="I agree" ></asp:CheckBox>
                            </div>
                        </div>
                        <div class ="submission w-100">
                            <asp:Button id="btnSubmits"  class=" btn btn-primary btn-block mt-3 float-right p-1 w-25  text-center " runat="server" Text="Go to Cart" OnClick="btnSubmits_Click"  />
                        </div>
                    </div>
                </div>
            </div>
            <!--with driver-->
            <div class="col-md-6 col-sm-12" id="withDriver" runat ="server">
                <div class ="card">
                    <div class="card-body">
                        <div class ="card-title text-center text-primary h3 font-weight-bold">With Driver</div>
                        <div class="datetime mt-3">
                            <div class="row d-flex flex-row">
                                <div class="col-md-6 col-sm-6">
                                    <label>Enter Pick Up Date</label><br />
                                         <input type ="date" id ="DriverPickup" runat="server" /><br />  
                                </div>
                                <div class="col-md-6 col-sm-6 text-center">
                                    <label>Pick Up Time</label><br />
                                         <input type ="time" id ="DriverPickUpTime" runat="server" /><br />
                                </div>
                            </div>
                           
                        </div>
                        <div class="returndatetime mt-3">
                            <div class="row d-flex flex-row">
                                <div class="col-md-6 col-sm-6" id ="DriveReturn" runat="server">
                                    <label>Enter Return Date</label><br />
                                         <input type ="date" id ="DriverReturn" runat="server"/><br />  
                                </div>
                                <div class="col-md-6 col-sm-6 text-center" id ="DriveReturnTime" runat="server">
                                    <label>Return Time</label><br />
                                         <input type ="time" id ="DriverReturnTime" runat="server" /><br />
                                </div>
                            </div>
                           
                        </div>
                        <div class="location mt-3">
                            <label>Enter PickUp Location</label><br />
                             <input type ="text" id ="location_driver" runat="server"/>
                        </div>
                        <div class="mt-3" id="round_trip1" runat="server">
                                 <asp:CheckBox id="CheckRound1" class="ml-2 mb-1" AutoPostBack="True" OnCheckedChanged="check2_CheckedChanged"  runat="server" Text="Are you interested in taking a round trip?" ></asp:CheckBox>
                         </div>
                        <div class="mt-3" id="count_hours" runat="server">
                                 <asp:TextBox  ID="count_hours_text" runat="server" placeholder="Number of Hours" ></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" class="font-weight-bold h6" runat="server" controltovalidate="count_hours_text" ForeColor ="Red" validationexpression="^[4-9]$" ErrorMessage="Hours should be limited to 4 to 10"></asp:RegularExpressionValidator>
                         </div>
                        <div class ="agreement mt-2 border border-primary rounded w-75  ml-5 mr-auto  mt-4 pr-2 pb-2">
                            <h6 class ="text-center">Please read through these rules</h6>
                            <div class="rules">
                                <asp:BulletedList ID="BulletedList2" runat="server" BulletStyle="Disc">
                                    <asp:ListItem >Please donot be late and waste others valuable time.</asp:ListItem>
                                    <asp:ListItem >You have to pay your own for car damage and petrol.</asp:ListItem>
                                    <asp:ListItem >Please donot eat inside the car.</asp:ListItem>
                                    <asp:ListItem >Please donot soil the car sheets.</asp:ListItem>
                                    <asp:ListItem >You are requested to abide all traffic rules.Do not encourage the driver to do any illegal activities.</asp:ListItem>
                                    <asp:ListItem >Always be polite with the driver.</asp:ListItem>
                                    <asp:ListItem >Please donot ask about corporate questions to the driver.</asp:ListItem>
                                    <asp:ListItem >Donot use the car outside your services schedule.</asp:ListItem>
                                    <asp:ListItem >And above all Please be patient and respectful.</asp:ListItem>
                                    <asp:ListItem >Parking fee not included.</asp:ListItem>
                                    <asp:ListItem>We cannot provide the car during the time of political strike and Natural disaster. </asp:ListItem>
                                    <asp:ListItem> In case of traveling outside of Dhaka city, need to discuss with the car rental company. Price will varry in this case. </asp:ListItem>
                                    
                                </asp:BulletedList>
                                <asp:CheckBox id="CheckDriver" class="ml-2"  AutoPostBack="true" OnCheckedChanged="check1_CheckedChanged"  Text="I agree" runat="server"></asp:CheckBox>
                            </div>
                        </div>
                        <div class ="submission w-100">
                             <asp:Button  id ="btnSubmit" class=" btn btn-primary btn-block mt-3 float-right p-1 w-25  text-center "  runat="server" Text="Go to Cart " OnClick="btnSubmit_Click"  />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
   
</asp:Content>
