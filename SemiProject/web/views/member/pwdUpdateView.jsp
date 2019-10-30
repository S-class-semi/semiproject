<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>

   #password_form>.title{
      margin-bottom:15px;
      font-size:24px;
      font-weight:700;
   }
   #password_form>form>label{
      color:#424242;
      display:block;
      font-size:14px;
      font-weight:bold;
   }
   #password_form{
      padding:30px;
      margin-top:10px;
      margin:30px auto;
      max-width:360px;
      width:100%;
      box-sizing:border-box;
      box-shadow:0 1px 3px 0 rgba(0,0,0,0.2);
      background-color:#ffffff;
   }
   #password_form>form>.notice{
      margin-top:5px;
      font-size:12px;
      color:#757575;
   }
   #password_form>form>input[type=submit]{
      margin-top:15px;
      width:100%;
      height:40px;
      background-color:#35c5f0;
      border:none;
      border-radius:4px;
      color: #ffffff;
      font-size:18px;
      font-weight:700;
      text-align:center;
      cursor:pointer;
   }

</style>
</head>
<body>
 <%@ include file = "/views/member/mypageMenuView.jsp" %>
   <div id = "password_form">
      <div class = "title">비밀번호 변경</div>
      <form class="edit_user" action="<%=request.getContextPath() %>/updatepwd.me" method="post">
         <label for = "user_password">새비밀번호</label>
         <div class="notice">8자이상 영문, 숫자를 사용하세요.</div>
         <input autofocus = "autofocus" type="password" name = "userPwd" id="pwd">
         <label>새 비밀번호 확인</label>
         <input autocomplete="off" type="password" id="checkPwd">
         <br>
         <input id = "updatePwd" type = "submit" name ="commit" value="비밀번호변경">
      </form>
      
   </div>
   <script>
   
    $(function(){
       $("#updatePwd").click(function(){
          return invalidJoin();
       })
    });
    
    function invalidJoin(){
       var pattern1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
        var pattern2 = /(\w)\1\1\1/;
        
       if($("#pwd").val().length == 0){
          alert("비밀번호를 입력하세요");
          $("#pwd").focus();
          return false;
       }
       
       if($("#pwd").val().length < 8){
          alert("비밀번호는 8자 이상이어야 합니다");
          $("#pwd").focus();
          return false;
       }
       
       if($("#pwd").val().length > 25){
          alert("비밀번호는 25자 이하여야 합니다");
          $("#pwd").focus();
          return false;
       }
       
       if($("#checkPwd").val().length == 0){
          alert("비밀번호 확인을 입력하세요");
          $("#checkPwd").focus();
          return false;
       }
       
       
       if($("#pwd").val() != $("#checkPwd").val()){
          alert("비밀번호가 일치하지 않습니다");
          $("#checkPwd").focus();
          return false;
       }
       
       
       if($('#pwd').val().indexOf(" ") >= 0){
          alert("비밀번호에 공백은 입력할 수 없습니다");
          $('#pwd').focus();
          return false;
       }
       
       if($('#checkPwd').val().indexOf(" ") >= 0){
          alert("비밀번호 확인에 공백은 입력할 수 없습니다");
          $('#checkPwd').focus();
          return false;
       }
       
       if(!pattern1.test($("#pwd").val())){            
          alert("비밀번호는 영문, 숫자 8자 이상 조합을 사용해야 합니다");
           $("#pwd").focus();
           return false;
        }
       
       if(pattern2.test($("#pwd").val())){
          alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다");
           $("#pwd").focus();
           return false;
        }
       
       
       return true;
    }
   </script>
   
</body>
</html>