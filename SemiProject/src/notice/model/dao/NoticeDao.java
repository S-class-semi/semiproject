package notice.model.dao;

//Dao클래스 처음 만들면 이거 먼저!!
import static common.JDBCTemplate.close;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import notice.model.vo.Notice;

public class NoticeDao {
	Properties prop = new Properties();

	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {		
			e.printStackTrace();
		} catch (IOException e) {	
			e.printStackTrace();
		}
	}

	public ArrayList<Notice> selectList(Connection conn) {
		// 이건 Statement로 한번 해보자~
		Statement stmt = null;
		ResultSet rs = null;

		ArrayList<Notice> arr = null;

		String query = prop.getProperty("selectList");

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			arr = new ArrayList<Notice>();	


			while(rs.next()) {
				Notice no = new Notice(rs.getInt("B_NO"),
						rs.getInt("B_TYPE"),
						rs.getString("B_TITLE"),
						rs.getString("B_TEXT"),
						rs.getString("USER_ID"),
						rs.getInt("B_COUNT"),
						rs.getDate("B_TIME")
						);	
				arr.add(no);		
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return arr;
	}


	public int insertNotice(Connection conn, Notice n){ 
		PreparedStatement pstmt= null;
		int result = 0;

		String query = prop.getProperty("insertNotice");

		try { 
		pstmt = conn.prepareStatement(query); 
		pstmt.setString(1,n.getB_TITLE());
		pstmt.setString(2,n.getB_TEXT());
		pstmt.setString(3,n.getUSER_ID());
		

		result = pstmt.executeUpdate();

		} catch (SQLException e) { 
			e.printStackTrace(); 
		}finally { 
			close(pstmt); 
		}
		return result;
		}

	public Notice selectNotice(Connection conn, int bNO) {
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		Notice notice =null;
		String query =prop.getProperty("selectNotice");
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, bNO);
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				notice =new Notice(rs.getInt("B_NO"),
						rs.getInt("B_TYPE"),
						rs.getString("B_TITLE"),
						rs.getString("B_TEXT"),
						rs.getString("USER_ID"),
						rs.getInt("B_COUNT"),
						rs.getDate("B_TIME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);ssss
			close(pstmt);
		}
		
		return notice;
	}


	/*
	 * public Notice selectNotice(Connection conn, int nno) { PreparedStatement
	 * pstmt = null; ResultSet rs = null;
	 * 
	 * Notice notice = null;
	 * 
	 * String query = prop.getProperty("selectNotice");
	 * 
	 * try { pstmt = conn.prepareStatement(query); pstmt.setInt(1, nno); rs =
	 * pstmt.executeQuery();
	 * 
	 * while(rs.next()) { notice = new Notice(rs.getInt("B_NO"),
	 * rs.getString("USER_ID"), rs.getInt("B_TYPE"), rs.getString("B_TTITLE"),
	 * rs.getString("B_TEXT"), rs.getDate("B_TIME"), rs.getInt("B_COUNT"),
	 * rs.getString("B_FLOG")); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(rs);
	 * close(pstmt); }
	 * 
	 * return notice; }
	 */











}
