<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body{
	background: #f2f2f2;
}
.outer {
	width: 900px;
	height: 700px;
	background: #f2f2f2;
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.outer label, .outer td {
	color: black;
}

input {
	margin-top: 2px;
}

/* 가입버튼 */
#joinBtn{
  background:#40e0d0;
  color:#fff;
  border:none;
  border-radius: 5px;
  position:relative;
  width: 300px;
  height:40px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#joinBtn:hover{
  background:#fff;
  color:#40e0d0;
}
#joinBtn:before,#joinBtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #40e0d0;
  transition:400ms ease all;
}
#joinBtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#joinBtn:hover:before,#joinBtn:hover:after{
  width:100%;
  transition:800ms ease all;
}

.joinBtn {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.join {
	width: 200px;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 3px solid #ccc;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	outline: none;
	border-style: hidden;
	box-shadow : 5px 5px 3px 2px gray;
	border-radius: 5px;
}
.join:focus {
	box-shadow : 5px 5px 3px 2px #40e0d0;
	border: 1px solid #40e0d0;
}

@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
  }
}

.option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 13.33333px;
  right: 0;
  bottom: 0;
  left: 0;
  height: 40px;
  width: 40px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background: #40e0d0;
}
.option-input:checked::before {
  height: 40px;
  width: 40px;
  position: absolute;
  content: "✔";
  display: inline-block;
  font-size: 26.66667px;
  text-align: center;
  line-height: 40px;
}
.option-input:checked::after {
  -webkit-animation: click-wave 0.65s;
  -moz-animation: click-wave 0.65s;
  animation: click-wave 0.65s;
  background: #40e0d0;
  content: "";
  display: block;
  position: relative;
  z-index: 100;
}
.option-input.radio {
  border-radius: 50%;
}
.option-input.radio::after {
  border-radius: 50%;
}

