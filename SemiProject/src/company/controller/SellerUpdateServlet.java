package company.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import company.model.service.CompanyService;
import company.model.vo.Company;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class SellerUpdateServlet
 */
@WebServlet("/updatesellerview.se")
public class SellerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userid");
		
		System.out.println(userId);
		
		
		Company c = new Company(userId);
		
		
		
		int update = new CompanyService().updateGrade1(new Company(userId));
		int result = new CompanyService().updateGrade(new Company(userId));
		
		System.out.println("컴패니 : " + result);
		System.out.println("업데이트 : " + update);
		String page = "";
		
		if(result >0 && update > 0) {
			page = "/seller.co";
			
		}else {
			page="views/admin/adminMenuView.jsp";
			
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
