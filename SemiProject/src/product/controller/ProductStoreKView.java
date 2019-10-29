package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.ProductImgFile;
import product.model.vo.ProductInfo;

/**
 * Servlet implementation class ProductStoreKView
 */
@WebServlet("/storeK.pro")
public class ProductStoreKView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductStoreKView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ArrayList<ProductInfo> all_pro = new ProductService().selectProListK();
		System.out.println(all_pro);
		ArrayList<ProductImgFile> imgList = new ProductService().selectImgListK();
		System.out.println(imgList);
		
		
		RequestDispatcher view = null;
		
		if(all_pro != null) {
			view = request.getRequestDispatcher("views/product/storeKView.jsp");
			request.setAttribute("all_pro", all_pro);
			request.setAttribute("imgList", imgList);
			view.forward(request, response);
		}else {
			request.setAttribute("msg", "실패");
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
