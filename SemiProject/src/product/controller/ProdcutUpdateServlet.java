package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

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
 * Servlet implementation class ProdcutUpdateServlet
 */
@WebServlet("/update.pro")
public class ProdcutUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdcutUpdateServlet() {
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
			
			//2_2. DB에 저장하기 위해ㅔ change_name 과 origin_name 각각의 리슽들을 만들어 주는 작업
			
			// 다중 파일을 묶어서 업로드(다중파일업로드) 하기 떄문에 컬렉션을 사용
			// 저장한 파일의 이름을 저장할 ArrayList를 생성하자
			ArrayList<String> saveFiles = new ArrayList<String>();
			System.out.println("update부분 saveFiles : "+saveFiles);
			//원본  파일의 이름을 저장할 ArrayList를 생성하자
			ArrayList<String> originFiles = new ArrayList<String>();
			System.out.println("update부분 originFiles :" + originFiles);
			
			
			// getFileNames() - 폼에서 전송된 파일 리스들의 name을 반환한다.
			Enumeration<String> files = multiRequest.getFileNames();
			System.out.println("update부분 files:" + files);
			while(files.hasMoreElements()) {
				//전송 순서 역순으로 파일을 가져온다.
				String name = files.nextElement();
				System.out.println("update부분 name :" + multiRequest.getOriginalFileName(name));
				if(multiRequest.getFilesystemName(name) != null) {
					 // getFilesystemName() - MyRenamePolicy의 rename 메소드에서 작성한대로 rename된 파일명
					saveFiles.add(multiRequest.getFilesystemName(name));
					// getOriginalFileName() - 실제 사용자가 업로드 할 때의 파일 명
					originFiles.add(multiRequest.getOriginalFileName(name));
					
				}
			}
			System.out.println("update부분 :" + originFiles);
			
			//수정 받아올 데이터 값
			HttpSession user = request.getSession();
			Company cominfo = (Company)user.getAttribute("companyinfo");
			
			String c_name = cominfo.getC_name();
			String p_code = multiRequest.getParameter("p_code");
			String pro_code = multiRequest.getParameter("pro_code");
			String p_name = multiRequest.getParameter("p_name");
			String p_price = multiRequest.getParameter("p_price");
			String pro_info = multiRequest.getParameter("p_info");
			
			//int size = Integer.valueOf(multiRequest.getParameter("size"));
			
			//System.out.println(size);
			
			
			ProductInfo p_info = new ProductInfo(p_code,pro_code,p_name,p_price,pro_info,c_name);
			
			ArrayList<ProductImgFile> imgList = new ArrayList<ProductImgFile>();
			System.out.println("update부분 imgList 값:" + imgList);
			System.out.println("update부분 originFiles.size() : "+originFiles.size());
				for(int i=originFiles.size()-1;i>=0;i--) {
					ProductImgFile at = new ProductImgFile();
					at.setFile_path(savePath);
					at.setOrigin_name(originFiles.get(i));
					at.setChange_name(saveFiles.get(i));
					
				//타이틀 이미지가 originFiles에서의 마지막 인덱스이기 때문에 다음과 같이 조건을 준 다음에 level을 0으로 지정
					if( i== originFiles.size()-1) {
						at.setFile_level(0);
					}else {
						at.setFile_level(1);
					}
					imgList.add(at);
				}
			


			System.out.println(p_info);
			System.out.println(imgList);
			
			
			System.out.println("뭐야 씨발");
			int result = new ProductService().updateProduct(p_info);
			System.out.println(result);
			
			int result1 = new ProductService().deleteImgFile(p_code,c_name);
			
			System.out.println(result1);
			
			if(result>0 && result1 >0) {
				int result2 = new ProductService().insertProduct(c_name,p_code, imgList);
				System.out.println("파일삽입 :" +result2);
				if(result2>0) {
					response.sendRedirect("list.pro?currentPage=1");
				}else {
					for(int i=0;i<saveFiles.size();i++) {
						File failedFile = new File(savePath + saveFiles.get(i));
						failedFile.delete();
					}
				}
			
			}else {
				
				request.setAttribute("msg", "실패 했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			
			
		/*	
			if((result>0 && result1>0 && result2>0)||(result>0)) {
				response.sendRedirect("list.pro?currentPage=1");
			}else {
				//실페시 저장된 사진 삭제
				for(int i=0;i<saveFiles.size();i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				request.setAttribute("msg", "실패 했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			*/
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}