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
 * Servlet implementation class CompanyInfoServlet
 */
@WebServlet("/info.com")
public class CompanyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String c_name = "프로젝트";
		System.out.println(c_name);
		Company compayinfo = new CompanyService().companyInfo(c_name);
		RequestDispatcher view = null;
		
		if(compayinfo != null) {
			view = request.getRequestDispatcher("views/company/companyinfoView.jsp");
			request.setAttribute("compayinfo", compayinfo);
		}else {
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
