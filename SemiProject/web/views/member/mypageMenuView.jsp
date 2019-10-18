<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
ul {
  list-style-type: none;
  margin: 0px;
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
}
#myPagediv{
width:550px;
margin:0 auto;
padding:5px 20px;
text-align:center;
display:inline-center;
border-bottom:3px solid #35c5f0;
}
</style>
</head>
<body>

<%@ include file = "/views/common/menubar.jsp" %> 
<hr>
<div id = "myPagediv">
<ul>
  <li><a class="active" href="<%=request.getContextPath()%>/views/member/pwdUpdateView.jsp">비밀번호변경</a></li>
  <li><a class="active" href="<%=request.getContextPath()%>/views/member/memberUpdateView.jsp">회원정보수정</a></li>
  <li><a class="active" href="<%=request.getContextPath()%>/views/member/myClaimView.jsp">취소/교환/환불</a></li>
  <li><a class="active" href="">나의리뷰</a></li>
</ul></div>
</body>
</html>