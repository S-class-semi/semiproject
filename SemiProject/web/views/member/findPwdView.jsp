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
						<input type="email" id="findMail" name="findMail" oninput = "checkId();">
						<input type = "hidden" id = "randomPwd" name = "randomPwd">
					</td>
				</tr>
				<tr>
					<td><div id = "checkId"></div></td>				
				</tr>
			</table>
			<br>
			<button type="button" onclick="find();">이메일로 비밀번호 찾기</button>
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
		
		// 가입된 이메일인지 확인
		var idUsable = false;
		function checkId(){
			var userId = $("#findMail");
			
			if(userId.val().indexOf(" ") >= 0){
				alert("공백은 입력할 수 없습니다");
				userId.val("");
				$("#checkId").html('');
				
			}else{
			
				if(userId.val().length == 0){
					$("#checkId").html('');
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/idcheck.me",
						type:"post",
						data:{userId:userId.val()},
						success:function(data){
							if(data == "fail"){
								$("#checkId").html('');
								$("#checkId").html("가입된 이메일입니다").css("color", "green");
								idUsable = true;
							}else{
								$("#checkId").html('');
								$("#checkId").html("가입되지 않은 이메일입니다").css("color", "red");
								idUsable = false;
							}
						},
						error:function(data){
							console.log("서버 통신 안됨");
						}
					});
				}
			}
		};

		// 비밀번호 찾기 버튼 클릭했을 때
		function find(){
			if(idUsable == false){
				alert("가입되지 않은 이메일입니다");
				$("#findMail").focus();
			}else{
				alert("이메일 전송이 완료되면 페이지가 전환됩니다. 잠시만 기다려주세요");
				$("#findForm").submit();
			}
		}
		
	</script>

</body>
</html>