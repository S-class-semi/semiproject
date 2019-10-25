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
 * Servlet implementation class ThumbnailDetailServlet
 */
@WebServlet("/detail.th")
public class ThumbnailDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int bid = Integer.valueOf(request.getParameter("bid"));
			
			// BoardService의 2개의 메소드를 호출할꺼다. 그러므로 참조변수로 만들자
			BoardService bService = new BoardService();
			
			// 1. 해당 게시판 정보 조회!
			Board board = bService.selectBoard(bid);
			System.out.println(board);
			
			// 2. 해당 게시판의 사진들 리스트 조회!
			ArrayList<Attachment> fileList = bService.selectThumbnail(bid);
			
			if(fileList!= null) {
				request.setAttribute("board", board);
				request.setAttribute("fileList", fileList);
				request.getRequestDispatcher("views/thumbnail/thumbnailDetailView.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "사진게시판 상세보기 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			// thumbnailDetailView.jsp 만들러 ㄱㄱ씽
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
