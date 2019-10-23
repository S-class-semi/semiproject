<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form action="<%=request.getContextPath() %>/insert.pro" method="post" encType = "multipart/form-data">
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
					<td colspan="2"><input name="p_code" type="text"></td>
				</tr>
				<tr>
					<td colspan="2">상품 카테고리 :</td>
					<td colspan="2">
					<select name = "pro_code">
							<option>선택</option>
							<option value="C">의자</option>
							<option value="T">책상</option>
							<option value="A">주방용품</option>
							<option value="B">침구류</option>
					</select></td>
				</tr>

				<tr>
					<td>상품명 :</td>
					<td><input type="text" name="p_name"></td>
					<td>상품 가격:</td>
					<td><input type="text" name="p_price"></td>
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
				<div id = "fileArea">
				<input type = "file" id="thumbnailImg1" multuple="multuple" name="thumbnailImg1" onchange="LoadImg(this,1)">
				<input type = "file" id="thumbnailImg2" multuple="multuple" name="thumbnailImg2" onchange="LoadImg(this,2)">
				<input type = "file" id="thumbnailImg3" multuple="multuple" name="thumbnailImg3" onchange="LoadImg(this,3)">
				</div>
				</td>
				</tr>
				<tr>
				<td colspan="4">
				<textarea rows="10" cols="100%" name ="p_info"></textarea>
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

</body>
</html>