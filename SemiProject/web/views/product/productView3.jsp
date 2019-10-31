<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* Slideshow container */
.slideshow-container {
  max-width: 700px;
  position: relative;
margin-left: 100px;
margin-top: 50px;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

/* -------- */
#category{
margin-top : 50px;
margin-left: 100px;
display: inline-block;

}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card {
	overflow: hidden;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 900px;
  text-align: center;
  font-family: arial;
  display: inline;
  background-image: url("");
}

.card img{
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.card:hover img {
   
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
 } 
 
.card:hover{
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
}
#c_proinfo{
display:inline-block;
}

.card #c_proinfo label{
text-align: left;
}

#c_Name{
font-size: 10px;
font-style: bold;
}
#c_proinfo #c_Name{
align-content: left;
}
#c_proinfo{
border: 1px soild black;
padding-left: 20px;
}

#c_proinfo #p_Name{
font-size: 20px;
font-weight: bold;
}

#c_proinfo #p_Price{
font-size: 22px;
font-family: 'Black Han Sans';
text-align: right;
margin-left: 150px;
}

</style>
</head>
<body>
<div style="display: inline-block;margin-left: 200px;">
<!-- Slideshow container -->

<div class="slideshow-container">
	<h1>진짜 이거 안보고 갈꺼야?</h1>
  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext" >1 / 3</div>
    <img src="<%=request.getContextPath()%>/images/productimg/2019103018040653038.jpg" style="width:100%" onclick="gotoday1()">
    <input type="hidden" id="imgnum1" name = "imgnum1 "value="2019103018040653038.jpg">
  </div>

  <div class="mySlides fade">
    <div class="numbertext">2 / 3</div>
    <img src="<%=request.getContextPath()%>/images/productimg/2019103017132390549.jpg" style="width:100%" onclick="gotoday2()">
    <input type="hidden" id="imgnum2" name = "imgnum2 "value="2019103017132390549.jpg">
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 3</div>
    <img src="<%=request.getContextPath()%>/images/productimg/2019103017143092481.jpg" style="width:100%" onclick="gotoday3()">
    <input type="hidden" id="imgnum3" name = "imgnum3 "value="2019103017143092481.jpg">
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="margin-left: 300px;">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
</div>
</div>
	
	<div id="category" style="display: inline-block;">
	<h1 style="margin-bottom: 100px;">오늘의 베스트 상품</h1>
		<div class="card">
			<img src="<%=request.getContextPath()%>/images/productimg/2019103019210147518.jpg" width="820px" height="460px" onclick="gotoday4()">
			<input type="hidden" id="imgnum4" name = "imgnum4 "value="2019103019210147518.jpg">
		</div>
	</div>
	<script>
	
	function gotoday1(){
		var imgnum = $("#imgnum1").val();
		location.href = "<%=request.getContextPath()%>/today.pro?imgnum="+imgnum;
	}
	function gotoday2(){
		var imgnum = $("#imgnum2").val();
		location.href = "<%=request.getContextPath()%>/today.pro?imgnum="+imgnum;
	}
	function gotoday3(){
		var imgnum = $("#imgnum3").val();
		location.href = "<%=request.getContextPath()%>/today.pro?imgnum="+imgnum;
	}
	function gotoday4(){
		var imgnum = $("#imgnum4").val();
		location.href = "<%=request.getContextPath()%>/today.pro?imgnum="+imgnum;
	}
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
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
}
</script>


</body>
</html>