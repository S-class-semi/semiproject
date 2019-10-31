<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.*,product.model.vo.*,java.util.*"%>

 <%
 	/* Member userinfo = (Member)request.getAttribute("loginUser"); */
    ProductInfo productinfo = (ProductInfo)request.getAttribute("productinfo");
    ArrayList<ProductImgFile> imgList = (ArrayList<ProductImgFile>)request.getAttribute("imgList");
    ProductImgFile titleImg = imgList.get(0);
    String count = (String)request.getAttribute("c_count");
    
    int int_price = Integer.valueOf(productinfo.getP_price()); 
    int int_count = Integer.valueOf(count);
    
    int subprice = int_price * int_count;
    int delivery =0;
    
    if(subprice >50000){
    	delivery = 0;
    }else{
    	delivery =2500;
    }
    
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>난 혼자 산다 결제</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
</head>
<style>
   #searchBtn, #listBtn, #couponBtn {
      background:  rgb(160, 200, 220);
      color: white;
   }
   
    #paysubmit{
        width: 170px;
        height: 50px;
        background: rgb(160, 200, 220);
      color: white;
      font-size: 30px;
    }
    
    #allPay{
    	display: inline-block;
    }
  	#basediv{
  	margin-top: 30px;
  	background-color: #FFFAFA;
  	}
  	
  	#order_div{
  	background-color: #ececec;  	
  	}
  	
  	#ingtext, #ingtext div{
  	display: inline-block;
  	}
  	#titleproInfo{
  	display:inline-block;
  	margin-left: 20px;
  	}
  	
  	#titleproInfo .subinfo{
  	margin-bottom: 20px;
  	font-weight: bold;
  	}
  	
  	#titleproInfo #c_namesub{
  	font-size: 10px;
  	}
  	
  	#titleproInfo #p_namesub{
  	font-size:25px;
  	font-weight: bold;
  	}
  	
  	#titleproInfo #p_pricesub{
  	font-size:25px;
  	}
  	
  	#titleImg{
  	margin-left: 200px;
  	margin-top: 15px;
  	}
  	
  	.legendclass{
  	font-size: 20px;
  	font-family: 'Jua';
  	}
	
	#payselect, #payselect div{
	display: inline-block;
	text-align: center;
	align-content: center;
	}
	#payselect div{
	font-size: 30px;
	font-family : 'Jua';
	margin-left: 50px;
	border: 1px solid black;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	}
	input[type=number]::-webkit-outer-spin-button,
input[type=number]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>



