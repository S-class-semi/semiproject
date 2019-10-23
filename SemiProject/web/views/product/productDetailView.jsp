<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "product.model.vo.*,java.util.*" %>
    
    <%
    ProductInfo prodcutinfo = (ProductInfo)request.getAttribute("prodcutinfo");
    ArrayList<ProductImgFile> imgList = (ArrayList<ProductImgFile>)request.getAttribute("imgList");
    ProductImgFile titleImg = imgList.get(0);
    int size = imgList.size()-1;
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
		<form id ="listpro" action="<%=request.getContextPath() %>/update.pro" method="post" onsubmit="return check()"  encType = "multipart/form-data">
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
					<input tpye="hidden" name="size" value=<%=size %>>
					<td colspan="2">상품코드 :</td>
					<td colspan="2"><input name="p_code" type="text" value="<%=prodcutinfo.getP_code() %>" readonly ></td>
				</tr>
				<tr>
					<td >상품 카테고리 :</td>
					<td readonly name="pro_code" value ="<%=prodcutinfo.getPro_code() %>"></td>
					<td>회사명 : </td>
					<td readonly naem = "c_name"><%=prodcutinfo.getC_name() %></td>
				</tr>
				<tr>
					<td>상품명 :</td>
					<td><input type="text" name="p_name" value = "<%=prodcutinfo.getP_name() %>" ></td>
					<td>상품 가격:</td>
					<td><input type="text" name="p_price" value = "<%=prodcutinfo.getP_price() %>"></td>
				</tr>
				<td>
				<div id = "fileArea">
				<input type = "file" id="thumbnailImg1" multuple="multuple" name="thumbnailImg1" onchange="LoadImg(this,1)">
				<input type = "file" id="thumbnailImg2" multuple="multuple" name="thumbnailImg2" onchange="LoadImg(this,2)">
				<input type = "file" id="thumbnailImg3" multuple="multuple" name="thumbnailImg3" onchange="LoadImg(this,3)">
				</div>
				</td>
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
				<textarea rows="10" cols="100%" name ="p_info"><%=prodcutinfo.getP_info() %></textarea>
				</td>
				</tr>
				<tr>
				<td colspan="2"><button type= "submit">수정</button></td>
				<td colspan="2"><button type= "reset">등록 취소 </button></td>
				</tr>
			</table>
			</div>
			</form>
		</div>
</body>
<script>
function check(){
	
	if(confirm("수정하시겠습니까?")){
		alert("상품수정 완료입니다.");
		return true;
	}else{
		alert("상품조회로 이동합니다.");
		$("#listpro").attr("action","<%=request.getContextPath() %>/list.pro");
		return false;
	}
}

	$(function(){
		$("#fileArea").hide();
		
		$("#titleImgArea").click(function(){
			alert("대표사진을 수정합니다.");
			$("#titleImg").removeAttr("src");
			$("#thumbnailImg1").click();
		});
		
		$("#contentImgArea1").click(function(){
			
			$("#contentImg1").removeAttr("src");
			$("#thumbnailImg2").click();
		});
		
		 $("#contentImgArea2").click(function(){
			$("#contentImg2").removeAttr("src");
			$("#thumbnailImg3").click();
		});
		
	});
	//각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 부분(함수)
	function LoadImg(value,num){
		if(value.files[0] != undefined){
			var reader = new FileReader();
			
			reader.onload = function(e){
				switch(num){
				case 1:
					$("#titleImg").attr("src",e.target.result);
					break;
				case 2:
					$("#contentImg1").attr("src",e.target.result);
					break;
				case 3:
					$("#contentImg2").attr("src",e.target.result);
					break;
				}
			}
		reader.readAsDataURL(value.files[0]);
		}
	}
</script>





</html>