package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import company.model.service.CompanyService;
import company.model.vo.Company;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member member = new Member(userId, userPwd);
		
		Member loginUser = new MemberService().loginMember(member);
		
		int userG = loginUser.getUserG();
		RequestDispatcher view= null;
		HttpSession session =null;
		
		if(loginUser != null && (userG==2)){
			Company companyinfo  = new CompanyService().companyInfo(userId);
			session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("companyinfo",companyinfo);
			view = request.getRequestDispatcher("views/company/companyMenubar.jsp");
			view.forward(request, response);
			
		}else if(loginUser != null) {
			session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("userG", userG);
			response.sendRedirect("index.jsp");
		} 
		else{
			request.setAttribute("msg", "로그인 실패");
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
