<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
hr{
	border: 1px solid #D5D5D5;
}
ul {
  width:600px;
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #ffffff;
  
}

li {
  float: left;
  font-weight:bold;
  color:black;
  font-size:18px;
}

li a {
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: white;
  color:#35c5f0;
  position:relative;
  font-weight:bold;
  border-bottom:3px solid #35c5f0;
}
#myPagediv{
	display:table;
	width:300px;
	height:60px;
	margin:0 auto;
	margin-top:100px;
	
}
</style>
</head>
<body>

<%@ include file = "/views/common/menubar.jsp" %> 
<div id = "myPagediv">
<ul>
  <li><a class="active" href="<%=request.getContextPath()%>/views/member/pwdUpdateView.jsp">비밀번호변경</a></li>
  <li><a class="active" href="<%=request.getContextPath()%>/views/member/UpdatememberView.jsp">회원정보수정</a></li>
  <li><a class="active" href="<%=request.getContextPath()%>/views/member/myClaimView.jsp">취소/교환/환불</a></li>
  <li><a class="active" href="#">나의리뷰</a></li>
</ul>
</div>
<hr>
</body>
</html>