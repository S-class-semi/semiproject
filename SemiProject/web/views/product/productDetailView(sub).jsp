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
		<form id ="listpro" action="<%=request.getContextPath() %>/update.pro" method="post" encType = "multipart/form-data" onsubmit="return CheckProductInfo()">
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
					<td><input type="hidden" id="ifpro" value="<%=prodcutinfo.getPro_code()%>"></td>
					<td>
					<select name = "pro_code" id ="pro_code2">
							<option value="C">의자</option>
							<option value="T">책상</option>
							<option value="A">주방용품</option>
							<option value="B">침구류</option>
					</select>
					</td>
					<td>회사명 : </td>
					<td readonly naem = "c_name"><%=prodcutinfo.getC_name() %></td>
				</tr>
				<tr>
					<td>상품명 :</td>
					<td><input type="text" name="p_name"  id= "p_name2" value = "<%=prodcutinfo.getP_name() %>" ></td>
					<td>상품 가격:</td>
					<td><input type="text" name="p_price" id= "p_price1" value = "<%=prodcutinfo.getP_price() %>"></td>
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
				<textarea rows="10" cols="100%" name ="p_info" id= "p_infomation"><%=prodcutinfo.getP_info() %></textarea>
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

//전역변수로 해야할것.
var p_updateimgtitleflg = true;
var p_updateimgcon1flg = true;	
var p_updatepriceflg = true;


// 이미지 src 유효성
var updateimg = $("#titleImg").attr("src")
var updateimg1 = $("#contentImg1").attr("src");
var updateimg2 = $("#contentImg2").attr("src");

$(function(){
	for(var i = 0; i<=2;i++){
		if($("#pro_code2 option:eq("+i+")").val() == $("#ifpro").val()){
			$("#pro_code2 option:eq("+i+")").prop('selected', true);
		}
	}
});


//내용 작성 부분의 공간을 클릭 할때마다 파일 첨부 창이 뜨도록 설정하는 부분
$(function(){

	$("#fileArea").hide();
	
	$("#titleImgArea").click(function(){
		$("#thumbnailImg1").click();
	});
	$("#contentImgArea1").click(function(){
		$("#thumbnailImg2").click();
	});
	
	 $("#contentImgArea2").click(function(){
		$("#thumbnailImg3").click();
	});
	 //여기 부분 부터 유효성
});
	//상품가격
		$("#p_price1").keyup(function() {
			var p_price = $("#p_price1");
			var p_priceCK = /^[0-9]*$/;
			if (!p_priceCK.test(p_price.val())) {
				alert("숫자만입력해주세요");
				p_price.val('');
				updatep_priceflg = false;
				console.log(p_updatepriceflg);
			} else {
				console.log(p_updatepriceflg);
				updatep_priceflg = true;
			}
		});
/* 상품가격 유효성 검사 끝 */
 
 	/* 전체 유효성 검사 */


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
					updatep_imgtitleflg = true;
					alert("대표사진이 등록되었습니다.");
					break;
				case 2:
					$("#contentImg1").attr("src",e.target.result);
					updatep_imgcon1flg= true;
					alert("이미지 1번이 등록되었습니다.");
					break;
				case 3:
					$("#contentImg2").attr("src",e.target.result);
					alert("이미지 2번이 등록되었습니다.");
					break;
				}
			}
		reader.readAsDataURL(value.files[0]);
		}
	}
	
	
	function CheckProductInfo(){
		if (confirm("수정하시겠습니까?")) {
			
			if(p_updateimgtitleflg == false){
				alert("대표사진 확인바랍니다.");
				return false;
			}else{
				updatep_imgtitleflg = true;
			}

			if(p_updatepriceflg ==false){
				alert("상품가격을 확인해주세요");
				return false;
			}else{
				p_updatepriceflg = true;
			}
			
			if($("#p_infomation").val()==''){
				alert("상품상세설명을 써주세요");
				return false;
			}
			
			alert("상품수정 완료입니다.");
		} else {
			alert("상품조회로 이동합니다.");
			$("#listpro").attr("action","<%=request.getContextPath() %>/list.pro");
		}
	return true;
}


</script>





</html>