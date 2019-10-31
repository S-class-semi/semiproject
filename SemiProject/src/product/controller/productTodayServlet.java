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

import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.ProductImgFile;
import product.model.vo.ProductInfo;

/**
 * Servlet implementation class productTodayServlet
 */
@WebServlet("/today.pro")
public class productTodayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productTodayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	String imgnum = request.getParameter("imgnum");	
	ProductImgFile file = new ProductService().selecttodayimg(imgnum);
	
	String p_code = file.getP_code();
	String c_name = file.getC_name();
	System.out.println(file);

	ProductInfo prodcutinfo = new ProductService().selectProduct(p_code);
	
	//img 값 확인하기
	ArrayList<ProductImgFile> imgList = new ProductService().selectImgList(p_code,c_name);
	
	
	HttpSession user = request.getSession();
	Member loginUser = (Member)user.getAttribute("loginUser");
	
	  System.out.println(prodcutinfo);
	  System.out.println(imgList);
	  if(prodcutinfo != null && imgList != null ) { 
      request.setAttribute("prodcutinfo", prodcutinfo);
      request.setAttribute("imgList", imgList);
      request.setAttribute("loginUser", loginUser);
	  request.getRequestDispatcher("views/product/storeDetailView.jsp").forward(request, response);
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
