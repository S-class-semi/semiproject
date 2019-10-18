<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="company.model.vo.Company"%>
    
    <%
    	Company companyInfo = (Company)request.getAttribute("compayinfo");
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
			<td><input type = "text" value="<%=companyInfo.getC_number() %>" disabled> </td>
			</tr>
			<tr>
			<td><label> 회사명 : </label></td>
			<td><input type = "text" value="<%=companyInfo.getC_name() %>" disabled> </td>
			</tr>
			<tr>
			<td><label> 회사주소 : </label></td>
			<td><input type = "text" value="<%=companyInfo.getC_add() %>" > </td>
			</tr>
			<tr>
			<td><label> 회사연락처 : </label></td>
			<td><input type = "text" value="<%=companyInfo.getC_phone() %>" > </td>
			</tr>
			<tr>
			<td><label> 담당자 : </label></td>
			<td><input type = "text" value="<%=companyInfo.getC_manager() %>" > </td>
			</tr>
			<tr>
			<td><label> 담당자 연락처 : </label></td>
			<td><input type = "text" value="<%=companyInfo.getC_contact() %>" > </td>
			</tr>
			<tr>
			<td><label> 담당자 이메일 : </label></td>
			<td><input type = "text" value="<%=companyInfo.getC_email() %>"> </td>
			</tr>
			<tr>
			<td><label> 판메종목 : </label></td>
			<td><input type = "text" > </td>
			</tr>
			
		</table>
		<div>
		<button align = "center">정보 수정</button>
		<button>취소 </button>
		</div>
		</div>
		

</body>
</html>