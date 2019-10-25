<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라벨</title>
<style>
.dropbtn {
  background-color: white;
  color: black;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  color:#35c5f0;
}

.dropdown {
  position: relative;
  display: inline-block;
  background-color: white;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
  color: black;
  background:white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  font-weight:bold;
}

.dropdown-content a:hover {
	background-color: #35C5F0;
	color:white;
	font-weight:bold;
	font-size:18px;
	
}

.show {display:block;}
</style>
</head>
<body>
<div class="dropdown">
  <button id="myBtn" class="dropbtn">▼</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="/SemiProject/views/member/MileageView.jsp">마일리지</a>
    <a href="/SemiProject/views/member/myBasketView.jsp">장바구니</a>
    <a href="/SemiProject/views/member/pwdUpdateView.jsp">비밀번호설정</a>
    <a href="/SemiProject/views/member/customerCenter.jsp">고객센터</a>
  </div>
</div>

<script>
document.getElementById("myBtn").onclick = function() {myFunction()};

function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}
</script>
</body>
</html>