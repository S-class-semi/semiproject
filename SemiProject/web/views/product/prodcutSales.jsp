<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.ProductSales"%>
    
      <%
    	ProductSales productsales = (ProductSales)request.getAttribute("prosales");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#centerbody {
	display: inline-block;
	position: relative;
	width: 85%;
	height: 100%;
	border : 1px solid black;
	margin-left: 250px;
	}
	#daily{
		background:orangered;
		border-radius:5px;
		width:80px;
		height:25px;
		text-align:center;
	}
</style>
</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 



<div id="centerbody">
	
	<form id = "sales" action = "<%=request.getContextPath()%>/sales.pro" method = "post">
	
	<span style="float: left; margin-right:20px;">
        <label for ="sales1">상품이름</label>
        <select id="p_name" name="p_name" size="1">
            <option value="원목책상">원목책상</option>
            <option value="원목의자">원목의자</option>
            <option value="간이책장">간이책장</option>
        </select>
    </span>
    <br>
	
	<div id="daily" onclick="prosales()">오늘매출</div>
	
	
	</form>
	

</div>

<script>
function prosales(){
	$("#sales").submit();
	
}

</script>
</body>
</html>