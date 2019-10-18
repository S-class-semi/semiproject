package notice.model.service;

// Service클래스 처음 만들면 이거 먼저!!
import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {

	/*
	 * 1. 공지사항 리스트 조회용 서비스
	 */
	public ArrayList<Notice> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Notice> arr = new NoticeDao().selectList(conn); 
		
		close(conn);

		return arr;
	}

	
	
	

	

}
