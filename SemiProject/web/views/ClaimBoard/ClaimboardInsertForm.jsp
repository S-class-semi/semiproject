<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      border:1px solid white;
   }
   .tableArea {
      width:650px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
   #center{
   	color:#35c5f0;
   	font-weight:bold;
   }
</style>
</head>
<body>
	<%@include file = "/views/member/mypageMenuView.jsp"%>
	<div class="outer">
		<br>
		<h2 align="center" id="center">1:1 질문ㅇㅅ< </h2>
		<div class="tableArea">
			<form action="<%=request.getContextPath() %>/insert.bo" method="post">
				<table>
					<tr>
						<td>분야</td>
						<td>
							<select name="category">
								<option>-------</option>
								<option value="10">주문취소</option>
								<option value="20">판매자신고</option>
								<option value="30">교환</option>
								<option value="40">환불</option>
								<option value="50">주문/결제</option>
								<option value="60">상품/재입고문의</option>
								<option value="70">기타문의</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colsapn="3"><input type="text" size="58" name="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea rows="15" cols="60" name="content" style="resize:none"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 게시판 작성하기 기능 구현하러 가기 -->
	<!--  InsertBoardServlet 만들러 ㄱㄱ씽 -->
</body>
</html>