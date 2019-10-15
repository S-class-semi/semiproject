<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#accordian {
	background: #333333;
	width: 250px;
	
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
#accordian ul ul li a {
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
}

#accordian ul ul li a:hover {
	background: #003545;
	border-left: 5px solid #09c;
}

/* active 클래스 외에 것은 보이지 않게 하기 */
#accordian ul ul {
	display: none;
}

#accordian li.active ul {
	display: block;
}
</style>

</head>
<body>
<div>
	<div id="hometrans">
				<a href ="<%=request.getContextPath() %>/companyView.jsp"> <img id="homeicon"
					src="<%=request.getContextPath()%>/images/home.png" width="50px"
					height="50px"></a>
			</div>
</div>
<hr>
<div id="accordian">
	<ul>
		<li>
			<h3><span class="icon-category"></span>상품카테고리</h3>
			<ul>
				<li><a href="#">상품등록</a></li>
				<li><a href="#">상품수정</a></li>
				<li><a href="#">상품삭제</a></li>
				<li><a href="#">상품재고</a></li>
			</ul>
		</li>
		<li class="active">
			<h3><span class="icon-money"></span>매출확인</h3>
			<ul>
				<li><a href="#">매출판매량</a></li>
				<li><a href="#">기간별 매출량</a></li>
			</ul>
		</li>
		<li>
			<h3><span class="icon-qna"></span>QnA</h3>
			<ul>
				<li><a href="#">1:1 QnA 확인</a></li>
				<li><a href="#">공지사항 등록</a></li>
				<li><a href="#">블랙컨슈머</a></li>
			</ul>
		</li>
	</ul>
</div>
        <script>
        $(function(){
        	$("#accordian h3").click(function(){
        		$("#accordian ul ul").slideUp();
        		if(!$(this).next().is(":visible"))
        		{
        			$(this).next().slideDown();
        		}
        	})
        })
        </script>

</body>
</html>