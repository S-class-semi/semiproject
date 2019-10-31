<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

a{
text-decoration:none;
}
a:hover{color:#1bc1a3;}


#wrapper{
    width:1000px;
    margin-left:470px;
    height:800px;
    position:relative;
    color:#fff;
    text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;    
    padding: 0;
    display: inline-block;
}

#slider-wrap{
    width:1000px;
    height:800px;
    position:relative;
    overflow:hidden;
    padding: 0px;
}

#slider-wrap ul#slider{
    width:100%;
    height:100%;
    padding:0;
    position:absolute;
    top:0;
    left:0;     
}

#slider-wrap ul#slider li{
    float:left;
    position:relative;
    width:1000px;
    height:800px;   
}

#slider-wrap ul#slider li > div{
    position:absolute;
    top:20px;
    left:35px;  
}

#slider-wrap ul#slider li > div h3{
    font-size:36px;
    text-transform:uppercase;   
}

#slider-wrap ul#slider li > div span{
    font-family: Neucha, Arial, sans serif;
    font-size:21px;
}

#slider-wrap ul#slider li img{
    display:block;
    width:100%;
  height: 100%;
}


/*btns*/
.btnstyle{
    position:absolute;
    width:50px;
    height:60px;
    top:50%;
    margin-top:-25px;
    line-height:57px;
    text-align:center;
    cursor:pointer; 
    background:rgba(0,0,0,0.1);
    z-index:100;
    
    
    -webkit-user-select: none;  
    -moz-user-select: none; 
    -khtml-user-select: none; 
    -ms-user-select: none;
    
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    -ms-transition: all 0.1s ease;
    transition: all 0.1s ease;
}

.btnstyle:hover{
    background:rgba(0,0,0,0.3); 
}

#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
    top: 30px; 
    right:35px; 
    width:auto;
    position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*bar*/
#pagination-wrap{
    min-width:20px;
    margin-top:350px;
    margin-left: auto; 
    margin-right: auto;
    height:15px;
    position:relative;
    text-align:center;
}

#pagination-wrap ul {
    width:100%;
    
}

#pagination-wrap ul li{
    margin: 0;
    display: inline-block;
    width:5px;
    height:5px;
    border-radius:50%;
    background:#fff;
    opacity:0.5;
    position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{

  width:12px;
  height:12px;
  top:3px;
  opacity:1;
  box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}


/*Header*/
h1, h2{text-shadow:none;}
h1{ color: #666; text-transform:uppercase;  font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 




/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
    -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    transition: all 0.3s cubic-bezier(1,.01,.32,1); 
}
/* ------------------ */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  margin-top: 30px;
  margin-bottom: 30px;
  text-align: center;
  font-family: arial;
  display: inline-block;
}

#footerhr{
border: 1px solid white;
}



#category{
font-weight: bold;
font-size: 25px;
}

.c_pro_name {
	color:black;
  font-size: 20px;
  font-weight:bold;
  display:inline-block;
}

