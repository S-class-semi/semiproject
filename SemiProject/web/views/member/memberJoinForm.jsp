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

		<form id="joinForm" action="<%=request.getContextPath()%>/insert.me" method="post" onsubmit = "toEnabled()">
			<table>
				<tr>
					<td>* 아이디(이메일)</td>
					<td>
						<input id="userId1" name="userId1" type="text" required autofocus> @ 
						<input id="userId2" name="userId2" type="text" disabled>
						<select id = "email" name = "email">
							<option value = "naver.com">naver.com</option>
                            <option value = "hanmail.net">hanmail.net</option>
                            <option value = "gmail.com">gmail.com</option>
                            <option value = "nate.com">nate.com</option>
							<option value = "1">직접입력</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input id="userPwd" name="userPwd" type="password" required></td>
				</tr>
				<tr>
					<td>* 비밀번호 확인</td>
					<td><input id="checkPwd" name="checkPwd" type="password" required></td>
				</tr>
				<tr>
					<td>* 별명</td>
					<td><input id="nickname" name="nickname" type="text" required></td>
				</tr>
				<tr>
					<td>* 평수</td><br>
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
		
		// 처음 시작할 때 naver.com으로
		$(function(){
			$("#userId2").val($("#email option").eq(0).val());
		});
		
		// 메일 바뀌게 하는 함수
		$('#email').change(function(){
		 	$("#email option:selected").each(function () {
				if($(this).parent().val()== "1"){ // 직접입력일 경우
					$("#userId2").val(""); // 값 초기화
					$("#userId2").attr("disabled",false); // 활성화
				}else{ // 직접입력이 아닐경우
					$("#userId2").val($(this).parent().val()); // 선택값 입력
					$("#userId2").attr("disabled",true); // 비활성화
				}
			}); 

		});
		
		// 메일주소 제대로 넘어가게
		function toEnabled() {
			$("#userId2").attr("disabled",false);
			}
		
		// 비밀번호 유효성 검사
		$("#userPwd").change(function(){
		    checkPassword($('#userPwd').val(),$('#userId1').val());
		});
		
		
		
	</script>
	
</body>
</html>