</head>
<body>

   <%@ include file = "/views/common/menubar.jsp" %> 
   <div id = "basediv">
   <form name = "order_fom1" action="<%=request.getContextPath() %>/infopay.pay" method="post">
   <div id = "ingtext">
   		<div>장바구니</div>
   		<div>주문결제</div>
   		<div>주문완료</div>
   </div>
   <hr>

   		<hr>
   		<fieldset>
   		<legend class="legendclass">구매 상품</legend>
   		<div id = "order_div">
   		<div id = "titleArea">
   		<img id = "titleImg" src ="<%=request.getContextPath() %>/images/productimg/<%=titleImg.getChange_name() %>" width="150px" height="150px">
   		<div id = "titleproInfo">
   			<div class="subinfo" id ="c_namesub"><label>회사명 : <%=productinfo.getC_name() %></label>
   			<input type ="hidden" name ="c_namevalue" value ="<%=productinfo.getC_name() %>" readonly><br></div>
   			<div class="subinfo" id ="p_namesub"><label>상품명 : <%=productinfo.getP_name() %></label>
   			<input type = "hidden" name ="p_namevalue" value ="<%=productinfo.getP_name() %>" readonly><br></div>
   			<div class="subinfo" id ="p_pricesub"><label>상품가격 : <%=productinfo.getP_price() %></label>
   			<input type = "hidden" name ="p_pricevalue" value ="<%=productinfo.getP_price() %>" readonly><br></div>
   			<div class="subinfo" id ="c_countsub"><label>갯수 : <%=int_count%> </label>
   			<input type="hidden" id="c_count" name="c_count" value="<%=int_count%>">
   			<input type = "hidden" name ="p_codevalue" value ="<%=productinfo.getP_code() %>" readonly></div>
   		</div>
   		</div>
   		</div>
   		</fieldset>
   		
   		<fieldset>
   		<legend class="legendclass">주문자 정보</legend>
   		<label>이름 : </label><input type = "text" id="o_name" name = "o_name" placeholder="이름"><br>
   		<label>연락처 : </label><input type= "text" id="o_phone" name = "o_phone" placeholder="연락처"><br>
   		<label>이메일 : </label><input type= "email" id="o_email" name = "o_email" value="<%=loginUser.getUserId()%>">
   		<input type="checkbox" id="same"><label for="same">주문자 정보와 동일합니다.</label>
   		</fieldset>
   		
   		
   		<fieldset>
   		<legend class="legendclass">배송자 정보</legend>
   		<label>받는분 : </label><input type= "text" id = "v_name" name="v_name"><br>
   		<label>연락처 : </label><input type= "text" id="v_phone" name="v_phone"><br>
   		<label>우편 번호</label><br>
   		<input type="text" id="postcode" name = "postcode" class = "a_form.mini" placeholder="우편번호">
				<input type="button" onclick="on_click()" class ="a_btn" value="우편번호 찾기"><br>
				<input type="text" id="roadAddress" name = "roadAddress" class = "a_form.std" placeholder="도로명주소">
				<input type="text" id="jibunAddress" name = "jibunAddress" class = "a_form.std"placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="detailAddress" name = "detailAddress" placeholder="상세주소">
				<input type="text" id="extraAddress" name = "extraAddress" placeholder="시/도/구"><br>
		<label>배송시 요구사항</label><br>
		<select id="selbox" name="selbox" style="height:21.33px;">
         <option value="배송 전 연락 바랍니다.">배송 전 연락 바랍니다.</option>
         <option value="문 앞에 놓아주세요">문 앞에 놓아주세요.</option>
         <option value="부재시 택배 보관함에 넣어주세요">부재시 택배 보관함에 넣어주세요.</option>
         <option value="direct">직접 입력</option>
         <option value="없음">없음</option>
         </select>
         <input type="text" id="selboxDirect" name="selboxDirect" style="width: 300px;" placeholder="이곳에 입력해주세요">
   		</fieldset>
   		
   		<fieldset>
   		<legend class="legendclass">포인트 및 최종금액</legend>
   		   <%if(loginUser!=null){ %>
            <h3>난 혼자 산다 포인트</h3>
            <hr><br>
            <h4>포인트<input type="text" id ="point" name="point">P</h4>
           	 사용 가능 포인트:  <%=loginUser.getPoint() %>P 
            <input type="checkbox" name="allpoint" id="allpoint" value="<%=loginUser.getPoint()%>"><label for="allpoint">전액사용</label>
           <br>   
             <% if(loginUser.getUserT() == 1) {%>
          	<h4> 예상 적립 포인트: <input type = "text" name = "pointinsert" value= "<%=subprice * 0.02 %>">P 적립 예정</h4>
          <%} else if(loginUser.getUserT() == 2) {%>
          	<h4>예상 적립 포인트: <input type = "text" name = "pointinsert" value= "<%=subprice * 0.05 %>">P 적립 예정</h4>
          <%} %>
           * 일반 등급은 2% 적립, VIP등급은 5% 적립
            <%} %>
            
            <label>최종금액</label><br>
            <label>주문 금액 : </label><div id="subpay"><%=subprice %></div><br>
           	<label>배송비 : </label><div id="deliverypay"><%=delivery %></div>
           	<label>포인트사용 : </label><div id="pointsub"></div>
           	<label>총금액 결제액 : </label><div id="total"><input type= "text" name = "totalprice" id = "totalprice"></div>
   		</fieldset>
   		
   		<fieldset>
   		<legend class="legendclass">결제 선택</legend>
   		<div id ="payselect">
 		<input type='checkbox' name="paychoose" value="card" >신용카드
  		<input type='checkbox' name="paychoose" value="vbank" >가상계좌
  		<input type='checkbox' name="paychoose" value="trans" >실시간계좌이체
		<input type='checkbox' name="paychoose" value="phone" >휴대폰소액결제
	
   		</div>
   		</fieldset>
   		<button type = "submit">결제하기</button>
   		   </form>   
   </div>
  <script>
  
  //주소
