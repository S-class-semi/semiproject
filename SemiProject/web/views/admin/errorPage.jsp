<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #centerbody {
	display: inline-block;
	position: relative;
	width: 100%;
	height: 100%;
	border : 1px solid black;
	margin-left: 250px;
	}
</style>
</head>
<body>
<%@ include file = "/views/admin/adminMenuView.jsp" %>
	<div id="centerbody">
	<h1 align = "center"><%= msg %></h1>
	<a href = "<%= request.getContextPath() %>/views/admin/adminMenuView.jsp" align = "center"><h1>메인으로 돌아가기</h1></a>
	</div>
</body>
</html>