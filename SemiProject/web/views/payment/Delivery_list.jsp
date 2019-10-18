<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>배송지 목록 </title>
	<script>
		function chkSelect() {

			var formObj = document.form1;

			
			for(i = 0; i < formObj.selItm.length; i++) {
				if(formObj.selItm[i].checked) {
					return formObj.selItm[i].value;
				}
			}
			

			return "";

		}


		function apply() {

			if( banBaseAddrUpdate ) {
				return;
			}

			var value = chkSelect();

			if(value == "") {
				alert("주소를 선택하십시오.");
				return;
			}

			value = value.split(";");

			if (value[3] == "N") {

				alert("행정구역이 변경되어 사용할 수 없는 주소입니다. 배송지를 수정해주세요.");

				// 주소수정페이지로 이동
				update();

				return;
			}

			
			var frm = document.form1;
			var value = chkSelect();
			value = value.split(";");

			var returnURL='https://buy.11st.co.kr/order/deliveryAddrSet.tmall';

			if(returnURL===''){
				alert("not exist return URL");
				return;
			}

			var urlValue = getReturnLocation(value);
			location.href = returnURL +'?'+ encodeURI(urlValue);

		
		}

		function getReturnLocation(value){

			var frm = document.form1;

			var addrSeq = value[0];
			var baseAddr = "";
			var dtlsAddr = "";
			var sendNm = "";
			var tempPhone = "";
			var tempMobile = "";
			var postMail = "";
			var phone1 = "";
			var phone2 = "";
			var phone3 = "";
			var mobile1 = "";
			var mobile2 = "";
			var mobile3 = "";
			var mailNoSeq = "";
			var jejuYN = "";
			var islandYN = "";
			var addrTypCD = "";
			var buildMngNO = "";
			var areaNo = "";		//새우편번호 지역번호 추가
			var lnmAddrSeq = "";

			if(frm.selItm.length == undefined && frm.selItm.checked){
				baseAddr = frm.baseAddr.value;
				dtlsAddr = frm.dtlsAddr.value;
				sendNm = frm.rcvrName.value;
				tempPhone = frm.phone.value;
				tempMobile = frm.mobile.value;
				postMail = frm.postMail.value;
				addrSeq = frm.addrSeq.value;
				mailNoSeq = frm.mailNoSeq.value;
				jejuYN = frm.jejuYN.value;
				islandYN = frm.islandYN.value;
				addrTypCD = frm.addrTypCD.value;
				buildMngNO = frm.buildMngNO.value;
				areaNo = frm.areaNo.value;	//새우편번호 지역번호 추가
				lnmAddrSeq = frm.lnmAddrSeq.value;

			}else{
				var arrayCnt
				for( i = 0 ; i < frm.selItm.length; i++){
					if(addrSeq == frm.addrSeq[i].value){
						arrayCnt = i;
					}
				}

				baseAddr = frm.baseAddr[arrayCnt].value;
				dtlsAddr = frm.dtlsAddr[arrayCnt].value;
				sendNm = frm.rcvrName[arrayCnt].value;
				tempPhone = frm.phone[arrayCnt].value;
				tempMobile = frm.mobile[arrayCnt].value;
				postMail = frm.postMail[arrayCnt].value;
				mailNoSeq = frm.mailNoSeq[arrayCnt].value;
				jejuYN = frm.jejuYN[arrayCnt].value;
				islandYN = frm.islandYN[arrayCnt].value;
				addrTypCD = frm.addrTypCD[arrayCnt].value;
				buildMngNO = frm.buildMngNO[arrayCnt].value;
				areaNo = frm.areaNo[arrayCnt].value;	//새우편번호 지역번호 추가
				lnmAddrSeq = frm.lnmAddrSeq[arrayCnt].value;
			}

			tempPhone = tempPhone.split("-");
			tempMobile = tempMobile.split("-");

			phone1 = getArrayValue(tempPhone, 0);
			phone2 = getArrayValue(tempPhone, 1);
			phone3 = getArrayValue(tempPhone, 2);

			mobile1 = getArrayValue(tempMobile, 0);
			mobile2 = getArrayValue(tempMobile, 1);
			mobile3 = getArrayValue(tempMobile, 2);

			//새우편번호 주문 나의 배송지 관리에서 zip1, zip2, mailNoSeq에 문자 null이 설정되는 경우가 있다하여 방어코드 추가
			var zip1 = "";
			var zip2 = "";
			if (postMail != null && 'null' != postMail) {
				zip1 = postMail.substring(0,3);
				zip2 = postMail.substring(3,6);
			}

			if (mailNoSeq == null || 'null' == mailNoSeq) {
				mailNoSeq = "";
			}

			var urlValue = "&addrSeq="+escape(addrSeq);
			urlValue = urlValue + "&baseAddr="+escape(baseAddr);
			urlValue = urlValue + "&dtlsAddr=" + escape(dtlsAddr);
			urlValue = urlValue + "&zip1="+escape(zip1);
			urlValue = urlValue + "&zip2="+escape(zip2);
			urlValue = urlValue + "&sendNm="+escape(sendNm);
			urlValue = urlValue + "&phone1="+escape(phone1);
			urlValue = urlValue + "&phone2="+escape(phone2);
			urlValue = urlValue + "&phone3="+escape(phone3);
			urlValue = urlValue + "&mobile1="+escape(mobile1);
			urlValue = urlValue + "&mobile2="+escape(mobile2);
			urlValue = urlValue + "&mobile3="+escape(mobile3);
			urlValue = urlValue + "&mailNoSeq="+escape(mailNoSeq);
			urlValue = urlValue + "&jejuYN="+escape(jejuYN);
			urlValue = urlValue + "&islandYN="+escape(islandYN);
			urlValue = urlValue + "&addrTypCd="+escape(addrTypCD);
			urlValue = urlValue + "&buildMngNo="+escape(buildMngNO);
			urlValue = urlValue + "&areaNo="+escape(areaNo);    //새우편번호 지역번호 추가
            urlValue = urlValue + "&lnmAddrSeq="+escape(lnmAddrSeq);
			urlValue = urlValue + "&rowIdx="+escape();
			;

			return urlValue;

		}

		// 배열인지 확인 하고 배열이변 배열내용을 배열이 아니면 ""을 리턴.
		function getArrayValue(obj , arrayIndex){
			if(isArray(obj)){
				return obj[arrayIndex];
			}else{
				return "";
			}
		}

		function isArray(obj){return(typeof(obj.length)=="undefined")?false:true;}



		function update() {

			var formObj = document.form1;
			var value = chkSelect();

			if(value == "") {
				alert("주소를 선택하십시오.");
				return;
			}

			value = value.split(";");

			formObj.addrSeqNO.value = value[0];

			formObj.method.value = "addrUpdate";
			formObj.action = "/register/addrUpdate.tmall";
			formObj.submit();
		}

		function del() {
			var formObj = document.form1;

			if(!formObj.selItm.length) {
				alert("최소한 한개의 주소지는 있어야 합니다.");
				return;
			}

			var value = chkSelect();

			if(value == "") {
				alert("주소를 선택하십시오.");
				return;
			}

			value = value.split(";");

			formObj.addrSeqNO.value = value[0];
			var baseAddrYN = value[2];

			if(confirm("선택하신 배송지를 삭제하시겠습니까?")) {

				if(baseAddrYN == "Y"){
					alert("기본 배송지는 삭제할 수 없습니다. 변경 후 삭제해주세요.");
					return;
				}

				formObj.method.value = "addrDelete";
				formObj.action = "/register/addrDelete.tmall";
				formObj.submit();
			}
		}

		function regist() {
			var formObj = document.form1;

			formObj.action = "/register/addrRegist.tmall";
			formObj.submit();
		}

		//주문서 작성페이지  배송지 정보 설정 초기화 작업
		function initDeliveryInfo() {

			if(opener.document.all.goParentScript != null) {
				opener.AddrRadioButtonDiv.innerHTML = "";

				
				opener.step2.makeAddrRadioButton('서하정' , '서하정' , '031-223-5133' , '010-4905-9320' , '441110' , '경기도 수원시 권선구 세류동 ' , '한라녹턴APT 102동 802호' , 'Y', 0, '2', '001');
				
				opener.step2.makeAddrRadioButton('기본주소' , '서예송' , '031-223-5133' , '010-9636-5133' , '441110' , '경기도 수원시 권선구 세류동 ' , '한라녹턴APT 102동 802호' , 'N', 1, '1', '001');
				
			}
		}

		function rowSelect(obj){
			if ( jQuery(obj).find("input:radio:disabled").length == 0){
				jQuery(obj).find("input:radio").attr("checked", true);
			}else{
				jQuery(obj).find("input:radio").attr("checked", false);
			}
		}

		var banBaseAddrUpdate = false;
		function fncAddrUseYnChk(mailNoUseYn) {
			if( mailNoUseYn == 'N' ) {
				jQuery("#notAvailableAddrTxt").css("display","inline");		//안쓰는주소 선택시   경고문구는 유지
			} else {
				jQuery("#notAvailableAddrTxt").css("display","none");
			}
		}

	</script>
