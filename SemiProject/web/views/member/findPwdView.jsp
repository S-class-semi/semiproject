<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div id="outer" align = "center">
		<form id="findForm" action="<%=request.getContextPath()%>/findpwd.me" method="post">
			<table>
				<tr>
					<td><label>이메일 입력 </label></td>	<!--if로 가입된 이메일이면 발송 아니면 fail페이지 띄우자 -->
					<td>
						<input type="email" id="findMail" name="findMail">
						<input type = "hidden" id = "randomPwd" name = "randomPwd">
					</td>
				</tr>
			</table>
			<br>
			<button type="submit" onclick="find();">이메일로 비밀번호 찾기</button>
		</form>
	</div>
	
	<script>
	
		// 임시 비밀번호 생성
		$(function() {
			$("#findMail").keyup(function() {
				var text = "";
				var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?!";

				for (var i = 0; i < 7; i++) {
					text += possible.charAt(Math.floor(Math.random()* possible.length));
				}

				$("#randomPwd").val('');
				$("#randomPwd").val(text);
			});
		});
		
		function find(){
			alert("이메일 전송이 완료되면 페이지가 전환됩니다. 잠시만 기다려주세요")
		}
		
		
	</script>

</body>
</html>