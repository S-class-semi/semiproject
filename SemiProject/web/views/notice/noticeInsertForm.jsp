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

table {
	border: 1px solid black;
}

input {
	border-radius: 5px;
	-webkit-appearance: none;
	​
}

textarea {
	border-radius: 5px;
}

.tableArea {
	width: 550px;
	height: 350px;
	margin-left: auto;
	margin-right: auto;
}
h2{
margin-left: 20px;
}
</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 
<br>
	<div id="centerbody">
		<h2 align="left">공지 사항 작성</h2>
		<div class="tableArea">
			<form action="<%=request.getContextPath() %>/insert.no" method="post">
				<table>
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
					<td>작성자 : </td>
					<td><%=companyinfo.getC_name() %></td>
					</tr>
<!-- 					<tr>
					<td colspan="4">
					<input type="checkbox">
					<label><input type ="radio" id="base" name="noticeselect"  value = "1" checked>일반</label>
               		<input type="radio" id="pro" name="noticeselect"   value = "2">
               		<label for="pro">상품</label>
               		<input type="radio" id="service" name="noticeselect"   value = "3" >
               		<label for="service">서비스</label>
					</td>
					</tr> -->
					<tr>
						<td> 내용</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="75" rows="15" style="resize:none"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>	
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>