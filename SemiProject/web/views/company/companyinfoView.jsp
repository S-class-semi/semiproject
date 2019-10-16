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
	border : 1px solid black;
	margin-left: 250px;
	}
</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 
		<div id="centerbody">
		<table border="1">
			<tr>
			<td><label> 사업증 번호 : </label></td>
			<td><input type = "text"  disabled> </td>
			</tr>
			<tr>
			<td><label> 회사명 : </label></td>
			<td><input type = "text" disabled> </td>
			</tr>
			<tr>
			<td><label> 회사주소 : </label></td>
			<td><input type = "text" > </td>
			</tr>
			<tr>
			<td><label> 회사연락처 : </label></td>
			<td><input type = "text" > </td>
			</tr>
			<tr>
			<td><label> 담당자 : </label></td>
			<td><input type = "text" > </td>
			</tr>
			<tr>
			<td><label> 담당자 연락처 : </label></td>
			<td><input type = "text" > </td>
			</tr>
			<tr>
			<td><label> 담당자 이메일 : </label></td>
			<td><input type = "text" > </td>
			</tr>
			<tr>
			<td><label> 판메종목 : </label></td>
			<td><input type = "text" > </td>
			</tr>
			
		</table>
		</div>
		

</body>
</html>