function on_click(){
    new daum.Postcode({
        oncomplete: function(data) {
        var Postcode =data.postcode;
		var Address = data.address;
		var JibunAddress = data.jibunAddress;
		var Bname = data.bname;
		
		console.log(Postcode);
		console.log(Address);
		console.log(JibunAddress);
		console.log(Bname);
		document.getElementById('postcode').value = Postcode;
		document.getElementById('roadAddress').value = Address;
		document.getElementById('jibunAddress').value = JibunAddress;
		document.getElementById('extraAddress').value = Bname;
		

		
		$("#postcode").attr("readonly","true");
		$("#roadAddress").attr("readonly","true");
		$("#jibunAddress").attr("readonly","true");
		$("#extraAddress").attr("readonly","true");
		autoClose: true;
        }
    
    
    }).open({autoClose: true});
   
}
  //구매자 받는자 이벤트
$("#same").change(function(){
	if($("#same").is(":checked")){
		var o_name = $("#o_name").val();
		var o_phone = $("#o_phone").val();
		$("#v_name").val(o_name);
		$("#v_phone").val(o_phone);
	}else{
		$("#v_name").val('');
		$("#v_phone").val('');
	}
});

  //포인트 체크 이벤트
$("#allpoint").change(function(){
	if($("#allpoint").is(":checked")){
		$("#point").val("<%=loginUser.getPoint()%>");
		$("#point").attr("readonly","true");
		$("#pointsub").text('<%=loginUser.getPoint()%>');
		totalpay($("#point").val());
	}else{
		$("#point").val('');
		$("#point").removeAttr("readonly");
		$("#pointsub").text('');
		totalpay(0);
	}
});

  //포인트 입력
$("#point").keyup(function() {
	if ($("#point").val().length == 0) {
		$("#pointsub").html(0);
		totalpay(0);
	} else {
		$("#pointsub").html($("#point").val());
		totalpay($("#point").val());
		if (!/^[0-9]*$/.test($("#point").val())) {
			alert("숫자만 입력해주세요.")
			$("#point").val("");
			$("#pointsub").html(0);
			totalpay(0);
		} else if ($("#point").val() >
<%=loginUser.getPoint()%>
) {
			alert("보유하고 있는 포인트가 적습니다.");
			$("#point").val("");
			$("#pointsub").html(0);
			totalpay(0);
		}
	}
});

  
  
$(function(){
    //직접입력 인풋박스 기존에는 숨어있다가
 $("#selboxDirect").hide();
 $("#selbox").change(function() {
              //직접입력을 누를 때 나타남
    if($("#selbox").val() == "direct") {
       $("#selboxDirect").show();
    }  else {
       $("#selboxDirect").hide();
    }
 });
});


function totalpay(point1) {
	var point = parseInt(point1);
	console.log(point);
	<%if (loginUser != null && subprice < 50000) {%>
	$("#totalprice").val(<%=subprice%> + <%=delivery%> -point);
	<%} else if (loginUser != null && subprice >= 50000) {%>
	$("#totalprice").val(<%=subprice%> - point);
	<%}%>
}


