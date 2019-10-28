<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "product.model.vo.*"%>
     <%
    	ProductSales productsales = (ProductSales)request.getAttribute("prosales");
    %>
    
    <%
    //커넥션 선언
    Connection con = null;
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "semi_";
	String password = "semi_";
	PreparedStatement ppst = null;
    try {
        //드라이버 호출, 커넥션 연결
        Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
        con = DriverManager.getConnection(
                url,user,password);
        ppst = con.prepareStatement("SELECT * FROM BAR");
        
 
        //ResultSet : 쿼리문에 대한 반환값
        ResultSet rs = null;
 
        //DB에서 뽑아온 데이터(JSON) 을 담을 객체. 후에 responseObj에 담기는 값
        List barlist = new LinkedList();
 
      
 
        
 
        rs = ppst.executeQuery();
        
        //ajax에 반환할 JSON 생성
        JSONObject responseObj = new JSONObject();
        JSONObject barObj = null;
        
        //소수점 2번째 이하로 자름
        DecimalFormat f1 = new DecimalFormat("");
        //rs의 다음값이 존재할 경우
        while (rs.next()) {
            String city = rs.getString("city");
            float amount = rs.getFloat("amount");
            float per = rs.getFloat("per");
            barObj = new JSONObject();
            barObj.put("city", city);
            barObj.put("amount", (int)amount);
            barObj.put("per", (int)per);
            barlist.add(barObj);
        }
 
        responseObj.put("barlist", barlist);
        out.print(responseObj.toString());
 
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try{
    	if (ppst != null) {
            
                ppst.close();
                if(con!=null){
                	con.close();
    	}    }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    
    
    
%>
  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>