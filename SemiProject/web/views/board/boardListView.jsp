﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList" %>
    
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer{
      width:900px;
      height:500px;
      background:white;
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
   table {
      border:1px solid black;
      text-align:center;
   }
   .tableArea {
      width:650px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
   .searchArea {
      width:650px;
      margin-left:auto;
      margin-right:auto;
   }
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">게시판</h2>
		<div class="tableArea">
			<table align="center" id="listArea">
				<tr>
					<th width="100px">글번호</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>
				</tr>
				<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Board b : list){ %>
						<tr>
							<input type="hidden" value="<%=b.getUserId() %>">
							<td><%=b.getbNo() %></td>
							<td><%=b.getbTitle() %></td>
							<td><%=b.getUserId() %></td>
							<td><%=b.getbCount() %></td>
							<td><%=b.getbTime() %></td>
						</tr>
					<%} %>
				<%} %>
			</table>
		</div>
		
		<!-- 페이징 처리 시작 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로(<<) -->
			<button > << </button>
			
			<!-- 이전 페이지로(<) -->

			<button> < </button>
			
			
			<!-- 10개의 페이지 목록 -->
			
				
		
			<button> 1 </button>
			<button> 2 </button>
			<button> 3 </button>
			<!-- 다음 페이지로(>) -->
			
			
			<button > > </button>
		
			
			<!-- 맨 끝으로(>>) -->
			<button > >> </button>
			
		</div>
		
		<!-- 공지사항 때와 마찬가지로 검색 부분이 있다. 기능 구현은 생략 -->
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search">
			<button type="submit">검색하기</button>
			
			<!-- 공지사항 때와는 다르게 여기선 로그인을 한 사람만 게시글을 작성하게 하자 -->
			<% if(loginUser != null){%>
				<button onclick="location.href='views/board/boardInsertForm.jsp'">작성하기</button>
			<%} %>
			<!-- boardInsertForm.jsp 만들러 ㄱㄱ씽 -->
		</div>
	</div>

	<script>
		// 게시판 상세보기 기능 구현하기
		$(function(){
			$("#listArea td").click(function(){
				var bid=$(this).parent().children("input").val();
				
				//로그인 한 사람만 이용하도록 하자!
				<% if(loginUser != null){%>
					location.href="<%=request.getContextPath()%>/detail.bo?bid=" + bid;
				<%}else{%>
					alert("로그인 해야만 상세보기가 가능합니다!");
				<%}%>
				// BoardDetailServlet 만들러 ㄱㄱ씽!
			});
		});
		
	</script>









</body>
