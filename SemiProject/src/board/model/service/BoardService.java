package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Attachment;
import board.model.vo.Board;

public class BoardService {

	
	
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	public ArrayList selectList(int flag) {
		Connection conn = getConnection();
		ArrayList list = null;
		
		
		// BoardDao 메소드 두개를 호출할꺼라 참조변수로 선언하자.
		BoardDao bDao = new BoardDao();
		
		if(flag ==1) {
			list = bDao.selectBList(conn);
		}else {
			list = bDao.selectFList(conn);
		}
		
		close(conn);
		
		return list;
	}
	
	
	public Board selectBoard(int bid) {
		Connection conn = getConnection();
		
//		Board board = new BoardDao().selectBoard(conn, bid);
		//BoardDao 메소드 두개를 호출해서 하나는 조회하고 하나는 조회수 늘리는 작업을 해보자
		//게시판을 클릭하면 조회수가 증가해야하므로
		
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
	public ArrayList<Attachment> selectThumbnail(int bid) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new BoardDao().selectThumbnail(conn,bid);
		
		close(conn);
		
		return list;
	}
	
}
