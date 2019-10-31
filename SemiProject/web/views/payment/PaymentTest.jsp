<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="payment.model.vo.*"%>
    <%
    Payment pay = (Payment)request.getAttribute("paymentinfo");
    String payselect = pay.getPayselect();
    String add[] = pay.getAddress().split("/");
    String postcode = add[0];
    String addr = add[1];
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
   <script>
   var IMP = window.IMP; // 생략가능
   IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
   IMP.request_pay({
       pg : 'inicis', // version 1.1.0부터 지원.
       pay_method : '<%=pay.getPayselect()%>',
       merchant_uid : 'merchant_' + new Date().getTime(),
       name : '<%=pay.getP_name()%>',
       amount : <%=pay.getTotalprice()%>,
       buyer_email : 'iamport@siot.do',
       buyer_name : '<%=pay.getO_name()%>',
       buyer_tel : '<%=pay.getO_phone()%>',
       buyer_addr : 'addr',
       buyer_postcode : 'postcode',
   }, function(rsp) {
       if ( rsp.success ) {
           var msg = '결제가 완료되었습니다.';
           msg += '고유ID : ' + rsp.imp_uid;
           msg += '상점 거래ID : ' + rsp.merchant_uid;
           msg += '결제 금액 : ' + rsp.paid_amount;
           msg += '카드 승인번호 : ' + rsp.apply_num;
           location.href = "<%=request.getContextPath() %>/views/payment/Order_complete.jsp";       
          /*  opener.location.replace('Order_complete.jsp'); */
           /* window.close(); */
          
       } else {
           var msg = '결제에 실패하였습니다.';
           p_code;
           c_name;
           cou
           msg += '에러내용 : ' + rsp.error_msg;
           location.href = "<%=request.getContextPath() %>/index.jsp";
       }
       alert(msg);
   });
   </script>
</body>
</html>