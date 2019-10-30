<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "notice.model.vo.Notice, java.util.ArrayList"%>
    
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("arr");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.outer{
		width:800px;
		height:600px;
		background:white;
		
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	
	#listArea{
	 border-collapse: collapse;
		text-align:center;
		
	}
	
	#listArea th, #listArea td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
	.tableArea{
		width:650px;
		height:400px;
		margin-left:auto;
		margin-right:auto;
	}
	.searchArea{
		width:650px;
		margin-left:auto;
		margin-right:auto;
	}
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		
		<h2 align="center">공지사항</h2>
		
		<div class="tableArea">
			<!-- 조회가 잘 되어 출력되는지 확인 -->
			<table align="center" id="listArea">
				<tr>
					<th>No.</th>
					<th width="300px">제목</th>
					<th>조회수</th>
					<th width="100px">작성일</th>
				</tr>
			 	 <%if(list.isEmpty()){ %>
					<tr>
						<td colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>
				<%}else{ %>
					<%for(Notice no : list){ %>
					<tr>
						<td><%= no.getB_NO() %></td>
						<td style="text-align:left"><%= no.getB_TITLE() %></td>
						<td><%= no.getB_COUNT() %></td>
						<td><%= no.getB_TIME() %></td>
					</tr>
					<%} %>
				<%} %>  
			</table>
		</div>
		
		<!-- 보통 사이트들에서는 공지사항이나 게시판 아래에 검색하기 기능을 하는 부분이 있다. -->
		<div class="searchArea" align="center">
		<form>
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search">
			<button type="submit">검색하기</button>
		</form>
		
		
		<!-- 공지사항 글쓰기 기능 추가 -->
		<!-- 공지사항은 보통 관리자만 쓸 수 있다. 따라서 관리자만 쓸 수 있도록 조건을 달자! -->
		
		 
		</div>
	</div>
	
	<script>
	$(function(){
		$("#listArea td").click(function(){
			var num = $(this).parent().children().eq(0).text();			
			location.href="<%=request.getContextPath()%>/detail.no?no="+num;
		});
	});
	

	</script>
		
	
	
	
<%-- <%{ %>
			<button onclick="location.href='views/notice/noticeInsertForm.jsp'">작성하기</button>
			<%} %> --%>
	
	
	
	
</body>
</html>