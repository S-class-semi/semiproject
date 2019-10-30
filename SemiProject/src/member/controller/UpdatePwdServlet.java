package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet(urlPatterns = "/updatepwd.me", name = "UpdatePwdServlet")
public class UpdatePwdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      Member loginUser = (Member)session.getAttribute("loginUser");
      
      String userId = loginUser.getUserId();
      String userPwd = request.getParameter("userPwd");
      
      int result = new MemberService().findPwd(new Member(userId, userPwd));
      
      String page="";
      if(result > 0) {
         page="/views/common/successPage.jsp";
         request.setAttribute("msg", "비밀번호 수정 성공!");
      }else {
         page="/views/common/errorPage.jsp";
         request.setAttribute("msg", "비밀번호 수정 실패!");
      }
      RequestDispatcher view = request.getRequestDispatcher(page);
      view.forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}