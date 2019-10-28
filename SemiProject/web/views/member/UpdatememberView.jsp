<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    
     
   <%
   Member m = (Member)session.getAttribute("loginUser");
    String gen = m.getGender(); 
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
	.sub_title{
		float:none;
		margin-bottom: 8px;
		width:100%;
		font-size: 13px;
		line-height:normal;
		font-weight:bold;
	}
	.title{
		font-size:18px;
		line-height:24px;
		pading: 0 0 20px;
		font-weight:bold;
	}
	.withdraw{
		float: right;
		font-size:13px;
		color:#bdbdbd;
		text-decoration:underline;
	}
	#submit{
	margin:25px 0 0;
	width:100%;
	height:40px;
	line-height:40px;
	font-size:14px;
	font-weight:normal;
	text-align:center;
	color:#ffffff;
	background-color:#35c5f0;
	border-radius:4px;
	border:none;
	cursor:pointer;
	}
	#content{
		max-width:600px;
		padding:30px 20px 56px;
		margin: 10px auto;
		width:100%;
		background-color:#ffffff;
		box-sizing:border-box;
		box-shadow:0 1px 3px 0 rgba(0,0,0,0.2);
		color:#424242;
	}
	.alert{
		padding-left:10px;
		padding-right: 10px;
		font-size: 11px;
		color:#dcdcdc;
	}
	.right{
		float: right;
	}
</style>
</head>
<body>
<div class="right">

<%-- <%@ include file = "/views/member/label.jsp" %> --%>
</div>
<%@ include file = "/views/member/mypageMenuView.jsp" %>
<br><br><br>
<form id = "updateForm" action="<%=request.getContextPath() %>/update.me" method="post">
<div id = "content">
		<div class="title">회원정보수정</div>
		<a class="withdraw" href="<%=request.getContextPath()%>/views/member/memberDeletView.jsp">탈퇴하기</a>
		<div class="sub_title">별명</div>
		<input placeholder="별명을 입력해주세요" type="text" name="nn" value="<%=m.getNickname()%>" >
		
		<div class="sub_title" >성별</div>
		<input type="radio" id ="M" name="sex" value="M" >
		<input type="hidden" id= "ch">
		<label>남자</label>
		<input type="radio" id="F" name="sex" value="F">

		<label>여자</label>
		<br>
		<div class="sub_title">평수</div>
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
		
		<div class="sub_title">한줄 소개</div>
		<input type="text" name="usrintro" maxlength="40" value = "<%=m.getContext()%>">
		<input type="submit" onclick = "updateForm" value="회원 정보 수정" id="submit">
		
		
		</div>
		</form>
		<script>
		$(function(){
			if($("#ch").val() == 'M'){
				$("#M").prop('checked', true);
				$("#F").prop('checked', false);
			}else if($("#ch").val() == 'M'){
				$("#F").prop("checked",true);
				$("#M").prop("checked",false);
			}
		});
		function goMain(){
			location.href="/jspProject/index.jsp";
		}
		
		// 회원 정보 수정하기
		function updateMember(){
			$("#updateForm").submit();
		}
		</script>
</body>
</html>