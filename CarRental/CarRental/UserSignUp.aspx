<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="CarRental.UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.0/animate.min.css" integrity="sha512-kb1CHTNhoLzinkElTgWn246D6pX22xj8jFNKsDmVwIQo+px7n1yjJUZraVuR/ou6Kmgea4vZXZeUDbqKtXkEMg==" crossorigin="anonymous" />
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    
    <div class="container mt-5"  >
     
      <div class="row">
         <div class="col-md-8 mx-auto">
            <div class="card">                     <!--card body for sign up ready set go go-->
               <div class="card-body">
                  <div class="row">
                     <div class="col text-center"> 
                           <img  class="text-center" src="images/user1.jpg" width="100"/>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">                       
                           <h4 class ="text-center">User Sign Up</h4>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                   <!-- Information -->
                   <div class ="row mb-2">
                       <div class="col text-center border border-info m-2 p-3 text-info bg-light font-weight-bolder">
                           You are requested to fill your information according to your NID.
                       </div>
                   </div>
                   <div class="row ">
                     <div class="col-md-6">
                         <label>Full Name</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name" required="" ></asp:TextBox>
                         
                         </div>
                        
                     </div>
                     
                      <div class="col-md-6">
                          <label>Date Of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Date OF Birth" TextMode="Date" required=""></asp:TextBox>
                        </div>
                        
                     </div>  
                  </div>
                  
                   <div class="row">
                     <div class="col-md-4">
                         <label>Contact Number</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Example:01XXX.." required="" ></asp:TextBox>
                         </div>
                        
                     </div>
                     
                      <div class="col-md-4">
                          <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Email ID" TextMode="Email" required=""></asp:TextBox>
                            
                        </div>
                        
                     </div>  
                       <div class="col-md-4">
                          <label>NID Number</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Example:1X0X04XXX" TextMode="Number" required=""></asp:TextBox>
                        </div>
                        
                     </div>  
                  </div>
                   <div class="row">
                     <div class="col-md-4">
                         <label>City</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="City" required="" ></asp:TextBox>
                         </div>
                        
                     </div>
                     
                      <div class="col-md-4">
                          <label>Location</label>   <!--Places in Dhaka lot to do-->
                        <div class="form-group">
                           <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" required="">
                               <asp:ListItem  Text="Select" Value="select"></asp:ListItem> 
                               <asp:ListItem  Text="AftabNaagar" Value="AftabNaaga"></asp:ListItem> 
                               <asp:ListItem  Text="Adabor" Value="Adabor"></asp:ListItem> 
                               <asp:ListItem  Text="AftabNagar" Value="AftabNagar"></asp:ListItem> 
                               <asp:ListItem  Text="Agargaon" Value="Agargaon"></asp:ListItem>
                               <asp:ListItem  Text="Airport Area" Value="Airport Area"></asp:ListItem>
                               <asp:ListItem  Text="Asad Gate" Value="Asad Gate"></asp:ListItem>
                               <asp:ListItem  Text="Ashkona" Value="Ashkona"></asp:ListItem>
                               <asp:ListItem  Text="Azimpur" Value="Azimpur"></asp:ListItem>
                               <asp:ListItem  Text="Badda" Value="Badda"></asp:ListItem>
                               <asp:ListItem  Text="Baily Road" Value="Baily Road"></asp:ListItem>
                               <asp:ListItem  Text="Banani" Value="Banani"></asp:ListItem>
                               <asp:ListItem  Text="Banasree" Value="Banasree"></asp:ListItem>
                               <asp:ListItem  Text="Bangshal" Value="Bangshal"></asp:ListItem>
                               <asp:ListItem  Text="Baridhara" Value="Baridhara"></asp:ListItem>
                               <asp:ListItem  Text="Bijoy Soroni" Value="Bijoy Soroni"></asp:ListItem>
                               <asp:ListItem  Text="Bosila" Value="Bosila"></asp:ListItem>
                               <asp:ListItem  Text="Cantonment" Value="Cantonment"></asp:ListItem>
                               <asp:ListItem  Text="Chawk Bazar" Value="Chawk Bazar"></asp:ListItem>
                               <asp:ListItem  Text="College Gate" Value="College Gate"></asp:ListItem>
                               <asp:ListItem  Text="Darus Salam" Value="Darus Salam"></asp:ListItem>
                               <asp:ListItem  Text="Demra" Value="Demra"></asp:ListItem>
                               <asp:ListItem  Text="Dhanmondi" Value="Dhanmondi"></asp:ListItem>
                               <asp:ListItem  Text="Elephant Road" Value="Elephant Road"></asp:ListItem>
                               <asp:ListItem  Text="Faidabad" Value="Faidabad"></asp:ListItem>
                               <asp:ListItem  Text="Farmgate" Value="Farmgate"></asp:ListItem>
                               <asp:ListItem  Text="Fokirapul" Value="Fokirapul"></asp:ListItem>
                               <asp:ListItem  Text="Gabtoli" Value="Gabtoli"></asp:ListItem>
                               <asp:ListItem  Text="Goran" Value="Goran"></asp:ListItem>
                               <asp:ListItem  Text="Green Road" Value="Green Road"></asp:ListItem>
                               <asp:ListItem  Text="Gulistan" Value="Gulistan"></asp:ListItem>
                               <asp:ListItem  Text="Gulshan" Value="Gulshan"></asp:ListItem>
                               <asp:ListItem  Text="Hatirjheel" Value="Hatirjheel"></asp:ListItem>
                               <asp:ListItem  Text="Hazaribag" Value="Hazaribag"></asp:ListItem>
                               <asp:ListItem  Text="Ibrahimpur" Value="Ibrahimpur"></asp:ListItem>
                               <asp:ListItem  Text="Indira Road" Value="Indira Road"></asp:ListItem>
                               <asp:ListItem  Text="Jatrabari" Value="Jatrabari"></asp:ListItem>
                               <asp:ListItem  Text="Kafrul" Value="Kafrul"></asp:ListItem>
                               <asp:ListItem  Text="Kakrail" Value="Kakrail"></asp:ListItem>
                               <asp:ListItem  Text="Kolabagan" Value="Kolabagan"></asp:ListItem>
                               <asp:ListItem  Text="Kalshi" Value="Kalshi"></asp:ListItem>
                               <asp:ListItem  Text="Katabon" Value="Katabon"></asp:ListItem>
                               <asp:ListItem  Text="Kazipara" Value="Kazipara"></asp:ListItem>
                               <asp:ListItem  Text="Khilgaon" Value="Khilgaon"></asp:ListItem>
                               <asp:ListItem  Text="Khilkhet" Value="Khilkhet"></asp:ListItem>
                               <asp:ListItem  Text="Kollanpur" Value="Kollanpur"></asp:ListItem>
                               <asp:ListItem  Text="Kuril" Value="Kuril"></asp:ListItem>
                               <asp:ListItem  Text="Lalbag" Value="Lalbag"></asp:ListItem>
                               <asp:ListItem  Text="Lalmatia" Value="Lalmatia"></asp:ListItem>
                               <asp:ListItem  Text="Malibag" Value="Malibag"></asp:ListItem>
                               <asp:ListItem  Text="Mirpur" Value="Mirpur"></asp:ListItem>
                               <asp:ListItem  Text="Mogbazar" Value="Mogbazar"></asp:ListItem>
                               <asp:ListItem  Text="Mohakhali" Value="Mohakhali"></asp:ListItem>
                               <asp:ListItem  Text="Mohammadpur" Value="Mohammadpur"></asp:ListItem>
                               <asp:ListItem  Text="Motijheel" Value="Motijheel"></asp:ListItem>
                               <asp:ListItem  Text="Mouchak" Value="Mouchak"></asp:ListItem>
                               <asp:ListItem  Text="Mugda" Value="Mugda"></asp:ListItem>
                               <asp:ListItem  Text="Nakhalpara" Value="Nakhalpara"></asp:ListItem>
                               <asp:ListItem  Text="Naya Bazar" Value="Naya Bazar"></asp:ListItem>
                               <asp:ListItem  Text="Naya Paltan" Value="Naya Paltan"></asp:ListItem>
                               <asp:ListItem  Text="New Eskaton Road " Value="New Eskaton Road"></asp:ListItem>
                               <asp:ListItem  Text="New Market" Value="New Market"></asp:ListItem>
                               <asp:ListItem  Text="Niketon" Value="Niketon"></asp:ListItem>
                               <asp:ListItem  Text="Nikunjo" Value="Nikunjo"></asp:ListItem>
                               <asp:ListItem  Text="Nilkhet" Value="Nilkhet"></asp:ListItem>
                               <asp:ListItem  Text="Pallabi" Value="Pallabi"></asp:ListItem>
                               <asp:ListItem  Text="Panthapath" Value="Panthapath"></asp:ListItem>
                               <asp:ListItem  Text="Pirerbag" Value="Pirerbag"></asp:ListItem>
                               <asp:ListItem  Text="Puran Dhaka" Value="Puran Dhaka"></asp:ListItem>
                               <asp:ListItem  Text="Ramna" Value="Ramna"></asp:ListItem>
                               <asp:ListItem  Text="Rampura" Value="Rampura"></asp:ListItem>
                               <asp:ListItem  Text="Rayer Bazar" Value="Rayer Bazar"></asp:ListItem>
                               <asp:ListItem  Text="Rupnagar" Value="Rupnagar"></asp:ListItem>
                               <asp:ListItem  Text="Sabujbag" Value="Sabujbag"></asp:ListItem>
                               <asp:ListItem  Text="Sankar" Value="Sankar"></asp:ListItem>
                               <asp:ListItem  Text="Sayedabad" Value="Sayedabad"></asp:ListItem>
                               <asp:ListItem  Text="Shahbag" Value="Shahbag"></asp:ListItem>
                               <asp:ListItem  Text="Shewrapara" Value="Shewrapara"></asp:ListItem>
                               <asp:ListItem  Text="Shamoli" Value="Shamoli"></asp:ListItem>
                               <asp:ListItem  Text="Shukrabad" Value="Shukrabad"></asp:ListItem>
                               <asp:ListItem  Text="Tejgaon" Value="Tejgaon"></asp:ListItem>
                               <asp:ListItem  Text="Tejkunipara" Value="Tejkunipara"></asp:ListItem>
                               <asp:ListItem  Text="Uttara" Value="Uttara"></asp:ListItem>
                               <asp:ListItem  Text="Vasantek" Value="Vasantek"></asp:ListItem>
                               <asp:ListItem  Text="Wari" Value="Wari"></asp:ListItem>
                               <asp:ListItem  Text="Zigatola" Value="Zigatola"></asp:ListItem>
                           </asp:DropDownList>
                        </div>
                        
                     </div>  
                       <div class="col-md-4">
                          <label>Gender</label>
                        <div class="form-group">
                           <asp:DropDownList CssClass="form-control"  ID="DropDownList2" runat="server" required="">
                               <asp:ListItem  Text="Select" Value="select"></asp:ListItem>
                              <asp:ListItem  Text="M" Value="M"></asp:ListItem>
                               <asp:ListItem  Text="F" Value="F"></asp:ListItem>
                               <asp:ListItem  Text="Other" Value="Other"></asp:ListItem>
                           </asp:DropDownList>

                        </div>
                        
                     </div>  
                  </div>
                   <div class="row">
                     <div class="col">
                         <label>Full Address</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder=" Full Address" TextMode="MultiLine" Rows="2" required=""></asp:TextBox>
                         </div>
                        
                     </div>
                  </div>

                   <div class="row">
                     <div class="col-md-4">
                         <label>Occupation</label>
                         <div class="form-group">
                           <asp:DropDownList CssClass="form-control"  ID="DropDownList3" runat="server" required="">
                               <asp:ListItem  Text="Select" Value="select"></asp:ListItem>
                               <asp:ListItem  Text="Artist" Value="Artist"></asp:ListItem>
                               <asp:ListItem  Text="Animator" Value="Animator"></asp:ListItem>
                               <asp:ListItem  Text="Cook" Value="Cook"></asp:ListItem>
                               <asp:ListItem  Text="Chef" Value="Chef"></asp:ListItem>
                              <asp:ListItem  Text="Govt" Value="Govt"></asp:ListItem>
                               <asp:ListItem  Text="Service Holder" Value="Service Holder"></asp:ListItem>
                               <asp:ListItem  Text="Developer" Value="Developer"></asp:ListItem>
                               <asp:ListItem  Text="Photographer" Value="Photographer"></asp:ListItem>
                              <asp:ListItem  Text="Cricketer" Value="Cricketer"></asp:ListItem>
                               <asp:ListItem  Text="Teacher" Value="Teacher"></asp:ListItem>
                               <asp:ListItem  Text="Student" Value="Student"></asp:ListItem>
                               <asp:ListItem  Text="Engineer" Value="Engineer"></asp:ListItem>
                               <asp:ListItem  Text="Doctor" Value="Doctor"></asp:ListItem>
                           </asp:DropDownList>
                             
                         </div>
                        
                     </div>
                     <div class="col-md-4">
                          <label>License No.</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="License" runat="server" placeholder="License No. if you have" ></asp:TextBox>
                        </div>
                        
                     </div>  
                      <div class="col-md-4">
                          <label>Nationality</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Nationality" required="" ReadOnly="true" Text="Bangladeshi"></asp:TextBox>
                        </div>
                        
                     </div>  
                        
                  </div>
                   <div class="row mt-1 mb-2">                    <!--Login info give give-->
                       <div class="col text-center">
                               <span class="badge badge-pill badge-primary">Login Credentials</span>
                               &nbsp;
                               &nbsp;
                       </div>
                   </div>

                    <div class="row mb-2 mt-1">
                     <div class="col-md-6">
                         <label>User ID</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="User ID"  required=""></asp:TextBox>
                             <!-- 5 t0 20 characters long, _ or . cannot be start , no double of . or _ , alphanumeric characters , . or _ not end --> 
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  class="font-weight-bold h6" runat="server" controltovalidate="TextBox1" ForeColor ="Red" validationexpression="^(?=.{5,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$" ErrorMessage="Invalid User ID"></asp:RegularExpressionValidator>
                         </div>
                        
                     </div>
                     
                      <div class="col-md-6">
                          <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password" required=""></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" class="font-weight-bold h6" runat="server" controltovalidate="TextBox9" ForeColor ="Red" validationexpression="^[0-9]{4,10}$" ErrorMessage="Password should be at least 4 characters long "></asp:RegularExpressionValidator>
                        </div>
                        
                     </div>  
                  </div>

                   <div class="row mt-2">                                <!--Not signed in -->
                       <div class="col">
                           <div class="form-group">
                               <asp:Button CssClass="btn btn-success btn-block btn-lg" ID="Button1" runat="server"                            
                                   Text="Sign Up" OnClick="Button1_Click" />
                           </div>
                       </div>
                   </div>
                  
               </div>
            </div>
            <a class= "text-decoration-none mb-4" href="Homepage.aspx"><< Back to Home</a><br><br>
         </div>
      </div>
   </div>
        
      
   
</asp:Content>
