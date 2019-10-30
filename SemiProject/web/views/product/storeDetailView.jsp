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
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
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
box-shadow: 0 4px 8px 0 rgba(0, 0, 0.2, 0.2);
margin-top: 50px;
margin-left: 300px;
}

#titleImgArea{
 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
align-content: center;
margin-left: 350px;
width: 500px;
vertical-align: center;
}

div{
display: inline-block;
}

#titleInfo{
vertical-align: center;
width: 500px;
height: 500px;
}
#titleInfo table{
margin-top: 50px;
margin-left:50px;
}

table tr td #c_namelabel{
font-size: 10px;
}

table tr td #C_namediv{
font-size: 15px;
font-weight: bold;
}
table tr td #p_namelabel{
font-size: 30px;
font-weight:bold;
}

table tr td #P_namediv{
font-size: 40px;
font-weight:bold;
}
table tr td #p_pricelabel{
font-size :25px;
font-weight:bold;
}

table tr td #P_pricediv{

font-size :40px;
font-weight:bold;
}


#subimg{
font-family :'Black Han Sans';

margin-left: 600px;
font-size: 40px;

border-bottom-left-radius: 10px;
border-bottom-right-radius: 10px;
border-top-left-radius: 10px;
border-top-right-radius: 10px;

}
#p_proinfodiv{
background-color: #dcdcdc;
width: 100%
}
#p_proinfoname{
font-family:'Jua';
font-size:20px;
font-weight: bold;
border-bottom-left-radius: 10px;
border-bottom-right-radius: 10px;
border-top-left-radius: 10px;
border-top-right-radius: 10px;

}
#p_proinfoview{
font-size: 12px;
background-color: #e9e9e9;
}
table tr td div{
display:inline;
text-align: center;
}
table tr td div img{
 display: block;
  margin: 0px auto; 
}
img{
display: block;
margin-left: auto;
margin-right: auto;
}

#imgstyle{
width: 100%;
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
	<div id = "titleImgArea">
			<img id = "titleImg" src ="<%=request.getContextPath() %>/images/productimg/<%=titleImg.getChange_name() %>" width="500" height="500">
		</div>
		<div id= "titleInfo">
		<input type= "hidden" id = "p_codelabel" value= "<%=prodcutinfo.getP_code()%>">
		<table>
		<tr>
		<td colspan="2"><label id="c_namelabel">회사명 : </label><div id= "C_namediv"><%=prodcutinfo.getC_name() %></div></td>
		</tr>
		<tr>
		<td colspan="2"><label id="p_namelabel">상품명  </label></td>
		</tr>
		<tr>
		<td colspan="2"><div id = "P_namediv"><%=prodcutinfo.getP_name() %></div></td>
		</tr>
		<tr>
		<td colspan="2"><label id ="p_pricelabel">가격  </label></td>
		</tr>
		<tr>
		<td colspan="2"><div id = "P_pricediv"><%=prodcutinfo.getP_price() %></div></td>
		</tr>
		<tr>
		<td>수량</td>
		<td><input type="number" id="c_count" name="c_count" min="0" max="10" value="1" step="1"></td>
		</tr>
		<tr>
		<td><button type="submit" onclick ="paymovelist()">구매하기</button></td>
		<td><button type="submit" onclick ="maket()">장바구니</button></td>
		</tr>
		</table>
		</div>
		<br clear="both">
		<hr>
		<div id = "subimg">상품 정보</div>
		<hr>
		
		<%for(int i=1;i<imgList.size();i++) {%>
		<div id = "imgstyle">
		<div id = "contentImgArea<%=i%>">
		<img id = "contentImg<%=i%>" name = "contentImg<%=i %>" src ="<%=request.getContextPath() %>/images/productimg/<%=imgList.get(i).getChange_name() %>" width="100%">
		</div>
		</div>
		<%} %>
		
		<div id ="p_proinfodiv">
		<div id = "p_proinfoname">상세정보</div><br>
		<div id="p_proinfoview"><%=prodcutinfo.getP_info() %></div>
		
		</div>
</div>
<script>
function goStoreC(){
	 location.href='<%=request.getContextPath() %>/storeC.pro';
	}

	//책상
	function goStoreT(){
	 location.href='<%=request.getContextPath() %>/storeT.pro';
	}
	//주방용품
	function goStoreK(){
	 location.href='<%=request.getContextPath() %>/storeK.pro';
	}
	//침구류
	function goStoreB(){
	 location.href='<%=request.getContextPath() %>/storeB.pro';
	}


	function paymovelist(){
		<% if(loginUser != null ){%>
		var p_code = $("#p_codelabel").val();
		var c_name = $("#C_namediv").html();
		var c_count = $("#c_count").val();
		alert(p_code);
		alert(c_name);
		alert(c_count);
		var payinfoview = p_code + "/" + c_name + "/" +c_count ;
		 location.href='<%=request.getContextPath() %>/list.pay?payinfoview='+payinfoview;
	<% } else{ %>
		alert("로그인 해야 구매페이지로 이동합니다..");		
	<%} %>
	}
	
	

	
	
</script>
<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>