.price2{
   font-size:28px;
   color:black;
   display:inline-block;
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

.card:hover {
  opacity: 0.7;
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
text-align: left;
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
#category{
display: inline-block;
margin-top: 50px;
margin-left: 300px;
}
</style>
</head>
<body>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
	
<div id="wrapper">
<h1 style="margin-left: 200px;">오늘 이거 안사면 진짜 후회한다.</h1>
      <div id="slider-wrap">
          <ul id="slider">
             <li data-color="#1abc9c">
                <div>
                    <h3>이쁜검정색조립식책상</h3>
                    <span>가격 : 30000</span>
                </div>                
<img src="<%=request.getContextPath()%>/images/productimg/2019103017195172551.jpg" onclick="gotostor1()">
<input type="hidden" id="imgnum1" name = "imgnum1 "value="2019103017195172551.jpg">
             </li>
             
             <li data-color="#3498db">
                <div>
                    <h3>H형 1280사이즈 검정</h3>
                    <span>가격 : 50000</span>
                </div>
<img src="<%=request.getContextPath()%>/images/productimg/2019103017211375742.jpg" onclick="gotostor2()">
<input type="hidden" id="imgnum2" name = "imgnum2 "value="2019103017211375742.jpg">
             </li>
             
             <li data-color="#9b59b6">
                <div>
                    <h3>찻잔선반</h3>
                    <span>가격 : 3000</span>    
                </div>
<img src="<%=request.getContextPath()%>/images/productimg/2019103017585064772.jpg" onclick="gotostor3()">
<input type="hidden" id="imgnum3" name = "imgnum3 "value="2019103017585064772.jpg">
             </li>
             
             <li data-color="#34495e">
                <div>
					<h3>원룸을 독서실처럼</h3>
                    <span>가격 : 70000</span>
                </div>
<img src="<%=request.getContextPath()%>/images/productimg/201910301808527539.jpg" onclick="gotostor4()">
<input type="hidden" id="imgnum4" name = "imgnum4 "value="201910301808527539.jpg">
             </li>
             
             <li data-color="#e74c3c">
                <div>
                    <h3>자세히보면매직아이</h3>
                    <span>가격 : 30000</span>
                </div>
<img src="<%=request.getContextPath()%>/images/productimg/2019103019183087774.jpg" onclick="gotostor5()">
<input type="hidden" id="imgnum5" name = "imgnum5 "value="2019103018002989693.jpg">
             </li>
             
             
          </ul>
          
           <!--controls-->
          <div class="btnstyle" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btnstyle" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
      </div>
  
   </div>
   
<%--    <div id="category" style="display: inline-block;">
	<div>이것도 괜찮지 않아?</div>
		<div class="card">
			<img src="<%=request.getContextPath()%>/images/maining5.jpeg"
				width="300px" height="382px">
		</div>
	</div> --%>
<script>

function gotostor1(){
	var imgnum = $("#imgnum1").val();
	location.href = "<%=request.getContextPath()%>/today.pro?imgnum="+imgnum;
}
function gotostor2(){
	var imgnum = $("#imgnum2").val();
	location.href = "<%=request.getContextPath()%>/today.pro?imgnum="+imgnum;
}
function gotostor3(){
	var imgnum = $("#imgnum3").val();
	location.href = "<%=request.getContextPath()%>/today.pro?imgnum="+imgnum;
}
function gotostor4(){
	var imgnum = $("#imgnum4").val();
	location.href = "<%=request.getContextPath()%>/today.pro?imgnum="+imgnum;
}
function gotostor5(){
	var imgnum = $("#imgnum5").val();
	location.href = "<%=request.getContextPath()%>/today.pro?imgnum="+imgnum;
}

//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();


$(document).ready(function(){
    
    
    /*****************
     BUILD THE SLIDER
    *****************/
    //set width to be 'x' times the number of slides
    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
    
    //next slide    
    $('#next').click(function(){
        slideRight();
    });
    
    //previous slide
    $('#previous').click(function(){
        slideLeft();
    });
    
    
    
    /*************************
     //*> OPTIONAL SETTINGS
    ************************/
    //automatic slider
    var autoSlider = setInterval(slideRight, 3000);
    
    //for each slide 
    $.each($('#slider-wrap ul li'), function() { 

       //create a pagination
       var li = document.createElement('li');
       $('#pagination-wrap ul').append(li);    
    });
    
    //counter
    countSlides();
    
    //pagination
    pagination();
    
    //hide/show controls/btns when hover
    //pause automatic slide when hover
    $('#slider-wrap').hover(
      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
    );
});//DOCUMENT READY
/***********
 SLIDE LEFT
************/
function slideLeft(){
    pos--;
    if(pos==-1){ pos = totalSlides-1; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
    
    //*> optional
    countSlides();
    pagination();
}
/************
 SLIDE RIGHT
*************/
function slideRight(){
    pos++;
    if(pos==totalSlides){ pos = 0; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
    
    //*> optional 
    countSlides();
    pagination();
}

/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
    $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
    $('#pagination-wrap ul li').removeClass('active');
    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}
        
</script>
</body>
</html>