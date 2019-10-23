<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="company.model.vo.*"%>
    
    <%
    	Company c_info = (Company)request.getAttribute("cominfo");
    	String address[] = c_info.getC_add().split("/");
    	
    	String addcode1 = address[0]; 
    	String addcode2 = address[1];
    	String addcode3 = address[2];
    	String addcode4 = address[3];
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#centerbody {
	display: inline-block;
	position: relative;
	width: 85%;
	height: 100%;
	border : 1px solid black;
	margin-left: 250px;
	}
</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 
		<div id="centerbody">
		<form action="<%=request.getContextPath() %>/update.com" method="post">
			<table border="1">
				<tr>
					<td><label> 사업증 번호 : </label></td>
					<td><input type="text" value="<%=c_info.getC_number()%>"
						disabled></td>
				</tr>
				<tr>
					<td><label> 회사명 : </label></td>
					<td><input type="text" name = "c_name" value="<%=c_info.getC_name()%>"
						disabled></td>
				</tr>
				<tr>
					<td><label> 회사주소 : </label></td>
					<td>
					<input type="text" id="postcode" name = "postcode" class = "a_form.mini" value = "<%=addcode1 %>">
					<input type="button" onclick="on_click()" class ="a_btn" value="우편번호 찾기"><br>
					<input type="text" id="roadAddress" name = "roadAddress" class = "a_form.std" value = "<%=addcode2 %>">
					<input type="text" id="jibunAddress" name = "jibunAddress" class = "a_form.std"value = "<%=addcode3 %>">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="detailAddress" name = "detailAddress" value = "<%=addcode4 %>">
					</td>
				</tr>
				<tr>
					<td><label> 회사연락처 : </label></td>
					<td><input type="text" name = "c_phone" value="<%=c_info.getC_phone()%>">
					
					</td>
				</tr>
				<tr>
					<td><label> 담당자 : </label></td>
					<td><input type="text" name="c_manager" value="<%=c_info.getC_manager()%>"></td>
				</tr>
				<tr>
					<td><label> 담당자 연락처 : </label></td>
					<td><input type="text" name ="c_contact" value="<%=c_info.getC_contact()%>"></td>
				</tr>
				<tr>
					<td><label> 담당자 이메일 : </label></td>
					<td><input type="text" name="c_email" value="<%=c_info.getC_email()%>">
					</td>
				</tr>
				<tr>
				<td><button type = "submit" onclick = "chenge()">정보 수정</button></td>
				<td><button type = "reset">취소</button></td>
				</tr>
			</table>
	</form>

	</div>
	
<script>
function on_click(){
    new daum.Postcode({
        oncomplete: function(data) {
        var Postcode =data.postcode;
		var Address = data.address;
		var JibunAddress = data.jibunAddress;
		
		console.log(Postcode);
		console.log(Address);
		console.log(JibunAddress);
		document.getElementById('postcode').value = Postcode;
		document.getElementById('roadAddress').value = Address;
		document.getElementById('jibunAddress').value = JibunAddress;
	
		$("#postcode").attr("readonly","true");
		$("#roadAddress").attr("readonly","true");
		$("#jibunAddress").attr("readonly","true");

		autoClose: true;
        }
    
    }).open({autoClose: true});
   
}
</script>


</body>
</html>