<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>

	#password_form>.title{
		margin-bottom:15px;
		font-size:24px;
		font-weight:700;
	}
	#password_form>form>label{
		color:#424242;
		display:block;
		font-size:14px;
		font-weight:bold;
	}
	#password_form{
		padding:30px;
		max-width:360px;
		width:100%;
		box-sizing:border-box;
		background-color:#ffffff;
		box-shadow:1px 3px rgba(0,0,0,0.2);
	}
	#password_form>form>.notice{
		margin-top:5px;
		font-size:12px;
		color:#757575;
	}
	#password_form>form>input[type=submit]{
		margin-top:15px;
		width:100%;
		height:40px;
		background-color:#35c5f0;
		border:none;
		border-radius:4px;
		color: #ffffff;
		font-size:18px;
		font-weight:700;
		text-align:center;
		cursor:pointer;
	}
	
</style>
</head>
<body>
 <%@ include file = "/views/member/mypageMenuView.jsp" %>
	<div id = "password_form">
		<div class = "title">비밀번호 변경</div>
		<form class="edit_user" action="<%=request.getContextPath() %>/re.me" method="post">
			<label for = "user_password">새비밀번호</label>
			<div class="notice">8자이상 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
			<input autofocus = "autofocus" name = "password">
			<label>새 비밀번호 확인</label>
			<input autocomplete="off" type="password">
			<br>
			<input type = "submit" name ="commit" value="비밀번호변경">
		</form>
		
	</div>
	
	
</body>
</html>