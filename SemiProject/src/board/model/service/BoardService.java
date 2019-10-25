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

	public ArrayList<Board> selectQNAList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectQNAList(conn,currentPage,limit);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}
	

	public Board selectQna(int bid) {
		Connection conn = getConnection();
		
		
		
		Board board = new BoardDao().selectQna(conn,bid);
		
		
		close(conn);
		
		
		return board;
	}

	public int updateQNA(Board b) {
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

	/*
	 * public Board updateQNA(int bid) { Connection conn = getConnection();
	 * 
	 * Board b = new Board(); BoardDao bDao = new BoardDao(); int result =
	 * bDao.updateQNA(conn,bid);
	 * 
	 * if(result>0) { commit(conn); b=bDao.selectQna(conn, bid); }else {
	 * rollback(conn); } close(conn); return b; }
	 */
	
	

}
