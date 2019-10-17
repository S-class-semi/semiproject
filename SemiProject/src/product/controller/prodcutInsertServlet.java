package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import company.model.vo.Company;
import product.model.service.ProductService;
import product.model.vo.ProductInfo;

/**
 * Servlet implementation class prodcutInsertServlet
 */
@WebServlet("/insert.pro")
public class prodcutInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public prodcutInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String code = request.getParameter("code");
		String codenumber = request.getParameter("codenumber");
		String codename = request.getParameter("codename");
		String codeprice = request.getParameter("codeprice");
		String proinfo = request.getParameter("proinfo");
	
		HttpSession session = request.getSession();
		//request객체가 session객체를 만드는 메소드를 지니고 있다.
		
		/*
		 * Company compayinfo = (Company)session.getAttribute("compayinfo");
		 * 
		 * String companyname = compayinfo.getC_name();
		 */	
		
		String companyname = "프로젝트";
		
		ProductInfo p_info = new ProductInfo(code,codenumber,codename,codeprice,proinfo,companyname);
		
		System.out.println(p_info);
		int result = new ProductService().insertProduct(p_info);
		
		System.out.println(result);
		
		if(result>0) {
			response.sendRedirect("list.pro?currentPage=1");
		}else {
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
