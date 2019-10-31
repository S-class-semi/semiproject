
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "product.model.vo.* , java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style>
#category{
margin-top : 50px;
margin-left: 200px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card {
	overflow: hidden;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 900px;
  text-align: center;
  font-family: arial;
  display: inline;
  background-image: url("");
}

.card img{
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.card:hover img {
   
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
 } 
 
.card:hover{
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
}
#c_proinfo{
display:inline-block;
}

.card #c_proinfo label{
text-align: left;
}

#c_Name{
font-size: 10px;
font-style: bold;
}
#c_proinfo #c_Name{
align-content: left;
}
#c_proinfo{
border: 1px soild black;
padding-left: 20px;
}

#c_proinfo #p_Name{
font-size: 20px;
font-weight: bold;
}

#c_proinfo #p_Price{
font-size: 22px;
font-family: 'Black Han Sans';
text-align: right;
margin-left: 150px;
}



</style>
</head>
<body>
	
	<div id = "category">
	<h1>오늘의 베스트 상품</h1>
			<div class="card">
            <img src="<%=request.getContextPath()%>/images/maining5.jpeg" width="820px" height="460px">
	</div>
</div>
</body>
</html>