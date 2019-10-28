<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.*,java.util.ArrayList"%>

<%
    	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
    	ProductPage pi = (ProductPage)request.getAttribute("pi");
    
    	int listCount = pi.getpListCount();
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

<div class="outer">
	<br>
	<h2 align = "center">주문내역</h2>
	<div id = "centerbody">
	<div class = "tableArea">
	<%if(loginUser != null && user_G == 3){%>	
		<table align ="center" id="listArea">
			<tr>
				<th width="100px">결제번호</th>
					<th width="100px">구매회원</th>
					<th width="100px">상품이름</th>
					<th width="100px">구매수량</th>
					<th width="100px">구매날짜</th>
					<th width="150px">구매취소여부</th>
			</tr>
			<%if(list.isEmpty()){ %>
			<tr>
				<td colspan = "6">조회된 리스트가 없습니다.</td>
			</tr>
			<%}else{ %>
				<%for(Order o : list){ %>
				<tr>
					<input type="hidden" value = "<%=o.getOno() %>">
					<td><%=o.getOno() %></td>
					<td><%=o.getUser_Id() %></td>
					<td><%=o.getPname() %></td>
					<td><%=o.getQuantity() %></td>
					<td><%=o.getBuydate() %></td>
					<td><%=o.getStatus() %></td>
					
				</tr>
				<%} %>
				<%} %>
		</table>
	<%}else{ %>
	<h2 align="center">관리자만 확인 가능한 페이지입니다.</h2>
	<%} %>
	</div>
	<!-- 페이징처리 -->
	<div class = "pagingArea" align = "center">
		<!-- 맨 처음으로(<<) -->
		<button onclick="location.href='<%=request.getContextPath() %>/order.or?currentPage=1'"> << </button>
		<!-- 이전 페이지로(<) -->
		<%if(currentPage <=1){ %>
			<button disabled> < </button>
		<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath() %>/order.or?currentPage=<%=currentPage-1 %>'"> < </button>
		<%} %>
		
		<!-- 10개의 페이지 목록 -->
		<%for(int p = startPage; p<=endPage; p++){ %>
			<%if(p==currentPage){ %>
				<button disabled><%=p %></button>
			<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/order.or?currentPage=<%=p %>'"><%=p %></button>
			<%} %>
			<%} %>
			
		<!-- 다음 페이지로(>) -->
		<%if(currentPage>=maxPage){ %>
			<button disabled> > </button>
		<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath() %>/order.or?currenPage=<%=currentPage+1 %>'"> > </button>
		<%} %>
		
		<!-- 맨 끝으로(>>) -->
		<button onclick="location.href='<%=request.getContextPath() %>/order.or?currentPage=<%=maxPage %>'"> >> </button>	
			
	</div>
	
</div>
</div>

<script>
		// 주문내역 상세보기 기능 구현하기
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
				<%-- location.href="<%=request.getContextPath()%>/updateGrade.me?user_Id="+ user_Id; --%>
				 
				 
				
			
				
				
			});
		});
</script>

</body>
</html>