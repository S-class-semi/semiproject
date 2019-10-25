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
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession user = request.getSession();
		Member userlogin = (Member)user.getAttribute("loginUser");
		
		String userId = userlogin.getUserId();
		String nn = request.getParameter("nn");
		String sex = request.getParameter("sex");
		int space = Integer.valueOf(request.getParameter("space"));
		String userintro = request.getParameter("usrintro");
		
		Member name = new Member(userId, nn, space, userintro, sex);
		
		
		
		int result = new MemberService().updateMember(name);
		
		String page="";
		if(result > 0) {
			page="/views/common/successPage.jsp";
			request.setAttribute("msg", "회원 수정 성공!");
		}else {	//실패했을때
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 수정 실패!");
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
