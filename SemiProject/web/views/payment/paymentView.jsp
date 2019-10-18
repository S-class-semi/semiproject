<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>난 혼자 산다 결제 페이지</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
</style>
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
	<%@ include file = "/views/common/menubar.jsp" %> 
	<br>
	 <form>
	 <fieldset>
	 
	 <h2>(로고) 주문/결제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 장바구니> 2. 주문결제 > 3. 주문완료</h2>
	 <hr><br>
	<fieldset>
	<h3>주문상품내역</h3>
	<img src = "sample/image/flower1.PNG" width = "200px" height = "150px">
	<br><br>
	</fieldset>
	<br><br>
	<h3>&nbsp;주문자 정보</h3>
	 <hr><br><br>
                <label>&nbsp;&nbsp;* 이름 : </label><input type="text" placeholder="name"><br><br>
                <label>&nbsp;&nbsp;* 연락처 : </label><input type="text" placeholder="phone"><br><br>
                <label>&nbsp;&nbsp;&nbsp;이메일 : </label><input type="text" placeholder="e-mail"><br><br>
            <br><br><br>
           
           <h3>&nbsp;배송정보</h3>
            <hr><br><br>
             &nbsp;<input type = "checkbox" id = "same" name = "same" value = "same" checked>
            <label for = "same">주문자 정보와 동일합니다.</label>
            <br><br>
            <label>&nbsp;&nbsp;* 받는분 : </label><input type="text" placeholder="name"><br><br>
                <label>&nbsp;&nbsp;* 연락처 : </label><input type="text" placeholder="phone"><br><br>
                <label>&nbsp;&nbsp;* 우편번호 : <input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소"><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목">
            <br><br><label>&nbsp;&nbsp;&nbsp;배송시 요청사항
       
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
								<option value="">배송시 요청사항 선택</option>
								<option value="1">부재시 경비실에 맡겨주세요.</option>
								<option value="2">집 앞에 놓아주세요.</option>
								<option value="3">택배함에 넣어주세요.</option>
								<option value="direct">직접입력</option>
							</select>
							<br><br>
							&nbsp;&nbsp;<input type="text" id="selboxDirect" name="selboxDirect" style="width: 300px;" placeholder="이곳에 입력해주세요">
            <br><br>
            &nbsp;&nbsp;&nbsp;<input type = "submit" value = "배송지 목록"></label><br><br><br><br><br>
            
            <h3>&nbsp;난 혼자 산다 포인트</h3>
            <hr><br>
            <h4>&nbsp;&nbsp;&nbsp;포인트&nbsp;&nbsp;</label><input type="text">&nbsp;P</h4>
            &nbsp;&nbsp;&nbsp;사용 가능 포인트: &nbsp; 15,000P &nbsp;&nbsp;<input type = "radio" id = "point" name = "point" value = "P" checked>
            <label for = "point">전액 사용 </label>
           <br><br><br><br>
            <h4>&nbsp;&nbsp; 예상 적립 포인트: &nbsp; XXX 적립 예정</h4>
          
            &nbsp;&nbsp; * 일반 등급은 2% 적립, VIP등급은 5% 적립
            <br><br><br><br><br>
            
            <h3>&nbsp;최종 결제금액</h3>
             <hr><br><br>
             &nbsp;&nbsp;주문금액
             <br><br>
             &nbsp;&nbsp;배송비
             <br><br>
             &nbsp;&nbsp;쿠폰할인&nbsp;&nbsp;&nbsp;<input type = "submit" value = "쿠폰 적용">
             <br><br>
             &nbsp;&nbsp;포인트 사용
             <br><br>
             <h3>&nbsp;&nbsp;총 결제금액</h3>
             <br><br>
             <h3>&nbsp;결제 수단</h3>
             <hr><br><br>
             
             <div class = "mainmenu">
		<div class = "payment">
			<div class = "menu" onclick ="goNotich()">신용카드</div>
			<div width = "200px"></div>
			<div class = "menu" onclick ="goProduct()">간편결제</div>
			<div width = "200px"></div>
			<div class = "menu" onclick ="goBoard();">무통장 입금</div>
			<div width = "200px"></div>
			<div class = "menu" onclick ="goBoard();">휴대폰</div>
			
		</div>
	</div>
	
	<Script>
		function goNotich(){
			location.href = "/SemiProject/list.no";
		}
		function goNotich(){
			location.href = "/SemiProject/list.pro";
		}
		function goNotich(){
			location.href = "/SemiProject/list.bo";
		}
		
		<hr><hr><hr>
		&nbsp;<input type = "checkbox" id = "agree" name = "agree" value = "agree" checked>
        <label for = "agree">결제 진행 필수사항 동의.</label>

            
            </fieldset>
            </form>
</body>
</html><body>

</body>
</html>