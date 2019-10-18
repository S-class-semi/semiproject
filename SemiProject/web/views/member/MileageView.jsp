<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mileage_set{
	max-width: 360px;
	margin-top:10px;
	padding: 30px 10px;
	width:100%;
	margin:30px auto;
	box-sizing:border-box;
	box-shadow:0 1px 3px 0 rgba(0,0,0,0.2);
	color:#424242;
	}
	.title{
		font-size:18px;
		font-weight:700;
		padding: 0 10px 28px;
	}
	.mileage_total{
		font-size: 25px;
		line-height: 40px;
		float:right;
	}
	.not_have_result{
		font-size:12px;
		text-align:center;
		padding:80px 0 0;
		cospdor:#424242;
	}
	.mileage_info{
		font-size:11px;
		font-weight:normal;
		line-height:0px;
		padding: 0px 10px 0px;
	}
	a{
		text-decoration:none;
	}
	.mileage-list{
		font-size:18px;
		padding:28px 10px 20px;
		line-height:30px;
		font-weight:700;
	}
	.mileage_list2{
		font-size:18px;
		padding: 0px 10px 20px;
		line-height:30px;
		font-weight:700;
	}
</style>
</head>
<body>
<%@ include file = "/views/member/mypageMenuView.jsp" %>
<div id="mileage_set">
	<div class="title">
		사용가능한 포인트
	</div>
	<div class="mileage_total">
		0p
	</div>
	<span>30일 이내 소멸 포인트</span>
	<span>p</span>
	<br><br><hr>
	<div class = "mileage_list2">
	<div class="mileage-list">
		포인트 내역
	</div>
	<a href="#">
		<div class="mileage_info">나혼자산다 포인트 사용 안내</div>
	</a>
	</div>
	<div class="not_have_result">
		포인트 내역이 없습니다.
	</div>
</div>
</body>
</html>