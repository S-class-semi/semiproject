<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "product.model.vo.*,java.util.*" %>
    
    <%
    ProductInfo prodcutinfo = (ProductInfo)request.getAttribute("prodcutinfo");
    ArrayList<ProductImgFile> imgList = (ArrayList<ProductImgFile>)request.getAttribute("imgList");
    ProductImgFile titleImg = imgList.get(0);
    String ifpro = prodcutinfo.getPro_code();
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
	width: 85%;
	height: 100%;
	border: 1px solid red;
	margin-left: 250px;
}

  table {
      border:1px solid white;
      text-align:center;
   }
   .tableArea {
      width:650px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
     
   }
   .searchArea {
      width:650px;
      margin-left:auto;
      margin-right:auto;
   }
</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 
		<div id="centerbody">
		<form id ="listpro"  action="<%=request.getContextPath() %>/change.pro" method="post" encType = "multipart/form-data" onsubmit="return CheckProductInfo()">
		<div  id="proinfotable">
		<h1 id="inserttext">상품 상세 조회</h1>
			<table border="1" align="center">
				<tr>
				<td>대표이미지 :  </td>
				<td>
				<div id = "titleImgArea">
					<img id = "titleImg" src ="<%=request.getContextPath() %>/images/productimg/<%=titleImg.getChange_name() %>" width="300" height="300">
				</div>
				</td>
				</tr>
				<tr>
					<td colspan="2">상품코드 :</td>
					<td colspan="2"><input name="p_code" type="text" value="<%=prodcutinfo.getP_code() %>" readonly ></td>
				</tr>
				<tr>
					<td >상품 카테고리 :</td>
					<td><input type="text" id="pro_code" id ="pro_code" value="<%=prodcutinfo.getPro_code()%>" readonly></td>
					<td>회사명 : </td>
					<td readonly naem = "c_name"><%=prodcutinfo.getC_name() %></td>
				</tr>
				<tr>
					<td>상품명 :</td>
					<td><input type="text" name="p_name"  id= "p_name" value = "<%=prodcutinfo.getP_name() %>원"  readonly></td>
					<td>상품 가격:</td>
					<td><input type="text" name="p_price" id= "p_price" value = "<%=prodcutinfo.getP_price() %>" readonly></td>
				</tr>
				<tr>
				<%for(int i=1;i<imgList.size();i++) {%>
				<td>
				<div id = "contentImgArea<%=i%>">
				<img id = "contentImg<%=i%>" name = "contentImg<%=i %>" src ="<%=request.getContextPath() %>/images/productimg/<%=imgList.get(i).getChange_name() %>" width="300" height="300">
				</div>
				</td>
				<%} %>
				</tr>
				<tr>
				<td colspan="4">
				<textarea rows="10" cols="100%" name ="p_info" id= "p_infomation" readonly><%=prodcutinfo.getP_info() %></textarea>
				</td>
				</tr>
				<tr>
				<td colspan="2"><button type= "submit" >수정하겠습니까?</button></td>
				<td colspan="2"><button type= "reset">등록 취소 </button></td>
				</tr>
			</table>
			</div>
			</form>
		</div>
</body>
<script>

	function CheckProductInfo(){
		if (confirm("수정하시겠습니까?")) {
			alert("상품수정 페이지로 이동합니다.");
		}
		 else {
			alert("상품조회로 이동합니다.");
			$("#listpro").attr("action","<%=request.getContextPath() %>/list.pro");
		}
	}
	
</script>

</html>