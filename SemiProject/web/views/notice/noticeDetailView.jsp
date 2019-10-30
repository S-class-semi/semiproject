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
	input {
	border-radius:5px;
  -webkit-appearance: none;
 
​}
textarea{
border-radius:10px;
}
tr{
    border-bottom:10px solid white;
    padding: 10px;
  }
	
	.tableArea{
		width:500px;
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
						
						<td><%= n.getB_TITLE() %></td>
						<td style="text-align:right"><%= n.getB_TIME() %></td>
					</tr>
					
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none" readonly><%= n.getB_TEXT() %></textarea>
						</td>
					</tr>
				</table>
				<br>

</div>
</div> 

</body>
</html>