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
						<td>작성자</td>
						<td>
 							<%--<input type="text" value="<%=loginUser.getUserName() %>" name="writer" readonly>
							<input type="hidden" value="<%=loginUser.getUserId() %>" name="userId"> --%>
							<!-- 화면에는 안보이지만 값을 servlet으로 넘겨 줄려고 하면 hidden태그 활용하자! -->
						</td>	

						<td></td>
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
					<!-- 사용자가 입력을 잘못 하면 입력했던 내용을 지워줄 수 있게 reset타입 button만들자! -->
					<button type="submit">등록하기</button>				
				</div>
				<!-- InsertNoticeServlet 만들러 ㄱㄱ씽! -->
			</form>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
</body>
</html>