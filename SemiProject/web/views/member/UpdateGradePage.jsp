<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
    
 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer{
      width:900px;
      height:500px;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
      }
   td {
      border:1px solid white;
   }

   .tableArea {
      border:1px solid white;
      width:800px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
   #content {
      height:230px;
   }
   #centerbody {
	display: inline-block;
	position: relative;
	width: 100%;
	height: 100%;
	border : 1px solid black;
	margin-left: 250px;
	}
	#updateBtn,#goBack{
	background-color: #555555;
	color: white;
	border: 2px solid #555555;
	margin-left: 55px;
	width: 150px;
	}
	#updateBtn,#goBack{
		display:inline-block;
	}
</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 

<div class = "outer">
	<div id="centerbody">
		<form id = "updateForm" action="<%=request.getContextPath() %>/GradeUpdate.me" method = "post">
			<table>
				<tr>
					<td width="200px">아이디</td>
					<td><input type ="text" maxlength="20" name ="userId" value="<%=m.getUser_Id() %>" readonly></td>		
				</tr>
				
				<tr>
					<td>비밀번호</td>
					<td><input type="password" maxlength="20" name="userPwd" value="<%=m.getUser_Pwd() %>" readonly></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" maxlength="6" name="userName" value="<%=m.getNickname() %>"></td>
				</tr>
				<tr>
					<td>회원등급</td>
					<td><input type="text" maxlength="5" name="userGrade" value ="<%=m.getUser_G() %>"></td>
				</tr>
				<tr>
					<td>포인트</td>
					<td><input type="text" maxlength="10" name="point" value ="<%=m.getPoint() %>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" maxlength="3" name="gender" value="<%=m.getGender() %>"></td>
				</tr>	
			</table>
			<br>
			<div class = "btns" align="center">
				<div id = "goBack" onclick ="goBack();">리스트로
				</div>
				<div id ="updateBtn" onclick="updateMemberGrade();">수정하기</div>
		</form>
	</div>
</div>
	
	<script>
		function goBack(){
			location.href = "<%=request.getContextPath()%>/grade.me";
		}
		
		function updateMemberGrade(){
			$("#updateForm").submit();
		}
	
	</script>
	
	
</body>
</html>