function paygo(){
	var name = $("#o_name").val();
	var phone = $("#o_phone").val();
    var name2 = $("#v_name").val();
    var phone2 = $("#v_phone").val();
    var add = $("#detailAddress").val();
  /*   if(name == "" || phone == "" || name2 == "" || phone2 == "" || add == ""){
       alert("필수 입력 정보를 확인해주세요.");
    } */
   
}

    <%-- window.name = "Payment";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("<%=request.getContextPath() %>/views/payment/PaymentTest.jsp","PaymentA", "width=850, height=700, resizable = no, scrollbars = no"); --%>

    
</script>

   
 <%--   <form name="order_form">
    <fieldset style = "background-color: #FFFAFA";>
    
   <h2>&nbsp;&nbsp;&nbsp;&nbsp;
   <img src="#" width="60px" height="60px">&nbsp;
   <img src="#" width="140px" height="40px">
   <legend align="right">
   <img src="/SemiProject/images/one.png" width="30px" height="30px">
    장바구니 
    <img src="/SemiProject/images/point.png" width="20px" height="20px">
     <img src="/SemiProject/images/two.png" width="30px" height="30px">
      주문/결제  <img src="/SemiProject/images/point.png" width="20px" height="20px">
       <img src="/SemiProject/images/three.png" width="30px" height="30px"> 
       주문완료  &nbsp;&nbsp;&nbsp;</h2>
       </legend>
    <hr><br>
   <fieldset style = "background-color: white";>
   <h3>주문상품내역</h3>
   <img src="/SemiProject/images/323.jpg" width="150px" height="150px">
   <br><br>
   </fieldset>
   <br><br>
   <h3>&nbsp;주문자 정보</h3>
    <hr><br><br>
    
    
   <tr class="tr">
  <th>&nbsp;&nbsp;* 이름:&nbsp;&nbsp;&nbsp;</th>
    <td class="m_info"><input type="text" name="o_name" size="20" placeholder="name" id = "o_name"></td>
  </tr>
  <br><br>
  <tr class="tr">
  <th>&nbsp;&nbsp;* 연락처:</th>
    <td class="m_info"><input type="phone" name="o_phone" size="20" placeholder="phone" id = "o_phone"></td>
  </tr><br><br>
                <label>&nbsp;&nbsp;&nbsp;이메일 : </label><input type="email" placeholder="e-mail" id = Cemail><br><br>
            <br><br><br>
           
           <h3>&nbsp;배송정보</h3>
            <hr><br><br>&nbsp;
            <tr>
   <td colspan="2"><input type="checkbox" id="same"><label for="same">주문자 정보와 동일합니다.</label></td>
  </tr>
            <br><br>
   <tr class="tr">
    <th>&nbsp;&nbsp;* 받는분:</th>
    <td class="m_info"><input type="text" name="name" size="20" placeholder="name" id = "v_name"></td>
  </tr><br><br>
  
  <tr class="tr">
    <th>&nbsp;&nbsp;* 연락처:</th>
    <td class="m_info"><input type="phone" name="phone" size="20" placeholder="phone" id = "v_phone"></td>
  </tr><br><br>
  
                <label>&nbsp;&nbsp;* 우편번호 : <input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" id = "searchBtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
&nbsp;&nbsp;&nbsp;<input type="text" id="sample6_address" placeholder="주소"><br>
&nbsp;&nbsp;&nbsp;<input type="text" id="sample6_extraAddress" placeholder="참고항목">
            <input type="text" id="sample6_detailAddress" placeholder="상세주소">
            <br><br><br><label>&nbsp;&nbsp;&nbsp;배송시 요구사항:&nbsp;
       



