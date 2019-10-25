<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*,java.util.ArrayList"%>

<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
	.outer{
      width:900px;
      height:500px;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
      }
       table {
      border:1px solid white;
      text-align:center;
   }
   .tableArea {
      width:650px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 


<div class = "outer">
<br>
<h2 align = "center">1:1 문의 확인</h2>
<div id="centerbody">

<div class = "tableArea">
<%if(loginUser != null && user_G == 3){%>	<!-- 관리자 로그인 -->
	<table align = "center" id = "listArea">
		<tr>
			<th width ="100px">글번호</th>
			<th width = "300px">글제목</th>
			<th width = "100px">작성자</th>
			<th width = "150px">작성일</th>
			<th width = "100px">처리여부</th>
		</tr>
		<% if(list.isEmpty()){ %>
		<tr>
			<td colspan="6">조회된 리스트가 없습니다</td>
		</tr>
		<%}else{ %>
			<%for(Board b : list){ %>
				<tr>
					<input type="hidden" value = "<%=b.getbId() %>">
					<td><%=b.getbId() %></td>
					<td><%=b.getbTitle() %></td>
					<td><%=b.getbWritter() %></td>
					<td><%=b.getbTime() %></td>
					<td><%=b.getStatus() %></td>
				</tr>
				<%} %>
				<%} %>
	</table>
	<%}else{ %>
	<h2 align = "center">관리자만 확인할수 있는 페이지입니다.</h2>
	<%} %>
	

</div>

<!-- 페이징 처리 -->
<div class="pagingArea" align = "center">
<!-- 맨 처음으로 -->
	<button onclick = "location.href='<%=request.getContextPath() %>/qna.do?currentPage=1'"> << </button>
	<!-- 이전 페이지로 -->
	<%if(currentPage <=1){ %>
		<button disabled> < </button>
		<%} else{ %>
			<button onclick = "location.href='<%=request.getContextPath() %>/qna.do?currentPage=<%=currentPage-1 %>'"> < </button>
		<%} %>
		<!--  10개의 페이지 목록 -->
		<%for(int p= startPage; p<=endPage; p++){ %>
		<%if(p==currentPage){ %>
			<button disabled><%=p %></button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath() %>/qna.do?currentPage=<%=p %>'"><%=p %></button>
			<%} %>
			<%} %>
			<!--  다음 페이지로 -->
		<%if(currentPage >= maxPage){ %>
			<button disabled> > </button>
		<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath() %>/qna.do?currentPage=<%=currentPage+1 %>'"> > </button>
		<%} %>
		
		 <!-- 맨 끝으로(>>) -->
		 <button onclick="location.href='<%=request.getContextPath() %>/qna.do?currentPage=<%=maxPage %>'"> >> </button>
			 
</div>






</div>
</div>

<script>
//게시판 상세보기 기능 구현하기
$(function(){
	$("#listArea td").mouseenter(function(){
		$(this).parent().css({"background":"darkgray","cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"#dcdcdc"});
	}).click(function(){
		var bid=$(this).parent().children("input").val();
		
		 //로그인 한 사람만 이용하도록 하자!
		<% if(loginUser != null){%>
			location.href="<%=request.getContextPath()%>/qnadetail.bo?bid=" + bid;
		<%}else{%>
			alert("로그인 해야만 상세보기가 가능합니다!");
		<%}%> 
		// BoardDetailServlet 만들러 ㄱㄱ씽!
	});
});

</script>
</body>
</html>