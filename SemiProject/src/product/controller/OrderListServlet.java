package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.PageInfo;
import product.model.service.ProductService;
import product.model.vo.Order;
import product.model.vo.ProductPage;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/order.or")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	System.out.println("넘어와랏");
		
		ProductService pService = new ProductService();
		
		int plistCount = pService.getOrderListCount();
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		maxPage = (int)((double)plistCount/limit+0.9);
		
		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1;
		
		endPage = startPage + limit -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		ProductPage pi = new ProductPage(currentPage,plistCount,limit,maxPage,startPage,endPage);
		
		ArrayList<Order> list = pService.selectList(currentPage,limit);
		
		RequestDispatcher view = null;
		System.out.println(list);
		if(list !=null) {
			view = request.getRequestDispatcher("views/product/OrderListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			view = request.getRequestDispatcher("/views/admin/errorPage.jsp");
			request.setAttribute("msg", "주문 내역 조회 실패");
		}
		
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
