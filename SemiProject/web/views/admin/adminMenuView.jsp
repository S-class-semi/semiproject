<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="member.model.vo.Member"%>
   
   <%
   Member loginUser = (Member)session.getAttribute("loginUser");
   Integer user_G = (Integer)session.getAttribute("user_G");
   Member m = (Member)request.getAttribute("member");
   %>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>난 혼자산다 관리자 : (회사명)</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
   href="https://fonts.googleapis.com/css?family=Sunflower:300,500,700&display=swap&subset=korean"
   rel="stylesheet">
<style>
body {
   background-color: #dcdcdc;
}

/* 메뉴와 작성할 구간 스타일*/
 #bodybase {
   position: absolute;
   display: inline-block;
   width: 100%;
   height: 100%;
}
 
/* 작성할 구간*/
/* #centerbody {
   display: inline-block;
   position: relative;
   width: 85%;
   height: 100%;
} */
/* 메뉴바 첫 div */
#accordian {
   display: inline-block;
   float: left;
   background: #333333;
   width: 250px;
   height: 100%;
   position: relative;
   color: white;
   box-shadow: 0 5px 15px 1px rgba(0, 0, 0, 0.6), 0 0 200px 1px
      rgba(255, 255, 255, 0.5);
}

/* 메뉴 스타일 */
#accordian h3 {
   font-size: 12px;
   line-height: 34px;
   padding: 0 1px;
   cursor: pointer;
   background: #064461;
   background: linear-gradient(#003040, #002535);
}

/* h3카테고리 스타일*/
#accordian h3:hover {
   text-shadow: 0 0 1px rgba(255, 255, 255, 0.7);
}

/* 아이콘폰트 스타일 */
#accordian h3 span {
   font-size: 16px;
   margin-right: 10px;
}

#accordian li {
   list-style-type: none;
}
/* 서브메뉴 스타일 */
#accordian ul ul li {
   color: white;
   text-decoration: none;
   font-size: 11px;
   line-height: 27px;
   display: block;
   padding: 0 15px;
   -webkit-transition: all 0.15s;
   -moz-transition: all 0.15s;
   -o-transition: all 0.15s;
   -ms-transition: all 0.15s;
   transition: all 0.15s;
   text-decoration: none;
   cursor: pointer;
}

#accordian ul ul li:hover {
   background: #003545;
   border-left: 5px solid #09c;
   
}

/* active 클래스 외에 것은 보이지 않게 하기 */
/* #accordian ul ul {
   display: none;
}

#accordian li.active ul {
   display: none;
}  */
#underbar {
   height: 4px;
   background-color: black;
   box-shadow: 10px 10px -10px;
}

#homemenu hr {
   height: 4px;
   background-color: black;
   box-shadow: 10px 10px -10px;
}

#homemenu {
   margin-top: 20px;
   text-decoration: none;
   color: black;
}

.CompanyInfo1 {
   float: right;
   margin-right: 100px;
   font-size: 16px;
   line-height: 30px;
   font-family: Sunflower;
   font-weight: bold;
}

.CompanyInfo1 button {
   margin-right: 50px;
}

/* main페이지 이미지 */
#homeimg , #homeimg{
   float: left;
   /*    border: 1px solid black; */
   margin-left: 50px;
   margin-top: 50px;
      cursor: pointer;
}


/* user 텍스트 스타일*/
#hometext , #hometext:hover{
   float: left;
   font-family: Sunflower;
   margin-left: 20px;
   margin-top: 50px;
   text-decoration: none;
   color: black;
   cursor: pointer;
}

#hometext h4 {
   margin-top: 50px;
   
}

#rogout {
   background-color: #555555;
   color: white;
   border: 2px solid #555555;
   margin-left: 55px;
   width: 150px;
}

#rogout:hover {
   background-color: white;
   color: black;
}
</style>

</head>
<body>
   <div id="homemenu">
      
         <div id="homeimg" onclick = "C_home();">
         <%-- <a href="<%=request.getContextPath()%>/views/company/companyView.jsp">
 --%>            <img id="homeicon"
               src="<%=request.getContextPath()%>/images/home.png" width="80px"
               height="80px">
         </div>
         <div id="hometext" onclick = "C_home();">
            <h1>난 혼자 산다</h1>
         </div>
         <div id="hometext" onclick = "C_home();">
            <h4>(관리자)</h4>
         </div>
   <!--    </a> -->      
   		<div class="CompanyInfo1">
      <fieldset id = "roginuser">
      <legend aling ="center">관리자님 환영합니다.</legend>
      <button id="rogout" onclick="logout();" >로그아웃</button>
      </fieldset>
      </div>
   </div>
   <br clear="both">
   <hr id="underbar">
   
   
   <div id="bodybase">
      <div id="accordian">
         <ul>
            <li class="active">
               <h3>
                  <span class="icon-money"></span>매출확인
               </h3>
               <ul>
                  <li onclick = "SalesGraph()">매출판매량</li>
                  <li onclick = "SalesGraph2()">기간별 매출량</li>
               </ul>
            </li>
            <li>
               <h3>
                  <span class="icon-qna"></span>QnA
               </h3>
               <ul>
                  <li onclick = "QnaView()">1:1 QnA 확인</li>
                  <li>공지사항 등록</li>
                  <li>블랙컨슈머</li>
               </ul>
            </li>
            <h3>
               <span class="icon-info"></span>정보확인
            </h3>
            <ul>
               <li onclick = "OrderList()">주문내역 관리</li>
               <li onclick = "GradeUpdate()">등급 및 포인트 관리</li>
            </ul>
            <li>
               <h3>
                  <span class="icon-info"></span>정보수정
               </h3>
               <ul>
                  <li onclick = "SellerUpdate()">판매자 관리</li>
               </ul>
            </li>
         </ul>
      </div>
   
   </div>
  <!--  String c_name = "프로젝트"; -->
   <script>
      function C_home(){
         location.href = "<%=request.getContextPath()%>/views/admin/adminMenuView.jsp";
      }
      function SalesGraph2(){
         location.href = "<%=request.getContextPath()%>/views/product/SalesDetailView.jsp";
      }
      function QnaView(){
         location.href = "<%=request.getContextPath()%>/qna.do";
      }
      function GradeUpdate(){
         location.href = "<%=request.getContextPath()%>/grade.me";
      }
      function OrderList(){
         location.href = "<%=request.getContextPath()%>/order.or";
      }
      function SellerUpdate(){
    	  location.href = "<%=request.getContextPath()%>/seller.co";
      }
      function logout(){
         location.href = '<%= request.getContextPath() %>/logout.me';
      }
   </script>
   
               


</body>
</html>