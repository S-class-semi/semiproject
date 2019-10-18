<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- <% String[] str = {"abc","def"}; %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
	.sub_title{
		float:none;
		margin-bottom: 8px;
		width:100%;
		font-size: 13px;
		line-height:normal;
	}
	.title{
		font-size:18px;
		line-height:24px;
		pading: 0 0 20px;
	}
	.withdraw{
		float: right;
		font-size:13px;
		color:#bdbdbd;
		text-decoration:underline;
	}
	#submit{
	margin:25px 0 0;
	width:100%;
	height:40px;
	line-height:40px;
	font-size:14px;
	font-weight:normal;
	text-align:center;
	color:#ffffff;
	background-color:#35c5f0;
	border-radius:4px;
	border:none;
	cursor:pointer;
	}
	#content{
		max-width:600px;
		padding:30px 20px 56px;
		margin: 10px auto;
		width:100%;
		background-color:#ffffff;
		box-sizing:border-box;
		box-shadow:0 1px 3px 0 rgba(0,0,0,0.2);
		color:#424242;
	}
	.alert{
		padding-left:10px;
		padding-right: 10px;
		font-size: 11px;
		color:#dcdcdc;
	}
</style>
</head>
<body>
<%@ include file = "/views/member/mypageMenuView.jsp" %>
<br><br>
<div id = "content">
		<div class="title">회원정보수정</div>
		<a class="withdraw" href="#">탈퇴하기</a>
		<div class="sub_title">이메일</div>
		<input type="text">
		<span>@</span>
		<input type="text">
		<div class="alert">이메일을 변경하시려면 운영자에게 이메일을 보내주세요:)</div>
		<div class="sub_title">별명</div>
		<input placeholder="별명을 입력해주세요" type="text">
		<div class="sub_title">홈페이지</div>
		<input pattern="https?://.+" placeholder="http://~" type="text">
		<div class="sub_title">성별</div>
		<input type="radio" name="sex">
		<label>남자</label>
		<input type="radio" name="sex">
		<label>여자</label>
		<div class="sub_title">한줄 소개</div>
		<input type="text" name="usrintro" maxlength="40">
		<input type="submit" value="회원 정보 수정" id="submit">
		
		
		</div>
</body>
</html>






<br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br>