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
		<form action="<%=request.getContextPath() %>/insert.pro" method="post">
		<div  id="proinfotable">
		<h1 id="inserttext">상품 등록</h1>
			<table border="1" align="center">
				<tr>
					<td colspan="2">상품코드 :</td>
					<td colspan="2"><input id="code" type="text"></td>
				</tr>
				<tr>
					<td colspan="2">상품 카테고리 :</td>
					<td colspan="2">
					<select>
							<option>선택</option>
							<option name="codenumber" value="C">의자</option>
							<option name="codenumber" value="T">책상</option>
							<option name="codenumber" value="A">주방용품</option>
							<option name="codenumber" value="B">침구류</option>
					</select></td>
				</tr>

				<tr>
					<td>상품명 :</td>
					<td><input type="text" name="codename"></td>
					<td>상품 가격:</td>
					<td><input type="text" name="codeprice"></td>
				</tr>
				<tr>
				<td colspan="4">
				<textarea rows="10" cols="100%" name ="proinfo"></textarea>
				</td>
				</tr>
				<tr>
				<td colspan="2"><button type= "submit">상품 등록</button></td>
				<td colspan="2"><button type= "reset">등록 취소 </button></td>
				</tr>
			</table>
		</div>
		
		
<!-- 		<div class ="test">
		<table>
			<tr>
				<td>카테고리 : </td>
				<td><input type = "text"></td>
			</tr>
			<tr>
				<td>품명 및 모델명 </td>
				<td><input type= "text"></td>
			</tr>
			<tr>
				<td>크기(형태/용량)</td>
				<td><input tpye= "text"></td>
			</tr>
			<tr>
				<td>정격전압,소비전력<br>
				에너지 소비효율 등급</td>
				<td><input type = "text"></td>
			</tr>
			<tr>
				<td>동일모델의 출시년월</td>
				<td><input type = "text"></td>
			</tr>
			<tr>
				<td>KC인증 필 유무</td>
				<td><input type= "text"></td>
			</tr>
			<tr>
				<td>품질보증기준</td>
				<td><input type = "text"></td>
			</tr>
			<tr>
				<td>제조자</td>
				<td><input type = "text"></td>
			</tr>
			<tr>
				<td>제조국(수입여부)</td>
				<td><input type = "text"></td>
			</tr>
			<tr>
				<td>고객센터</td>
				<td><input type = "text"></td>
			</tr>
		</table>
		<button type = "sumbit">상품등록</button> 
		</div> -->
		</form>
	</div>


</body>
</html>