<select id="selbox" name="selbox" style="height:21.33px;">
                                <option value="배송 전 연락 바랍니다.">배송 전 연락 바랍니다.</option>
                        <option value="문 앞에 놓아주세요">문 앞에 놓아주세요.</option>
                        <option value="부재시 택배 보관함에 넣어주세요">부재시 택배 보관함에 넣어주세요.</option>
                        <option value="direct">직접 입력</option>
                        <option value="없음">없음</option>
                     </select>
                     <br><br>
                     &nbsp;&nbsp;<input type="text" id="selboxDirect" name="selboxDirect" style="width: 300px;" placeholder="이곳에 입력해주세요">
            <br><br><br><br><br>
            
           
            <%if(loginUser!=null){ %>
            <h3>&nbsp;난 혼자 산다 포인트</h3>
            <hr><br>
            <h4>&nbsp;&nbsp;&nbsp;포인트&nbsp;&nbsp;</label><input type="text" id = "point">&nbsp;P</h4>
            &nbsp;&nbsp;&nbsp;사용 가능 포인트: &nbsp; <%=loginUser.getPoint() %>P &nbsp;&nbsp;
            <input type="checkbox" name="allpoint" id="allpoint"><label for="allpoint">전액사용</label>
           <br><br><br><br>
            
                    
             <% if(loginUser.getUserT() == 1) {%>
          	<h4>&nbsp;&nbsp; 예상 적립 포인트: &nbsp; <%=orderpay* 0.02 %>P 적립 예정</h4>
          <%} else if(loginUser.getUserT() == 2) {%>
          	<h4>&nbsp;&nbsp; 예상 적립 포인트: &nbsp; <%=orderpay* 0.05 %>P 적립 예정</h4>
          <%} %>
            &nbsp;&nbsp; * 일반 등급은 2% 적립, VIP등급은 5% 적립
            <br><br><br><br><br>
            <%} %>
            
            <h3>&nbsp;최종 결제금액</h3>
             <hr><br><br>
             &nbsp;&nbsp;주문금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "orderpay"></a>원
             <br><br>
             &nbsp;&nbsp;배송비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <br><br>
             &nbsp;&nbsp;포인트 사용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "usePoint"></a>P
             <br><br><br><br>
             
             <h3>&nbsp;&nbsp;총 결제금액</h3>
             &nbsp;&nbsp;&nbsp;<img src="/SemiProject/images/coins.png" width="25px" height="25px">&nbsp;&nbsp;<div id="allPay"></div>원
             

             <br><br><br><br>
             <h3>&nbsp;결제 수단</h3>
             <hr><br>
             
               <div>
                   
                  <legend align="center"><a href="javascript:void(0);" id="aaa" style=" display: inline-block; width: 150px; height: 50px; text-decoration:none; text-align: center;">
                   <font size="3">　&nbsp;<img src="/SemiProject/images/101.png" width="140px" height="50px"></font>
                   </a>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="javascript:void(0);" id="bbb" style=" display: inline-block; width: 150px; height: 50px; text-decoration:none; text-align: center;">
                     　                   <font size="3"> &nbsp;<img src="/SemiProject/images/202.png" width="140px" height="52px"></font>
                  </a>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="javascript:void(0);"  id="ccc" style=" display: inline-block; width: 150px; height: 50px; text-decoration:none; text-align: center;">
                     <font size="3">　&nbsp;<img src="/SemiProject/images/303.png" width="140px" height="50px"></font>
                  </a>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="javascript:void(0);"  id="ddd" style=" display: inline-block; width: 150px; height: 50px; text-decoration:none; text-align: center;">
                     <font size="3">　&nbsp;<img src="/SemiProject/images/404.png" width="140px" height="52px"></font>
                  </a>
                  
                  </legend>

               </div>


                <br><br><br><br><br><br>
            
            
            <legend align="center"><input id="paysubmit" type="button"  font size="8" value="결제하기" onclick="paygo()"></legend>
                        
            <input type="hidden" id="throw" >
               <br>
               


            </fieldset>
            	</form> --%>
<!--             	            <script>
                $(function(){
                     //직접입력 인풋박스 기존에는 숨어있다가
                  $("#selboxDirect").hide();
                  $("#selbox").change(function() {
                               //직접입력을 누를 때 나타남
                     if($("#selbox").val() == "direct") {
                        $("#selboxDirect").show();
                     }  else {
                        $("#selboxDirect").hide();
                     }
                  });
               });
            </script>  -->
