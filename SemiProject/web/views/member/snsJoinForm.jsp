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
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	
	<div class = "outer">
		<br>
		<h2 align = "center">추가정보 입력</h2>
		
		<form id="joinForm" action="<%=request.getContextPath() %>/insert.me" method="post">
			<table>
				<tr>
					<td>* 이메일</td>
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
							userId.focus();
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
	</script>

</body>
</html>