</head>
<body>
<form name="form1" method="post">
	<input type="hidden" name="method">
	<input type="hidden" name="seq" value="">
	<input type="hidden" name="addr" value="">
	<input type="hidden" name="addrSeqNO" value="">
	<input type="hidden" name="addrCD"   value="01">
	<input type="hidden" name="callSite" value="05">
	<input type="hidden" name="rowIdx" value="">
	<input type="hidden" id="isTown" name="isTown" value="">
	<input type="hidden" id="activeRoadYN" name="activeRoadYN" value="Y">
	<input type="hidden" id="activeJibunYN" name="activeJibunYN" value="Y">
	<input type="hidden" id="returnURL" name="returnURL" value="https://buy.11st.co.kr/order/deliveryAddrSet.tmall">
	
	<input type="hidden" name="addrNms" value="서하정|기본주소">
	<div id="popLayWrap">
		<div id="popHead">
			<div class="popHeadEnd">
				<h1>나의 배송지 관리</h1>
			</div>
		</div>
		<div class="popbody_con">
			<div class="deliverManage_wrap">
				<h2 class="stit3">배송지 목록</h2>
				<ul class="pop_tab">
				</ul>
				<h3 class="tab_htit">국내배송주소</h3>
				<div class="tblwrap">
					<table class="tbl_atype">
						<caption>배송지 목록</caption>
						<colgroup>
							<col style="width:43px;">
							<col style="width:117px;">
							<col>
							<col style="width:90px;">
							<col style="width:103px;">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">선택</th>
							<th scope="col">배송지이름</th>
							<th scope="col">주소</th>
							<th scope="col">받는사람</th>
							<th scope="col">연락처</th>
						</tr>
						</thead>
						<tbody>
						

								<tr onclick="javascript:fncAddrUseYnChk('Y');"  class="first" >
									<td>
										<input title="radio" type="radio" class="nobdr" name="selItm" value="2;경기도 수원시 권선구 세류동 한라녹턴APT 102동 802호;Y;Y">
									</td>
									<td>서하정&nbsp(기본)</td>
									<td class="addr">경기도 수원시 권선구 세류동 한라녹턴APT 102동 802호</td>
									<td>서하정</td>
									<td class="telnum">010-4905-9320</td>
								</tr>

								<!-- 부모창으로 던져주기위한 hidden값 -->
								<tr align="center">
									<input type='hidden' name='rcvrName' value='서하정'>
									<input type='hidden' name='phone' value='031-223-5133'>
									<input type='hidden' name='mobile' value='010-4905-9320'>
									<input type='hidden' name='postMail' value='441110'>
									<input type='hidden' name='baseAddr' value='경기도 수원시 권선구 세류동 '>
									<input type='hidden' name='dtlsAddr' value='한라녹턴APT 102동 802호'>
									<input type='hidden' name='addrSeq' value='2'>
									<input type='hidden' name='mailNoSeq' value='001'>
									<input type='hidden' name='baseAddrYN' value='Y'>
									<input type='hidden' name='jejuYN' value='N'>
									<input type='hidden' name='islandYN' value='N'>
									<input type='hidden' name='addrTypCD' value='01'>
									<input type='hidden' name='buildMngNO' value=''>
									<input type='hidden' name='areaNo' value='441110'>    <!-- //새우편번호 지역번호 추가 -->
									<input type='hidden' name='lnmAddrSeq' value=''>
								</tr>
						

								<tr onclick="javascript:fncAddrUseYnChk('Y');"   >
									<td>
										<input title="radio" type="radio" class="nobdr" name="selItm" value="1;경기도 수원시 권선구 세류동 한라녹턴APT 102동 802호;N;Y">
									</td>
									<td>기본주소</td>
									<td class="addr">경기도 수원시 권선구 세류동 한라녹턴APT 102동 802호</td>
									<td>서예송</td>
									<td class="telnum">010-9636-5133</td>
								</tr>

								<!-- 부모창으로 던져주기위한 hidden값 -->
								<tr align="center">
									<input type='hidden' name='rcvrName' value='서예송'>
									<input type='hidden' name='phone' value='031-223-5133'>
									<input type='hidden' name='mobile' value='010-9636-5133'>
									<input type='hidden' name='postMail' value='441110'>
									<input type='hidden' name='baseAddr' value='경기도 수원시 권선구 세류동 '>
									<input type='hidden' name='dtlsAddr' value='한라녹턴APT 102동 802호'>
									<input type='hidden' name='addrSeq' value='1'>
									<input type='hidden' name='mailNoSeq' value='001'>
									<input type='hidden' name='baseAddrYN' value='N'>
									<input type='hidden' name='jejuYN' value='N'>
									<input type='hidden' name='islandYN' value='N'>
									<input type='hidden' name='addrTypCD' value='01'>
									<input type='hidden' name='buildMngNO' value=''>
									<input type='hidden' name='areaNo' value='441110'>    <!-- //새우편번호 지역번호 추가 -->
									<input type='hidden' name='lnmAddrSeq' value=''>
								</tr>
						
						<script>
							self.resizeTo(720, 700);
							window.document.body.scroll = "auto";
						</script>
						
						</tbody>
					</table>
				</div>
				<br>

				<div class="list_btnW">
					<div class="fl_left">
						<a href="javascript:regist();" class="defbtn_med mdtype6"><span>배송지 추가</span></a>
						<a href="javascript:update();" class="defbtn_med mdtype6"><span>수정</span></a>
						<a href="javascript:del();" class="defbtn_med mdtype6"><span>삭제</span></a>
						<p id="notAvailableAddrTxt" style="display:none;">행정구역이 변경되어 사용 할 수 없는 주소입니다. 배송지를 수정해주세요.</p>
					</div>
					<div class="fl_right">
						
						<a href="javascript:apply();" class="defbtn_med mdtype4" id="baseAddrAtag"><span>배송지로 선택</span></a>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>