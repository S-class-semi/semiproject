package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.QNA;

public class BoardService {

	
	
	
	public int getQNAListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getQNAListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<QNA> selectQNAList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<QNA> list = new BoardDao().selectQNAList(conn,currentPage,limit);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}
	

	public QNA selectQna(int bid) {
		Connection conn = getConnection();
		
		
		
		QNA qna = new BoardDao().selectQna(conn,bid);
		
		
		close(conn);
		
		
		return qna;
	}

	public int updateQNA(QNA b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateQNA(conn, b);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

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
