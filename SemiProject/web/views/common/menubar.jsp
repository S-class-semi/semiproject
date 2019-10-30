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
<link href="https://fonts.googleapis.com/css?family=Sunflower:300,500,700&display=swap&subset=korean" rel="stylesheet">
<style>

/* 바디 색상 */
body {
   background-color: white;
}
/* mainmenu 크기 */
.mainmenubar {
   align-content: center;
   margin-left: 300px;
}

.mainmenubar div {
   display: inline-block;
   float: left;
}

.mainmenu .menu {
   font-family: Sunflower;
   color: black;
   text-align: center;
   align-content: center;
   vertical-align: middle;
   width: 150px;
   height: 50px;
   display: table-cell;
   line-height: 50px;
   font-weight: bold;
   font-size: 30px;
   
}

.menu:hover {
   background: #ece6cc;
   color: white;
   font-wight: bold;
   cursor: pointer;
   border-bottom-left-radius: 10px;
   border-bottom-right-radius: 10px;
   border-top-left-radius: 10px;
   border-top-right-radius: 10px;
}



.mainmenu{
padding-left:15px;
padding-top: 15px;
text-align: center;
display:table-cell;
}

.bar{
margin-top: 100px;
}

/* 로그인 div */
.loginArea {
   margin-top: 20px;
   margin-right: 50px;
}

/* 아이디 저장 및 패스워드 찾기 */
.pwdwhat, .grid {
   display: inline-block;
   flex: left;
}

.pwdwhat button{
   border: 1px solid skyblue;
   background-color: rgba(0, 0, 0, 0);
   color: skyblue;
   padding: 5px;
   width: 100px;
   border-top-right-radius: 5px;
   border-bottom-right-radius: 5px;
   margin-left: -3px;
}

.pwdwhat button:hover {
   color: white;
   background-color: skyblue;
}

/* 카카오 */
.kakao{
display: inline-block;
flex: left;
padding: 0px;
}
/* 라인 */
#menuhr{
   border-bottom-left-radius: 10px;
   border-bottom-right-radius: 10px;
   border-top-left-radius: 10px;
   border-top-right-radius: 10px;
 height: 3px;
 background-color: black;
 width: 80%;
 display: none;
}

.menu:hover > #menuhr{
display: block;
}

#loginBtn:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover,
   #myPage:hover, .pwdwhat:hover {
   cursor: pointer;
}

.loginArea>form, #userInfo {
   float: right;
   text-align: center;
}

#userId, #userPwd {
   width: 200px;
}

.btns {
   display: inline-block;
   flex:left;
}

#memberJoinBtn, #myPage {
   border-top-left-radius: 5px;
   border-bottom-left-radius: 5px;
   margin-right: -4px;
}

#loginBtn, #logoutBtn {
   border-top-right-radius: 5px;
   border-bottom-right-radius: 5px;
   margin-left: -3px;
}

.btns button {
   border: 1px solid skyblue;
   background-color: rgba(0, 0, 0, 0);
   color: skyblue;
   padding: 5px;
   width: 150px;
}

.btns button:hover {
   color: white;
   background-color: skyblue;
}




/* 체크박스 css */
.grid .item {
   align-self: center;
   user-select: none;
   transform: translateZ(0);
}

.grid .item .cbx {
   position: relative;
   top: 1px;
   display: inline-block;
   width: 14px;
   height: 14px;
   margin-right: 6px;
   border: 1px solid #c8ccd4;
   border-radius: 3px;
   cursor: pointer;
}

.grid .item .cbx svg {
   position: relative;
   top: -1px;
   transform: scale(0);
   fill: none;
   stroke-linecap: round;
   stroke-linejoin: round;
}

.grid .item .cbx svg polyline {
   stroke-width: 2;
   stroke: #18cda6;
}

.grid .item .cbx:before {
   content: '';
   position: absolute;
   top: 50%;
   left: 50%;
   margin: -10px 0 0 -10px;
   width: 20px;
   height: 20px;
   border-radius: 100%;
   background: #18cda6;
   transform: scale(0);
}

.grid .item .cbx:after {
   content: '';
   position: absolute;
   top: 5px;
   left: 5px;
   width: 2px;
   height: 2px;
   border-radius: 2px;
   box-shadow: 0 -18px 0 #18cda6, 12px -12px 0 #18cda6, 18px 0 0 #18cda6,
      12px 12px 0 #18cda6, 0 18px 0 #18cda6, -12px 12px 0 #18cda6, -18px 0 0
      #18cda6, -12px -12px 0 #18cda6;
   transform: scale(0);
}

.grid .item .cbx-lbl {
   position: relative;
   cursor: pointer;
   transition: color 0.3s ease;
}

.grid .item input {
   display: none;
}

.grid .item input:checked+.cbx {
   border-color: transparent;
}

.grid .item input:checked+.cbx svg {
   transform: scale(1);
   transition: all 0.4s ease;
   transition-delay: 0.1s;
}

.grid .item input:checked+.cbx:before {
   transform: scale(1);
   opacity: 0;
   transition: all 0.3s ease;
}

.grid .item input:checked+.cbx:after {
   transform: scale(1);
   opacity: 0;
   transition: all 0.6s ease;
}

.grid .item input:checked+.cbx:after {
   width: 100%;
   transition: all 0.4s ease;
}

.mainImg {
   display: inline-block;
}
.menu > div{
display: none;
}
.menu:hover > div{
display: block;
}
.menu > #menuhr:hover > div{
display: black;
}

/* 서브메뉴 */
.submenubar{

display: inline-block;
flex: left;
width: 300px;
height: 100px;
}

