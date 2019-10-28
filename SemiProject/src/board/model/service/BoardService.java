package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;

public class BoardService {

	

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}
	
	
	
	
	
	
	
}
