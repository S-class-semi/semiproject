<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semi4조 난 혼자 산다 !</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	body{
		background-color: white;
	}
	.mainmenu{
		align-content: center;
	}
	.menu{
		background: rgb(160, 200, 220);
		color : white;
		text-align : center;
		vertical-align: middle;
		width :150px;
		height : 50px;
		display:table-cell;
	}
	.menu:hover{
		background : rgb(220, 200, 130);
		font-wight: bold;
		cursor:pointer;
	}
</style>
</head>
<body>
	<a href = "<%=request.getContextPath() %>/NewFile.jsp"><h1">난 혼자 산다</h1></a><br>
	<div class = "mainmenu">
		<div class = "bar">
			<div class = "menu" onclick ="goNotich()">공지사항</div>
			<div class = "menu" onclick ="goProduct()">상품카테고리</div>
			<div class = "menu" onclick ="goBoard();">자유게시판</div>
			
			
		</div>
	</div>
	
	<Script>
		function goNotich(){
			location.href = "<%=request.getContextPath()%>/list.no";
		}
		function goNotich(){
			location.href = "<%=request.getContextPath()%>/list.pro";
		}
		function goNotich(){
			location.href = "<%=request.getContextPath()%>/list.bo";
		}
	</Script>
</body>
</html>