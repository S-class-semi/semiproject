<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>공지사항 상세</title>
 <style>
	.outer{
		width:1000px;
		height:1000px;
		background:white;
		color:black;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table{
		border:1px solid black;
	}
	.tableArea{
		width:450px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	
</style> 
</head>
<body>
<%@include file="../common/menubar.jsp" %>
 <div class="outer">
<br>
<h2 align="center">공지사항 상세보기</h2>
<div class="tableArea">
<table>
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" size="50" name="title" value="<%= n.getB_TITLE() %>" readonly></td>
						</tr>
					<tr>
						
						<td>작성일</td>
						<td><input type="date" name="date" value="<%= n.getB_TIME() %>" readonly></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none" readonly><%= n.getB_TEXT() %></textarea>
						</td>
					</tr>
				</table>

</div>
</div> 

</body>
</html>