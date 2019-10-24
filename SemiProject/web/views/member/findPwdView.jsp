<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#outer{
	width: 400px;
	height: 700px;
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}
#findBtn {
	background: #40e0d0;
	color: white;
	display: inline-block;
	text-align: center;
	width: 300px;
	height: 40px;
}

.findBtn {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
form {
  display: grid;
  grid-template-rows: 80px;
  font-family: Avenir;
  -webkit-text-size-adjust: 100%;
  -webkit-font-smoothing: antialiased;
  overflow: hidden;
}
* {
  box-sizing: border-box;
}
.inp {
  position: relative;
  margin: auto;
  width: 100%;
  max-width: 280px;
}
.inp .label {
  position: absolute;
  top: 16px;
  left: 0;
  font-size: 16px;
  color: #9098a9;		/* 이메일 입력 글씨색 */
  font-weight: 500;
  transform-origin: 0 0;
  transition: all 0.2s ease;
}
.inp svg {
  position: absolute;
  left: 0;
  bottom: 0;
  height: 26px;
  fill: none;
}
.inp svg path {
  stroke: #c8ccd4;		/* 커서 안눌렀을 때 왼쪽 줄 색 */
  stroke-width: 2;
}
.inp svg path d {
  transition: all 0.2s ease;
}
.inp .border {
  position: absolute;
  bottom: 0;
  left: 120px;
  height: 2px;
  right: 0;
  background: #c8ccd4;		/* 커서 안눌렀을 때 오른쪽 줄 색 */
}
.inp input {
  -webkit-appearance: none;
  width: 100%;
  border: 0;
  font-family: inherit;
  padding: 12px 0;
  height: 48px;
  font-size: 16px;
  font-weight: 500;
  background: none;
  border-radius: 0;
  color: #223254;
  transition: all 0.15s ease;
}
.inp input:not(:placeholder-shown) + span {
  color: #5a667f;
  transform: translateY(-26px) scale(0.75);
}
.inp input:focus {
  background: none;
  outline: none;
}
.inp input:focus + span {
  color: #07f;		/* 커서 눌렀을 때 이메일 입력 글씨 색 */
  transform: translateY(-26px) scale(0.75);
  transition-delay: 0.1s;
}
.inp input:focus + span + svg path {
  stroke: #07f;		/* 커서 눌렀을 때 왼쪽 줄 색 */
  animation: elasticInput 0.4s ease forwards;
}
.inp input:focus + span + svg + .border {
  background: #07f;		/* 커서 눌렀을 때 오른쪽 줄 색 */
}
@-moz-keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
@-webkit-keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
@-o-keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
@keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
</style>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<%-- <div id="outer" align = "center">
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
	</div> --%>
	
	<div id="outer" align = "center">
	<br>
		<h2 align = "center">비밀번호 찾기</h2>
		<br><br>
	<form id="findForm" action="<%=request.getContextPath()%>/findpwd.me" method="post">
	<label for="findMail" class="inp">
		<input type="email" id="findMail" name="findMail" oninput = "checkId();" placeholder="&nbsp;">
		<span class="label">이메일 입력</span>
		<svg width="120px" height="26px" viewBox="0 0 120 26">
		<path d="M0,25 C21,25 46,25 74,25 C102,25 118,25 120,25"></path>
		</svg>
		<span class="border"></span>
	</label>
	<div id = "checkId"></div>
	<input type = "hidden" id = "randomPwd" name = "randomPwd">
	<br><br>
	<div class = "findBtn">
	<button id = "findBtn" type="button" onclick="find();">이메일로 비밀번호 찾기</button>
	</div>
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