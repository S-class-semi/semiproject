<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.Member" %>
    
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Integer userT = (Integer)session.getAttribute("userT");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semi4조 난 혼자 산다 !</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
	body{
		background-color: white;
	}
	.mainmenu{
		align-content: center;
	}
	.menu{
		background: rgb(160, 200, 220);
		color : white;
		text-align : center;
		vertical-align: middle;
		width :150px;
		height : 50px;
		display:table-cell;
	}
	.menu:hover{
		background : rgb(220, 200, 130);
		font-wight: bold;
		cursor:pointer;
	}
	#loginBtn, #memberJoinBtn, #logoutBtn, #myPage{
		display: inline-block;
		vertical-align: middle;
		text-align: center;
		background: hotpink;
		color: white;
		height: 25px;
		width: 100px;
		border-radius: 5px;
	}
	#memberJoinBtn, #myPage{
		background: rgb(160, 200, 220);
	}
	#loginBtn:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover, #myPage:hover{
		cursor: pointer;
	}
	.loginArea > form, #userInfo{
		float: right;
	}
	.loginArea{
	border: 3px solid black;
	}
	#userId, #userPwd{
		width: 200px;
	}
	.btns, #loginBtn{
		display:inline-block
	}

</style>
</head>
<body>


	<a href="<%=request.getContextPath() %>/index.jsp"><h1">난 혼자 산다</h1></a>
	<br>
	<div class="loginArea">

		<% if(loginUser == null){ %>
		<!-- 로그인 안했을 때 -->
		<form id=loginForm " action="<%=request.getContextPath()%>/login.me"
			onsubmit="return validate();" method="post">
			<table>
				<tr>
					<td><label>아이디(이메일) : </label></td>
					<td><input type="email" name="userId" id="userId"></td>
				</tr>
				<tr>
					<td><label>비밀번호 : </label></td>
					<td><input type="password" name="userPwd" id="userPwd"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="checkbox" name="saveId"
						id="saveId">&nbsp; <label for="saveId">아이디 저장</label></td>
				</tr>
			</table>

			<div class="btns" align="center">
				<button type="button" onclick="findingPwd();">비밀번호 찾기</button>
				<button type="button" id="memberJoinBtn" onclick="memberJoin();">회원가입</button>
				<button id="loginBtn" type="submit">로그인</button>				
			</div>
			<br>
			
			<!-- <div id = "kakao">
			<a id="kakao-login-btn"></a>
			<a href="http://developers.kakao.com/logout"></a>
			</div> -->
		</form>
		

		<%}else if(loginUser != null && userT == 2){%>
		<!-- 판매자 로그인 -->
		<div id="userInfo">
			<label>판매자 로그인됨 환영</label><br>
			<div class="btns" align="right">
				<div id="myPage"
					onclick="location.href = '/SemiProject/mypage.me?userId=<%= loginUser.getUserId() %>'">마이페이지</div>
				<div id="logoutBtn" onclick="logout();">로그아웃</div>
			</div>
		</div>

		<%}else if(loginUser != null && userT == 3){%>
		<!-- 관리자 로그인 -->
		<div id="userInfo">
			<label>관리자 로그인됨 환영</label><br>
			<div class="btns" align="right">
				<div id="myPage"
					onclick="location.href = '/SemiProject/mypage.me?userId=<%= loginUser.getUserId() %>'">마이페이지</div>
				<div id="logoutBtn" onclick="logout();">로그아웃</div>
			</div>
		</div>
		<%}else{%>
		<!-- 로그인 했을 때 -->
		<div id="userInfo">
			<label>소비자 로그인됨 환영</label><br>
			<div class="btns" align="right">
				<div id="myPage"
					onclick="location.href = '/SemiProject/mypage.me?userId=<%= loginUser.getUserId() %>'">마이페이지</div>
				<div id="logoutBtn" onclick="logout();">로그아웃</div>
			</div>
		</div>
		<% } %>
	</div>

	<div class="mainmenu">
		<div class="bar">
			<div class="menu" onclick="goNotich()">공지사항</div>
			<div class="menu" onclick="goProduct()">상품카테고리</div>
			<div class="menu" onclick="goBoard();">자유게시판</div>
		</div>
	</div>

	<script>

		function validate(){
			if($("#userId").val().trim().length == 0){
				alert("아이디를 입력하세요");
				$("#userId").focus();
				
				return false;	// return값이 false면 submit이 되지 않는다
			}
			if($("#userPwd").val().trim().length == 0){
				alert("비밀번호를 입력하세요");
				$("#userPwd").focus();
				
				return false;
			}
			
			return true;
		}
		
		// 로그아웃
		function logout(){
			location.href = '<%= request.getContextPath() %>/logout.me';
		}
		
		// 회원가입
		function memberJoin(){
			location.href = '<%= request.getContextPath() %>/views/member/memberJoinForm.jsp';
		}
		
		// 비밀번호 찾기
		function findingPwd(){
			location.href = '<%= request.getContextPath() %>/views/member/findPwdView.jsp';
		}
		
		// 아이디 저장(쿠키) 관련 함수
		$(function(){
			// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		    var userInputId = getCookie("userInputId");
    		$("#userId").val(userInputId);
		     
    		if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
				$("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    	    }
		     
    		$("#saveId").change(function(){ // 체크박스에 변화가 있다면,
    			if($("#saveId").is(":checked")){ // ID 저장하기 체크했을 때,
    				var userInputId = $("#userId").val();
    				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		        	deleteCookie("userInputId");
		        }
		    });
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		    	if($("#saveId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		    		var userInputId = $("#userId").val();
		    		setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		        }
		    });
		});
		
		function setCookie(cookieName, value, exdays){
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toUTCString());
			document.cookie = cookieName + "=" + cookieValue;
		}
 
		function deleteCookie(cookieName){
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires=" + expireDate.toUTCString();
		}
 
		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if(start != -1){
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if(end == -1)end = cookieData.length;
					cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
		
	</script>

	<script type='text/javascript'>
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('e955c40a1536d6e04ad9bbc441193544');
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container: '#kakao-login-btn',
		success: function(authObj) {
		// 로그인 성공시, API를 호출합니다.
		Kakao.API.request({
			url: '/v1/user/me',
			success: function(res) {
				console.log(JSON.stringify(res.kaccount_email));
				console.log(JSON.stringify(res.id));
				console.log(JSON.stringify(res.properties.profile_image));
				console.log(JSON.stringify(res.properties.nickname));
			},
			fail: function(error) {
				alert(JSON.stringify(error));
			}
		});
		},
		fail: function(err) {
			alert(JSON.stringify(err));
		}
	});
	
	</script>

</body>
</html>