<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Vellfire.aspx.cs" Inherits="CarRental.Vellfire" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"/>
    <link href="css/StyleSheet4.css" type="text/css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
       <div class="mt-3 h2 text-left text-weight-bold mb-3">Toyota Vellfire Images<br /></div>
       <div class="horizontal  m-auto "></div>
       <div class="intro text-italic text-muted text-left mt-3 mb-3">See the latest Vellfire images.Your car has 14 more images for you to see.</div>
       <br /><br />

       <div class="mySlides">
    <div class="numbertext">1 / 14</div>
    <img src="images/vellfire/1.jpg"  style="width:100%"/>
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 14</div>
    <img src="images/vellfire/2.jpg"  style="width:100%"/>
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 14</div>
    <img src="images/vellfire/3.jpg"  style="width:100%"/>
  </div>
    
  <div class="mySlides">
    <div class="numbertext">4 / 14</div>
    <img src="images/vellfire/4.jpg" style="width:100%"/>
  </div>

  <div class="mySlides">
    <div class="numbertext">5 / 14</div>
    <img src="images/vellfire/5.jpg" style="width:100%">
  </div>
    
  <div class="mySlides">
    <div class="numbertext">6 / 14</div>
    <img src="images/vellfire/6.jpg" style="width:100%"/>
  </div>
    <div class="mySlides">
    <div class="numbertext">7 / 14</div>
    <img src="images/vellfire/7.jpg" style="width:100%"/>
  </div>
   <div class="mySlides">
    <div class="numbertext">8 / 14</div>
    <img src="images/vellfire/8.jpg" style="width:100%"/>
  </div>
   <div class="mySlides">
    <div class="numbertext">9 / 14</div>
    <img src="images/vellfire/9.jpg" style="width:100%"/>
  </div>
   <div class="mySlides">
    <div class="numbertext">10 / 16</div>
    <img src="images/vellfire/10.jpg" style="width:100%"/>
  </div>
   <div class="mySlides">
    <div class="numbertext">11 / 14</div>
    <img src="images/vellfire/11.jpg" style="width:100%"/>
  </div>
   <div class="mySlides">
    <div class="numbertext">12 / 14</div>
    <img src="images/vellfire/12.jpg" style="width:100%"/>
  </div>
   <div class="mySlides">
    <div class="numbertext">13 / 14</div>
    <img src="images/vellfire/13.jpg" style="width:100%"/>
  </div>
    <div class="mySlides">
    <div class="numbertext">14 / 14</div>
    <img src="images/vellfire/14.jpg" style="width:100%"/>
  </div>
  
  

  <a class="prev" style="color:darkseagreen;" onclick="plusSlides(-1)">❮</a>
  <a class="next" style="color:darkseagreen;" onclick="plusSlides(1)">❯</a>

  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <div class="row">
    <div class="column">
      <img class="demo cursor" src="images/vellfire/1.jpg" style="width:100%" onclick="currentSlide(1)" alt="Angular Front">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/vellfire/2.jpg" style="width:100%" onclick="currentSlide(2)" alt="Front">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/vellfire/3.jpg" style="width:100%" onclick="currentSlide(3)" alt="Side View">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/vellfire/4.jpg" style="width:100%" onclick="currentSlide(4)" alt="Mirror">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/vellfire/5.jpg" style="width: 100%" onclick="currentSlide(5)" alt="Wheel">
    </div>    
    <div class="column">
      <img class="demo cursor" src="images/vellfire/6.jpg" style="width:100%" onclick="currentSlide(6)" alt="Front Headlight">
    </div>
      <div class="column">
      <img class="demo cursor" src="images/vellfire/7.jpg" style="width:100%" onclick="currentSlide(7)" alt="Rear Backlight">
    </div>
      <div class="column">
      <img class="demo cursor" src="images/vellfire/8.jpg" style="width:100%" onclick="currentSlide(8)" alt="Back Seat">
    </div>
      <div class="column">
      <img class="demo cursor" src="images/vellfire/9.jpg" style="width:100%" onclick="currentSlide(9)" alt="Steering Wheel">
    </div>
      <div class="column">
      <img class="demo cursor" src="images/vellfire/10.jpg" style="width:100%" onclick="currentSlide(10)" alt="Steer Control">
    </div>
      <div class="column">
      <img class="demo cursor" src="images/vellfire/11.jpg" style="width:100%" onclick="currentSlide(11)" alt="Trunk">
    </div>
      <div class="column">
      <img class="demo cursor" src="images/vellfire/12.jpg" style="width:100%" onclick="currentSlide(12)" alt="Roof">
    </div>
      <div class="column">
      <img class="demo cursor" src="images/vellfire/13.jpg" style="width:100%" onclick="currentSlide(13)" alt="Trunk Angular View">
    </div>
      <div class="column">
      <img class="demo cursor" src="images/vellfire/14.jpg" style="width:100%" onclick="currentSlide(14)" alt="Wheel">
    </div>
      
  </div>
   </div>
    <!--video could not be added for large size -->
    <div class="container">
        <div class="mt-3 h2 text-left text-weight-bold mb-3 ml-0 pl-0">Toyota Vellfire Videos<br /></div>
       <div class="horizontal  m-auto "></div><br />
        <!--<video controls loop width="350">
            <source src="video/2020 Toyota Vellfire review - First Drive - OVERDRIVE - YouTube.mp4" type="video/mp4" />
        </video>-->
    </div>

    <br /><br />
    <div class="container mb-5">
        <div class="mt-3 h2 text-left text-weight-bold mb-3 ml-0 pl-0">Toyota Vellfire Reviews<br /></div>
       <div class="horizontal  m-auto "></div><br />
        
       <div class="row mb-2">
           <div class="col-lg-4 col-md-4 col-sm-12 col-12">
               <div class="facility  text-dark p-2">
                   <span class="fontr-weight-bolder"><code><mark>Highs</mark></code></span> Enjoyable handling, excellent gas mileage, impressive list of standard tech features.
               </div>
           </div>
           <div class="col-lg-4 col-md-4 col-sm-12 col-12">
               <div class="cons  text-dark p-2">
                   <span class="fontr-weight-bolder"><code><mark>Lows</mark></code></span> Certain key driver-assistance features are absent, not as quick as some rivals, lacks cargo capacity.
               </div>
           </div>
           <div class="col-lg-4 col-md-4 col-sm-12 col-12">
               <div class="result  text-dark p-2">
                   <span class="fontr-weight-bolder"><code><mark>Verdict</mark></code></span> Though rival models offer more cargo space and a wider range of driver-assistance features, the Yaris impresses with its pleasant driving dynamics and frugal fuel economy.
               </div>
           </div>
       </div>
        <div class="row">
            <div class="col-lg-10">
               
            </div>
            <div class="col-lg-2 float-right mt-3 mb-3"><asp:Button ID="Button1" class="btn btn-success btn-block "  runat="server"                            
                Text="Proceed to Booking" OnClick="Button1_Click"  data-toggle="modal" data-target="#exampleModalCenter" />
        </div>

       </div>
    </div>
    
    <br /><br />
    <script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}

</script>
</asp:Content>
