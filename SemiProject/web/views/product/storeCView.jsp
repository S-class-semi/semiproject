<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "product.model.vo.* , java.util.ArrayList"%>
    <%
    ArrayList<ProductInfo> all_pro = (ArrayList<ProductInfo>)request.getAttribute("all_pro"); 
    ArrayList<ProductImgFile> imgList = (ArrayList<ProductImgFile>)request.getAttribute("imgList");
    %>
<!DOCTYPE html>
<html>
<head>

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
  display: inline-block;
}


#category{
font-weight: bold;
font-size: 25px;
}

.c_pro_name {
	color:black;
  font-size: 20px;
  font-weight:bold;
  display:inline-block;
}

.price2{
   font-size:28px;
   color:black;
   display:inline-block;
}
.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card:hover {
  opacity: 0.7;
}

.card #c_proinfo label{
text-align: left;
}
#c_Name{
font-size: 10px;
font-style: bold;
}
#c_proinfo #c_Name{
align-content: left;
}
#c_proinfo{
text-align: left;
padding-left: 20px;
}

#c_proinfo #p_Name{
font-weight: bold;

}

#c_proinfo #p_Price{
font-size: 22px;
font-family: 'Black Han Sans';
text-align: right;
margin-left: 150px;
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
}
</style>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>

<div id ="categorymenu">

 <ul>
 	<li id="categoryname">상품 카테고리</li>
 	<li id="categoryCheck" onclick = "goStoreC()">의자</li>
 	<li onclick = "goStoreT()">책상</li>
 	<li onclick = "goStoreK()">주방용품</li>
 	<li onclick = "goStoreB()">침구류</li>
 </ul> 
</div>

	<div id = "category">
 <% for(ProductInfo p : all_pro){%>
 	<%for(ProductImgFile img : imgList){%>
 		<%if(p.getC_name().equals(img.getC_name()) && p.getP_code().equals(img.getP_code()) ){%>
 			<%if(img.getFile_level() == 0) {%>
			<div class="card">
				<img src="<%=request.getContextPath()%>/images/productimg/<%=img.getChange_name()%>" width="100%" height="300px">
				<div id = "c_proinfo">
				<input type= "hidden" name="c_nameusb" value="<%=p.getC_name()%>"><label id="c_Name"><%=p.getC_name()%></label><br>
				<input type= "hidden" name="p_codeeusb" value="<%=p.getP_code() %>">
				<input type= "hidden" name="p_nameusb" value= "<%=p.getP_name() %>"><label id ="p_Name"><%=p.getP_name()%></label><br>
				<label id = "p_Price"><%=p.getP_price() %></label>
				</div>
			</div>
			<%} %>
		<%} %>
	<%} %>
<%} %>
</div>
<%@ include file = "/views/common/footer.jsp" %>
<script>
//의자
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

function proinfo(){
	location.href="<%=request.getContextPath() %>/storedetail.pro";
}

$(function(){
	$(".card").click(function(){
		console.log("실행되는가?");
		var c_name=$(this).find("input").val();
		var p_code = $(this).find("input").eq(1).val();
		var p_name = $(this).find("input").eq(2).val();
		console.log(c_name);
		console.log(p_code);
		console.log(p_name);
		var codeinfo = c_name + "/" +p_code + "/" + p_name;
	 	location.href= " <%=request.getContextPath() %>/storedetail.pro?codeinfo=" + codeinfo;	
	});
});
</script>
</body>
</html>