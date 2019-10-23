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
	#joinBtn{
		background: hotpink;
		color: white;
		display: inline-block;
		text-align: center;
		width: 300px;
		height: 50px;
	}
	.joinBtn{
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	.outer input{
		
	}
</style>
</head>
<body>

	<%@ include file = "../common/menubar.jsp" %>
	
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
						<input id="userId1" name="userId1" type="text" oninput = "checkId();" required autofocus> @ 
						<input id="userId2" name="userId2" type="text" oninput = "checkId();" disabled>
						<input type = "hidden" id = "userId3" name = "userId3">
						<select id = "email" name = "email" >
							<option value = "naver.com">naver.com</option>
                            <option value = "hanmail.net">hanmail.net</option>
                            <option value = "gmail.com">gmail.com</option>
                            <option value = "nate.com">nate.com</option>
							<option value = "1">직접입력</option>
						</select>
					</td>
					<td><div id = "checkId"></div></td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
				</tr>
				<tr>
					<td>8자 이상 영문, 숫자, 특수문자를 사용하세요</td>
				</tr>
				<tr>
					<td><input id="pwd" name="pwd" type="password" required></td>
					<td><div id = "pwdTest"></div></td>
				</tr>
				<tr>
					<td>* 비밀번호 확인</td>
				</tr>
				<tr>
					<td><input id="checkPwd" name="checkPwd" type="password" required></td>
					<td><div id = "pwdTF"></div></td>
				</tr>
				<tr>
					<td>* 별명</td>
				</tr>
				<tr>
					<td>한글, 영문, 숫자만 입력 가능합니다</td>
				</tr>
				<tr>
					<td><input id="nickname" name="nickname" type="text" required></td>
					<td><div id = "nickTF"></div></td>
				</tr>
				<tr>
					<td>* 평수</td>
				</tr>
				<tr>
					<td>
					<input id="space1" name="space" type="radio" value = "1" checked>
					<label for="space1">1평</label>&nbsp;
					<input id="space3" name="space" type="radio" value = "3">
					<label for="space3">3평</label>&nbsp;
					<input id="space5" name="space" type="radio" value = "5">
					<label for="space5">5평</label>&nbsp;
					<input id="space7" name="space" type="radio" value = "7">
					<label for="space7">7평</label>&nbsp;
					<input id="space9" name="space" type="radio" value = "9">
					<label for="space9">9평</label>&nbsp;
					<input id="space10" name="space" type="radio" value = "10">
					<label for="space10">10평</label>
					</td>
				</tr>
			</table>
			<br><br><br>
			<div class="joinBtn">
				<input type="submit" id="joinBtn" value="가입하기">
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
		    	$("#pwdTest").html("비밀번호에 아이디가 포함되었습니다").css("color", "red");
		    	
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
			
			if(!/^[a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/.test($("#nickname").val())){
				alert("별명은 한글, 영문, 숫자만 입력 가능합니다");
				$("#nickname").focus();
				return false;
			}
			
			if($("#nickname").val().indexOf(" ") >= 0){
				alert("별명에 공백은 입력할 수 없습니다");
				$("#nickname").focus();
				return false;
			}
			
			return true;
		}
	</script>
	
</body>
</html>