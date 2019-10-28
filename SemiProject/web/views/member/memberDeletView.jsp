<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
	#content form>.filed{
		padding: 25px 0 10px;
	}
	#content.title{
		font-weight:bold;
	}
	#content>.field>.box{
		margin-top: 20px;
		padding:10px 20px;
		border:1px solid #dcdcdc;
		word-break:keep-all;
		overflow:hidden;
		font-size:12px;
		line-heigt:18px;
	}
	#content span.alert{
		font-weight:bold;
		color:#ff7777;
	}
	#content>.field div{
		display:inline-block;
	}
	.button{
		display:block;
		float:left;
		border:none;
		border-radius:4px;
		backgrund-color:#35c5f0;
		font-weight:bold;
		font-size:16px;
		color:#ffffff;
		text-align:center;
	}
	#content .title{
		font-weight: bold;
		font-size:20px;
	}
	#content{
		padding:30px;
		margin-top:10px;
		margin:30px auto;
		max-width:1000px;
		width:100%;
		box-sizing:border-box;
		box-shadow:0 1px 3px 0 rgba(0,0,0,0.2);
		background-color:#ffffff;
	}
	
</style>
</head>
<body>
<%@ include file = "/views/member/mypageMenuView.jsp" %>
<form id="updateForm" action="<%=request.getContextPath() %>/update.me" method="post">
<div id = "content">
	<div class="title">회원탈퇴 신청</div>
	<br>
	<div class="field">
	<div class="title">회원탈퇴 신청에 앞서 아래 내용을 반드시 확인해 주세요.</div>
	<br>
	<div class="box">
		<div class="title">회원탈퇴 시 처리내용</div>
			<ul class="text">
				<li>난혼자산다 포인트.쿠폰은 소멸되며 환불되지 않습니다.</li><br>
				<li>난혼자산다 구매 정보가 삭제됩니다.</li><br>
				<li>
				"소비자보호에 관한 법률 제6조에 의거,<br>계약 또는 청약철회 등에 관한기록은 5년,<br>
				대금결제 및 재화등의 공급에 관한 기록은 5년, <br>
				소비자의 불만 또는 분쟁처리에 관한 기록은 3년 동안 보관됩니다.<br>
				개인정보는 법률에 의한 보유 목적 외에 다른 목적으로는 <br>
				이용되지 않습니다."<br></li>
			</ul>
	<div class="title">회원탈퇴 시 게시물 관리</div>
	<br>
	<div class="text">
		"회원탈퇴 후 나혼자산다 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며,<br>
		 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로<br> 
		 게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다.<br>
		 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후,<br>
		 탈퇴를 신청하시기 바랍니다."<br>
		</div>
		<br><br>
	<div class="title">회원탈퇴 후 재가입 규정</div>
	<br>
	<div class="text">
		탈퇴 회원이 재가입하더라도 기존의 나혼자산다 포인트는 <br>
		이미 소멸되었기 때문에 양도되지 않습니다.
		</div>
		</div>
		</div>
		<div class="cs_center">
		<b>고객센터 1670-0876</b></div>
	<div class="confirm ui-checked-left-right-text ui-checked">
		<input id="confirm" type="checkbox">
		<div class="image"></div>
		<label for="confirm">
		"위 내용을 모두 확인하였습니다."
		</label>
		<span class="alert">필수</span>
	</div>
	<br><br>
<div class="field">
	<div class="title">
	"난혼자산다 회원에서 탈퇴하려는 이유가 무엇인가요?"
	<span class="alert">필수</span>
	</div>
	<br>
	<div class="box" >
		<div class="check_box ui-checked ui-checked-left-right-text">
			<input type="checkbox" name="reason_0" id="reason_0" value="이용빈도 낮음" class="reason">
			<div class="image"></div>
			<label for="reason_0">이용빈도 낮음</label>
		</div>
		<br>
		<div class="check_box ui-checked ui-checked-left-right-text">
			<input type="checkbox" name="reason_1" id="reason_1"value="재가입"class="reason">
			<div class="image"></div>
			<label for="reason_1">재가입</label>
		</div>
		<br>
		<div class= "check_box ui-checked ui-checked-left-right-text">
			<input type="checkbox" name="reason_2" id="reason_2" value="콘텐츠/제품정보/상품부족" class="reason">
		<div class="image"></div>
		<label for="reason_2">콘텐츠/제품정보/상품 부족</label>
		</div>
		<br>
		<div class= "check_box ui-checked ui-checked-left-right-text">
			<input type="checkbox" name="reason_3" id="reason_3" value="기타" class="reason">
		<div class="image"></div>
		<label for="reason_3">기타</label>
		</div>
	</div>
</div>

<div id="deleteBtn" onclick="deleteMember();">탈퇴하기</div>
<a class="cancel-button" href="https://www.naver.com/">취소하기</a>
</div>
</form>
<script>
// 회원 탈퇴하기
		function deleteMember(){
			var bool = confirm("정말루 탈퇴 할꼬얌?");
			
			if(bool){
				$("#updateForm").attr("action", "<%=request.getContextPath()%>/delete.me");
				$("#updateForm").submit();
				// DeleteMemberServlet 만들러 ㄱㄱ씽!
			}
		}
</script>
</body>
</html>