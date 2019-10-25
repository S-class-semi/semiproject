package BoardInsert.model.service;

import static common.JDBCTemplate.close;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BoardInsert.model.dao.ClaimBoardDao;
import BoardInsert.model.vo.ClaimBoard;

@WebServlet("/insert.bo")
public class ClaimBoardService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClaimBoardService() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	public int insertBoard(ClaimBoard b) {
		Connection conn = getConnection();
		
		int result = new ClaimBoardDao().insertBoard(conn, b);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	private Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}

}
