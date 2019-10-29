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
 * Servlet implementation class ProductStoreBView
 */
@WebServlet("/storeB.pro")
public class ProductStoreBView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductStoreBView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ProductInfo> all_pro = new ProductService().selectProListB();
		System.out.println(all_pro);
		ArrayList<ProductImgFile> imgList = new ProductService().selectImgListB();
		System.out.println(imgList);
		
		
		RequestDispatcher view = null;
		
		if(all_pro != null) {
			view = request.getRequestDispatcher("views/product/storeBView.jsp");
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
