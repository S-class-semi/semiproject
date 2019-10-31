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

#centerbody {
	display: inline-block;
	position: relative;
	width: 85%;
	height: 100%;
	border: 1px solid red;
	margin-left: 250px;
}
	.outer{
		width:800px;
		height:600px;
		background:white;
		
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table{
	 border-collapse: collapse;
		text-align:center;
		
	}
	th, td {
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
<%@ include file = "/views/company/companyMenubar.jsp" %> 


	<div id="centerbody">
		<br>
		
		<h2 align="center">공지사항</h2>
		
		<div class="tableArea">
			<!-- 조회가 잘 되어 출력되는지 확인 -->
			<table align="center" id="listArea">
				<tr>
					<th>No.</th>
					<th width="500px">제목</th>
					<th width="100px">작성자</th>
					<th width="200px">작성일</th>
				</tr>
			 	 <%if(list.isEmpty()){ %>
					<tr>
						<td colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>
				<%}else{ %>
					<%for(Notice no : list){ %>
					<tr>
						<td><%= no.getB_NO() %></td>
						<td style="text-align:left;"><%= no.getB_TITLE() %></td>
						<td><%= no.getUSER_ID() %></td>
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
			<button type="button" onclick="noticeinsertView()">작성하기</button>
		</form>
		</div>
	</div>
	
	<script>
	function noticeinsertView(){
		location.href = "<%=request.getContextPath()%>/views/notice/noticeInsertForm.jsp";
	}
	$(function(){
			$("#listArea td").click(function(){
				var name = $(this).parent().children().eq(2).text();
				var no = $(this).parent().children().eq(0).text();
				var info = name +"/" + no;
				if(name==[]){
					
				}else{
					location.href = "<%=request.getContextPath()%>/detail.ng?info="+info;
				}
					
		 		});
	});
	</script>
		
	

			
 
	
	
	
	
</body>
</html>