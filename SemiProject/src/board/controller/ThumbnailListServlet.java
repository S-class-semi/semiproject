package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;

/**
 * Servlet implementation class ThumbnailListServlet
 */
@WebServlet("/list.th")
public class ThumbnailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 관련 즉 사진게시판을 위해 Attachment라는 테이블을 활용할 것이다.
		// 따라서 Attachment vo클래스 만들러 ㄱㄱ
		
		// vo클래스 만들었으면, BoardService로 두개의 서비스를 요청할 것이다.
		// 사진게시판은 일반게시판과 달리 페이징 처리를 안할 거지만 하고 싶으면 board관련 코드 참고해서 완성해보자
		
		BoardService bService = new BoardService();
		
		//1. 우선 사진 게시판 리스트 정보를 불러오자
		ArrayList blist = bService.selectList(1);
		
		//2. 사진 리스트도 불러오자
		ArrayList flist = bService.selectList(2);
		
		if(blist != null && flist != null) {
			request.setAttribute("blist", blist);
			request.setAttribute("flist", flist);
			request.getRequestDispatcher("views/board/thumbnailListView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg","사진 게시판 조회 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		// thumbnail 폴더 만들고 그 안에 thumbnailListView.jsp 만들러 ㄱㄱ씽
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
