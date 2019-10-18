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
import product.model.vo.ProductInfo;
import product.model.vo.ProductPage;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/list.pro")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService pService = new ProductService();
		//두개의 서비스를 호출 
		
		int pListCount = pService.getListCount();
		//상품의 갯수를 가져와야 되니 만들어준다.
		System.out.println(pListCount);
		//가지고 와졌는지 확인
		
		//------------페이징 처리 추가-------------------
				// 페이지 수 처리용 변수 선언
				int currentPage;	 // 현재 페이지를 표시할 변수
				int limit;			//한 페이지에 게시글이 몇개가 보여질지와 한 페이지에서 처리 가능한 페이지 수
				int maxPage;		//전체 페이지에서 가장 마지막 페이지 
				int startPage;		//한번에 표시될 페이지가 시작할 페이지
				int endPage;		// 한번에 표시될 페이지가 끝나는 페이지
				
				// ex) 총 123개의 게시글이 있다면 
				//<< 1 2 3 4 5 6 7 8 9 10>> 이후에도 페이지가 더 있어야함.
				// <<11 12 13 >> <-- 여기서 11이 startPage, 13이 end Page, 13이 maxPasge
				currentPage = 1;		// 1페이지를 default로 가져가자
				// 하지만, 페이지 전환시 전달받은 현재 페이지가 있을시 해당 페이지를 currentPage로 적용
				
				if(request.getParameter("currentPage") != null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				// * limit - 한페이지에 보여질 목록 갯구
				limit= 10;
				
				 // * maxPage - 총 페이지 수
				// 목록 수가 123개이면 13페이지가 마지막 페이지다.
				// 짜투리 목록이 최소 1개 일때, 한 page로써 의미를 갖게 해기위해서 0.9를 더해주자
				maxPage=(int)((double)pListCount/limit + 0.9);
				
				// * startPage -  현재 페이지에 보여질 시작 페이지 수
				// 아래쪽에 페이지 수가 10개씩 보여지게 할 경우
				// 1, 11, 21, 31, ...
				startPage = (((int)((double)currentPage/limit+0.9))-1)*limit + 1;
				
				//* endPage - 현재 페이지에서 보여질 마지막 페이지 수
				// 아래쪽에 페이지 수가 10개씩 보여지게 할 경우
				// 10, 20, 30, 40, ...
				endPage = startPage + limit -1;
				
				
				//하지만 !!! 마지막 페이지 수가 총 페이지 수보다 클 경우
				// max Page가 13이고 endpage가 20페이지일 경우
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				//위에서 계산된 모든 페이지 관련 변수들을 request에 담아서 보내야 될텐데 너무 많다.
				// 그래서 페이지 정보를 공유할 vo 객체 PageInfo를 만들러 가자!(page정보만 지닌 객체를 만들어서 넘기기 위해)
				ProductPage pi = new ProductPage(currentPage,pListCount,limit,maxPage,startPage,endPage);
				
				//상품 리스트 조회해오기
				
				ArrayList<ProductInfo> pList = pService.selectProList(currentPage,limit);
				System.out.println(pList);
				
				
				RequestDispatcher view = null;
				
				if(pList != null) {
					view = request.getRequestDispatcher("views/product/prodcutListView.jsp");
					request.setAttribute("pList", pList);
					request.setAttribute("pi", pi);
				}else {
					request.setAttribute("msg", "실패");
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
