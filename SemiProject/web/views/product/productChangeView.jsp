<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "product.model.vo.*,java.util.*"%>
    
    <%
    ProductInfo productinfo =(ProductInfo)request.getAttribute("productinfo");
    String ifpro = productinfo.getPro_code();
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

#proimg {
	width: 400px;
	height: 400px;
	border: 1px soild black;
	margin-left: 50px;
	margin-top: 50px;
}
#proinfotable{
align : center;
text-align: justify;
}


.test{
display: hidden;
}
table tr td{
align-content: center;
align:center;
text-align: center;
}


</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 
		<div id="centerbody">
		<form action="<%=request.getContextPath() %>/changeinsert.pro" method="post" encType = "multipart/form-data" onsubmit="return productcheck()">
		<div  id="proinfotable">
		<h1 id="inserttext">상품 등록</h1>
			<table border="1" align="center">
			<tr>
			<td>대표이미지 :  </td>
			<td>
			<div id = "titleImgArea">
				<img id = "titleImg" width="300" height="">
			</div>
			</td>
			</tr>
				<tr>
					<td colspan="2">상품코드 :</td>
					<td><input name="p_code" id ="p_code1" type="text" value = "<%=productinfo.getP_code()%>" readonly></td>
					<td><div id = "p_codeCheck">코드변경 불가입니다.</div></td>
				</tr>
				<tr>
					<td colspan="2">상품 카테고리 :</td>
					<td><input type="hidden" id="ifpro" value="<%=productinfo.getPro_code()%>"></td>
					<td>
					<select name = "pro_code" id ="pro_code1">
							<option value="C">의자</option>
							<option value="T">책상</option>
							<option value="A">주방용품</option>
							<option value="B">침구류</option>
					</select></td>
				</tr>

				<tr>
					<td>상품명 :</td>
					<td><input type="text" name="p_name" id="p_name1" value="<%=productinfo.getP_name()%>"></td>
					<td>상품 가격:</td>
					<td><input type="text" name="p_price" id="p_price1" value = "<%=productinfo.getP_price()%>"></td>
				</tr>
				<tr>
				<td>내용 사진 기재</td>
				<td>
					<div id = "contentImgArea1">
					<img id= "contentImg1" width ="300" height = "300">
					</div>
				</td>
				<td>
					<div id = "contentImgArea2">
					<img id= "contentImg2" width ="300" height = "300">
					</div>
				</td>
				<td>
				<div id = "fileArea" type ="hidden">
				<input type = "file" id="thumbnailImg1" multuple="multuple" name="thumbnailImg1" onchange="LoadImg(this,1)">
				<input type = "file" id="thumbnailImg2" multuple="multuple" name="thumbnailImg2" onchange="LoadImg(this,2)">
				<input type = "file" id="thumbnailImg3" multuple="multuple" name="thumbnailImg3" onchange="LoadImg(this,3)">
				</div>
				</td>
				</tr>
				<tr>
				<td colspan="4">
				<textarea rows="10" cols="100%" name ="p_info" id="p_info1"><%=productinfo.getP_info() %></textarea>
				</td>
				</tr>

				<tr>
				<td colspan="2"><button type= "submit">상품 등록</button></td>
				<td colspan="2"><button type= "reset">등록 취소 </button></td>
				</tr>
			</table>
		</div>
		
		</form>
	</div>
	<script>
					//전역변수로 해야할것.
			var p_codeflg = true;
			var p_imgtitleflg = false;
			var p_imgcon1flg = false;	
			var p_priceflg =true;

			
					// 이미지 src 유효성
					var img = $("#titleImg").attr("src")
					var img1 = $("#contentImg1").attr("src");
					var img2 = $("#contentImg2").attr("src");
					
					
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
	
							/* --------------상품코드 유효성 검사---- */
							$("#p_code1").keyup(function(){
							var p_code = $("#p_code1");
							var p_codeCK = /^[a-zA-Z0-9]*$/;
							
							if(!p_codeCK.test(p_code.val())){
								alert("영문 및 숫자만 기입 가능합니다.");
								p_code.val('');
								$("#p_codeCheck").html('다시 기입해주세요');
								p_codeflg = false;
								console.log(p_codeflg);
							}else{
								console.log(p_code.val());	
								$.ajax({
									url: "<%=request.getContextPath() %>/p_code.pro",
									type:"post",
									data:{
										p_code:p_code.val()
									},success:function(data){
										if(data == "fail"){
											$("#p_codeCheck").html('');
											$("#p_codeCheck").html("코드 변경 불가.").css("color","red");
											p_codeflg = false;
											console.log(p_codeflg);
										}else if(data == "success"){
											$("#p_codeCheck").html('');
											$("#p_codeCheck").html("사용가능한 상품 코드입니다.").css("color","green");
											p_codeflg = true;
											console.log(p_codeflg);
										}
									},
									error:function(data){
										console.log("데이터 통신 오류");
									}
								});
							}

						});
						/* -------------- */
					
					//상품가격
					$("#p_price1").keyup(function(){
						var p_price = $("#p_price1");
						var p_priceCK = /^[0-9]*$/;

						if(!p_priceCK.test(p_price.val())){
							alert("숫자만입력해주세요");
							p_price.val('');
							p_priceflg =false;
						}else{
							p_priceflg = true;
						}
					});
						
					///////끝//////////////////
					
					
					});
					//각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 부분(함수)
					function LoadImg(value,num){
						if(value.files[0] != undefined){
							// value는 함수를 발동시킨 객체(file타입 input태그)이고
							// value.files[0]은 input태그로 파일을 선택 했으면 undefined가 아니고 선택 안했으면 undefined이다.
							var reader = new FileReader();
							reader.onload = function(e){
								switch(num){
								case 1:
									$("#titleImg").attr("src",e.target.result);
									p_imgtitleflg = true;
									console.log(p_imgtitleflg);
									alert("대표사진이 등록되었습니다.");
									break;
								case 2:
									$("#contentImg1").attr("src",e.target.result);
									p_imgcon1flg= true;
									alert("이미지 1번이 등록되었습니다.");
									break;
								case 3:
									$("#contentImg2").attr("src",e.target.result);
									alert("이미지 2번이 등록되었습니다.");
									p_imgcon1flg= true;
									break;
								}
							}
						reader.readAsDataURL(value.files[0]);
						}
					}
					
					
					function productcheck(){
						if(p_codeflg == false){
							alert("상품 코드를 확인해주세요");
							return false;
						}else{
							p_codeflg = true;
						}

						if(p_imgtitleflg == false){
							alert("대표사진 확인바랍니다.");
							return false;
						}else{
							p_imgtitleflg = true;
						}
						
						if($("#p_code1").val()==''){
							alert("실행");
							return false;
						}
						
						if(p_priceflg ==false){
							alert("상품가격을 확인해주세요");
							return false;
						}
						
						if(p_imgcon1flg == false){
							alert("정보사진은 한개필수에요");
							return false;
						}else{
							p_imgcon1flg = true;
						}

						
						if($("#p_name1").val()==''){
							alert("상품명 입력하세요");
							return false;
						}
						
						if($("#pro_code1").val()==''){
							alert("카테고리를 선택하세요");
							return false;
						}
						
						if($("#p_info1").val()==''){
							alert("상품상세설명을 써주세요");
							return false;
						}
						
							return true;
						}
					</script>
<!-- 유효성 검사 -->

</body>
</html>