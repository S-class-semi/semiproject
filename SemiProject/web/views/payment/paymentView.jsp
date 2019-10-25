<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>난 혼자 산다 결제 페이지</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
	#searchBtn, #listBtn, #couponBtn{
		background:  rgb(160, 200, 220);
		color: white;
	}
	
</style>

<script type="text/javascript">
		function paygo(){
		    window.name = "Payment";
		    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		    openWin = window.open("PaymentTest.jsp",
		            "PaymentA", "width=850, height=700, resizable = no, scrollbars = no");
			}
</script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<script>
	function same2m_info(f){
	f.name.value = f.o_name.value;
	f.phone.value = f.o_phone.value;
	}
	</script>
	
	<%@ include file = "/views/common/menubar.jsp" %> 
	<br>
	<form name="order_form">
	 <fieldset>
	 
	<h2>&nbsp;&nbsp;&nbsp;&nbsp;<img src="/SemiProject/images/wallet.png" width="50px" height="50px">&nbsp;&nbsp;주문/결제
	<legend align="right"><img src="/SemiProject/images/one.png" width="30px" height="30px"> 장바구니 <img src="/SemiProject/images/point.png" width="20px" height="20px"> <img src="/SemiProject/images/two.png" width="30px" height="30px"> 주문/결제  <img src="/SemiProject/images/point.png" width="20px" height="20px"> <img src="/SemiProject/images/three.png" width="30px" height="30px"> 주문완료  &nbsp;&nbsp;&nbsp;</h2></legend>
	 <hr><br>
	<fieldset>
	<h3>주문상품내역</h3>
	<img src="/SemiProject/images/320.jpg" width="150px" height="150px">
	<br><br>
	</fieldset>
	<br><br>
	<h3>&nbsp;주문자 정보</h3>
	 <hr><br><br>
	 
	 
	<tr class="tr">
  <th>&nbsp;&nbsp;* 이름:&nbsp;&nbsp;&nbsp;</th>
    <td class="m_info"><input type="text" name="o_name" size="20" placeholder="name"></td>
  </tr>
  <br><br>
  <tr class="tr">
  <th>&nbsp;&nbsp;* 연락처:</th>
    <td class="m_info"><input type="phone" name="o_phone" size="20" placeholder="phone"></td>
  </tr><br><br>
                <label>&nbsp;&nbsp;&nbsp;이메일 : </label><input type="email" placeholder="e-mail"><br><br>
            <br><br><br>
           
           <h3>&nbsp;배송정보</h3>
            <hr><br><br>&nbsp;
            <tr>
    <td colspan="2"><input type="checkbox" name="same" onclick="javascript:same2m_info(document.order_form)">주문자 정보와 동일합니다.</td>
  </tr>
            <br><br>
   <tr class="tr">
    <th>&nbsp;&nbsp;* 받는분:</th>
    <td class="m_info"><input type="text" name="name" size="20" placeholder="name"></td>
  </tr><br><br>
  
  <tr class="tr">
    <th>&nbsp;&nbsp;* 연락처:</th>
    <td class="m_info"><input type="phone" name="phone" size="20" placeholder="phone"></td>
  </tr><br><br>
  
                <label>&nbsp;&nbsp;* 우편번호 : <input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" id = "searchBtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
&nbsp;&nbsp;&nbsp;<input type="text" id="sample6_address" placeholder="주소"><br>
&nbsp;&nbsp;&nbsp;<input type="text" id="sample6_extraAddress" placeholder="참고항목">
            <input type="text" id="sample6_detailAddress" placeholder="상세주소">
            <br><br><br><label>&nbsp;&nbsp;&nbsp;배송시 요구사항:&nbsp;
       
            <script>
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
				</script>


