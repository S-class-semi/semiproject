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
	.maingoing{
		font-size : 15px;
		font-color : balck;
		font-family: 굴림;
	}
	.bar > div{
		display: table-cell;
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
	
	.hometrans{
		margin-left: 100px;
	}
	
	#homeicon:hover{
		-webkit-transform:scale(2,2);
	}
</style>
</head>
<body>

		<div class="bar" align="left">
			<div></div>
			<div id= "hometrans">
				<a href ="<%=request.getContextPath() %>/NewFile.jsp"> <img id="homeicon"
					src="<%=request.getContextPath()%>/images/home.png" width="50px"
					height="50px"></a>
			</div>
			<div id="maingoing">난 혼자 산다</div>
			<div class="menu" onclick="goNotich()">공지사항</div>
			<div class="menu" onclick="goProduct()">상품카테고리</div>
			<div class="menu" onclick="goBoard();">자유게시판</div>
		</div>
		<hr>
		<%-- <a href = "<%=request.getContextPath() %>/NewFile.jsp"><h1">난 혼자 산다</h1></a><br>
	 --%>




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