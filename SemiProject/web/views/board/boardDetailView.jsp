<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "board.model.vo.*, java.util.ArrayList"%>
    
<%
	Board b = (Board)request.getAttribute("board");

	%>
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
   td {
      border:1px solid white;
   }

   .tableArea {
      border:1px solid white;
      width:800px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
   #content {
      height:230px;
   }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center">게시판 상세보기</h2>
		<div class="tableArea">
			<table align="center" width="800px">
				<tr>
					
					<td>제목</td>
					<td colspan="3"><span><%=b.getbTitle() %></span></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><span><%=b.getUserId() %></span></td>
					<td>조회수</td>
					<td><span><%=b.getbCount() %></span></td>
					<td>작성일</td>
					<td><span><%=b.getbTime() %></span></td>
				</tr>
				<tr>
					<td colspan="6">내용</td>
				</tr>
				<tr>
					<td colspan="6"><p id="content"><%=b.getbText() %></p></td>
				</tr>
			</table>
		</div>
		
		<div align="center">
			<button onclick="location.href='<%=request.getContextPath() %>/list.bo'">메뉴로 돌아가기</button>
			<button>수정하기</button>
			<!-- 수정하기는 공지사항 때 해봤으니까 알아서 센스껏 완성 하시고 -->
			<!-- 이제 사진게시판 하러 가자! menubar.jsp로 ㄱㄱ씽 -->
			
		</div>
	</div>
	
	<!-- 여기는 Ajax 관련 코드 -->
	<div class="replyArea">
		<!-- 댓글 작성하는 부분 -->
		<div class="replyWriterArea">
			<table align="center">
				<tr>
					<td>댓글</td>
					<td><textArea rows="3" cols="80" id="replyContent"></textArea></td>
					<td>
						<button id="addReply">등록</button>
					</td>
				</tr>
			</table>
		</div>
		
	
			
	</div>

	<script>
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>