<select id="selbox" name="selbox" style="height:21.33px;">
                                <option value="1">배송 전 연락 바랍니다.</option>
								<option value="2">문 앞에 놓아주세요.</option>
								<option value="3">부재시 택배함에 넣어주세요.</option>
								<option value="direct">직접 입력</option>
								<option value="4">없음</option>
							</select>
							<br><br>
							&nbsp;&nbsp;<input type="text" id="selboxDirect" name="selboxDirect" style="width: 300px;" placeholder="이곳에 입력해주세요">
            <br><br>
            &nbsp;&nbsp;&nbsp;<input type = "submit" id= "listBtn" value = "배송지 목록"></label><br><br><br><br><br>
           
            <%if(loginUser!=null){ %>
            <h3>&nbsp;난 혼자 산다 포인트</h3>
            <hr><br>
            <h4>&nbsp;&nbsp;&nbsp;포인트&nbsp;&nbsp;</label><input type="text" id = "point">&nbsp;P</h4>
            &nbsp;&nbsp;&nbsp;사용 가능 포인트: &nbsp; <%=loginUser.getPoint() %>P &nbsp;&nbsp;
            <input type="checkbox" name="allpoint" id="allpoint"><label for="allpoint">전액사용</label>
           <br><br><br><br>
            <h4>&nbsp;&nbsp; 예상 적립 포인트: &nbsp; XXX 적립 예정</h4>
          
            &nbsp;&nbsp; * 일반 등급은 2% 적립, VIP등급은 5% 적립
            <br><br><br><br><br>
            <%} %>
            
            <h3>&nbsp;최종 결제금액</h3>
             <hr><br><br>
             &nbsp;&nbsp;주문금액
             <br><br>
             &nbsp;&nbsp;배송비
             <br><br>
             &nbsp;&nbsp;포인트 사용
             <br><br>
             <h3>&nbsp;&nbsp;총 결제금액</h3>
             <br><br>
             <h3>&nbsp;결제 수단</h3>
             <hr><br><br><br>
             
					<div>
						결제 수단 <br><br>
						<a href="javascript:void(0);" id="aaa" style=" display: inline-block; width: 150px; height: 40px; text-decoration:none; text-align: center;">
							<font size="3">신용카드</font>
						</a>
						<a href="javascript:void(0);" id="bbb" style=" display: inline-block; width: 150px; height: 40px; text-decoration:none; text-align: center;">
							<font size="3">무통장입금</font>
						</a>
						<a href="javascript:void(0);"  id="ccc" style=" display: inline-block; width: 150px; height: 40px; text-decoration:none; text-align: center;">
							<font size="3">실시간 계좌이체</font>
						</a>
						<br>
						<a href="javascript:void(0);"  id="ddd" style=" display: inline-block; width: 150px; height: 40px; text-decoration:none; text-align: center;">
							<font size="3">휴대폰결제</font>
						</a>
						<a href="javascript:void(0);"  id="eee" style=" display: inline-block; width: 150px; height: 40px; text-decoration:none; text-align: center;">
							<font size="3">삼성페이</font>
						</a>

					</div>

				<script>
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
						$("#eee").click(function() {
							$("#infoarea").hide();
							document.getElementById("throw").value = 'samsung';
						});
						
					});
				</script>
                <br><br><br>
				
				
				<input id="paysubmit" type="button" value="결제하기" onclick="paygo()">
								
				<input type="text" id="throw" >
               
               
               <script>
<%if(loginUser!=null){ %>
	$(function() {
		$("#allpoint").change(function() {

			if ($("#allpoint").is(":checked")) {
				$("#point").val(<%=loginUser.getPoint() %>);
				$("#point").attr("disabled", true);
			}else{
				$("#point").attr("disabled", false);
				$("#point").val("");
			}
		});
		
		$("#point").keyup(function(){
			if(!/^[0-9]*$/.test($("#point").val())){
				alert("숫자만 입력해주세요.")
				$("#point").val("");
			}else if($("#point").val() > <%=loginUser.getPoint()%>){
				alert("보유하고 계신 포인트가 입력하신 값보다 적습니다.");
				$("#point").val("");
			}
			
		});
		
	});
	<%}%>
</script>

            </fieldset>
            </form>
</body>
</html>