package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NocticeDetailServlet
 */
@WebServlet("/detail.no")
public class NocticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NocticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String info = request.getParameter("info");
		String sub[] = info.split("/");
		int nno =Integer.valueOf(sub[1]);
		String c_name = sub[0];
		
		System.out.println(nno);
		System.out.println(c_name);
		
		Notice notice=new NoticeService().selectNotice(nno,c_name);
		System.out.println(notice);
		
		RequestDispatcher view = null;
		if(notice!=null) {
			view = request.getRequestDispatcher("views/notice/noticeDetailView.jsp");
			request.setAttribute("notice", notice);
		}else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "공지사항 조회에 실패했습니다.");
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
