<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.title{
		font-size:18px;
		font-weight:bold;
		color:#35c5f0;
		border-bottom: 2px solid #35c5f0;
	}
	.content{
		max-width:600px;
		padding:30px 20px 56px;
		margin: 10px auto;
		width:100%;
		background-color:#ffffff;
		box-sizing:border-box;
		box-shadow:0 1px 3px 0 rgba(0,0,0,0.2);
		color:#424242;
	}
	.subt{
		font-weight:bold;
	}
</style>
</head>
<body>
	<%@ include file = "/views/member/mypageMenuView.jsp" %>
<div class="content">
<div class="title">취소/교환/환불 조회</div>
<br>
	<tr>
		<th class="subt">주문일</th>
		<th class="subt">주문번호</th>
		<th class="subt">주문금액</th>
		<th class="subt">주문상태</th>
	</tr>
</div>
</body>
</html>
		