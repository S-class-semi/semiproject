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
		<form action="<%=request.getContextPath() %>/insert.com" method="post">
			<table border="1">
				<tr>
				<td><label>사용자 ID : </label></td>
				<td><label name = "userid"><%=userid %></label>
				</tr>
				<tr>
				<td><label> 사업증 번호 : </label></td>
				<td><input type="text" name="c_number" id="c_number" oninput="c_numCheck()" required autofocus> </td>
				<td><div id = "c_numCheck"></div></td>
				</tr>
				<tr>
				<td><label> 회사명 : </label></td>
				<td><input type = "text" name="c_name" id="c_name" oninput="c_nameCheck()" reqeuired autofocus> </td>
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
				<td><input type = "text" name = "c_phone"> </td>
				</tr>
				<tr>
				<td><label> 담당자 : </label></td>
				<td><input type = "text" name = "c_manager"> </td>
				</tr>
				<tr>
				<td><label> 담당자 연락처 : </label></td>
				<td><input type = "text" name = "c_contact"> </td>
				</tr>
				<tr>
				<td><label> 담당자 이메일 : </label></td>
				<td><input type = "text" name = "c_email"> </td>
				</tr>
				<tr>
				<td><button type = "submit">정보 수정</button></td>		
	
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
		
	
		<script>
		function c_numCheck(){
			var c_Check = false;
		
			var c_number = $("#c_number");
			
			if(c_number.val().indexOf(" ") >= 0){
				alert("공백은 입력할 수 없습니다");
				c_number.val("");
				$("#c_numCheck").html('');
			}else{
				if(c_number.val().length == 0){
					$("#c_numCheck").html('');
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/c_number.com",
						type:"post",
						data:{c_number:c_number.val()},
						success:function(data){
							if(data == "fail"){
								$("#c_numCheck").html('');
								$("#c_numCheck").html("등록된 회사명").css("color", "red");
								userId.focus();
							}else{
								$("#c_numCheck").html('');
								$("#c_numCheck").html("미등록 회사명").css("color", "green");
								c_Check = true;
							}
						},
						error:function(data){
							console.log("서버 통신 안됨");
						}
					});
				}

	}
		}
		
		
		function c_nameCheck(){
		
			var c_name = $("#c_name");	
			if(c_name.val().indexOf(" ") >= 0){
				alert("공백은 입력할 수 없습니다");
				c_name.val("");
				$("#c_nameCheck").html('');
			}else{
				if(c_name.val().length == 0){
					$("#c_nameCheck").html('');
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/c_name.com",
						type:"post",
						data:{c_name:c_name.val()},
						success:function(data){
							if(data == "fail"){
								$("#c_nameCheck").html('');
								$("#c_nameCheck").html("이미 등록된 사업자").css("color", "red");
								userId.focus();
							}else{
								$("#c_nameCheck").html('');
								$("#c_nameCheck").html("미등록 사업자").css("color", "green");
							}
						},
						error:function(data){
							console.log("서버 통신 안됨");
						}
					});
				}

	}
		}
	</script>
</body>
</html>