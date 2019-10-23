package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.ProductImgFile;
import product.model.vo.ProductInfo;

/**
 * Servlet implementation class ProdudctDetailServlet
 */
@WebServlet("/detail.pro")
public class ProdudctDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdudctDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String c_code =request.getParameter("c_code");
		System.out.println(c_code);
		
		//상품 정보 값
		ProductInfo prodcutinfo = new ProductService().selectProduct(c_code);
		
		ArrayList<ProductImgFile> imgList = new ProductService().selectImgList(c_code);
		
		  System.out.println(prodcutinfo);
		  System.out.println(imgList);
		  if(prodcutinfo != null) { 
	      request.setAttribute("prodcutinfo", prodcutinfo);
	      request.setAttribute("imgList", imgList);
		  request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);
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
