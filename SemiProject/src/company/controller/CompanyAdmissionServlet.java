package company.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;

/**
 * Servlet implementation class CompanyInsertServlet
 */
@WebServlet("/admssion.com")
public class CompanyAdmissionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyAdmissionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//유저 아이디 가져오는 세션 방법
		HttpSession user = request.getSession();
		Member userlogin = (Member)user.getAttribute("loginUser");
		String userid = userlogin.getUserId();
		//
		RequestDispatcher view = null;

		if (userid != null) {
			view = request.getRequestDispatcher("views/company/companyJoinForm.jsp");
			request.setAttribute("userid", userid);
		} else {
			view = request.getRequestDispatcher("views/company/companyMenubar.jsp");
			request.setAttribute("msg", "일시적 오류입니다. 다시 시도바랍니다.");
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
