<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userid = (String)request.getAttribute("userid");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %> 
	<div>
		<form action="<%=request.getContextPath() %>/insert.com" method="post" onsubmit ="return ifCheck()">
			<table border="1">
				<tr>
				<td><label>사용자 ID : </label></td>
				<td><label name = "userid"><%=userid %></label>
				</tr>
				<tr>
				<td><label> 사업증 번호 : </label></td>
				<td><input type="text" name="c_number" id="c_number"required autofocus></td>
				<td><div id = "c_numCheck"></div></td>
				</tr>
				<tr>
				<td><label> 회사명 : </label></td>
				<td><input type = "text" name="c_name" id="c_name"required autofocus></td>
				<td><div id = "c_nameCheck"></div>
				</tr>
				<tr>
				<td><label> 회사주소 : </label></td>
				<td>
				<input type="text" id="postcode" name = "postcode" class = "a_form.mini" placeholder="우편번호">
				<input type="button" onclick="on_click()" class ="a_btn" value="우편번호 찾기"><br>
				<input type="text" id="roadAddress" name = "roadAddress" class = "a_form.std" placeholder="도로명주소">
				<input type="text" id="jibunAddress" name = "jibunAddress" class = "a_form.std"placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="detailAddress" name = "detailAddress" placeholder="상세주소">
				<input type="text" id="extraAddress" name = "extraAddress" placeholder="시/도/구">
				 </td>
				</tr>
				<tr>
				<td><label> 회사연락처 : </label></td>
				<td><input type = "text" name = "c_phone" id= "c_phone"></td>
				<td><div id = "c_phoneCheck"></div></td>
				</tr>
				<tr>
				<td><label> 담당자 : </label></td>
				<td><input type = "text" name = "c_manager"> </td>
				</tr>
				<tr>
				<td><label> 담당자 연락처 : </label></td>
				<td><input type = "text" name = "c_contact" id="c_contact"></td>
				<td><div id = "c_contactCheck"></div></td>
				</tr>
				<tr>
				<td><label> 담당자 이메일 : </label></td>
				<td><input type = "text" name = "c_email" id="c_email"></td>
				<td><div id = "c_emailCheck"></div></td>
				</tr>
				<tr>
				<td><button type= "submit">정보 입력</buuton></td>
				<td><button type= "reset">취소 </button></td>
				</tr>
			</table>
		</form>

	</div>
	<!-- 주소 스크립트 -->
<script>
function on_click(){
    new daum.Postcode({
        oncomplete: function(data) {
        var Postcode =data.postcode;
		var Address = data.address;
		var JibunAddress = data.jibunAddress;
		var Bname = data.bname;
		
		console.log(Postcode);
		console.log(Address);
		console.log(JibunAddress);
		console.log(Bname);
		document.getElementById('postcode').value = Postcode;
		document.getElementById('roadAddress').value = Address;
		document.getElementById('jibunAddress').value = JibunAddress;
		document.getElementById('extraAddress').value = Bname;
		

		
		$("#postcode").attr("readonly","true");
		$("#roadAddress").attr("readonly","true");
		$("#jibunAddress").attr("readonly","true");
		$("#extraAddress").attr("readonly","true");
		autoClose: true;
        }
    
    
    }).open({autoClose: true});
   
}
</script>
		

