<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="CarRental.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/StyleSheet3.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <div class="heading h1 text-center text-uppercase mt-2 mb-3 font-weight-bolder">meet our team </div>
                <div class="motto h4 text-center text-dark text-wrap w-50 mx-auto mt-5">We are all very different. We were born in different cities,
                    at different times, we love different music, food, movies. But we have something that unites us all.
                    It is our company. We are its heart. We are not just a team, we are a family.</div>
                <a href="#myForm"><div class="contact btn btn-outline-dark mx-auto mt-4 d-flex justify-content-center font-weight-bold"  id="con" style="max-width:10rem;">Contact Us</div></a>
            </div>
        </div>
        
    </div>
    <!--for parallax view -->
    <div id="parallax" class="mt-5"></div>
    <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="icon ">
                        <img src="images/think.png" class="d-block mx-auto mt-5" />
                    </div>
                    <div class="titles mx-auto h4 text-center font-weight-bold mt-3">Creativity</div>
                    <div class="desc h6 mt-3 text-center mx-auto" style="width:330px;">
                        It's the ability to think outside the box. 
                        We make decisions, create something new and generate
                        a lot of ideas.
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="icon ">
                        <img src="images/partnership.png" class="d-block mx-auto mt-5" />
                    </div>
                    <div class="titles mx-auto h4 text-center font-weight-bold mt-3">Friendly</div>
                    <div class="desc h6 mt-3 text-center mx-auto" style="width:330px;">
                        It's the ability to think outside the box. 
                        We make decisions, create something new and generate
                        a lot of ideas.
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="icon ">
                        <img src="images/support.png" class="d-block mx-auto mt-5" />
                    </div>
                    <div class="titles mx-auto h4 text-center font-weight-bold mt-3">Supportive</div>
                    <div class="desc h6 mt-3 text-center mx-auto" style="width:330px;">
                        It's the ability to think outside the box. 
                        We make decisions, create something new and generate
                        a lot of ideas.
                    </div>
                </div>
            </div>
        </div>
    <!--for carousel-->
    <div class="container comments ">
        <div id="myCarousel" class="carousel slide mt-4">
         
            <div class="carousel-inner mb-4">
                <div class="carousel-item active">
                    <img id="img1" src="images/araragi.jpg" 
                        class=" mt-4 mb-4 w-25  d-block mx-auto"
                        alt="araragi koyomi" />
                    <div class="comment display-6 text-center mt-3 text-wrap 
                        w-50 d-flex justify-content-center mx-auto ">
                        Good afternoon. I am very pleased with the quality 
                        of the work of your employee 
                        representing your wonderful company.Thanks for helping.  
                    </div>
                    <div class="text-center h5 mt-3 font-weight-bold">Araragi Koyomi</div>
                    <div class="text-center display-5 mt-2">Customer</div>
                </div>
                <div class="carousel-item">
                    <img id="img2" src="images/gintoki.jpg" 
                        class="mt-4 mb-4 w-25  d-block mx-auto" 
                        alt="gin" />
                     <div class="comment display-6 text-center mt-3 text-wrap 
                        w-50 d-flex justify-content-center mx-auto ">
                      Excellent client manager. He is always accurate, 
                         well punctual, all questions get answers, 
                         the company presents very attentive and positive approach.    
                    </div>
                    <div class="text-center h5 mt-3 font-weight-bold">Gintoki Sakata</div>
                    <div class="text-center display-5 mt-2">Exports Manager</div>
                </div>
                <div class="carousel-item">
                    <img id="img3" src="images/suzuha.jpg" 
                        class="mt-4 mb-4 w-25 d-block mx-auto" 
                        alt="suzuha amane" />
                    <div class="comment display-6 text-center mt-3 text-wrap 
                        w-50 d-flex justify-content-center mx-auto ">
                       All issues are resolved promptly. In communication, 
                         the employees are pleasant, helpful.Offer new ideas,
                         new ways to develop.   
                    </div>
                    <div class="text-center h5 mt-3 font-weight-bold">Suzuha Amane</div>
                    <div class="text-center display-5 mt-2">Professor</div>
                </div>
                
            </div>

            <!--left and riight control-->
            <a class="carousel-control-prev" href="#myCarousel">
                <span class="carousel-control-prev-icon "></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel">
                <span class="carousel-control-next-icon"></span>
            </a>
            </div>
        </div>

     <!--Contact Us-->
    <div class="container">
        <div class="contact_tag text-center h2 font-weight-bold text-uppercase ">
            contact us
        </div>
        <div class="container contact_us w-75 mx-auto ">
                <div id="myForm"  class="contact_form">
                    <div class="row">
                        <div class= "col-lg-4 col-md-4 col-sm-12 col-12">
                             <label  for="name">Name</label>
                             <input type="text" id="name" placeholder="Enter your Name" runat="server" />
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                            <label for="email">Email</label>
                            <input type="text" id="email" placeholder="Enter email here" runat="server" />
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                            <label for="phone">Phone</label>
                            <input type="text" id="phone" placeholder="Enter your phone number" runat="server"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label for="Message">Message</label>
                            <textarea id="message" placeholder="Your message here" runat="server"
                                style="height:200px"></textarea>
                            
                        </div>
                        
                         <asp:Button ID="Button1"  class="btn btn-success mx-auto" runat="server" Text="Send Message" OnClick="Button1_Click"  />  
                        
                    </div>
           
            </div>
        </div>
    </div>
    <script>
    
         $(document).ready(function(){
             //Activate carousel with a specific interval
               $("#myCarousel").carousel({interval:2000});
               // Enable Carousel Indicators
                 /* $(".item1").click(function(){
                    $("#myCarousel").carousel(0);
                  });
                  $(".item2").click(function(){
                    $("#myCarousel").carousel(1);
                  });
                  $(".item3").click(function(){
                    $("#myCarousel").carousel(2);
                  });*/
             //enable carousel control
                $(".carousel-control-prev").click(function(){
                    $("#myCarousel").carousel("prev");
                 });
                $(".carousel-control-next").click(function(){
                    $("#myCarousel").carousel("next");
                 });  
                  /*var obj =[];     
                  var jsonStr = '{"theTeam":[{}]}';
                  document.getElementById("Button1").addEventListener("click" , function() {
                       var data = document.getElementById("name").value;
                       var data1 = document.getElementById("email").value;
                        var data2 = document.getElementById("phone").value;
                        var data3 = document.getElementById("message").value; 
                         
                  
                  obj.push("Name: " +data +"\n");
                  obj.push("Email: " +data1+"\n");
                  obj.push("Phone: " +data2+"\n");
                  obj.push("Message: " +data3+"\n");
                  alert(obj);


var info = JSON.parse(jsonStr);
info += info['theTeam'].push(obj);
console.log(info);
jsonStr = JSON.stringify(info);
console.log(jsonStr);
alert("Your Message is saved."); 
                  /*var myJsonString = JSON.stringify(obj);
                  alert(myJsonString);*/
                  
                  /*var request = new XMLHttpRequest();
                  request.open('GET','./userMsg.json');
                  request.onload = function(){
                     if(request.status >=200 && request.status <400){
                         var myJson = request.responseText; 
                          aleet(myJson); 
                         var info = JSON.parse(request.responseText);
                         info['Response'].push(obj);
                          alert(info);
                         myJson  = JSON.stringify(info);
                         alert(myJson);
                      }else{
                          request.onerror = function(){
                           alert("connection errror");  
                         }
                       }
                   };
                  });   */  
          });
/*$(document).ready(function() {
  $("#btn").click(function(e){
     var jsonData = {};

   var formData = $("#myform").serializeArray();
  // console.log(formData);

   $.each(formData, function() {
        if (jsonData[this.name]) {
           if (!jsonData[this.name].push) {
               jsonData[this.name] = [jsonData[this.name]];
           }
           jsonData[this.name].push(this.value || '');
       } else {
           jsonData[this.name] = this.value || '';
       }


   });
   console.log(jsonData);
    $.ajax(
    {
        url : "action.php",  
        type: "POST",
        data : jsonData,

    });
    e.preventDefault(); 
});
});*/
 

  


    </script>
</asp:Content>
