<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:800px;
		height:500px;
		background:white;
		color:black;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table{
		border:1px solid black;
	}
	input {
	border-radius:5px;
  -webkit-appearance: none;
​}
textarea{
border-radius:5px;
}
	.tableArea{
		width:550px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">공지 사항 작성</h2>
		<div class="tableArea">
			<form action="<%=request.getContextPath() %>/insert.no" method="post">
				<table>
			
					<tr>

						<td>제목</td>
						<td colspan="3"><input type="text" size="50" name="title"></td>
						
					</tr>
					<tr>
						<td>내용</td>
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
				<!-- InsertNoticeServlet 만들러 ㄱㄱ씽! -->
			</form>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
</body>
</html>