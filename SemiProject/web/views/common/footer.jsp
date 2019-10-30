<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#footer{
   background: black;
   color: white;
   width: 100%;
   height: 180px;
   font-size: 14px;
}
</style>

</head>
<body>

<div id="footer">
   <br>
   <p align="center">회사명: (주) 난혼자산다    대표: 장준하   대표전화: 010-1234-1234</p>
   <p align="center">주소: 서울특별시 강남구 테헤란로14길 6 남도빌딩 4층 S-CLASS</p>
   <p align="center">이메일: livealone1199@gmail.com</p>
   <p align="center">copyright © 2019 by 난혼자산다 all rights reserved.</p>
</div>

<script>
    // 태그가 전부 그려진 후에 실행 할 수 있도록 한다.
    $(document).ready(function () {
        resize();
    });
    // 화면 크기가 변경될 때 마다 동적으로 사이즈를 조정한다.
    $(window).on('resize', function () {
        resize();
    });

    function resize() {
        if (window.innerHeight > $('html').height()) {
            $('#footer').css('position', 'absolute');
            $('#footer').css('bottom', '0');
        } else {
            $('#footer').css('position', 'relative');
        }
    }
</script>
</body>
</html>