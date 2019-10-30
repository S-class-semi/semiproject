<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<script>
		location.href = "<%=request.getContextPath() %>/views/common/mainView.jsp"; 
	</script>
 

	<%--
	 
	 다른 페이지에서 사용할때는  밑에 있는 구문을 사용하자.
	 <%@ include file = "/views/common/menubar.jsp" %> 
	 
	 --%>
	<%-- 
	
	잊어먹을때 한번씩 확인하면서 활용하자 안나오는지 확인
	
	지시자 (<% page %>)
	: 컨테이너가 페이지를 자바코드로 변환할 때 특별
	한 지시를 내릴 수 있도록 고안된 것들
	(인코딩 방식, MIME , import)
	
	스크립트릿(<% 자바코드 %>)
	: 일반적으로 자바코드를 넣고자 할때 사용. jsp에서 무언가를 출력하려면 out.println()메소드를 사용해야 한다.
	
	표현식(<%= 값 %>)
	: out.println()메소드를 사용하지 않고 사용
	(컨테이너가 자동으로 out.println()구문으로 바꿔줌. 단! ;(세미콜론)을 붙이지 않아야 한다.(자동으로 붙여주기 때문에)
	표현식에는 void인 메소드를 호출하지 말아야 함)
	
	선언부 (<%! 함수(메소드) %>)
	: 함수를 선언해서 쓰고자 할 때 사용하나 자주 사용되지는 않음
	 --%>
	 
	 
</body>
</html>