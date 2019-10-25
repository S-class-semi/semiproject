package product.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;

/**
 * Servlet implementation class Productp_codeCheckServlet
 */
@WebServlet("/p_code.pro")
public class Productp_codeCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Productp_codeCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_code = request.getParameter("p_code");
		
		System.out.println(p_code);
		
		int result = new ProductService().p_codeCheck(p_code);
		
		System.out.println(result);
		
		PrintWriter out = response.getWriter();

		if (result > 0) {
			out.append("fail"); // print 대신 append 해도 된다 } else {

		}else {
			out.append("success");
		}

		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
