package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet("/delete.me")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		
		
		int result = new MemberService().deleteMember(userId);
		
		
		String page="";
				if(result > 0) {	//성공했을때
					request.getSession().invalidate();
					page= "/views/common/successPage.jsp";
					request.setAttribute("msg", "회원탈퇴성공!");
				}else {	//실패했을때
					page= "/views/common/errorPage.jsp";
					request.setAttribute("msg", "회원 탈퇴 실패!");
				}
				// 넘어갈 view와 넘겨줄 request객체를 같이 보낼려면 forwarding 처리를 해야함
				RequestDispatcher view = request.getRequestDispatcher(page);
				view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
