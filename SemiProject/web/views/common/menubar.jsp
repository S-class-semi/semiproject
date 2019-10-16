<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.Member" %>
    
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semi4조 난 혼자 산다 !</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	#loginBtn input, #memberJoinBtn, #logoutBtn, #myPage{
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
	#loginBtn input:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover, #myPage:hover{
		cursor: pointer;
	}
	.loginArea > form, #userInfo{
		float: right;
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
	<a href = "<%=request.getContextPath() %>/index.jsp"><h1">난 혼자 산다</h1></a><br>

	<div class="loginArea">
	
	<% if(loginUser == null){ %>	<!-- 로그인 안했을 때 -->
		<form id=loginForm " action="<%=request.getContextPath()%>/login.me"
			onsubmit="return validate();" method="post">
			<table>
				<tr>
					<td><label>ID : </label></td>
					<td><input type="email" name="userId" id="userId"></td>
				</tr>
				<tr>
					<td><label>PWD : </label></td>
					<td><input type="password" name="userPwd" id="userPwd"></td>
				</tr>
			</table>

			<div class="btns" align="center">
				<button type = "button" id="memberJoinBtn" onclick="memberJoin();">회원가입</button>
				<div id="loginBtn"><input type="submit" value="로그인"></div>
			</div>

		</form>
		<% } else{%>	<!-- 로그인 했을 때 -->
			<div id = "userInfo">
				<label>로그인됨. 환영.</label><br>
				<div class = "btns" align = "right">
					<div id = "myPage" onclick = "location.href = '/jspProject/mypage.me?userId=<%= loginUser.getUserId() %>'">정보수정</div>
					<div id = "logoutBtn" onclick = "logout();">로그아웃</div>
				</div>
			</div>
		<% } %>
	</div>
	

	<div class = "mainmenu">
		<div class = "bar">
			<div class = "menu" onclick ="goNotich()">공지사항</div>
			<div class = "menu" onclick ="goProduct()">상품카테고리</div>
			<div class = "menu" onclick ="goBoard();">자유게시판</div>
			
			
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
		
		// logout() 함수 작성하기
		function logout(){
			location.href = '<%= request.getContextPath() %>/logout.me';
			
			// LogoutServlet 만들러 ㄱㄱ
		}
		
		function memberJoin(){
			location.href = '<%= request.getContextPath() %>/views/member/memberJoinForm.jsp';
		}
	</script>
	
	<Script>
		function goNotich(){
			location.href = "<%=request.getContextPath()%>/list.no";
		}
		function goNotich(){
			location.href = "<%=request.getContextPath()%>/list.pro";
		}
		function goNotich(){
			location.href = "<%=request.getContextPath()%>/list.bo";
		}
	</Script>
</body>
</html>