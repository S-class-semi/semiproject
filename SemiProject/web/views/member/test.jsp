<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.Member" %>
     
<%
   Member loginUser = (Member)session.getAttribute("loginUser");
%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="author" content="webstoryboy">
    <meta name="description" content="반응형 사이트 따라하기">
    <meta name="keywords" content="반응형사이트, 웹퍼블리셔, 웹접근성, HTML5, webstoryboy, webs">
    <title>반응형 사이트 만들기 : 사이드 이펙트3</title>

    <!-- style -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/lightgallery.css">

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="icon/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="icon/favicon-152.png">
    <link rel="icon" href="path/to/favicon.png">
    <link rel="icon" href="icon/favicon-16.png" sizes="16x16"> 
    <link rel="icon" href="icon/favicon-32.png" sizes="32x32"> 
    <link rel="icon" href="icon/favicon-48.png" sizes="48x48"> 
    <link rel="icon" href="icon/favicon-64.png" sizes="64x64"> 
    <link rel="icon" href="icon/favicon-128.png" sizes="128x128">

    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">


    <style>
        /* reset */
        /* 여백 초기화 */
        body,div,ul,li,dl,dd,dt,ol,h1,h2,h3,h4,h5,h6,input,fieldset,legend,p,select,table,th,td,tr,textarea,button,form,figure,figcaption{margin:0;padding:0;}

        /* a 링크 초기화 */
        a {color: #222; text-decoration: none;}
        a:hover {color: #2698cb;}

        /* 폰트 초기화 */
        body, input, textarea, select, button, table {font-family:  'Nanum Gothic', AppleSDGothicNeo-Regular,'Malgun Gothic','맑은 고딕',dotum,'돋움',sans-serif; color: #222; font-size: 13px; line-height: 1.6;}
        
        /* 폰트 스타일 초기화 */
        em,address {font-style: normal;}

        /* 블릿기호 초기화 */
        ul,li,ol {list-style: none;}
 
        /* 제목 태그 초기화 */
        h1,h2,h3,h4,h5,h6 {font-size: 13px; font-weight: normal;}
         
        /* 버튼 초기화 */
        button {border: 0;}
        
        /* 반응형 */
        img {width: 100%;}
        
        /* clearfix */
        .clearfix{*zoom:1;}
        .clearfix:before, .clearfix:after {display: block; content: '';line-height: 0;}
        .clearfix:after {clear: both;}

        /* IR 효과 */
        .ir_pm {display:block; overflow:hidden; font-size:0; line-height:0; text-indent:-9999px;} /* 의미있는 이미지의 대체 텍스트를 제공하는 경우(Phark Method) */
        .ir_wa {display:block; overflow:hidden; position:relative; z-index:-1; width:100%; height: 100%;} /* 의미있는 이미지의 대체 텍스트로 이미지가 없어도 대체 텍스트를 보여주고자 할 때(WA IR) */
        .ir_su {overflow: hidden; position:absolute; width:0; height:0; line-height:0; text-indent:-9999px;} /* 대체 텍스트가 아닌 접근성을 위한 숨김 텍스트를 제공할 때 */
        
        /* margin, padding */
        .mt10 {margin-top: 10px !important;}
        .mt15 {margin-top: 15px !important;}
        .mt20 {margin-top: 20px !important;}
        .mt25 {margin-top: 25px !important;}
        .mt30 {margin-top: 30px !important;}
        .mt35 {margin-top: 35px !important;}
        .mt40 {margin-top: 40px !important;}
        .mt45 {margin-top: 45px !important;}
        .mt50 {margin-top: 50px !important;}

        /* style */
        /* 레이아웃 */
        body {background: url(image/header_bg.jpg) repeat-x center top;}
        #header {  }
        #nav {background-color: #f6fdff; height:100%;}
        #title {background-color: #eaf7fd;}
        #contents .container {border-right: 1px solid #dbdbdb; border-left: 1px solid #dbdbdb;}
        #cont_left {float: left; width: 250px;}
        #cont_center {
            overflow: hidden; 
            margin-right: 250px; 
            min-height: 1300px; 
            /* border-right: 1px solid #dbdbdb; 
               오른쪽 메뉴는 메인 페이지에만 보여줄거다.
            */ 
            border-left: 1px solid #dbdbdb;
        }
        #cont_right {position: absolute; right: 0; top: 0px; width: 250px;}
        #footer {border-top: 1px solid #dbdbdb;}

        /* 컨테이너 */
        .container {position: relative; width: 1200px; margin: 0 auto; /* background: rgba(0,0,0,0.3) */}

        /* 헤더 */
        #userHeader{display: inline-block; } 
        
        .header {height: 200px;} 
        .header .header_menu {text-align: right;}
        .header .header_menu a {color: #fff; padding: 8px 0 6px 10px; display: inline-block; transition: color 0.3s ease; font-family: 'Abel', sans-serif;}
        .header .header_menu a:hover {color: #ccc;}
        
        .header .header_tit { text-align: center; text-transform: uppercase; margin-top: 55px; font-family: 'Abel', sans-serif;}
        .header .header_tit h1 {
            font-size: 30px; 
            color: #fff; 
            background: #51b0dc; 
            display: inline-block; 
            padding: 5px 30px 5px 30px; 
            letter-spacing: 2px; 
            font-weight: 900;
            transition: box-shadow 0.25s ease-in-out;
        }
        .header .header_tit h1:hover {
            box-shadow: 
                inset -12em 0 0 0 #257FAC, 
                inset 12em 0 0 0 #257FAC;
        }
        .header .header_tit a {
            font-size: 16px; 
            color: #fff; 
            background: #4a9abf;  
            display: inline-block; 
            padding: 10px 20px 10px 20px; 
            margin-top: -7px; 
            transition: box-shadow 0.3s ease-in-out;
        }
        .header .header_tit a:hover {
            box-shadow: 
                0 0 0 5px rgba(75,154,191,0.9) inset,
                0 0 0 100px rgba(0,0,0,0.1) inset;
        }
        
        .header .header_icon {text-align: center; margin-top: 40px; padding-bottom: 45px;}
        .header .header_icon li {display: inline; margin: 0 2px;}
        .header .header_icon li a {
            position: relative;
            background-color: #3192bf;
            border-radius: 50%;
            width: 60px; 
            height: 60px;  
            color: #fff;
            display: inline-block;
            font-size: 35px;
            line-height: 60px;
            transition: all 0.3s ease;
        }
        .header .header_icon li a span {
            position: absolute; 
            opacity: 0;
            left: 50%; top: -40px;
            transform: translateX(-50%);
            font-size: 12px;
            line-height: 1.6;
            background: #3192bf; 
            padding: 3px 9px;
            border-radius: 6px 0;
            transition: all 0.3s ease;
        }
        .header .header_icon li a span:before {
            content: '';
            position: absolute;
            left: 50%; bottom: -5px;
            margin-left: -5px;
            border-top: 5px solid #3192bf;
            border-left: 5px solid transparent;
            border-right: 5px solid transparent;
        }
        .header .header_icon li a:hover span {
            opacity: 1;
            top: -33px;
        }
        .header .header_icon li a:hover {
            box-shadow: 
                0 0 0 3px rgba(75,154,191,0.9) inset,
                0 0 0 100px rgba(0,0,0,0.1) inset;
        }
        
        /* 전체 메뉴 */
        .nav {overflow: hidden; padding: 25px 0; display: none; }
        .nav > div {float: left; width: 200px; /* width: 40%; */}
        .nav > div:last-child {width: 20%;}
        .nav > div ol {overflow: hidden; }
        .nav > div li {float: left; width: 50%; position: relative; padding-left: 8px; /* box-sizing: border-box; */}
        .nav > div:last-child li {width: 100%;}
        .nav > div li a {position: relative;}
        .nav > div li:before {
            content: '';
            width: 3px; height: 3px;
            background-color: #25a2d0;
            border-radius: 50%;
            position: absolute; left: 0; top: 8px;
        }
        .nav > div h3 {
            font-size: 18px; 
            color: #25a2d0; 
            font-weight: bold; 
            margin-bottom: 4px;
        }
        .nav > div li a:after {
            content: '';
            display: inline-block;
            width: 0;
            height: 1px;
            position: absolute;
            bottom: 0;
            left: 0;
            background: #25a2d0;
            transition: all .2s ease-out;
        }
        .nav > div li:hover a:after {width: 100%; }
        
   
        /* 타이틀 */
        .title {position: relative; text-align: center; }
        .title h2 {font-family: 'Nanum Brush Script', cursive; font-size: 39px; color: #0093bd; padding: 5px 0;}
        
        .title .btn {
            position: absolute; right: 0; top: 5px;
            width: 60px; 
            height: 60px; 
            line-height: 60px; 
            background: #3192bf; 
            color: #fff;
            font-size: 20px; 
            border-radius: 50%;
            transition: all 0.3s ease;
            cursor:pointer;
        }
          
         .title .btn :hover {
            box-shadow: 
                0 0 0 3px rgba(75,154,191,0.9) inset,
                0 0 0 600px rgba(0,0,0,0.1) inset;
        }
        
        /* 컨텐츠 영역 */
        .column {padding: 15px; border-bottom: 1px solid #dbdbdb;}
        .column .col_tit {font-size: 20px; color: #2f7fa6; padding-bottom: 5px;}
        .column .col_desc {
            border-bottom: 1px dashed #dbdbdb; 
            padding-bottom: 15px; margin-bottom: 15px;  
            color: #878787;
            line-height: 18px;
        }
        .column.col1 {} 
        .column.col2 {} 
        .column.col3 {border-bottom: 0;} 
        .column.col4 {} 
        .column.col5 {} 
        .column.col6 {border-bottom: 0;} 
        .column.col7 {} 
        .column.col8 {} 
        .column.col9 {border-bottom: 0;} 
        
        /* 메뉴 */
        .menu li {position: relative;}
        
        
        .menu li a {
            font-size: 16px; text-transform: uppercase; 
            color: #878787; border-bottom: 1px solid #dbdbdb; 
            padding: 10px; 
            display: block;  
            transition: box-shadow 0.34s ease, background 0.34s ease;
        }
        .menu li a i {position: absolute; right: 10px; top: 15px;}
        .menu li a:hover {
            box-shadow: inset 180px 0 0 0 rgba(36,130,174,0.7); 
            color: #fff; 
            background: rgba(36,130,174,0.9);
        }
        
        /* 게시판1 */
        .notice1 {position: relative;  }
        .notice1 h5 {font-size: 14px; color: #2f7fa6; padding-bottom: 5px;}
        .notice1 li {position: relative; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; padding-left: 8px;}
        .notice1 li:before {
           content: ''; width: 3px; height: 3px; 
            border-radius: 50%;
            background: #449ce2; 
            position: absolute; left: 0; top: 6px;
        }
        .notice1 .more {
            position: absolute; 
            right: 0; top: 3px; 
            color: #878787; 
            text-transform: uppercase;
            font-size: 10px;
        }
        
        /* 게시판2 */
        .notice2 {position: relative;  }
        .notice2 h5 {font-size: 14px; color: #2f7fa6; padding-bottom: 5px;}
        .notice2 li {
            position: relative; 
            overflow: hidden; 
            text-overflow: ellipsis; 
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp : 2;
            padding-left: 8px;
            padding-bottom: 5px;
            max-height: 40px; /* ie */
        }
        .notice2 li:before {
            content: ''; width: 3px; height: 3px; 
            border-radius: 50%;
            background: #449ce2; 
            position: absolute; left: 0; top: 6px;
        }
        .notice2 .more {
            position: absolute; 
            right: 0; top: 3px; 
            color: #878787; 
            text-transform: uppercase;
            font-size: 10px;
        }
        
        /* 블로그1 */
        .blog1 img {width: 100%;}
        .blog1 .img-retina {display: none;}
        
        @media only screen and (-webkit-min-device-pixel-ratio: 1.5),
               only screen and (min-device-pixel-ratio: 1.5),
               only screen and (min-resolution: 1.5dppx) {
                .blog1 .img-retina {display: initial;}
                .blog1 .img-normal {display: none;}
        }

        /* 블로그2 */
        .blog2 h5 {color: #fff; text-align: center; padding: 30px 30px; text-transform: uppercase;}
        .blog2 p {padding-top: 5px;}
        .blog2 .img-retina {
            background-image: url(image/blog3_@1.jpg);
            background-size: cover;
        } 
        @media only screen and (-webkit-min-device-pixel-ratio: 1.5),
               only screen and (min-device-pixel-ratio: 1.5),
               only screen and (min-resolution: 1.5dppx) {
                .blog2 .img-retina {background-image: url(image/blog3_@2.jpg);}
        }
        
        /* 이미지 슬라이드 */
        .slider figure {position: relative;}
        .slider figcaption {position: absolute; bottom: 0; left: 0; width: 100%; padding: 20px;
            box-sizing: border-box;
            background-color: rgba(0,0,0,0.5);
            color: #fff;
            font-size: 18px;
        }
        .slider figcaption em {
            display: block; 
            font-weight: bold; font-size: 28px; text-transform: uppercase; font-family: 'Abel', sans-serif;
            opacity: 0;
            transform: translateX(50px);
            transition: all .84s ease;
        }
        .slider figcaption span {
            display: block;
            overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
            opacity: 0;
            transform: translateX(50px);
            transition: all .84s 0.2s ease;
        }
        .slider .slick-active figcaption em {opacity: 1; transform: translateX(0)}
        .slider .slick-active figcaption span {opacity: 1; transform: translateX(0)}
        
        .slider .slick-dots {display: block; width: 100%; text-align: center;}
        .slider .slick-dots li {display: inline-block; width: 15px; height: 15px; margin: 5px;}
        .slider .slick-dots li button {
            font-size: 0; 
            line-height: 0; 
            display: block; 
            width: 15px; height: 15px;
            cursor: pointer; 
            background: #5dbfeb; 
            border-radius: 50%;
        }
        .slider .slick-dots li.slick-active button {background: #2b91c8;}
        .slider .slick-prev {
            position: absolute; left: 0; bottom: 0; 
            z-index: 1000;
            width: 30px; height: 30px; 
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            text-indent: -9999px;
        }
        .slider .slick-prev::before {
            content: "\f053";
            color: #5dbfeb;
            text-indent: 0;
            position: absolute; left: 9px; top: 8px;
        }
        .slider .slick-next {
            position: absolute; right: 0; bottom: 0; 
            z-index: 1000;
            width: 30px; height: 30px; 
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            text-indent: -9999px;
        }
        .slider .slick-next::before {
            content: "\f054";
            color: #5dbfeb;
            text-indent: 0;
            position: absolute; left: 11px; top: 8px;
        }
        
        /* 라이트 박스 */
        .square a {float: left; width: 19%; margin: 0.5%; position: relative; overflow: hidden;  }
        .square a img {width: 100%; display: block;}
        .square a em {background: rgba(0,0,0,0.77); color: #fff; width: 100%; text-align: center; position: absolute; left:0; bottom: -30px; opacity: 1; transition: all .3s ease;}
        .square a:hover em {bottom: 0; background: rgba(0,0,0,0.57); }
        .square a:nth-child(1):hover img {filter: blur(2px);}
        .square a:nth-child(2):hover img {filter: brightness(50%);}
        .square a:nth-child(3):hover img {filter: contrast(10%);}
        .square a:nth-child(4):hover img {filter: grayscale(100%);}
        .square a:nth-child(5):hover img {filter: hue-rotate(120deg);}
        .square a:nth-child(6):hover img {filter: invert(100%);}
        .square a:nth-child(7):hover img {filter: opacity(10%);}
        .square a:nth-child(8):hover img {filter: saturate(10%);}
        .square a:nth-child(9):hover img {filter: sepia(120%);}
        .square a:nth-child(10):hover img {filter: sepia(120%) hue-rotate(120deg);}
        
        /* 비디오 */
        .video {position: relative; width: 100%; padding-bottom: 56.25%;}
        .video iframe {position: absolute; width: 100%; height: 100%;}
        
        /* 푸터 */
        .footer {text-align: center; padding: 30px 50px; }
        .footer li {position: relative; display: inline; padding: 0 7px 0 10px; white-space: nowrap;}
        .footer li:before {content: ''; width: 1px; height: 12px; background-color: #dbdbdb; position: absolute; left: 0; top: 2px;}
        .footer li:first-child:before {width: 0;}
        .footer address {padding-top: 15px;}
        
        /* 사이드 이펙트1 */
        .side1 {position: relative; display: block; perspective: 600px;}
        .side1 .front {
            transform-style: preserve-3d;
            transform: rotateY(0deg);
            transition: all 0.5s ease-in-out;
            backface-visibility: hidden;
        }
        .side1 .back {
            position: absolute; top: 0; left: 0; 
            width: 100%; height: 100%; z-index: -1;
            transform-style: preserve-3d;
            color: #fff;
            background: #4038DC;
            text-align: center;
            transform: rotateY(-180deg);
            transition: all 0.5s ease-in-out;
            backface-visibility: hidden;
        }
        .side1 .back i {position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        .side1:hover .front {transform: rotateY(180deg);}
        .side1:hover .back {transform: rotateY(0deg); z-index: 1;}
        
        /* 사이드 이펙트2 */
        .side2 {position: relative; display: block; perspective: 600px;}
        .side2 .front {
            transform-style: preserve-3d;
            transform: rotateY(0deg);
            transition: all 0.5s ease-in-out;
            backface-visibility: hidden;
        }
        .side2 .back {
            position: absolute; top: 0; left: 0; 
            width: 100%; height: 100%; z-index: -1;
            transform-style: preserve-3d;
            transform: rotateY(-180deg);
            transition: all 0.5s ease-in-out;
            backface-visibility: hidden;
        }
        .side2 .front figcaption {
            position: absolute; left: 50%; top: 50%;
            transform: translate(-50%,-50%) translateZ(100px);
            display: block;
            text-align: center;
        }
        .side2 .back figcaption {
            position: absolute; left: 50%; top: 50%;
            transform: translate(-50%,-50%) translateZ(100px);
            color: #fff;
            font-size: 20px;
            display: block;
            text-align: center;
        }
        .side2 figcaption {width: 60%;}
        .side2 figcaption h3 {color: #fff; font-size: 20px; font-family: 'Abel', sans-serif; font-weight: bold; background: rgba(0,0,0,0.4); padding: 3px 10px;}
        .side2 figcaption p {font-size: 14px;}
        .side2:hover .front {transform: rotateY(180deg);}
        .side2:hover .back {transform: rotateY(0deg); z-index: 1;}
        
        /* 사이드 이펙트3 */
        .side3 {position: relative; overflow: hidden; background: #000;}
        .side3 figcaption {
            position: absolute;
           top: 50%; left: 50%;
            color: #fff;
            text-align: center;
            opacity: 0;
            text-transform: uppercase;
            transition: all 0.3s ease;
           transform: translate(350%, -50%) rotate(180deg);
        }
        .side3 figcaption:after {
            content: '';
            width: 100px; height: 100px; 
            background: #000; 
            border-radius: 50%;
            position: absolute; left: 50%; top: 50%; z-index: -1;
            transform: translate(-50%, -50%);
        }
        .side3 figcaption h3 {font-size: 16px;}
        .side3 figcaption em {display: block; font-weight: bold;}
        .side3 img {display: block; transition: all 0.3s ease;}
        .side3:hover img {opacity: 0.4;}
        .side3:hover figcaption {transform: translate(-50%, -50%) rotate(0deg); opacity: 1;}
        
        
        /* mediaquery */
        /* 화면 너비 0~1220px */
        @media (max-width: 1220px){
            .container {width: 100%;}
            .row {padding: 0 15px; }
            #cont_center {min-height: 1350px;}
           #contents .container {border: 0;}
            
            .title .btn {right: 15px;}
            .square a {width: 24%}
           .square a:nth-child(5n) {display: none;}
        }
        
        /* 화면 너비 0~1024px */
        @media (max-width: 1024px){
            .square a {width: 32.33333%}
           .square a:nth-child(5) {display: block;}
        }
        
        /* 화면 너비 0~960px */
        @media (max-width: 960px){
            #cont_right {position: static; width: 100%; border-top: 1px solid #dbdbdb;}
           #cont_center {margin-right: 0; border-right: 0;}
            
            .nav > div {float: none; width: 100%;}
            .nav > div:last-child {width: 100%;}
            .nav > div li {width: 33.333%;}
            .nav > div:last-child li {width: 33.333%;}
            .nav > div ol {margin-bottom: 10px;}
            
            #cont_right {overflow: hidden;}
            #cont_right .column {float: left; width: 33.333%; box-sizing: border-box;}
            #cont_right .column.col7 {border-right: 1px solid #dbdbdb; border-bottom: 0;}
            #cont_right .column.col8 {border-right: 1px solid #dbdbdb; border-bottom: 0;}
        }
        
        /* 화면 너비 0~768px */
        @media (max-width: 768px){
            #cont_left {float: none; width: 100%;}
           #cont_center {border-left: 0;}
        }
        
        /* 화면 너비 0~600px */
        @media (max-width: 600px){
            .header {height: auto;}
            .nav > div li {width: 50%;}
           .nav > div:last-child li {width: 50%;}
            
            .header .header_tit {display: none;}
            .header .header_icon {display: none;}
            .title .btn {display: none;}
            .column.col1 .col_tit {display: none;}
            .column.col1 .col_desc {display: none;}
            .column.col1 .menu li a i {display: none;}
            .column.col1 {padding: 0; border-bottom: 0;}
            .column.col1 .menu ul {overflow: hidden;}
            .column.col1 .menu li {float: left; width: 33.33333%; text-align: center; border-right: 1px solid #dbdbdb; box-sizing: border-box;}
            .column.col1 .menu li:nth-child(3n) {border-right: 0;}
            .column.col1 .menu li a {color: #fff; text-shadow: 0 0 5px rgba(0,0,0,0.7);}
            .column.col1 .menu li a:hover {box-shadow: none; background: rgba(36,130,174,0.3);}
            .column.col2 {background: #fff;}
           .column.col4 {border-top: 1px solid #dbdbdb;}
            
            #cont_right .column {width:50%;}
            #cont_right .column.col8 {border-right: 0;}
            #cont_right .column.col9 {display: none;}
            
            .slider figcaption {padding: 10px;}
            .slider figcaption em {font-size: 18px;}
            .slider figcaption span {font-size: 14px;}
            
            .square a {width: 49%}
           .square a:nth-child(5) {display: none;}
        }
        
        /* 화면 너비 0~480px */
        @media (max-width: 480px){

        }

        /* 화면 너비 0~320px */
        @media (max-width: 320px){
            #cont_right .column {width:100%;}
           #cont_right .column.col7 {border-right: 0; border-bottom: 1px solid #dbdbdb;}
            .square a {width: 100%; margin-left:0; margin-right: 0;}
        }
        
        























/* 작업중 */

   /*====================
      Search form 
   ====================*/
   
   .searchform {
      position: absolute;
      right: 15px;
      top: 5px;
      width: 360px;
      line-height: 60px;
      display: inline-block;
      zoom: 1;
      *display: inline;
      border: 0;
      padding: 0;
   }
   
   #loginForm{
      position: absolute;
      right: 15px;
      top: 5px;
      width: 2350px;
      line-height: 60px;
      display: inline-block;
      zoom: 1;
      *display: inline;
      border: 0;
      padding: 0;   
   }
   
   .goHome{
      display: inline-block;
      position: absolute; 
      /* right: 0; */ 
      left:0;
      top: 0px;  
      width: 60px; 
      height: 60px; 
      line-height: 60px; 
      background: #3192bf; 
      color: #fff; 
      font-size: 20px; 
      border-radius: 50%;
      transition: all 0.3s ease;
      cursor:pointer;   
   }
   
   .goHome:hover {
      box-shadow: 
          0 0 0 3px rgba(75,154,191,0.9) inset,
          0 0 0 600px rgba(0,0,0,0.1) inset;
   }
   
   
   .btns{
      position: absolute;
      display: inline-block;
   }
   
   .searchform input {
      font: normal 12px/100% Arial, Helvetica, sans-serif;
   }
   .searchform .searchfield {
      height: 27px;
      line-height: 27px;
      padding-left: 10px;
      padding-right: 10px;
      width: 150px;
      border: 2px solid #3192bf;
      outline: none;
      -webkit-border-radius: 2em;
      -moz-border-radius: 2em;
      border-radius: 2em;
      -moz-box-shadow: inset 1px 1px 2px #A1A1A1;
      -webkit-box-shadow: inset 1px 1px 2px #A1A1A1;
      box-shadow: inner 1px 1px 2px #A1A1A1;
   }
   
   .searchfield:focus{
      font-weight: 700;
      width: 220px;
   }
   
   .searchfield:not(:focus){
      width: 150px;
   }

   /*====================
      설문 Now 메뉴
   ====================*/
   .btn2 {
      display: inline-block;
      position: absolute; 
      /* right: 0; */ 
      left:0;
      top: 5px;
      width: 60px; 
      height: 60px; 
      line-height: 60px; 
      background: #3192bf; 
      color: #fff; 
      font-size: 20px; 
      border-radius: 50%;
      transition: all 0.3s ease;
      cursor:pointer;
      /* display: none; */
   }

   .btn2:hover {
      box-shadow: 
          0 0 0 3px rgba(75,154,191,0.9) inset,
          0 0 0 600px rgba(0,0,0,0.1) inset;
   }

   /* 메뉴 상단 고정  */
      .jbFixed { 
         width:100%;
         position: fixed;
         z-index:1000;
         top: 0px;
      }
      .menuHeader:hover{
            box-shadow: inset 180px 0 0 0 rgba(36,130,174,0.7); 
            color: #fff;  
              background: rgba(36,130,174,0.9);
            box-shadow: none;
      }
       .lowMenu{   
         font-size: 13px; 
         text-transform: uppercase; 
         color: #878787; 
         right: -20px;
         padding: 5px; 
         display: block;  
         transition: box-shadow 0.34s ease, background 0.34s ease;
         width:190px;
      }      
       .lowMenu:hover{   
         box-shadow: inset 180px 0 0 0 rgba(233, 161, 13, 0.8);
         color: #fff; 
         /* background: rgba(36,130,174,0.9); */
         background: rgba(233, 161, 13, 0.9);
         cursor:pointer;
      }
      
      .sideMenu{
         display:none;
      }
      
      .menuTest{
/*          background:black;
         color:white;
         text-align:center; */
         vertical-align:middle;

      }
      /* <a href="#"> 
      버튼 처럼 만들기위해 이렇게 a 태그가 먹어있으면 겉으로 파란색의 테두리가 생긴다.
       href="#" 를 뺀 이유는 클리시 최상단으로 올라가게 되어있어서
       */
      a{
         cursor:pointer;
      }
      
      .menuTest:hover{
/*          background:darkgray;
         color:orangered;
         font-wight:bold; */ 
         cursor:pointer;
      }      

       .contentsTest{
         /* border:1px solid lightgray; */
         width:300px; 
         height:100%;     
         /* display:none; */ 
         /* display:blick; */
         display:none;
         color:orangered;
      }


      .serchMenu{
      display:blick;
         vertical-align:middle;
      }


/*          main { min-height:100vh; } */
        
        
    </style>
</head>
<body>

    <header id="header">
        <div class="container">
            <div class="row">
                <div class="header">
                    <div class="header_menu">

                    <%if(loginUser != null) {%>
                          <div class="userHeader">
                           <label> <%=loginUser.getNickname() %> 하이? </label>  
                              <a id="myPage" <%-- onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'" --%>>정보수정</a>
                           <a id="logoutBtn" onclick="logout()">로그아웃</a>                    
                        </div>     
                  <%} else{%>
<%--                           <form id ="loginForm" action="<%=request.getContextPath()%>/login.me" onsubmit="return validate()" method="post">                       --%>
                        <!-- <div class="userHeader"> -->              
                           <label> 로그인 이름 </label>   
                              <a id="myPage"  <%-- onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'" --%>>정보수정</a>
                              <a id="logoutBtn" onclick="logout()">로그아웃</a>
                        <!-- </div> -->     
<!--                         </form> -->
                   <%} %>        
                    </div>
                    
                    <!-- //header_menu -->
                    <div class="header_tit">
                        <h1>여기에 이미지 슬라이드를 넣어야 될거같은데</h1><br>
                        <a href="http://www.iei.or.kr">kh 정보 교육원</a>
                    </div>
                    <!-- //header_tit --> 
                    
                </div>
            </div>
        </div>
    </header>
    <!-- //nav -->
    
   <article id="title" class="jbMenu">
         <a href="#" class="btn"></a>
      <div class="container">
         <div class="title">
         
<%-- <a href="#" class="btn2"  onclick="location.href='/surveyNow/login.me?userId=<%=loginUser.getUserId()%>'"><i class="fa fa-angle-down" aria-hidden="true"></i><span class="ir_su">전체메뉴 보기</span></a> --%>
            <!-- <div href="#" class="btn2" onclick="goHome()" -->
<%-- <a href="#" ><h3 class="menuHeader" onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">마이메뉴</h3> </a> --%>
 
<!--             <div href="#" class="btn2" onMouseOver="this.innerHTML='GoGo'" onMouseOut="this.innerHTML='Home'">
               <i class="fa fa-angle-down" aria-hidden="true"></i><span>Home</span></div> -->
               
                <form id ="loginForm" <%-- action="<%=request.getContextPath()%>/login.me" --%> 
                              onsubmit="return validate()" method="get">
                     <div class="btns" align="center">
                     <input type="submit" value="홈" class="goHome">
                        <input type="hidden" name="userId" id = "userId" <%-- value="<%=loginUser.getUserId() %>" --%>>
                     <input type="hidden" name="userPwd" id = "userPwd" <%-- value="<%=loginUser.getUserPwd() %>" --%>>
                     </div>
               </form>   
                  
               
               <h2>난 혼자 산다</h2>

               
               <!-- Search Form -->
               <form class="searchform" action="#"> 
                  <input class="searchfield" type="text" value="Search..." onfocus="if (this.value == 'Search...') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search...';}" />
               </form>
               <!-- / Search Form -->
   
            <div href="#" class="btn"
               onMouseOver="this.innerHTML='Click'"
               onMouseOut="this.innerHTML='Menu'"
            ><i class="fa fa-angle-down" aria-hidden="true"></i><span>Menu</span></div>
         </div>
      </div>
   
    
    
    <nav id="nav" ><!-- class="jbMenu" --> 
      <div class="container">
         <div class="row">
            <div class="nav">
               <h2 class="ir_su">전체 메뉴</h2>
               <div>
                     <!-- <h3>마이메뉴</h3> -->
                     <a href="#" ><h3 class="menuHeader" <%-- onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'" --%>>마이메뉴</h3> </a>
                     
                     <ol>
                         <li><a href="#">HTML 태그(Tag)</a></li>
                         <li><a href="#">블록 요소/인라인 요소</a></li>
                         <li><a href="#">DTD 선언</a></li>
                         <li><a href="#">언어 속성 설정</a></li>
                         <li><a href="#">HTML &lt;title&gt;</a></li>
                         <li><a href="#">HTML &lt;meta&gt;</a></li>
                     </ol>
                 </div>
                 <div>
                     <a href="#" ><h3 class="menuHeader">설문</h3> </a>
                     <ol>
                         <li><a href="#">가나다</a></li>
                         <li><a href="#">라마바</a></li>
                         <li><a href="#">사아자</a></li>
                         <li><a href="#">차카타</a></li>
                         <li><a href="#">파하</a></li>
                     </ol>
                 </div> 
                 <div>
                     <a href="#" ><h3 class="menuHeader">공지사항</h3> </a>
                     <ol>
                         <li><a href="#">가나다</a></li>
                         <li><a href="#">라마바</a></li>
                         <li><a href="#">사아자</a></li>
                         <li><a href="#">차카타</a></li>
                         <li><a href="#">파하</a></li>
                     </ol>
                 </div>
                 <div>
                     <a href="#" ><h3 class="menuHeader">추가 1</h3> </a>
                     <ol>
                         <li><a href="#">가나다</a></li>
                         <li><a href="#">라마바</a></li>
                         <li><a href="#">사아자</a></li>
                         <li><a href="#">차카타</a></li>
                         <li><a href="#">파하</a></li>
                     </ol>
                 </div>
                 
                 <div>
                     <a href="#" ><h3 class="menuHeader">추가 2</h3> </a>
                     <ol>
                         <li><a href="#">가나다</a></li>
                         <li><a href="#">라마바</a></li>
                         <li><a href="#">사아자</a></li>
                         <li><a href="#">차카타</a></li>
                         <li><a href="#">파하</a></li>
                     </ol>
                 </div>
                 
            </div>
         </div>
      </div>
   </nav>
   </article>
   <!-- //nav -->
<!--    
    <article id="title" class="jbMenu">
      <div class="container">
         <div class="title">
            <h2>"설문 NOW"</h2>
            <a href="#" class="btn"><i class="fa fa-angle-down" aria-hidden="true"></i><span class="ir_su">전체메뉴 보기</span></a>
         </div>
      </div>
   </article> -->
   <!-- //title -->
   
    <!-- <main> -->
        <section id="contents">
            <div class="container">
            <h2 class="ir_su">반응형 사이트 컨텐츠</h2>
                <section id="cont_left">
                    <h3 class="ir_su">메뉴 및 게시판 컨텐츠 영역</h3>
                    <article class="column col1">
                        <h4 class="col_tit">Menu</h4>      

 
             <div class="menu">
               <li class="menuTest" value="3"><a>공지사항 <i class="fa fa-angle-double-right" aria-hidden="true" ></i></a></li>
                  <ul class="contentsTest" >
                     <li class="lowMenu">테이블</li>
                     <li class="lowMenu">의자</li>
                  </ul>
                  
               <li class="menuTest" value="0"><a>상품 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                  <ul class="contentsTest">
                     <li class="lowMenu" onclick = "doSurvey();">설문 참여하기</li>
                     <li class="lowMenu" onclick="makeSurvey();">설문 만들기</li>
                     <li class="lowMenu" onclick="holdSurvey();">작성된 설문</li>
                     <li class="lowMenu" onclick="ingSurvey();">진행중인 설문</li>
                     <li class="lowMenu" onclick="finishedSurvey();">완료된 설문</li>
                     <li class="lowMenu" onclick="deletedSurvey();">삭제한 설문</li>
                     <li class="lowMenu" onclick="purchaseSurvey();">설문 결제하기</li>
                  </ul>   
                  
               <li class="menuTest" value="0"><a>자유게시판 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                  <ul class="contentsTest" >
                     <li class="lowMenu">회원 조회</li>
                     <li class="lowMenu">패널 랭킹</li>
                  </ul>
               <li class="menuTest"><a>조명 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                  <ul class="contentsTest">
                     <li class="lowMenu">상품 등록</li>
                     <li class="lowMenu">상품관리</li>
                  </ul>
                     
               <li class="menuTest" value="0"><a>홈데코 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                  <ul class="contentsTest">
                     <li class="lowMenu">상품 등록</li>
                     <li class="lowMenu">상품관리</li>
                  </ul>
                     
               <li class="menuTest" value="0"><a>가전 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                  <ul class="contentsTest">
                     <li class="lowMenu">상품 등록</li>
                     <li class="lowMenu">상품관리</li>
                  </ul>   
               </div>
                     

                  <!--//메뉴 -->
                    </article>
                    <!-- //col1 -->
                    
                    <article class="column col2">
                  <h4 class="col_tit">게시판</h4>
                  <!-- <p class="col_desc">게시판 영역의 한줄 효과와 두줄 효과 게시판입니다.</p> -->
                  <!-- 게시판 -->
                  <div class="notice1">
                     <h5>게시판 제목1</h5>
                     <ul>
                        <li><a href="#">한 줄 씩 만 나 온 다!</a></li>
                        <li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
                        <li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
                        <li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
                        <li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
                     </ul>
                     <a href="#" class="more" title="더 보기">More <i class="fa fa-plus-circle" aria-hidden="true"></i></a>
                  </div>
                  <!--//게시판 -->
                  <!-- 게시판2 -->
                  <div class="notice2 mt15">
                     <h5>게시판 제목2</h5>
                     <ul>
                        <li><a href="#">두 줄 씩 만 나 온 다!</a></li>
                        <li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
                        <li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
                        <li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
                        <li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
                     </ul>
                     <a href="#" class="more" title="더 보기">More <i class="fa fa-plus-circle" aria-hidden="true"></i></a>
                  </div>
                  <!--//게시판2 -->
               </article>
                    
                    <article class="column col3">
                  <h4 class="col_tit">Blog</h4>
                  <!-- <p class="col_desc">해상도에 따라 이미지를 다르게 표현하는 방법입니다.</p> -->
                 
               </article>
               <!-- //col3 -->
                </section>
                

                
                <!-- //cont_left -->
                
<!--                 <section id="cont_center"> -->

                
<!--
                    <h3 class="ir_su">반응형 사이트 가운데 컨텐츠</h3>
                    
                     <article class="column col4">
                        <h4 class="col_tit">Slick Slider</h4>
                  <p class="col_desc">slick.js를 이용한 이미지 슬라이드 효과입니다.</p>
                  이미지 슬라이드
                  <div class="slider">
                     <div>
                                <figure>
                                    <img src="image/slider001.jpg" alt="이미지1">
                                    <figcaption><em>Responsive Site</em><span>슬라이드 플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span></figcaption>
                                </figure>
                        </div>
                     <div>
                                <figure>
                                    <img src="image/slider001.jpg" alt="이미지2">
                                    <figcaption><em>Responsive Site</em><span>슬라이드 플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span></figcaption>
                                </figure>
                        </div>
                        <div>
                                <figure>
                                    <img src="image/slider001.jpg" alt="이미지3">
                                    <figcaption><em>Responsive Site</em><span>슬라이드 플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span></figcaption>
                                </figure>
                        </div>
                  </div>
                  //이미지 슬라이드
                    </article> -->
                    
                    
                    <!-- //col4 --> 
                    
                    <!-- <article class="column col5"> -->
<!--                         <h4 class="col_tit">Filter Effect</h4>
                  <p class="col_desc">CSS3에서는 Background-blend-mode, mix-blend-mode, filter와 같이 포토샵에 다루는 효과들이 있습니다.</p>
                  lightbox
                  <div class="lightbox square clearfix">
                     <a href="image/light01_s.jpg"><img src="image/light01.jpg" alt="이미지"><em>blur</em></a>
                     <a href="image/light02_s.jpg"><img src="image/light02.jpg" alt="이미지"><em>brightness</em></a>
                     <a href="image/light03_s.jpg"><img src="image/light03.jpg" alt="이미지"><em>contrast</em></a>
                     <a href="image/light04_s.jpg"><img src="image/light04.jpg" alt="이미지"><em>grayscale</em></a>
                     <a href="image/light05_s.jpg"><img src="image/light05.jpg" alt="이미지"><em>hue-rotate</em></a>
                     <a href="image/light06_s.jpg"><img src="image/light06.jpg" alt="이미지"><em>invert</em></a>
                     <a href="image/light07_s.jpg"><img src="image/light07.jpg" alt="이미지"><em>opacity</em></a>
                     <a href="image/light08_s.jpg"><img src="image/light08.jpg" alt="이미지"><em>saturate</em></a>
                     <a href="image/light09_s.jpg"><img src="image/light09.jpg" alt="이미지"><em>sepia</em></a>
                     <a href="image/light10_s.jpg"><img src="image/light10.jpg" alt="이미지"><em>Mix</em></a>
                  </div> -->
                  <!--//lightbox -->
                    <!-- </article> -->
                    <!-- //col5 -->
                    
        <!--             <article class="column col6">
                   <h4 class="col_tit">Video</h4>
                  <p class="col_desc">영상을 보여주는 영역입니다.</p>
                  video
                  <video autoplay="autoplay" controls="controls" loop="loop">
                     <source src="img/video.mp4" type="video/mp4">
                  </video>
                  <div class="video">
                     <iframe src="https://www.youtube.com/embed/tHy498wdPaA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                  </div> 
               </article> -->
               <!-- //col6 -->
<!--                 </section> -->
                <!-- //cont_center -->
                <!-- <section id="cont_right">
                    <h3 class="ir_su">반응형 사이트 오른쪽 컨텐츠</h3>
                    <article class="column col7">
                        <h4 class="col_tit">Effect1</h4>
                  <p class="col_desc">CSS3의 transform을 이용한 마우스 오버효과입니다.</p>
                  side1
                  <div class="side1">
                            <figure class="front">
                                <img src="image/side1.jpg" alt="이미지2">
                            </figure>
                            <div class="back">
                                <i class="fa fa-heart fa-4x" aria-hidden="true"></i>
                            </div>
                        </div>
                        side1//
                    </article>
                    //col7
                    
                    <article class="column col8">
                        <h4 class="col_tit">Effect2</h4>
                  <p class="col_desc">CSS3의 transform을 이용한 마우스 오버효과입니다.</p>
                  side2
                  <div class="side2">
                            <figure class="front">
                                <img src="image/side2.jpg" alt="이미지2">
                                <figcaption>
                                    <h3>Hover Effect</h3>
                                </figcaption>
                            </figure >
                            <figure class="back">
                                <img src="image/side4.jpg" alt="이미지2">
                                <figcaption>
                                    <h3>Hover Effect</h3>
                                </figcaption>
                            </figure>
                        </div>
                        side2//
                    </article>
                    //col8
                    
                    <article class="column col9">
                        <h4 class="col_tit">Effect3</h4>
                  <p class="col_desc">CSS3의 transform을 이용한 마우스 오버효과입니다.</p>
                  side3
                  <div class="side3">
                            <figure>
                                <img src="image/side3.jpg" alt="이미지3">
                                <figcaption>
                                    <h3>Hover<em>Effect</em></h3>
                                </figcaption>
                            </figure>
                        </div>
                        side3//
                    </article>
                    //col9
                </section> -->
                <!-- //cont_right -->
            </div>
        </section>
        <!-- //contents -->

    </main>

<!--     <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="footer">
                    <ul>
                        <li><a href="#">사이트 도움말</a></li>
                        <li><a href="#">사이트 이용약관</a></li>
                        <li><a href="#">사이트 운영원칙</a></li>
                        <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                        <li><a href="#">책임의 한계와 법적고지</a></li>
                        <li><a href="#">게시중단요청서비스</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                    <address>
                        Copyright &copy;
                        <a href="http://webstoryboy.co.kr"><strong>webstoryboy</strong></a>
                        All Rights Reserved.
                    </address>
                </div>
            </div>
        </div>
    </footer> -->
    <!-- //footer -->
    
    <!-- JavaScript Libraries -->
<!--     <script src="js/jquery.min_1.12.4.js"></script>
    <script src="js/modernizr-custom.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/lightgallery.min.js"></script> -->
    
    
<!--SDB_20191018_사이드 메뉴 .. IF문이 너무 많다 더럽다. 가독성최악이네...  
   이렇게 if문을 많이 한 이유가. 
      contentsTest 태그가 첫번째 태그만 잡힌다.. (밑에 태그들 클릭시 출력값은 contentsTest태그 처음것만 나오네.? : 이유는 모름)
   코드 줄여주면 감사합니다.
-->
      <script> 
   $(function(){
       $('.menuTest').click(function(){ 


         if($(this).next(".contents").css("display")=="block"){
            $(this).next().siblings(".contentsTest").slideUp();
//alert("1");
            if($(this).next(".contents").css("display")=="block"){
               $(this).addClass("contents");
//alert("2");
               if($(this).next(".contents").css("display")=="block"){
                  $(this).next(".contents").slideUp();
                  $(this).removeClass('contents');
//alert("3");
               }
            }
            
         } else {
            $(this).next().slideDown(function(){
               $(this).addClass("contents");
//alert("4");
            });
//alert("5");
            if($(this).next(".contents").css("display")=="block"){
               $(this).addClass("contents");
               $(this).next().siblings(".contentsTest").slideUp();
//alert("6");
            }else{
//alert("7");               
               $(this).next().siblings(".contentsTest").slideUp();
            }
         }
      });
   }); 
   </script>
    
    
<!--STR  메뉴상단 고정  script ----------------------------------------------------------------------->
   <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
<!--END  메뉴상단 고정  script ----------------------------------------------------------------------->
    
<!--STR 화면 onclick 이벤트 ------------------------------------------------------------------------>
   <script>
      // 게시판 작업 시작(공지사항 관련된 작업이 끝나면)
      function goBoard(){
         location.href="<%=request.getContextPath()%>/list.bo"
         //BoardListServlet.java 만들기
      }
      
      // logout() 함수 작성하기
      function logout(){
         location.href = '<%=request.getContextPath()%>/logout.me';
         
         // LogoutServlet 만들기~ 꼬꼬씽~
      }
      
       function goHome(){
         <%-- //location.href="<%=request.getContextPath()%>/views/common/mainLoing.jsp"; --%>
         <%-- location.href='<%=request.getContextPath()%>/login.me?userId=<% userId %>'; --%>
         
         
         
         <%-- <form id ="loginForm" action="<%=request.getContextPath()%>/login.me" onsubmit="return validate()" method="post"> --%>
      }       
      
      
   </script>
<!--END 화면 onclick 이벤트 ------------------------------------------------------------------------>
 
 
    
    <script>
        //접기/펼치기
        $(".btn").click(function(e){
            e.preventDefault();
            $(".nav").slideToggle();
            $(".btn").toggleClass("open");
            //var btn = $(".btn").find(">i").attr("class");
            //alert(btn);

            if($(".btn").hasClass("open")){
                //open이 있을 때
                $(".btn").find(">i").attr("class","fa fa-angle-up");
            } else {
                //open이 없을 때
                $(".btn").find(">i").attr("class","fa fa-angle-down");
            }
        });
        
        
<%--         $(".btn2").click(function(e){
            e.preventDefault();
            location.href="<%=request.getContextPath()%>/views/common/mainLoing.jsp";
        }); --%>
        
/*         $(window).resize(function(){
            var wWidth = $(window).width();
            if(wWidth > 600){
                $(".nav").removeAttr("style");
            }
        }); */
        
/*         //라이트 박스
        $(".lightbox").lightGallery({
            thumbnail: true,
            autoplay: true,
            pause: 3000,
            progressBar: true
        }); 

        //이미지 슬라이더
        $(".slider").slick({
         dots: true,
         autoplay: true,
         autoplaySpeed: 3000,
         arrows: true,
         responsive: [
             {
                breakpoint: 768,
                settings: {
                    autoplay: false,
                  }
             }
         ]
      }); */

    </script>





<!-- 화면 맨아래 보이게 -->
<%-- <%@ include file="../common/footer.jsp" %> 
.. ... 일단 나중에... 흘

--%>




</body>




</html>