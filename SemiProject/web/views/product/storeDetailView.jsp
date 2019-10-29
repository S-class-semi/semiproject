<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "product.model.vo.*,java.util.*"%>
    
    <%
    ProductInfo prodcutinfo = (ProductInfo)request.getAttribute("prodcutinfo");
    ArrayList<ProductImgFile> imgList = (ArrayList<ProductImgFile>)request.getAttribute("imgList");
    ProductImgFile titleImg = imgList.get(0);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style>
#category{
font-weight: bold;
font-size: 25px;
}

#categorymenu{
display:inline-block;
margin-top: 50px;
width: 250px;
position: absolute;
height: 100%;
}
#categorymenu ul li{
text-align:center;
	font-family :'Black Han Sans';
	list-style-type: none;
	font-size: 30px;
	line-height: 34px;
	cursor: pointer;
	margin-left: 10px;
	margin-top:20px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}
#category{
display: inline-block;
margin-top: 50px;
margin-left: 300px;
}

#categorymenu ul li:hover{
background-color: #ece6cc;
}

#categorymenu ul #categoryCheck{
background-color: #87ceeb;
}

#categorymenu ul #categoryname{
background-color: white;
font-size: 20px;
cursor: default;
}

.outdiv{
border: 1px solid black;
margin-top: 50px;
margin-left: 300px;
}

#titleImgArea{
border: 1px solid black;
align-content: center;
margin-left: 350px;
width: 500px;
vertical-align: center;
}

#productinfoview div{
display: inline-block;
}

#titleInfo{
vertical-align: center;
border: 1px solid black;
}
}
</style>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>

<div id ="categorymenu">
 <ul>
 	<li id="categoryname">상품 카테고리</li>
 	<li onclick = "goStoreC()">의자</li>
 	<li onclick = "goStoreT()">책상</li>
 	<li onclick = "goStoreK()">주방용품</li>
 	<li onclick = "goStoreB()">침구류</li>
 </ul> 
</div>

<div class= "outdiv">
	<form id = "productinfoview">
	<div id = "titleImgArea">
			<img id = "titleImg" src ="<%=request.getContextPath() %>/images/productimg/<%=titleImg.getChange_name() %>" width="500" height="500">
		</div>
		<div id= "titleInfo">
		<label>회사명 : </label><div id= "C_namediv"><%=prodcutinfo.getC_name() %></div><br>
		<label>상품명 : </label><div id = "P_namediv"><%=prodcutinfo.getP_name() %></div><br>
		<label>상품가격 : </label><div id = "P_pricediv"><%=prodcutinfo.getP_price() %></div><br>
		</div>
		<%for(int i=1;i<imgList.size();i++) {%>
		<div id = "contentImgArea<%=i%>">
		<img id = "contentImg<%=i%>" name = "contentImg<%=i %>" src ="<%=request.getContextPath() %>/images/productimg/<%=imgList.get(i).getChange_name() %>" width="100%" height="100%">
		</div>
		<%} %>

	</form>	
</div>
</body>
</html>