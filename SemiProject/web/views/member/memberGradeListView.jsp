<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*,java.util.ArrayList"%>
    
    
    <%
    	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "/views/admin/adminMenuView.jsp" %> 
<div class="outer">
	<br>
	<h2 align = "center">회원정보</h2>
	<div id = "centerbody">
	<div class = "tableArea">

		<table align ="center" id="listArea">
			<tr>
				<th width="100px">아이디</th>
					<th width="100px">회원등급</th>
					<th width="100px">닉네임</th>
					<th width="100px">보유포인트</th>
					<th width="100px">생일</th>
					<th width="150px">회원여부</th>
			</tr>
			<%if(list.isEmpty()){ %>
			<tr>
				<td colspan = "6">조회된 리스트가 없습니다.</td>
			</tr>
			<%}else{ %>
				<%for(Member b : list){ %>
				<tr>
					<input type="hidden" value = "<%=b.getUserId() %>">
					<td><%=b.getUserId()%></td>
					<td><%=b.getUserG()%></td>
					<td><%=b.getNickname()%></td>
					<td><%=b.getPoint()%></td>
					<td><%=b.getBirth()%></td>
					<td><%=b.getStatus()%></td>
				</tr>
				<%} %>
				<%} %>
		</table>

	</div>
	<!-- 페이징처리 -->
	<div class = "pagingArea" align = "center">
		<!-- 맨 처음으로(<<) -->
		<button onclick="location.href='<%=request.getContextPath() %>/grade.me?currentPage=1'"> << </button>
		<!-- 이전 페이지로(<) -->
		<%if(currentPage <=1){ %>
			<button disabled> < </button>
		<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath() %>/grade.me?currentPage=<%=currentPage-1 %>'"> < </button>
		<%} %>
		
		<!-- 10개의 페이지 목록 -->
		<%for(int p = startPage; p<=endPage; p++){ %>
			<%if(p==currentPage){ %>
				<button disabled><%=p %></button>
			<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/grade.me?currentPage=<%=p %>'"><%=p %></button>
			<%} %>
			<%} %>
			
		<!-- 다음 페이지로(>) -->
		<%if(currentPage>=maxPage){ %>
			<button disabled> > </button>
		<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath() %>/grade.me?currenPage=<%=currentPage+1 %>'"> > </button>
		<%} %>
		
		<!-- 맨 끝으로(>>) -->
		<button onclick="location.href='<%=request.getContextPath() %>/grade.me?currentPage=<%=maxPage %>'"> >> </button>	
			
	</div>
	
</div>
</div>
<script>
		// 게시판 상세보기 기능 구현하기
		<%-- $(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"#dcdcdc"});
			}).click(function(){
				var bid=$(this).parent().children("input").val();
				location.href="<%=request.getContextPath()%>/myPage.me?userId=<%=m.getUser_Id() %>"
					
			});
		}); --%>
		
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"#dcdcdc"});
			}).click(function(){
				var user_Id=$(this).parent().children("input").val();
				location.href="<%=request.getContextPath()%>/updateGrade.me?user_Id="+ user_Id;
				 
				 
				
			
				
				
			});
		});
</script>


</body>
</html>