<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.Member"%>
    
<%
	Member user = (Member)session.getAttribute("loginUser");
%>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mileage_set{
	max-width:800px;
	margin-top:10px;
	padding: 30px 10px;
	width:100%;
	margin:30px auto;
	box-sizing:border-box;
	box-shadow:0 1px 3px 0 rgba(0,0,0,0.2);
	color:#424242;
	}
	.title{
		font-size:30px;
		font-weight:bold;
		padding: 0 10px 28px;
	}
	.mileage_total{
		font-size: 45px;
		line-height: 40px;
		float:right;
		color:#35c5f0;
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
		font-size:30px;
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
	.right{
		float:right;
	}
	#hitori{
		max-width:800px;
		paddgin:30px 20px 56px;
		margin: 10px auto;
		width:70%;
		background-color:#effbff;
		box-sizing:border-box;
		box-shadow:0 1px 3px 0 rgba(0,0,0,0.2);
		color:#424242;
		display:none;
	}
	.show{
		display:block;
	}
	.title1{
		font-size:18px;
		font-weight:bold;
		color:#09addb;
	}
	.info_btn{
		background-color:#35c5f0;
		color:#ffffff;
		font-size:18px;
		font-weight:700;
		text-align:center;
		border:none;
		width:40%;
		height: 50px;
		border-top-left-radius:5px;
		border-bottom-left-radius:5px;
		border-top-right-radius:5px;
		border-bottom-right-radius:5px;
	}
</style>
</head>
<body>
<div class="right">
<%@ include file = "/views/member/label.jsp" %>
</div>
<%@ include file = "/views/member/mypageMenuView.jsp" %>
<div id="mileage_set">
	<div class="title">
		사용가능한 포인트
	</div>
	<div class="mileage_total">
		<%= user.getPoint() %>p		<!-- 로그인을 하지 않으면 500에러가 뜬다 -->
	</div>
	<br><br><hr>
	<div class = "mileage_list2">
	<div class="mileage-list">
		포인트 내역
	</div>
		<input type = "button" name = "commit" value = "나혼자산다 포인트 사용 안내" class="info_btn">
		
	</div>
	<div class="not_have_result">
	</div>
</div>
<div id="hitori">
<div class="title1">난혼자산다 포인트 안내</div><br>
<div class="title1">공통 유의 사항</div><br>
모든 포인트는 오늘의집 가입 회원만 사용 가능합니다.<br>
(비회원 구매시 포인트 적립/사용이 불가)<br>
오늘의집 앱 또는 웹으로 결제할 경우에만 포인트 사용이 가능합니다.<br>
포인트는 최소 3만원 이상 결제 시 사용 가능합니다.<br>
단, 포인트에 따라 최소 구매 금액이나 최대 할인 금액 제한이 있을 수 있습니다.<br>
이벤트, 기획전 등 일부 상품에는 포인트 사용 제한이 있을 수 있습니다.<br>
사용기간이 만료된 포인트는 자동으로 소멸됩니다.<br>
자세한 내역은 오늘의집 포인트 사용 내역에서 확인 가능합니다.<br>
교환, 취소, 환불 시 수수료가 발생하는 경우, 포인트로는 결제가 불가능합니다.<br>
주문 후 결제 취소 시, 포인트 사용 기간이 남아있는 경우 자동 복원됩니다.<br>
구매후기 적립 포인트 안내<br>
상품 구매 확정 7일 후 구매금액의 1%를 적립해 드립니다. (VIP는 3%)<br>
회원 등급 기준 및 혜택은 오늘의집 운영 정책에 따라 변경될 수 있습니다.<br>
</div>
<script>
	$(function(){
		$(".info_btn").click(function(){
			$("#hitori").slideToggle();
		});
	});
</script>
<script>
	//회원탈퇴하기
	function deleteMember(){
		var bool = confirm("이제 혼자가 아니신가보군요!");
		
		if(bool){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/delete.me");
			$("#updateForm").submit();
			//DeleteMemberServlet 만들러 가자
		}
	}
</script>



<br><br><br>
<br><br><br>
<br><br><br>
</body>
</html>