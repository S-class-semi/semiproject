package payment.controller;

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
 * Servlet implementation class paymentlistServlet
 */
@WebServlet("/list.pay")
public class paymentlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String proinfo = request.getParameter("payinfoview");
		String proinfosub[] = proinfo.split("/");
		String p_code = proinfosub[0];
		String c_name = proinfosub[1];
		String count = proinfosub[2];
		
		
		ProductInfo productinfo = new ProductService().selectProduct(p_code);
		
		ArrayList<ProductImgFile> imgList = new ProductService().selectImgList(p_code, c_name);
		
		System.out.println(productinfo);
		System.out.println(imgList);
		
		if(productinfo != null && imgList != null ) { 
		      request.setAttribute("productinfo", productinfo);
		      request.setAttribute("imgList", imgList);
		      request.setAttribute("c_count", count);
			  request.getRequestDispatcher("views/payment/PaymentView.jsp").forward(request, response);
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
