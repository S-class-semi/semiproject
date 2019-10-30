package company.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import company.model.service.CompanyService;
import company.model.vo.Company;
import company.model.vo.SellerPageInfo;

/**
 * Servlet implementation class SellerApprovalServlet
 */
@WebServlet("/seller.co")
public class SellerRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CompanyService cService = new CompanyService();
		
		int listCount = cService.getListCount();
		
		//-------------페이징 처리 추가----------------
				// 페이지 수 처리용 변수 선언
				int currentPage;	//현재 페이지를 표시할 변수
				int limit;			//한 페이지에 게시글이 몇개가 보여질지와 한 페이지에서 처리가능한 페이지 수
				int maxPage;		//전체 페이지에서 가장 마지막 페이지
				int startPage;		//한번에 표시될 페이지가 시작할 페이지
				int endPage;		//한번에 표시될 페이지가 끝나는 페이지
	
				currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage=(((int)((double)currentPage/limit+0.9))-1)*limit+1;
	
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		SellerPageInfo pi = new SellerPageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		
		ArrayList<Company> list = cService.selectSellerList(currentPage,limit);
		
		RequestDispatcher view = null;
		System.out.println("list : "+list);
		if(list != null) {
			view = request.getRequestDispatcher("views/admin/SellerListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			view = request.getRequestDispatcher("views/admin/adminMenuView.jsp");
		}
		view.forward(request,response);
		
		// boardListView.jsp 만들러 ㄱㄱ씽
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
