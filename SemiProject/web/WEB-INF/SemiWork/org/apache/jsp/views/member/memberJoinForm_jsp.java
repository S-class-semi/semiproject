/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.45
 * Generated at: 2019-10-16 06:48:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import member.model.vo.Member;

public final class memberJoinForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/views/member/../common/menubar.jsp", Long.valueOf(1571208488689L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("member.model.vo.Member");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<style>\r\n");
      out.write("\t.outer{\r\n");
      out.write("\t\twidth: 900px;\r\n");
      out.write("\t\theight: 700px;\r\n");
      out.write("\t\tbackground: rgb(160, 200, 220);\r\n");
      out.write("\t\tcolor: white;\r\n");
      out.write("\t\tmargin-left: auto;\r\n");
      out.write("\t\tmargin-right: auto;\r\n");
      out.write("\t\tmargin-top: 50px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.outer label, .outer td{\r\n");
      out.write("\t\tcolor: white;\r\n");
      out.write("\t}\r\n");
      out.write("\tinput{\r\n");
      out.write("\t\tmargin-top: 2px;\r\n");
      out.write("\t}\r\n");
      out.write("\t#idCheck, #goMain, #joinBtn{\r\n");
      out.write("\t\tbackground: rgb(160, 200, 220);\r\n");
      out.write("\t\tborder-radius: 5px;\r\n");
      out.write("\t\twidth: 80px;\r\n");
      out.write("\t\theight: 25px;\r\n");
      out.write("\t\ttext-align: center;\r\n");
      out.write("\t\tcolor: white;\r\n");
      out.write("\t}\r\n");
      out.write("\t#joinBtn{\r\n");
      out.write("\t\tbackground: hotpink;\r\n");
      out.write("\t\tcolor: white;\r\n");
      out.write("\t}\r\n");
      out.write("\t#joinBtn, #goMain{\r\n");
      out.write("\t\tdisplay: inline-block;\r\n");
      out.write("\t}\t\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("    \r\n");

	Member loginUser = (Member)session.getAttribute("loginUser");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Semi4조 난 혼자 산다 !</title>\r\n");
      out.write("<script src = \"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write("\tbody{\r\n");
      out.write("\t\tbackground-color: white;\r\n");
      out.write("\t}\r\n");
      out.write("\t.mainmenu{\r\n");
      out.write("\t\talign-content: center;\r\n");
      out.write("\t}\r\n");
      out.write("\t.menu{\r\n");
      out.write("\t\tbackground: rgb(160, 200, 220);\r\n");
      out.write("\t\tcolor : white;\r\n");
      out.write("\t\ttext-align : center;\r\n");
      out.write("\t\tvertical-align: middle;\r\n");
      out.write("\t\twidth :150px;\r\n");
      out.write("\t\theight : 50px;\r\n");
      out.write("\t\tdisplay:table-cell;\r\n");
      out.write("\t}\r\n");
      out.write("\t.menu:hover{\r\n");
      out.write("\t\tbackground : rgb(220, 200, 130);\r\n");
      out.write("\t\tfont-wight: bold;\r\n");
      out.write("\t\tcursor:pointer;\r\n");
      out.write("\t}\r\n");
      out.write("\t#loginBtn input, #memberJoinBtn, #logoutBtn, #myPage{\r\n");
      out.write("\t\tdisplay: inline-block;\r\n");
      out.write("\t\tvertical-align: middle;\r\n");
      out.write("\t\ttext-align: center;\r\n");
      out.write("\t\tbackground: hotpink;\r\n");
      out.write("\t\tcolor: white;\r\n");
      out.write("\t\theight: 25px;\r\n");
      out.write("\t\twidth: 100px;\r\n");
      out.write("\t\tborder-radius: 5px;\r\n");
      out.write("\t}\r\n");
      out.write("\t#memberJoinBtn{\r\n");
      out.write("\t\tbackground: rgb(160, 200, 220);\r\n");
      out.write("\t}\r\n");
      out.write("\t#loginBtn input:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover, #myPage:hover{\r\n");
      out.write("\t\tcursor: pointer;\r\n");
      out.write("\t}\r\n");
      out.write("\t.loginArea > form, #userInfo{\r\n");
      out.write("\t\tfloat: right;\r\n");
      out.write("\t}\r\n");
      out.write("\t#userId, #userPwd{\r\n");
      out.write("\t\twidth: 200px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.btns, #loginBtn{\r\n");
      out.write("\t\tdisplay:inline-block\r\n");
      out.write("\t}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<a href = \"");
      out.print(request.getContextPath() );
      out.write("/index.jsp\"><h1\">난 혼자 산다</h1></a><br>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"loginArea\">\r\n");
      out.write("\t\r\n");
      out.write("\t");
 if(loginUser == null){ 
      out.write("\t<!-- 로그인 안했을 때 -->\r\n");
      out.write("\t\t<form id=loginForm \" action=\"");
      out.print(request.getContextPath());
      out.write("/login.me\"\r\n");
      out.write("\t\t\tonsubmit=\"return validate();\" method=\"post\">\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td><label>ID : </label></td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"email\" name=\"userId\" id=\"userId\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td><label>PWD : </label></td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"password\" name=\"userPwd\" id=\"userPwd\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"btns\" align=\"center\">\r\n");
      out.write("\t\t\t\t<button type = \"button\" id=\"memberJoinBtn\" onclick=\"memberJoin();\">회원가입</button>\r\n");
      out.write("\t\t\t\t<div id=\"loginBtn\"><input type=\"submit\" value=\"로그인\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t");
 } else{
      out.write("\t<!-- 로그인 했을 때 -->\r\n");
      out.write("\t\t\t<div id = \"userInfo\">\r\n");
      out.write("\t\t\t<label>로그인됨. 환영.</label>\r\n");
      out.write("\t\t\t<div class = \"btns\" align = \"right\">\r\n");
      out.write("\t\t\t\t<div id = \"myPage\" onclick = \"location.href = '/jspProject/mypage.me?userId=");
      out.print( loginUser.getUserId() );
      out.write("'\">정보수정</div>\r\n");
      out.write("\t\t\t\t<div id = \"logoutBtn\" onclick = \"logout();\">로그아웃</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<div class = \"mainmenu\">\r\n");
      out.write("\t\t<div class = \"bar\">\r\n");
      out.write("\t\t\t<div class = \"menu\" onclick =\"goNotich()\">공지사항</div>\r\n");
      out.write("\t\t\t<div class = \"menu\" onclick =\"goProduct()\">상품카테고리</div>\r\n");
      out.write("\t\t\t<div class = \"menu\" onclick =\"goBoard();\">자유게시판</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\tfunction validate(){\r\n");
      out.write("\t\t\tif($(\"#userId\").val().trim().length == 0){\r\n");
      out.write("\t\t\t\talert(\"아이디를 입력하세요\");\r\n");
      out.write("\t\t\t\t$(\"#userId\").focus();\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\treturn false;\t// return값이 false면 submit이 되지 않는다\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif($(\"#userPwd\").val().trim().length == 0){\r\n");
      out.write("\t\t\t\talert(\"비밀번호를 입력하세요\");\r\n");
      out.write("\t\t\t\t$(\"#userPwd\").focus();\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\treturn true;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t// logout() 함수 작성하기\r\n");
      out.write("\t\tfunction logout(){\r\n");
      out.write("\t\t\tlocation.href = '");
      out.print( request.getContextPath() );
      out.write("/logout.me';\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t// LogoutServlet 만들러 ㄱㄱ\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction memberJoin(){\r\n");
      out.write("\t\t\tlocation.href = '");
      out.print( request.getContextPath() );
      out.write("/views/member/memberJoinForm.jsp';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("\t\r\n");
      out.write("\t<Script>\r\n");
      out.write("\t\tfunction goNotich(){\r\n");
      out.write("\t\t\tlocation.href = \"");
      out.print(request.getContextPath());
      out.write("/list.no\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction goNotich(){\r\n");
      out.write("\t\t\tlocation.href = \"");
      out.print(request.getContextPath());
      out.write("/list.pro\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction goNotich(){\r\n");
      out.write("\t\t\tlocation.href = \"");
      out.print(request.getContextPath());
      out.write("/list.bo\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</Script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<div class = \"outer\">\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t<h2 align = \"center\">회원가입</h2>\r\n");
      out.write("\r\n");
      out.write("\t\t<form id=\"joinForm\" action=\"");
      out.print(request.getContextPath());
      out.write("/insert.me\" method=\"post\" onsubmit = \"toEnabled()\">\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>* 아이디(이메일)</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input id=\"userId1\" name=\"userId1\" type=\"text\" required autofocus> @ \r\n");
      out.write("\t\t\t\t\t\t<input id=\"userId2\" name=\"userId2\" type=\"text\" disabled>\r\n");
      out.write("\t\t\t\t\t\t<select id = \"email\" name = \"email\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value = \"naver.com\">naver.com</option>\r\n");
      out.write("                            <option value = \"hanmail.net\">hanmail.net</option>\r\n");
      out.write("                            <option value = \"gmail.com\">gmail.com</option>\r\n");
      out.write("                            <option value = \"nate.com\">nate.com</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value = \"1\">직접입력</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>* 비밀번호</td>\r\n");
      out.write("\t\t\t\t\t<td><input id=\"userPwd\" name=\"userPwd\" type=\"password\" required></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>* 비밀번호 확인</td>\r\n");
      out.write("\t\t\t\t\t<td><input id=\"checkPwd\" name=\"checkPwd\" type=\"password\" required></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>* 별명</td>\r\n");
      out.write("\t\t\t\t\t<td><input id=\"nickname\" name=\"nickname\" type=\"text\" required></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>* 평수</td><br>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input id=\"space1\" name=\"space\" type=\"radio\" value = \"1\" checked>\r\n");
      out.write("\t\t\t\t\t<label for=\"space1\">1평</label>&nbsp;\r\n");
      out.write("\t\t\t\t\t<input id=\"space3\" name=\"space\" type=\"radio\" value = \"3\">\r\n");
      out.write("\t\t\t\t\t<label for=\"space3\">3평</label>&nbsp;\r\n");
      out.write("\t\t\t\t\t<input id=\"space5\" name=\"space\" type=\"radio\" value = \"5\">\r\n");
      out.write("\t\t\t\t\t<label for=\"space5\">5평</label>&nbsp;\r\n");
      out.write("\t\t\t\t\t<input id=\"space7\" name=\"space\" type=\"radio\" value = \"7\">\r\n");
      out.write("\t\t\t\t\t<label for=\"space7\">7평</label>&nbsp;\r\n");
      out.write("\t\t\t\t\t<input id=\"space9\" name=\"space\" type=\"radio\" value = \"9\">\r\n");
      out.write("\t\t\t\t\t<label for=\"space9\">9평</label>&nbsp;\r\n");
      out.write("\t\t\t\t\t<input id=\"space10\" name=\"space\" type=\"radio\" value = \"10\">\r\n");
      out.write("\t\t\t\t\t<label for=\"space10\">10평</label>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"btns\" align=\"center\">\r\n");
      out.write("\t\t\t\t<input type=\"button\" id=\"goMain\" onclick=\"goMain();\" value = \"메인으로\">\r\n");
      out.write("\t\t\t\t<input type=\"submit\" id=\"joinBtn\" value=\"가입하기\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\t// 메인으로\r\n");
      out.write("\t\tfunction goMain(){\r\n");
      out.write("\t\t\tlocation.href = \"");
      out.print( request.getContextPath() );
      out.write("/index.jsp\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t// 처음 시작할 때 naver.com으로\r\n");
      out.write("\t\t$(function(){\r\n");
      out.write("\t\t\t$(\"#userId2\").val($(\"#email option\").eq(0).val());\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t// 메일 바뀌게 하는 함수\r\n");
      out.write("\t\t$('#email').change(function(){\r\n");
      out.write("\t\t \t$(\"#email option:selected\").each(function () {\r\n");
      out.write("\t\t\t\tif($(this).parent().val()== \"1\"){ // 직접입력일 경우\r\n");
      out.write("\t\t\t\t\t$(\"#userId2\").val(\"\"); // 값 초기화\r\n");
      out.write("\t\t\t\t\t$(\"#userId2\").attr(\"disabled\",false); // 활성화\r\n");
      out.write("\t\t\t\t}else{ // 직접입력이 아닐경우\r\n");
      out.write("\t\t\t\t\t$(\"#userId2\").val($(this).parent().val()); // 선택값 입력\r\n");
      out.write("\t\t\t\t\t$(\"#userId2\").attr(\"disabled\",true); // 비활성화\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}); \r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t// 메일주소 제대로 넘어가게\r\n");
      out.write("\t\tfunction toEnabled() {\r\n");
      out.write("\t\t\t$(\"#userId2\").attr(\"disabled\",false);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t// 비밀번호 유효성 검사\r\n");
      out.write("\t\t$(\"#userPwd\").change(function(){\r\n");
      out.write("\t\t    checkPassword($('#userPwd').val(),$('#userId1').val());\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t</script>\r\n");
      out.write("\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}