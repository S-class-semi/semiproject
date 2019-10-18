<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList"%>
<%
 	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 
/*	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();*/
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체게시판</title>
<style type="text/css">
    body{
        line-height:2em;        
        font-family:"맑은 고딕";
}
    ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
}
if(#ulTable > li > ul > li:first-child +li=="공지"){

}
    #mainWrapper{
        width: 800px;
        margin: 0 auto; /*가운데 정렬*/
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
}

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        background-color:#c9c9c9;
        font-weight:bold;
        text-align:center;
}

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
}
    #ulTable > li > ul > li { 
        float:left;
        font-size:10pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
}    

    #ulTable > li > ul > li:first-child					{width:10%;} /*NO열 크기*/
    #ulTable > li > ul > li:first-child +li				{width:10%;} /*타입 크기*/
    #ulTable > li > ul > li:first-child +li+li			{width:35%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li   	{width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li	{width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li+li	{width:10%;} /*조회수 열 크기*/

    #divPaging {
        clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
}

  

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 20px; 
        width:auto; 
        height:100px;

}

    .left {
        text-align : left;
}


</style>

</head>
<body>
	<%@ include file = "/views/common/menubar.jsp" %> 
    <div class="mainWrapper">

        <ul>

            <li>전체 게시판</li>

            <!-- 게시판 목록  -->
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No</li>
                            <li>카테고리</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>작성자</li>
                            <li>조회수</li>
                        </ul>
                    <!-- 게시물이 출력될 영역 -->
                    <li>
                    <%if(list.isEmpty()){ %>
                    <tr>
                    	<td colspan="6">게시글이없습니다</td>
                    </tr>
                    </li>
                    <%}else{ %>
                    <%for(Board b :list){ %>
                    	<tr>q
                    		<input value="<%=b.getB_NO()%>">
                    		<li><%=b.getB_NO()%></li>
                    		<li><%=b.getB_TYPE()%></li>
                    		<li><%=b.getB_TITLE()%></li>
                    		<li><%=b.getUSER_ID()%></li>
                    		<li><%=b.getB_COUNT()%></li>
                    		</tr>
                    		<%} %>
				<%} %>
				
				</div>
<!--
		B_NO = b_NO;
		B_TYPE = b_TYPE;
		B_NAME = b_NAME;
		B_TITLE = b_TITLE;
		B_TEXT = b_TEXT;
		USER_ID = uSER_ID;
		B_TIME = b_TIME;
		B_COUNT = b_COUNT;
		B_FLOG = b_FLOG;

            <!-- 게시판 페이징 영역 -->
        
            <!-- 검색 폼 영역 -->
            <li id='liSearchOption'>
                <div>
                    <select id='selSearchOption' >
                        <option value='A'>제목+내용</option>
                        <option value='T'>제목</option>
                        <option value='C'>내용</option>
                    </select>
                    <input id='txtKeyWord' />
                    <input type='button' value='검색'/>
                </div>
                </li>

        </ul>
    </div>
</body>
</html>