/* input */
form {
  display: grid;
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
  color: #9098a9;
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
  stroke: #c8ccd4;
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
  background: #c8ccd4;
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
  color: #07f;
  transform: translateY(-26px) scale(0.75);
  transition-delay: 0.1s;
}
.inp input:focus + span + svg path {
  stroke: #07f;
  animation: elasticInput 0.4s ease forwards;
}
.inp input:focus + span + svg + .border {
  background: #07f;
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
</head>
<body>
	
	<div class = "outer">
		<br>
		<h2 align = "center">회원가입</h2>

		<form id="joinForm" action="<%=request.getContextPath()%>/insert.me" method="post" onsubmit = "toEnabled()">
			<table align = "center">
				<tr>
					<td>* 아이디(이메일)</td>
				</tr>
				<tr>
					<td>
						<input id="userId1" name="userId1" class = "join" type="text" oninput = "checkId();" placeholder = "아이디" required autofocus> @ 
						<input id="userId2" name="userId2" class = "join" type="text" oninput = "checkId();" disabled>&nbsp;&nbsp;
						<input type = "hidden" id = "userId3" name = "userId3">
						<select id = "email" name = "email" class = "join">
							<option value = "naver.com">naver.com</option>
                            <option value = "hanmail.net">hanmail.net</option>
                            <option value = "gmail.com">gmail.com</option>
                            <option value = "nate.com">nate.com</option>
							<option value = "1">직접입력</option>
						</select>
					</td>
				</tr>
					<tr><td><div id = "checkId"></div></td></tr>
				<tr>
					<td>* 비밀번호</td>
				</tr>
				<tr>
					<td>8자 이상 영문, 숫자를 조합하여 입력하세요</td>
				</tr>
				<tr>
					<td><input id="pwd" name="pwd" class = "join" type="password" placeholder = "비밀번호" required></td>
				</tr>
					<tr><td><div id = "pwdTest"></div></td></tr>
				<tr>
					<td>* 비밀번호 확인</td>
				</tr>
				<tr>
					<td><input id="checkPwd" name="checkPwd" class = "join" type="password" placeholder = "비밀번호 확인" required></td>
				</tr>
					<tr><td><div id = "pwdTF"></div></td></tr>
				<tr>
					<td>* 별명</td>
				</tr>
				<tr>
					<td>한글, 영문, 숫자만 입력 가능합니다</td>
				</tr>
				<tr>
					<td><input id="nickname" name="nickname" class = "join" type="text" placeholder = "별명" required></td>
				</tr>
					<tr><td><div id = "nickTF"></div></td></tr>
				<tr>
					<td>* 평수</td>
				</tr>
				<tr>
					<td>
					<input id="space1" name="space" class="option-input radio" type="radio" value = "1" checked>
					<label for="space1">1평</label>&nbsp;
					<input id="space3" name="space" class="option-input radio" type="radio" value = "3">
					<label for="space3">3평</label>&nbsp;
					<input id="space5" name="space" class="option-input radio" type="radio" value = "5">
					<label for="space5">5평</label>&nbsp;
					<input id="space7" name="space" class="option-input radio" type="radio" value = "7">
					<label for="space7">7평</label>&nbsp;
					<input id="space9" name="space" class="option-input radio" type="radio" value = "9">
					<label for="space9">9평</label>&nbsp;
					<input id="space10" name="space" class="option-input radio" type="radio" value = "10">
					<label for="space10">10평</label>
					</td>
				</tr>
			</table>
			<br><br>
			<div class="joinBtn">
				<button id = "joinBtn" type="submit">가입하기</button>
			</div>
		</form>
	</div>
	
	<script>
		
		// 처음 시작할 때 naver.com으로
		$(function(){
			$("#userId2").val($("#email option").eq(0).val());
		});
		
		// 메일 바뀌게 하는 함수(바뀔 때마다 아이디 중복체크 함수 실행)
		$('#email').change(function(){
		 	$("#email option:selected").each(function () {
				if($(this).parent().val()== "1"){ // 직접입력일 경우
					$("#userId2").val(""); // 값 초기화
					$("#userId2").attr("disabled",false); // 활성화
					checkId();
				}else{ // 직접입력이 아닐경우
					$("#userId2").val($(this).parent().val()); // 선택값 입력
					$("#userId2").attr("disabled",true); // 비활성화
					checkId();
				}
			}); 

		});
		
		function toEnabled() {
			$("#userId2").attr("disabled",false);	// 메일주소 제대로 넘어가게
			
		}
		
		// 아이디 중복체크
		var idUsable = false;
		function checkId(){
			var userId = $("#userId3");
			var userId1 = $("#userId1");
			
			if(userId1.val().indexOf(" ") >= 0){
				alert("공백은 입력할 수 없습니다");
				userId1.val("");
				$("#checkId").html('');
				
			}else{
				$("#userId3").val($("#userId1").val() + '@' + $("#userId2").val());
			
				if(userId1.val().length == 0){
					$("#checkId").html('');
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/idcheck.me",
						type:"post",
						data:{userId:userId.val()},
						success:function(data){
							if(data == "fail"){
								$("#checkId").html('');
								$("#checkId").html("아이디가 중복됩니다").css("color", "red");
								idUsable = false;
							}else{
								$("#checkId").html('');
								$("#checkId").html("아이디 사용 가능합니다").css("color", "green");
								idUsable = true;
							}
						},
						error:function(data){
							console.log("서버 통신 안됨");
						}
					});
				}
			}
		};

		// 비밀번호 및 비밀번호 확인 일치 체크
		$(function() {
			$('#pwd').keyup(function() {
					$("#pwdTF").html('');
			});

			$('#checkPwd').keyup(function() {
				if($('#pwd').val() != $('#checkPwd').val()) {
					$("#pwdTF").html('');
					$("#pwdTF").html("비밀번호 불일치").css("color", "red");
				} else {
					$("#pwdTF").html('');
					$("#pwdTF").html("비밀번호 일치").css("color", "green");
				}
			});
		});
		
		// 비밀번호 유효성 검사
		$(function(){
			$("#pwd").blur(function(){
				checkPassword($('#pwd').val(),$('#userId1').val());	// 유효성 검사 함수 실행
				
				if($('#pwd').val() != $('#checkPwd').val() && $('#checkPwd').val() != "") {	// 비밀번호를 다 썼으면 일치 불일치 뜨게
					$("#pwdTF").html('');
					$("#pwdTF").html("비밀번호 불일치").css("color", "red");
				}
			});
		});
		
		// 비밀번호 유효성 검사 실행 함수
		function checkPassword(password,id){
		    var checkNumber = password.search(/[0-9]/g);
		    var checkEnglish = password.search(/[a-z]/ig);
		    var pattern1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		    var pattern2 = /(\w)\1\1\1/;
		    
			if(!pattern1.test(password)){            
		    	$("#pwdTest").html("영문, 숫자 8자 이상 조합을 사용해야 합니다").css("color", "red");
		    	
		    }else if(pattern2.test(password)){
		    	$("#pwdTest").html("같은 문자를 4번 이상 사용하실 수 없습니다").css("color", "red");
		    	
		    }else if(password.search(id) > -1 && id.length > 3){
		    	$("#pwdTest").html("비밀번호에 아이디가 포함되어 있습니다").css("color", "red");
		    	
		    }else{
		    	$("#pwdTest").html('');
		    }
		}
		
		// 별명 중복 체크
		var nickUsable = false;
		$(function(){
			$("#nickname").keyup(function(){
				var nickname = $("#nickname");
				
				if(nickname.val().length == 0){
					$("#nickTF").html('');
					
				}else{
					$.ajax({
						url:"<%= request.getContextPath() %>/nickcheck.me",
						type:"post",
						data:{nickname:nickname.val()},
						success:function(data){
							if(data == "fail"){
								$("#nickTF").html('');
								$("#nickTF").html("이미 존재하는 별명입니다").css("color", "red");
								nickUsable = false;
							}else{
								$("#nickTF").html('');
								$("#nickTF").html("사용 가능한 별명입니다").css("color", "green");
								nickUsable = true;
							}
						},
						error:function(data){
							console.log("서버 통신 안됨");
						}
					});
				}
			});
		});
		
		
		// 가입 버튼 클릭했을 때
		$(function(){
			$("#joinBtn").click(function(){
				return invalidJoin();
			})
		});
		
		// 가입버튼 클릭했을 때 실행 함수
		function invalidJoin(){
			var pattern1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		    var pattern2 = /(\w)\1\1\1/;
		    
			if($("#userId1").val().length == 0){
				alert("아이디를 입력하세요");
				$("#userId1").focus();
				return false;
			}
			
			if($("#pwd").val().length == 0){
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			}
			
			if($("#pwd").val().length < 8){
				alert("비밀번호는 8자 이상이어야 합니다");
				$("#pwd").focus();
				return false;
			}
			
			if($("#checkPwd").val().length == 0){
				alert("비밀번호 확인을 입력하세요");
				$("#checkPwd").focus();
				return false;
			}
			
			if($("#nickname").val().length == 0){
				alert("별명을 입력하세요");
				$("#nickname").focus();
				return false;
			}
			
			if(idUsable == false){
				alert("아이디가 중복됩니다");
				$("#userId1").focus();
				return false;
			}
			
			if($("#pwd").val() != $("#checkPwd").val()){
				alert("비밀번호가 일치하지 않습니다");
				$("#checkPwd").focus();
				return false;
			}
			
			if(nickUsable == false){
				alert("별명이 중복됩니다");
				$("#nickname").focus();
				return false;
			}
			
			if(!/^[a-zA-Z0-9]*$/.test($("#userId1").val())){
				alert("아이디에 한글 및 특수문자는 입력하실 수 없습니다");
				$("#userId1").focus();
				return false;
			}
			
			if($("#userId1").val().indexOf(" ") >= 0){
				alert("아이디에 공백은 입력할 수 없습니다");
				$("#userId1").focus();
				return false;
			}
			
			if($('#pwd').val().indexOf(" ") >= 0){
				alert("비밀번호에 공백은 입력할 수 없습니다");
				$('#pwd').focus();
				return false;
			}
			
			if($('#checkPwd').val().indexOf(" ") >= 0){
				alert("비밀번호 확인에 공백은 입력할 수 없습니다");
				$('#checkPwd').focus();
				return false;
			}
			
			if(!pattern1.test($("#pwd").val())){            
				alert("비밀번호는 영문, 숫자 8자 이상 조합을 사용해야 합니다");
		    	$("#pwd").focus();
		    	return false;
		    }
			
			if(pattern2.test($("#pwd").val())){
				alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다");
		    	$("#pwd").focus();
		    	return false;
		    }
			
			if($("#pwd").val().search($("#userId1").val()) > -1 && $("#userId1").val().length > 3){
				alert("비밀번호에 아이디가 포함되어 있습니다");
		    	$("#pwd").focus();
		    	return false;
		    }
			
			if($("#nickname").val().indexOf(" ") >= 0){
				alert("별명에 공백은 입력할 수 없습니다");
				$("#nickname").focus();
				return false;
			}
			
			if(!/^[a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/.test($("#nickname").val())){
				alert("별명은 한글, 영문, 숫자만 입력 가능합니다");
				$("#nickname").focus();
				return false;
			}
			
			return true;
		}
	</script>


</body>
</html>