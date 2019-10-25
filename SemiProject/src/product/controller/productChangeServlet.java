package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import company.model.vo.Company;
import product.model.service.ProductService;
import product.model.vo.ProductImgFile;
import product.model.vo.ProductInfo;

/**
 * Servlet implementation class productChangeServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/change.pro" })
public class productChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			if(ServletFileUpload.isMultipartContent(request)) {
				System.out.println("insert.pro로 넘어왔니?");	
			
				int maxSize = 1024 *  1024 * 100; //바이트 단위(바이트 > KB > MB)
				
				// 1_2. 웹 서버 컨테이너 경로 추출함
				String root = request.getSession().getServletContext().getRealPath("/");// 넘어오는 파일 경로(web폴더 경로)
				System.out.println("파일 경로 : " + root);
					
				// 1_3. 파일들 저장 경로(web/thrumbnail_uploadFiles/)
				String savePath = root +"images/productimg/";
				
				MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
				
				
			//수정 받아올 데이터 값
			HttpSession user = request.getSession();
			Company cominfo = (Company)user.getAttribute("companyinfo");
			
			String c_name = cominfo.getC_name();
			String p_code = multiRequest.getParameter("p_code");
			String pro_code = multiRequest.getParameter("pro_code");
			String p_name = multiRequest.getParameter("p_name");
			String p_price = multiRequest.getParameter("p_price");
			String pro_info = multiRequest.getParameter("p_info");
			
			ProductInfo productinfo = new ProductInfo(p_code, pro_code, p_name, p_price, pro_info, c_name);
			System.out.println(productinfo);
			System.out.println("값 받아오니?");
			RequestDispatcher view = request.getRequestDispatcher("views/product/productChangeView.jsp");
			request.setAttribute("productinfo", productinfo);
			view.forward(request, response);
			}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
