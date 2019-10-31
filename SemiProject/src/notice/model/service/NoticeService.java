package notice.model.service;

// Service클래스 처음 만들면 이거 먼저!!
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {

	/*
	 * 1. 공지사항 리스트 조회용 서비스
	 */
	public ArrayList<Notice> selectNoticeList(String c_name) {
		Connection conn = getConnection();
		
		ArrayList<Notice> arr = new NoticeDao().selectNoticeList(conn,c_name); 
		
		close(conn);

		return arr;
	}
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn,n);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public Notice selectNotice(int nno,String c_name) {
		Connection conn =getConnection();
		
		Notice notice =new NoticeDao().selectNotice(conn,nno,c_name);
		
		close(conn);
		System.out.println(nno);
		return notice;
	}
	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public int deleteNotice(int nno,String c_name) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, nno, c_name);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public ArrayList<Notice> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Notice> arr = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		
		return arr;
	}
	
	
	
	
	

	

}
