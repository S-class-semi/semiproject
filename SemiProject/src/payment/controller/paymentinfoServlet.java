package payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import payment.model.vo.Payment;

/**
 * Servlet implementation class paymentinfoServlet
 */
@WebServlet("/infopay.pay")
public class paymentinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		HttpSession user = request.getSession();
		Member loginUser = (Member)user.getAttribute("loginUser");
		
		String userid = loginUser.getUserId();
		String o_name = request.getParameter("o_name");
		String o_phone = request.getParameter("o_phone");
		String p_name = request.getParameter("p_namevalue");
		String p_code = request.getParameter("p_codevalue");
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String jibunAddress = request.getParameter("jibunAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		String Address = postcode +"/" +roadAddress + "/" + jibunAddress+ "/" + detailAddress;
		String selbox = request.getParameter("selbox");
		String pPlz = selbox;
		if(selbox.equals("direct")) {
			pPlz = request.getParameter("selboxDirect");
		}
		String email = request.getParameter("o_email");
		String payselect = request.getParameter("paychoose");
		String totalprice = request.getParameter("totalprice");
		
		Payment paymentinfo = new Payment(userid,o_name,o_phone,p_name,p_code,Address,pPlz,email,payselect,totalprice);
		System.out.println(paymentinfo);
		request.setAttribute("paymentinfo", paymentinfo);
		request.getRequestDispatcher("views/payment/PaymentTest.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
