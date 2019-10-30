package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.PageInfo;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class GradeUpdateServlet
 */
@WebServlet("/grade.me")
public class GradeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService mService = new MemberService();
		
		int listCount = mService.getListCount();
		
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
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1;
		
		endPage = startPage + limit -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		
		ArrayList<Member> list = mService.selectList(currentPage,limit);
		
		RequestDispatcher view = null;
		System.out.println(list);
		if(list !=null) {
			view = request.getRequestDispatcher("views/member/memberGradeListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			view = request.getRequestDispatcher("/views/admin/errorPage.jsp");
			request.setAttribute("msg", "회원 등급 조회 실패");
		}
		
		view.forward(request, response);
		
		// memberGradeListView.jsp만들러 ㄱㄱ
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
