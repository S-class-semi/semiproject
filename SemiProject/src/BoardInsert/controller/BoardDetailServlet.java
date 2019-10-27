package BoardInsert.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/insert.bo")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession(); // request객체가 session 객체를 만드는 메소드를 지니고 있다.
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// BOARD 테이블에 BWRITER 컬럼에 추가할 회원 번호를 알아내기 위해 다음과 같이 작업하자
		// int 값이지만 Board라는 vo클래스의 bWirter 필드에 담기 위해 다음과 같이 함
		String writer = String.valueOf(loginUser.getUserNo());	// int >> String형으로
		
		ClaimBoard b = new ClaimBoard();
		b.setcId(category);
		b.setbTitle(title);
		b.setbContent(content);
		b.setbWriter(writer);
		
		int result = new ClaimBoardService().insertBoard(b);
		
		if(result>0) {
			response.sendRedirect("/list.bo?currentPage=1");
		}else {
			request.setAttribute("msg","게시판 작성 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		// 게시글이 잘 저장되고 첫페이지를 뿌려주면 boardListView.jsp가서 detail 관련 코드(상세보기)하러 가기!!!
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}