package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import company.model.vo.Company;
import product.model.service.ProductService;
import product.model.vo.ProductInfo;
import product.model.vo.ProductPage;

/**
 * Servlet implementation class ProductDeleteServler
 */
@WebServlet("/p_delete.pro")
public class ProductDeleteServler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteServler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String deletecode = request.getParameter("deletecode");
		System.out.println(deletecode);
		
		String sub[] = deletecode.split("/");
		
		String p_code = sub[0];
		String c_name = sub[1];
		int result1 = new ProductService().deleteProduct(p_code);
		
		
		if(result1 >0 ) {
			int result2 = new ProductService().deleteImgFile(p_code,c_name);
			RequestDispatcher view = request.getRequestDispatcher("views/company/companyMenubar.jsp");
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
