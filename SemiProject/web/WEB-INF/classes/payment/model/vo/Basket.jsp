<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>난 혼자 산다 장바구니</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<style>
    #ooorder{
        width: 110px;
        height: 40px;
        background: rgb(160, 200, 220);
      color: white;
      font-size: 20px;;
      display:inline-block
      
    }
</style>
</head>
<body onload="init();">
<script language="JavaScript">
<!--
var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  
//-->
</script>

	<%@ include file = "/views/common/menubar.jsp" %> 
	<br>
	<form name="order_form">
	 <fieldset style = "background-color: #FFFAFA";>
	 
	<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/SemiProject/images/cart (1).png" width="50px" height="50px">&nbsp;&nbsp;<img src="/SemiProject/images/1111.png" width="130px" height="40px">
	<legend align="right"><img src="/SemiProject/images/one.png" width="30px" height="30px"> 장바구니 <img src="/SemiProject/images/point.png" width="20px" height="20px"> <img src="/SemiProject/images/two.png" width="30px" height="30px"> 주문/결제  <img src="/SemiProject/images/point.png" width="20px" height="20px"> <img src="/SemiProject/images/three.png" width="30px" height="30px"> 주문완료  &nbsp;&nbsp;&nbsp;</h2></legend>
    <hr>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
      $( document ).ready( function() {
        $( '.check-all' ).click( function() {
          $( '.ab' ).prop( 'checked', this.checked );
        } );
      } );
    </script>
    
    </form>
    
    
      <p>&nbsp;&nbsp;<input type="checkbox" name="all" class="check-all"> <label>모두선택</label></p>
      <fieldset style = "background-color: white";>
      <p><legend align="center">리성호컴퍼니 배송</legend><p><hr>
      <br><p><input type="checkbox" name="cb1" class="ab"> <label></label></p><img src="/SemiProject/images/320.jpg" width="100px" height="100px"><br><br>
      <p><input type="checkbox" name="cb2" class="ab"> <label></label></p><img src="/SemiProject/images/321.jpg" width="100px" height="100px"><br><br>
      <p><input type="checkbox" name="cb3" class="ab"> <label></label></p><img src="/SemiProject/images/322.jpg" width="100px" height="100px"><br><br>
      </fieldset>
      <br><br><br>
      
      <fieldset style = "background-color: white";>
      <p><legend align="center">중고로운 성호나라 배송</legend><p><hr>
      <p><input type="checkbox" name="cb4" class="ab"> <label></label></p><img src="/SemiProject/images/323.jpg" width="100px" height="100px"><br><br>
      <!-- 제품 사진, 상품명, 가격, 수량 불러와야 함 -->
      
	
<form name="form" action="PaymentView.jsp" method="get">
수량 : <input type=hidden name="sell_price" value="10000">
<input type="text" name="amount" value="1" size="3" onchange="change();">
<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br><br>

상품금액 : <input type="text" name="sum" size="11" readonly>원
	<br><br>
	  </fieldset>
	<br><br>
	

	&nbsp;&nbsp;<input type="submit" value="주문하기" id = "ooorder">
	<br><br>
	</form>
   
       
</body>
</html>