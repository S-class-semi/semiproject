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
 * Servlet implementation class ProductStoredetailServlet
 */
@WebServlet("/storedetail.pro")
public class ProductStoredetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductStoredetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String codeinfo = request.getParameter("codeinfo");
		String codesub[] = codeinfo.split("/");
		String c_name = codesub[0];
		String p_code = codesub[1];
		String p_name = codesub[2];
		
		
		ProductInfo prodcutinfo = new ProductService().selectProduct(p_code);
		
		//img 값 확인하기
		ArrayList<ProductImgFile> imgList = new ProductService().selectImgList(p_code,c_name);
		
		  System.out.println(prodcutinfo);
		  System.out.println(imgList);
		  if(prodcutinfo != null && imgList != null ) { 
	      request.setAttribute("prodcutinfo", prodcutinfo);
	      request.setAttribute("imgList", imgList);
		  request.getRequestDispatcher("views/product/storeDetailView.jsp").forward(request, response);
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
