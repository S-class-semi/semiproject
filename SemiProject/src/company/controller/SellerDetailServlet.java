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

/**
 * Servlet implementation class UpdateSellerServlet
 */
@WebServlet("/sellerupdate.se")
public class SellerDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//System.out.println("어서 넘어오라구~~~");
		request.setCharacterEncoding("utf-8");
		String user_Id = request.getParameter("userId");
		
		Company company = new CompanyService().sellerdetail(user_Id);
		
		System.out.println(company);
		System.out.println(user_Id);
		
		RequestDispatcher view = null;
		if(company != null) {
			view = request.getRequestDispatcher("views/admin/SellerDetailView.jsp");
			request.setAttribute("company", company);
		}else {
			view=request.getRequestDispatcher("views/admin/errorPage.jsp");
			request.setAttribute("msg", "판매자 정보 조회 실패.");
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
