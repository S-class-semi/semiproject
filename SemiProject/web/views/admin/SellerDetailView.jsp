<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "company.model.vo.*"%>

 	<%
    	Company c = (Company)request.getAttribute("company");
 		
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
	width: 100%;
	height: 100%;
	
	margin-left: 100px;
	}
	.outer{
      width:900px;
      height:500px;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
      }
   .header {
  background-color: #327a81;
  color: white;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}

img {
  border-radius: 50%;
  height: 60px;
  width: 60px;
}

.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 800px;
}

table {
  width: 100%;
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
}
table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: left;
}
table th {
  background-color: #daeff1;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: white;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}
</style>
</head>
<body>
<%@ include file = "/views/admin/adminMenuView.jsp" %> 

<div class = "outer">

<div id="centerbody">

<div class="table-users">
   <div class="header">판매자 신청 회원 상세보기</div>
		<div class = "tableArea">
		<form id = "updateForm" method="post">
			<table align = "center" width="800px">
				<tr>
				<input type = "hidden" name="userid" value= "<%=c.getUserid() %>">
	
					<th>회원 아이디</th>
					<td><span><%=c.getUserid() %></span></td>
					<th>사업증번호</th>
					<td colsapn="3"><span><%=c.getC_number() %></span></td>
				</tr>
				<tr>
					<th>회사 이름</th>
					<td><span><%=c.getC_name() %></span></td>
					<th>담당자 이름</th>
					<td><span><%=c.getC_manager() %></span></td>
					<th>회원 등급</th>
					<td><span><%=c.getUser_t() %></span></td>
				</tr>
				<tr>
					<th>회사 연락처</th>
					<td><span><%=c.getC_phon() %></span></td>
					<th>담당자 연락처</th>
					<td><span><%=c.getC_contact() %></span></td>
				</tr>
				<tr>
					<th>회사 주소</th>
					<td colspan="6"><span><%=c.getC_add() %></span></td>
				</tr>
				
				
			</table>
		<div align ="center">
			<button type="submit" onclick ="update()">승인하기</button>
		</div>
		</form>
		<div align = "center">
			<button onclick = "Goback()">메뉴로 돌아가기</button>
		</div>
		</div>
			
		</div>
	</div>
</div>

<script>
	
	function Goback(){
		location.href = "<%=request.getContextPath()%>/seller.co";
	}
	function update(){
		$("#updateForm").attr("action","<%=request.getContextPath()%>/updatesellerview.se");
	}
</script>



</body>
</html>