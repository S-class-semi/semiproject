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
function selectAll(checkFlag) { 

		       var f = document.sendForm; 

		       for(var i=0; i<f.elements.length; i++) { 

		               if(f.elements[i].name == 'checkbox2'){ 

		                       f.elements[i].checked = checkFlag; 

		               } 

		       } 

		} 

		</script>

		</head>

		<body>
<br><br><br>
		<form name='sendForm'>

		  <input type='checkbox' onclick='selectAll(this.checked);'>모두선택
		  <br><br>
		  <input type='checkbox' name='checkbox2' value='value1'>상품1
          <br><br>
		  <input type='checkbox' name='checkbox2' value='value2'>상품2
		  <br><br>
		  <input type='checkbox' name='checkbox2' value='value3'>상품3
		  <br><br>
		  <input type='checkbox' name='checkbox2' value='value4'>상품4

		</form>



		


		
		
</body>
</html>