.submenu{

display: inline-block;
color : black;
flex: left;
margin-left: 10px;
font-size: 20px;
margin-top: 30px;
}

.submenu:hover {
   background: #ece6cc;
   color: white;
   font-wight: bold;
   cursor: pointer;
   border-bottom-left-radius: 10px;
   border-bottom-right-radius: 10px;
   border-top-left-radius: 10px;
   border-top-right-radius: 10px;

}

/* 내가만든 로긴박스 */
.loginbox{
   margin-top: 70px;
   display: inline-block;
   margin-left: 600px;
}


</style>
</head>
<body>


   <div class="mainmenubar">
      <div class="bar">
         <div id="mainImg" onclick="goHome()">
            <img id="maini-con" src="<%=request.getContextPath()%>/images/mainIcon.png" width="80px" height="80px">
         </div>
         <div class="mainmenu">
         <div class="menu" onclick="goNotice()">공지사항
                        <hr id="menuhr">
                        </div>
         <div class="menu">스토어
            <div class = "submenubar">
            <div class = "submenu" onclick ="StoreC()">
            <!-- <input type="hidden" name="procodeinfo" id ="procodeinfo" value ="proc"> -->
            의자</div>
            <div class = "submenu" onclick ="StoreT()">
         <!--    <input type="hidden" name="procodeinfo" id = "procodeinfo" value ="prot"> -->
            책상</div>
            <div class = "submenu" onclick ="StoreK()">

            주방용품</div>
            <div class = "submenu" onclick ="StoreB()">
 
            침구류</div>
         </div>
         </div>
         
         <div class="menu" onclick="goBoard();">자유게시판
                        <hr id="menuhr"></div>
         </div>
      </div>
   </div>
   
   
   <div class= "loginbox">
   <% if(loginUser == null){ %>
      <table>
         <tr>
            <td>
            <div class="btns">
                     <button type="button" id="memberJoinBtn" onclick="memberJoin();">회원가입</button>
                     
                  </div>
            </td>
            <td>
            <div class="btns">
                     <button id="loginBtn" onclick = "loginViewPage()">로그인</button>
                  </div>
            </td>
         </tr>
         
         <tr>
         <td colspan="2">
         <div id="kakao">
                     <a id="kakao-login-btn"></a> <a
                        href="http://developers.kakao.com/logout"></a>
                  </div></td>
         </tr>
      </table>
   
   <%}else{%>
   <label><%=loginUser.getNickname() %>님, 환영합니다!</label>
   <br>
   <table>
         <tr>
            <td>
            <div class="btns">
                     <button id="myPage" onclick="location.href = '/SemiProject/mypage.me?userId=<%= loginUser.getUserId() %>'">마이페이지</button>
                  </div>
            </td>
            <td>
            <div class="btns">
                     <button id="logoutBtn" onclick="logout();">로그아웃</button>
                  </div>
            </td>
         </tr>
         <tr>
         <td>
         	<div class="btns">
         		<button id = "companyinfo" onclick="c_insertInfo()">판매자등록</button>
         	</div>
         </td>
         </tr>
      </table>
   
   <%} %>
   </div>

   
   <br clear="both">
   <hr>
   <br>


   <script>
   
      //홈으로
      function goHome(){
         location.href ="<%=request.getContextPath() %>/index.jsp";
      }
      //의자
      function StoreC(){
       location.href='<%=request.getContextPath() %>/storeC.pro';
      }
      
      //책상
      function StoreT(){
       location.href='<%=request.getContextPath() %>/storeT.pro';
      }
      //주방용품
      function StoreK(){
       location.href='<%=request.getContextPath() %>/storeK.pro';
      }
      //침구류
      function StoreB(){
       location.href='<%=request.getContextPath() %>/storeB.pro';
      }
      
      function goNotice(){
    	  location.href="<%=request.getContextPath()%>/list.no";
      }
      
      
      // 로그아웃
      function logout(){
         Kakao.Auth.logout();
         location.href = '<%= request.getContextPath() %>/logout.me';
      }
      
      // 회원가입
      function memberJoin(){
         location.href = '<%= request.getContextPath() %>/views/member/memberJoinForm.jsp';
      }
      //판매자 등록 부분
      function c_insertInfo(){
         location.href = "<%= request.getContextPath()%>/admssion.com";
      }
      
      // 비밀번호 찾기
      function findingPwd(){
         location.href = '<%= request.getContextPath() %>/views/member/findPwdView.jsp';
      }
      function loginViewPage(){
         location.href= '<%= request.getContextPath() %>/views/member/memberLoginView.jsp';
      }

   </script>
   
   <script type='text/javascript'>
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('e955c40a1536d6e04ad9bbc441193544');
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      size: 'large',
      success: function(authObj) {
      // 로그인 성공시, API를 호출합니다.
      Kakao.API.request({
         url: '/v1/user/me',
         success: function(res) {
            console.log(JSON.stringify(res.id));
            var kakaoId = JSON.stringify(res.id);
            
            $.ajax({
               url:"<%=request.getContextPath()%>/kakaocheck.me",
               type:"post",
               data:{kakaoId:kakaoId},
               success:function(data){
                  if(data == "o"){
                     location.href = '<%= request.getContextPath() %>/kakaologin.me?kakaoId='+kakaoId;
                  }else{
                     location.href = '<%= request.getContextPath() %>/views/member/kakaoJoinForm.jsp?kakaoId='+kakaoId;
                  }
               },
               error:function(data){
                  console.log("서버 통신 안됨");
               }
            });
            
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