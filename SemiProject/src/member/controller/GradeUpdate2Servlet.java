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
 * Servlet implementation class GradeUpdate2Servlet
 */
@WebServlet("/updateGrade.me")
public class GradeUpdate2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeUpdate2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String user_Id = request.getParameter("user_Id");
		
		Member member = new MemberService().selectMemberGrade(user_Id);
		
		System.out.println(member);
		System.out.println(user_Id);
		
		RequestDispatcher view = null;
		if(member != null) {
			view = request.getRequestDispatcher("views/member/UpdateGradePage.jsp");
			request.setAttribute("member", member);
		}else {
			view=request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "회원 조회에 실패했습니다.");
		}
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