<!-- 유효성 검사 -->
	
	<script>
	

	var c_numCK = false;
	var c_nameCK = false;
	var c_phoneCK = false;
	var c_contactCK = false;
	var c_emailCK = false;

	$(function(){

		 c_numCK = false;
	$("#c_number").keyup(function(){
		var c_number = $("#c_number");
		var c_nCk = /^[0-9]*$/;
		
		if(c_number.val().indexOf(" ") >= 0){
			alert("공백은 입력할 수 없습니다");
			c_number.val("");
			c_numCK = false;
		}else{
			if(c_nCk.test(c_number.val())){
				if(c_number.val().length == 0){
					$("#c_numCheck").html("사업자 번호를 입력하세요");
					c_numCK = false;
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/c_number.com",
						type:"post",
						data:{c_number:c_number.val()},
						success:function(data){
							if(data == "fail"){
								$("#c_numCheck").html('');
								$("#c_numCheck").html("등록된 사업증번호").css("color", "red");
								c_numCK = false;
								console.log(c_numCK);
							}else{
								$("#c_numCheck").html('');
								$("#c_numCheck").html("미등록 사업증번호").css("color", "green");
								c_numCK = true;
								console.log(c_numCK);
							}
						},
						error:function(data){
							console.log("서버 통신 안됨");
						}
					});
				}
			}else{
				alert("문자가 입력되었습니다.");
				c_number.val('');
			}


}
	
	});
	
	
	 c_nameCK = false;
	$("#c_name").keyup(function(){
		var c_name = $("#c_name");
		
		if(c_name.val().indexOf(" ") >= 0){
			alert("공백은 입력할 수 없습니다");
			c_name.val("");
			$("#c_nameCheck").html('공백입니다.');
			c_nameCK = false;
		}else{
			if(c_name.val().length == 0){
				$("#c_nameCheck").html('');
				c_nameCK = false;
			}else{
				$.ajax({
					url:"<%=request.getContextPath()%>/c_name.com",
					type:"post",
					data:{c_name:c_name.val()},
					success:function(data){
						if(data == "fail"){
							$("#c_nameCheck").html('');
							$("#c_nameCheck").html("이미 등록된 사업자").css("color", "red");
							c_nameCK = false;
						}else{
							$("#c_nameCheck").html('');
							$("#c_nameCheck").html("미등록 사업자").css("color", "green");
							c_nameCK = true;
						}
						
					},
					error:function(data){
						console.log("서버 통신 안됨");
					}
				});
			
			}

}
		
		
	});

	 c_phoneCK = false;
	$("#c_phone").keyup(function(){
		var c_phone = $("#c_phone").val();
		var c_phCheck = /^0(?:[0-9]{1}|[1-9]{2})[-]?(?:\d{3})[-]?\d{4}$/;
		
		if(c_phone == " "){
			$("#c_phoneCheck").html("공백 입력 불가");
			$("#c_phone").val('');
			c_phoneCK = false;
		}else if(!c_phCheck.test(c_phone)){
			$("#c_phoneCheck").html("ex) 02-123-4567/021234567");
			c_phoneCK = false;
		}else{
			$("#c_phoneCheck").html("전화번호 입력 확인");
			c_phoneCK = true;	
		}
	});

	 c_contactCK = false;
	$("#c_contact").keyup(function(){
		var c_contact = $("#c_contact").val();
		var c_conCheck = /^01(?:0|1|[6-9])[-]?(?:\d{3}|\d{4})[-]?\d{4}$/;
		
		if(c_contact == " "){
			$("#c_contactCheck").html("공백 입력 불가");
			$("#c_contact").val('');
			c_contactCK = false;
		}else if(!c_conCheck.test(c_contact)){
			$("#c_contactCheck").html("ex) 010-123-4567/010-1234-9900");
			c_contactCK = false;
		}else{
			$("#c_contactCheck").html("담당자 휴대폰 확인");
			c_contactCK = true;	
		}
	});
	


	 c_emailCK = false;
	$("#c_email").keyup(function(){
		var c_email = $("#c_email").val();
		var c_mailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

		if(c_email == " "){
			$("#c_emailCheck").html("공백 입력 불가");
			c_emailCK = false;
			$("#c_email").val('');
		}else if(!c_mailCheck.test(c_email)){
			$("#c_emailCheck").html("ex)abc@ab.kr");
			c_emailCK = false;
		}else{
			$("#c_emailCheck").html("이메일 입력확인");
			c_emailCK= true;	
		}
	});
		
	});
	
	function ifCheck(){
			console.log("사업자" +c_numCK);
			console.log("회사명" +c_nameCK);
			console.log("회사번호" + c_phoneCK);
			console.log("담당자번호"+c_contactCK);
			console.log("담당자이메일" +c_emailCK);
			
			if (c_numCK == false) {
				alert("사업자등록 번호를 확인하세요");
				return false;
			} else {
				c_numCk = true;
			}
			
			if (c_nameCK == false) {
				alert("회사이름 확인하세요");
				return false;
			} else {
				c_nameCK= true;
			}
			
			if(c_phoneCK == false) {
				alert("회사 번호를 확인하세요");
				return false;
			} else {
				c_phoneCK= true;
			}
			
			if (c_contactCK == false) {
				alert("담당자 번호를 확인하세요");
				return false;
			} else {
				c_contactCK = true;
			}
			
			if (c_emailCK == false) {
				alert("이메일을 확인하세요");
				return false;
			} else {
				c_emailCK = true;
			}
			
			if($("#c_phone").val()==''&& $("#c_phone").val().length==0){
				alert("회사전화 입력을 다시하세요");
				return false;
			}else{
				c_phoneCK = true;
			}
			
			if($("#c_contact").val()==''&& $("#c_contact").val().length==0){
				alert("담당자확인");
				return false;
			}else{
				c_contactCK = true;
			}
			
			if($("#c_email").val()==''&& $("#c_email").val().length==0){
				alert("이메일 입력확인");
				return false;
			}else{
				c_emailCK = true;
			}
			return true;
			
		}
	</script>

</body>
</html>