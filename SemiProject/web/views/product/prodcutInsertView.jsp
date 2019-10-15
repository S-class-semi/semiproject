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

</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 
		<div id="centerbody">
		<!-- 		<div id= "proimg">
			<h1>사진 등록 </h1>
		</div> -->
		<div  id="proinfotable">
			<table border="1" align="center">
				<tr width="">
					<td colspan="2">상품코드 :</td>
					<td colspan="2"><input type="text"></td>
				</tr>
				<tr>
					<td colspan="2">상품 카테고리 :</td>
					<td colspan="2"><input type="text"></td>
				</tr>
				<tr>
					<td>상품명 :</td>
					<td><input type="text"></td>
					<td>상품 가격:</td>
					<td><input type="text"></td>
				</tr>
			</table>
		</div>
		
		<div>
		<h1>그다음 내용은 어디로 붙을까요?</h1>
		<textarea rows="10" cols="10"></textarea>
		</div>
		<div>
		공시내용 작성 
		</div>
	</div>
		

</body>
</html>