<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
  
  
<!-- 
	  이 페이지는 noticeDetailView.jsp를 복붙해서 readonly 풀어줘야 될 것들 풀어주고 버튼만 바꿔주자
	 form 태그도 여기에는 추가해 주자
 -->    
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.outer{
		width:800px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table{
		border:1px solid white;
	}
	.tableArea{
		width:450px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">공지사항 상세보기</h2>
		<div class="tableArea">
			<form id="updateForm" method="post">	<!-- table부터 아래 버튼까지 포함하는 form태그 -->
			<table>
					<tr>
						<td>제목</td>
						
						<td colspan="3"><input type="text" size="50" name="title" value="<%= n.getB_TITLE() %>"></td>
						
<!-- 					servlet에서 이 페이지의 정보중 필요로 하는 것이 있다면 name에 담아서 넘기는데
						화면에 보여줄 필요가 없다면 hidden 타입 input태그에 실어 보내자 -->
						<input type="hidden" name="nno" value="<%=n.getB_NO() %>">
						
					</tr>
					<tr>
						<td>작성일</td>
						<td><input type="date" name="date" value="<%= n.getB_TIME() %>"></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none"><%= n.getB_TEXT() %></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="submit" onclick="update()">수정하기</button>
					
					<button onclick="nDelete()">삭제하기</button>	 		
					
				</div>
				<!-- NoticeUpdateViewServlet 만들러 ㄱㄱ씽! -->
				
				</form>
				<script>
					// 공지사항 수정하기 작업 먼저하기
					function update(){
						$("#updateForm").attr("action", "<%=request.getContextPath()%>/update.no");
						// NoticeUpdateServlet 만들러 ㄱㄱ씽
					}
					
					// 공지사항 삭제하기
					function nDelete(){
						$("#updateForm").attr("action", "<%=request.getContextPath()%>/nDelete.no");
						// NoticeDeleteServlet 만들러 ㄱㄱ씽
					}
				</script>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>