<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "board.model.vo.*"%>
    
    <%
    	QNA b = (QNA)request.getAttribute("board");
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
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
      }
   td {
      border:1px solid white;
   }

   .tableArea {
      border:1px solid white;
      width:800px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
   #content {
      height:230px;
   }
   #centerbody {
	display: inline-block;
	position: relative;
	width: 100%;
	height: 100%;
	border : 1px solid black;
	margin-left: 250px;
	}
</style>
</head>
<body>
<%@ include file = "/views/admin/adminMenuView.jsp" %> 
<div class = "outer">
	<br>
	<h2 align ="center">1:1 문의 상세보기</h2>
	<div id= "centerbody">
		<div class = "tableArea">
		<form id = "updateForm" method="post">
			<table align = "center" width="800px">
				<tr>
				<input type = "hidden" name="bid" value= "<%=b.getbId() %>">
					<td>카테고리</td>
					<td><span><%=b.getbType() %></span></td>
					<td>제목</td>
					<td colsapn="3"><span><%=b.getbTitle() %></span></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><span><%=b.getbWritter() %></span></td>
					<td>작성일</td>
					<td><span><%=b.getbTime() %></span></td>
					<td>처리여부</td>
					<td><span><%=b.getStatus() %></span></td>
				</tr>
				<tr>
					<td colspan="6">내용</td>
				</tr>
				<tr>
					<td colspan="6"><p id="content"><%=b.getbText() %></p></td>
				</tr>
			</table>
		<div align ="center">
			<button type="submit" onclick = "update()">처리하기</button>
		</div>
			</form>
		</div>
			
		
	</div>
</div>

<script>
	
	function update(){
		$("#updateForm").attr("action","<%=request.getContextPath()%>/update.qna");
	}
	
</script>
</body>
</html>