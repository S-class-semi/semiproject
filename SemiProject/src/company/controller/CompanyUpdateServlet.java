package company.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import company.model.service.CompanyService;
import company.model.vo.Company;

/**
 * Servlet implementation class CompanyUpdateServlet
 */
@WebServlet("/update.com")
public class CompanyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession user = request.getSession();
		Company cominfo = (Company) user.getAttribute("companyinfo");
		
		String c_name = cominfo.getC_name();
		
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String jibunAddress = request.getParameter("jibunAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		String Address = postcode + "/" + roadAddress + "/" + jibunAddress + "/" + detailAddress;
		
		String c_phone = request.getParameter("c_phone");
		String c_manager = request.getParameter("c_manager");
		String c_contact = request.getParameter("c_contact");
		String c_email = request.getParameter("c_email");
		System.out.println(c_name);
		Company company = new Company(c_name,Address,c_phone,c_manager,c_contact,c_email);
		
		int result = new CompanyService().companyUpdate(company);
		
		if (result > 0) {
			Company companyinfo  = new CompanyService().companyInfo(cominfo.getUserid());
			HttpSession session = request.getSession();
			session.setAttribute("companyinfo",companyinfo);
			request.getRequestDispatcher("views/company/companyMenubar.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
