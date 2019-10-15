<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 900px;
		height: 700px;
		background: rgb(160, 200, 220);
		color: white;
		margin-left: auto;
		margin-right: auto;
		margin-top: 50px;
	}
	.outer label, .outer td{
		color: white;
	}
	input{
		margin-top: 2px;
	}
	#idCheck, #goMain, #joinBtn{
		background: rgb(160, 200, 220);
		border-radius: 5px;
		width: 80px;
		height: 25px;
		text-align: center;
		color: white;
	}
	td{
		text-align: right;
	}
	#joinBtn{
		background: hotpink;
		color: white;
	}
	#joinBtn, #goMain{
		display: inline-block;
	}	
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	
	<div class = "outer">
		<br>
		<h2 align = "center">회원가입</h2>

		<form id="joinForm" action="<%=request.getContextPath()%>/insert.me"
			method="post">
			<fieldset>
				<ol>
					<li>
						<label for="userId">* 아이디(이메일)</label>
						<input id="userId" name="userId" type="email" required autofocus>
					</li>
					<li>
						<label for="userPwd">* 비밀번호</label>
						<input id="userPwd" name="userPwd" type="password" required>
					</li>
					<li>
						<label for="userPwd2">* 비밀번호 확인</label>
						<input id="userPwd2" name="userPwd2" type="password" required>
					</li>
					<li>
						<label for="nickname">* 별명</label>
						<input id="nickname" name="nickname" type="text" required>
					</li>
					<li>
						<label>* 평수</label><br>
						<input id="space1" name="space" type="radio" checked>
						<label for="space1">1평</label>&nbsp;
						<input id="space3" name="space" type="radio">
						<label for="space3">3평</label>&nbsp;
						<input id="space5" name="space" type="radio">
						<label for="space5">5평</label>&nbsp;
						<input id="space7" name="space" type="radio">
						<label for="space7">7평</label>&nbsp;
						<input id="space9" name="space" type="radio">
						<label for="space9">9평</label>&nbsp;
						<input id="space10" name="space" type="radio">
						<label for="space10">10평</label>
				</ol>
			</fieldset>

			<div class="btns" align="center">
				<input type="button" id="goMain" onclick="goMain();" value = "메인으로">
				<input type="submit" id="joinBtn" value="가입하기">

			</div>
		</form>
	</div>
	
	<script>
		// 메인으로
		function goMain(){
			location.href = "<%= request.getContextPath() %>/index.jsp";
		}
	</script>
	
</body>
</html>