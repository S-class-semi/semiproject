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

	

	

	

	
	
	public Board selectBoard(int bid) {
		Connection conn = getConnection();
		
		
		Board b = new Board();
		BoardDao bDao = new BoardDao();
		int result = bDao.updateCount(conn,bid);
		
		if(result>0) {
			commit(conn);
			b=bDao.selectBoard(conn,bid);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}

	public ArrayList<Board> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn); 
		
		close(conn);

		return list;
	
	}
	
	
	
	
	
}
