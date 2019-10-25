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
		String p_info =request.getParameter("p_info");
		System.out.println(p_info);
		
		String p_infomaction[] = p_info.split("/");
		String p_code = p_infomaction[0];
		String c_name = p_infomaction[1];
		
		//상품 정보 값
		ProductInfo prodcutinfo = new ProductService().selectProduct(p_code);
		
		//img 값 확인하기
		ArrayList<ProductImgFile> imgList = new ProductService().selectImgList(p_code,c_name);
		
		  System.out.println(prodcutinfo);
		  System.out.println(imgList);
		  if(prodcutinfo != null && imgList != null ) { 
	      request.setAttribute("prodcutinfo", prodcutinfo);
	      request.setAttribute("imgList", imgList);
		  request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);
		  }else {
			  System.out.println("실패");
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
