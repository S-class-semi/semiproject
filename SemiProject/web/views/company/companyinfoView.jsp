<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="company.model.vo.*"%>

<%
	Company c_info = (Company) request.getAttribute("cominfo");
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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#centerbody {
	display: inline-block;
	position: relative;
	width: 85%;
	height: 100%;
	border: 1px solid black;
	margin-left: 250px;
}
</style>
</head>
<body>
	<%@ include file="/views/company/companyMenubar.jsp"%>
	<div id="centerbody">
		<form action="<%=request.getContextPath()%>/update.com" method="post" onsubmit="return infoChek()">
			<table border="1">
				<tr>
					<td><label> 사업증 번호 : </label></td>
					<td><input type="text" value="<%=c_info.getC_number()%>" disabled></td>
				</tr>
				<tr>
					<td><label> 회사명 : </label></td>
					<td><input type="text" name="c_name" value="<%=c_info.getC_name()%>" disabled></td>
				</tr>
				<tr>
					<td><label> 회사주소 : </label></td>
					<td><input type="text" id="postcode" name="postcode" class="a_form.mini" value="<%=addcode1%>">
					 <input	type="button" onclick="on_click()" class="a_btn" value="우편번호 찾기"><br>
					 <input type="text" id="roadAddress" name="roadAddress" class="a_form.std" value="<%=addcode2%>">
					 <input type="text" id="jibunAddress" name="jibunAddress" class="a_form.std" value="<%=addcode3%>"> 
					 <span id="guide" style="color: #999; display: none"></span> 
					 <input type="text" id="detailAddress" name="detailAddress" value="<%=addcode4%>"></td>
				</tr>
				<tr>
					<td><label> 회사연락처 : </label></td>
					<td><input type="text" name="c_phone" id="c_phone" value="<%=c_info.getC_phone()%>">
					<td><div id="c_phoneCheck">변경된 값이 없습니다.</div></td>


				</tr>
				<tr>
					<td><label> 담당자 : </label></td>
					<td><input type="text" name="c_manager" id="c_manager1" value="<%=c_info.getC_manager()%>"></td>
					<td><div id="c_managerCheck">변경된 값이 없습니다.</div></td>
				</tr>
				<tr>
					<td><label> 담당자 연락처 : </label></td>
					<td><input type="text" name="c_contact" id="c_contact1" value="<%=c_info.getC_contact()%>"></td>
					<td><div id="c_contactCheck">변경된 값이 없습니다.</div></td>
				</tr>
				<tr>
					<td><label> 담당자 이메일 : </label></td>
					<td><input type="text" name="c_email" id="c_eamil1" value="<%=c_info.getC_email()%>">
					<td><div id="c_emailCheck"></div>변경된값이 없습니다.</td>
					</td>

				</tr>
				<tr>
					<td><button type="submit" onclick="chenge()">정보 수정</button></td>
					<td><button type="reset">취소</button></td>
				</tr>
			</table>
		</form>

	</div>

	<script>
		function on_click() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var Postcode = data.postcode;
							var Address = data.address;
							var JibunAddress = data.jibunAddress;

							console.log(Postcode);
							console.log(Address);
							console.log(JibunAddress);
							document.getElementById('postcode').value = Postcode;
							document.getElementById('roadAddress').value = Address;
							document.getElementById('jibunAddress').value = JibunAddress;

							$("#postcode").attr("readonly", "true");
							$("#roadAddress").attr("readonly", "true");
							$("#jibunAddress").attr("readonly", "true");

							autoClose: true;
						}

					}).open({
				autoClose : true
			});

		}
	</script>
	<!-- 유효성검사 -->

	<script>
		/* 유효성 검사를 위한 블린값 */
		var c_phoneCK = true;
		var c_managerCK = true;
		var c_contactCK = true;
		var c_emailCK = true;

		$(function() {

			/* 회사전화번호 */

			$("#c_phone")
					.keyup(
							function() {
								var c_phone = $("#c_phone").val();
								var c_phCheck = /^0(?:[0-9]{1}|[1-9]{2})[-]?(?:\d{3})[-]?\d{4}$/;

								if (c_phone == " ") {
									$("#c_phoneCheck").html("공백 입력 불가");
									$("#c_phone").val('');
									c_phoneCK = false;
								} else if (!c_phCheck.test(c_phone)) {
									$("#c_phoneCheck").html(
											"ex) 02-123-4567/021234567");
									c_phoneCK = false;
								} else {
									$("#c_phoneCheck").html("전화번호 입력 확인");
									c_phoneCK = true;
								}
							});
			/* 담당자이름 */

			$("#c_manager1").keyup(function() {
				var c_manager = $("#c_manager1").val();
				var c_manCheck = /^[가-힣]*$/;
				if (c_manager == " ") {
					$("#c_managerCheck").html("공백 입력 불가");
					$("#c_manager1").val('');
					c_managerCK = false;
				} else if (!c_manCheck.test(c_manager)) {
					$("#c_managerCheck").html("한글만 입력하세요");
					c_managerCK = false;
				} else {
					$("#c_managerCheck").html("담당자 이름 확인");
					c_managerCK = true;
				}
			});

			/* 담당자번호 */

			$("#c_contact1")
					.keyup(
							function() {
								var c_contact = $("#c_contact1").val();
								var c_conCheck = /^01(?:0|1|[6-9])[-]?(?:\d{3}|\d{4})[-]?\d{4}$/;
								if (c_contact == " ") {
									$("#c_contactCheck").html("공백 입력 불가");
									$("#c_contact1").val('');
									c_contactCK = false;
								} else if (!c_conCheck.test(c_contact)) {
									$("#c_contactCheck").html(
											"ex) 010-123-4567/010-1234-9900");
									c_contactCK = false;
								} else {
									$("#c_contactCheck").html("담당자 휴대폰 확인");
									c_contactCK = true;
								}
							});

			/* 담당자이메일 */

			$("#c_email1")
					.keyup(
							function() {
								var c_email = $("#c_email1").val();
								var c_mailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

								if (c_email == " ") {
									$("#c_emailCheck").html("공백 입력 불가");
									c_emailCK = false;
									$("#c_email1").val('');
								} else if (!c_mailCheck.test(c_email)) {
									$("#c_emailCheck").html("ex)abc@ab.kr");
									c_emailCK = false;
								} else {
									$("#c_emailCheck").html("이메일 입력확인");
									c_emailCK = true;
								}
							});

		});

		/* 입력되지않은 textbox및 마지막 유효성검사 */
		function infoChek() {

			console.log("회사번호" + c_phoneCK);
			console.log("담당자번호" + c_contactCK);
			console.log("담당자이메일" + c_emailCK);

			if (c_phoneCK == false) {
				alert("회사 전화번호를 확인하세요");
				$("#c_phone").focus();
				return false;
			} else {
				c_phoneCK = true;
			}

			if (c_managerCK == false) {
				alert("담당자 이름을 확인하세요");
				$("#c_manager1").focus();
				return false;
			} else {
				c_managerCK = true;
			}

			if (c_contactCK == false) {
				alert("담당자 번호를 확인하세요");
				$("#c_contact1").focus();
				return false;
			} else {
				c_contactCK = true;
			}

			if (c_emailCK == false) {
				alert("이메일을 확인하세요");
				$("#c_email1").focus();
				return false;
			} else {
				c_emailCK = true;
			}

			if ($("#c_phone1").val() == '' && $("#c_phone1").val().length == 0) {
				alert("회사전화 입력을 다시하세요");
				$("#c_phone1").focus();
				return false;
			} else {
				c_phoneCK = true;
			}

			if ($("#c_manager1").val() == ''
					&& $("#c_manager1").val().length == 0) {
				alert("담당자 명을 확인하세요");
				$("#c_manager1").focus();
				return false;
			} else {
				c_managerCK = true;
			}

			if ($("#c_contact1").val() == ''
					&& $("#c_contact1").val().length == 0) {
				alert("담당자 번호 확인해주세요");
				$("#c_contact1").focus();
				return false;
			} else {
				c_contactCK = true;
			}

			if ($("#c_email1").val() == '' && $("#c_email1").val().length == 0) {
				alert("이메일을 확인해주세요");
				$("#c_email1").focus();
				return false;
			} else {
				c_emailCK = true;
			}

			if ($("#postcode").val() == '' && $("#postcode").val().length == 0) {
				alert("주소확인해주세요");
				return false;
			}
			if ($("#detailAddress").val() == ''
					&& $("#detailAddress").val().length == 0) {
				alert("주소확인해주세요");
				return false;
			}
			return true;

		}
	</script>

</body>
</html>