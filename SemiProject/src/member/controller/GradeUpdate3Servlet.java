package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class GradeUpdate3Servlet
 */
@WebServlet("/GradeUpdate.me")
public class GradeUpdate3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeUpdate3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("update부분");
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		int user_G = Integer.parseInt(request.getParameter("userGrade"));
		String nickname = request.getParameter("userName");
		int point = Integer.parseInt(request.getParameter("point"));
		String gender = request.getParameter("gender");
		
		Member m = new Member(userId,user_G,nickname,point,gender);
		System.out.println(m);
		
		
		int result = new MemberService().updateGrade(new Member(userId,user_G,nickname,point,gender));
		System.out.println("ID : " + result);
		String page = "";
		
		if(result >0) {
			page = "views/common/successPage.jsp";
			request.setAttribute("msg", "회원등급 수정 성공");
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "회원등급 수정 실패");
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
