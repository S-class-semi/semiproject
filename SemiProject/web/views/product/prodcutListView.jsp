<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "product.model.vo.* , java.util.ArrayList"%>
<%
	ArrayList<ProductInfo> pList = (ArrayList<ProductInfo>)request.getAttribute("pList");
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
	border: 1px solid red;
	margin-left: 250px;
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
   .searchArea {
      width:650px;
      margin-left:auto;
      margin-right:auto;
   }
</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 
		<div id="centerbody">
			<br>
	<h2 align= "center">게시판</h2>
	<div class = "tableArea">
		<table align = "center" id = "listArea">
			<tr>
				<th width = "100px">번호</th>
				<th width = "100px">상품코드</th>
				<th width = "100px">상품카테고리</th>
				<th width = "100px">상품명</th>
				<th width = "100px">상품가격</th>
				<th width = "100px">회사명</th>
			</tr>
			<% if(pList.isEmpty()){%>
			<tr>
				<td colspan="6">조회된 리스트가 없습니다.</td>
			</tr>
			<%} else{ %>
				<% for(ProductInfo p : pList){%>
					<tr>
						<input type="hidden" value ="<%=p.getP_info()%>">
						<td><%=p.getP_number() %></td>
						<td><%=p.getP_code() %></td>
						<td><%=p.getPro_code() %></td>
						<td><%=p.getP_name() %></td>
						<td><%=p.getP_price() %></td>
						<td><%=p.getC_name() %></td>
						
					</tr>
				<% } %>
			<%} %>
		</table>
	</div>
		<!-- 페이징 처리 시작 -->
		<div class = "pagingArea" align= "center">
			<!-- 맨처음으로 (<<) -->
			<button onclick = "location.href='<%=request.getContextPath() %>/list.bo?currentPage=1'"> << </button>
		
			<!-- 이전 페이지로 -->
			<%if (currentPage <= 1) {%>
			<button disabled> < </button>
			<%} else{ %>
			<button onclick = "location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=currentPage-1 %>'"> < </button>
			<%} %>
			
			<!--  10개의 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				<%if(p == currentPage) {%>
					<button disabled> <%=p %></button>
				<%}else{ %>
					<button onclick = "location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=p %>'"> <%=p %> </button>
				<%} %>
			<%} %>
			
			<!-- 다음페이지로 -->
			<%if(currentPage >=maxPage){ %>
				<button disable> > </button>
			<%}else { %>
				<button onclick = "location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=currentPage+1 %>'"> > </button>
			<%} %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=maxPage %>'"> >> </button>
		</div>
		
		<!-- 공지사항 때와 마찬가지로 검색 부분이 있다. 기능 구현은 생략 -->
		<div class = "searchArea" align="center">
		<select id ="searchCondition" name = "searchCondition">
			<option>----</option>
			<option value = "category">카테고리</option>
			<option value = "writer">회사명</option>
			<option value = "title">상품코드</option>
		</select>
		<input tpye="search">
		<button type= "submit">검색하기</button>
		
		<!-- 공지사항 떄와는 다르게 여기선 로그인을 한 사람만 게시글을 작성하게 하자 -->

		</div>
		</div>
<script>
	//게시판 상세보기 기능 구현하기
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background":"white","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"#dcdcdc"});
		}).click(function(){
			var pro_id=$(this).parent().children().eq(1).text();
			location.href= " <%=request.getContextPath() %>/detail.pro?pro_id=" + pro_id;
			
<%-- 			//로그인 한 사람만 이용하도록 하자!
			<% if(loginUser != null ){%>
				location.href= " <%=request.getContextPath() %>/detail.bo?bid=" + bid;
			<% } else{ %>
				alert("로그인 해야 상세보기가 가능합니다!");
			<%} %>
			//BoardDetailServlet 만들러 ㄱㄱ씽
		 --%>
			
			
		});
	});
</script>

</body>
</html>