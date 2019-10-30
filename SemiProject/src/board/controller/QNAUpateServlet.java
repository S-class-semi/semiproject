package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.QNA;

/**
 * Servlet implementation class QNAUpateServlet
 */
@WebServlet("/update.qna")
public class QNAUpateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAUpateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		QNA b = new QNA();
		b.setbId(bid);
		
		int result = new BoardService().updateQNA(b);
		System.out.println("번호 : " + bid);
		System.out.println("수정하려 한 글 : " + b);
		
		
		
		
		RequestDispatcher view =null;
		if(result>0) {
			
			view = request.getRequestDispatcher("/qna.do");
			request.setAttribute("board", new BoardService().selectQna(bid));
		}else {
			view = request.getRequestDispatcher("views/admin/errorPage.jsp");
			request.setAttribute("msg", "처리 완료 실패");
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
