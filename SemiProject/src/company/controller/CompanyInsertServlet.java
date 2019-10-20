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
import member.model.vo.Member;

/**
 * Servlet implementation class CompanyInsertServlet
 */
@WebServlet("/insert.com")
public class CompanyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//userid 가지고 오기
		HttpSession user = request.getSession();
		Member userlogin = (Member)user.getAttribute("loginUser");
		
		String userid = userlogin.getUserId();
		int user_t = userlogin.getUserG(); //나중에 G와 T변경
		String c_number = request.getParameter("c_number");
		String c_name = request.getParameter("c_name");
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String jibunAddress = request.getParameter("jibunAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		String Address = postcode + "/" + roadAddress + "/" + jibunAddress + "/" + detailAddress;
		
		String c_phone = request.getParameter("c_phone");
		String c_manager = request.getParameter("c_manager");
		String c_contact = request.getParameter("c_contact");
		String c_email = request.getParameter("c_email");
		String c_flog = "N";
		
			
		/*
		 * System.out.println(Address);
		 */
		Company companyAdmission = new Company(userid,user_t,c_number,c_name,Address,c_phone,c_manager,c_contact,c_email,c_flog);
		
		System.out.println(companyAdmission);
		
		int companyResult = new CompanyService().admission(companyAdmission);
		
		
		System.out.println(companyResult);
		
		
		
		if (companyResult > 0) {
			request.getRequestDispatcher("views/common/successPage.jsp").forward(request, response);
			request.setAttribute("msg", "성공했습니다.");
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			request.setAttribute("msg", "실패 했습니다.");
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
