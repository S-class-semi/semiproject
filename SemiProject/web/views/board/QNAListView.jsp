<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*,java.util.ArrayList"%>

<%
	ArrayList<QNA> list = (ArrayList<QNA>)request.getAttribute("list");
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
	width: 100%;
	height: 100%;
	
	margin-left: 100px;
	}
	.outer{
      width:900px;
      height:500px;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
      }
   .header {
  background-color: #327a81;
  color: white;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}

img {
  border-radius: 50%;
  height: 60px;
  width: 60px;
}

.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 800px;
}

table {
  width: 100%;
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
}
table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: left;
}
table th {
  background-color: #daeff1;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #edf7f8;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: 'Name:';
  }
  td:nth-child(3):before {
    content: 'Email:';
  }
  td:nth-child(4):before {
    content: 'Phone:';
  }
  td:nth-child(5):before {
    content: 'Comments:';
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}
</style>
</head>
<body>
<%@ include file = "/views/admin/adminMenuView.jsp" %> 


<div class = "outer">

<div id="centerbody">

<div class="table-users">
   <div class="header">1:1 문의 확인</div>

				<table align="center" id="listArea">
					<tr>
						<th width="100px">글번호</th>
						<th width="300px">글제목</th>
						<th width="100px">작성자</th>
						<th width="150px">작성일</th>
						<th width="100px">처리여부</th>
					</tr>
					<%
						if (list.isEmpty()) {
					%>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다</td>
					</tr>
					<%
						} else {
					%>
					<%
						for (QNA b : list) {
					%>
					<tr>
						<input type="hidden" value="<%=b.getbId()%>">
						<td><%=b.getbId()%></td>
						<td><%=b.getbTitle()%></td>
						<td><%=b.getbWritter()%></td>
						<td><%=b.getbTime()%></td>
						<td><%=b.getStatus()%></td>
					</tr>
					<%} %>
					<%} %>
				</table>
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
		$(this).parent().css({"background":"#ebeced","cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"white"});
	}).click(function(){
		var bid=$(this).parent().children("input").val();
		location.href="<%=request.getContextPath()%>/qnadetail.bo?bid=" + bid;
	});
});

</script>
</body>
</html>