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
#centerbody {
	display: inline-block;
	position: relative;
	width: 85%;
	height: 100%;
	border: 1px solid red;
	margin-left: 250px;
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
<%@ include file = "/views/company/companyMenubar.jsp" %> 
	<div id="centerbody">
		<br>
		<h2 align="center">공지사항 수정하기</h2>
		<div class="tableArea">
			<form id="updateForm" method="post">	<!-- table부터 아래 버튼까지 포함하는 form태그 -->
			<table>
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" size="50" name="title" value="<%= n.getB_TITLE() %>"></td>
						<input type="hidden" name="nno" value="<%=n.getB_NO() %>">
						<input tpye="hidden" name="c_name" value="<%=n.getUSER_ID() %>">
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
					<button type="submit" onclick="update()">수정완료</button>
					<button type="submit" onclick="nDelete()">삭제하기</button>	 		
				</div>
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