<!-- <script>
      function paygo(){
    	  var name = document.getElementById("o_name").value;
    	  var phone = document.getElementById("o_phone").value;
          var name2 = document.getElementById("v_name").value;
          var phone2 = document.getElementById("v_phone").value;
          var add = document.getElementById("sample6_postcode").value;
          
          
          if(name == "" || phone == "" || name2 == "" || phone2 == "" || add == ""){
             alert("필수 입력 정보를 확인해주세요.");
          }else{
          window.name = "Payment";
          // window.open("open할 window", "자식창 이름", "팝업창 옵션");
          openWin = window.open("PaymentTest.jsp",
                  "PaymentA", "width=850, height=700, resizable = no, scrollbars = no");
         }
          }
</script> -->


<!-- 		<script>

			$(document).ready(function() {
				$("#aaa").click(function() {
					document.getElementById("throw").value = 'card';
				});
				$("#bbb").click(function() {
					$("#infoarea").hide();
					document.getElementById("throw").value = 'vbank';
				});
				$("#ccc").click(function() {
					$("#infoarea").hide();
					document.getElementById("throw").value = 'trans';
					return false;
				});
				$("#ddd").click(function() {
					$("#infoarea").hide();
					document.getElementById("throw").value = 'phone';
				});

			});
		</script> -->
<%-- 
	<script>
		$(function() {
			$("#usePoint").html(0);
	<%if(orderpay>50000){%>
		$("#allPay").html(
	<%=orderpay%>
		);
	<%}else{%>
		$("#allPay").html(
	<%=orderpay+dFee%>
		);
	<%}%>
		});
	<%if(loginUser!=null){ %>
		$(function() {

			$("#same").change(function() {
				if ($("#same").is(":checked")) {
					$("input[name=name]").val($("input[name=o_name]").val());
					$("input[name=phone]").val($("input[name=o_phone]").val());
				} else {
					$("input[name=name]").val("");
					$("input[name=phone]").val("");
				}
			});

			$("#allpoint").change(function() {

				if ($("#allpoint").is(":checked")) {
					$("#point").val(<%=loginUser.getPoint() %>);
					$("#usePoint").html($("#point").val());
					allPay($("#point").val());
					$("#point").attr("disabled", true);
				} else {
					$("#point").attr("disabled", false);
					$("#usePoint").html(0);
					allPay(0);
					$("#point").val("");
				}
			});

			$("#point").keyup(function() {
				if ($("#point").val().length == 0) {
					$("#usePoint").html(0);
					allPay(0);
				} else {
					$("#usePoint").html($("#point").val());
					allPay($("#point").val());

					if (!/^[0-9]*$/.test($("#point").val())) {
						alert("숫자만 입력해주세요.")
						$("#point").val("");
						$("#usePoint").html(0);
						allPay(0);
					} else if ($("#point").val() >
	<%=loginUser.getPoint()%>
		) {
						alert("보유하고 있는 포인트가 적습니다.");
						$("#point").val("");
						$("#usePoint").html(0);
						allPay(0);
					}
				}
			});

		});
	<%}%>
		function allPay(point1) {
			var point = parseInt(point1);
			var orderpay =
	<%=orderpay%>
		;
			var dFee =
	<%=dFee%>
		;
	<%if(loginUser == null && orderpay < 50000){%>
		$("#allPay").html(orderpay + dFee);
	<%}else if(loginUser == null && orderpay >= 50000){%>
		$("#allPay").html(orderpay);
	<%}else if(loginUser != null && orderpay < 50000){%>
		$("#allPay").html(orderpay + dFee - point);
	<%}else if(loginUser != null && orderpay >= 50000){%>
		$("#allPay").html(orderpay - point);
	<%}%>
		}
	</script> --%>
</body>
</html>