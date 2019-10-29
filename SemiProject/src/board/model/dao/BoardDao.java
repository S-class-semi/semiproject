package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.org.apache.bcel.internal.generic.RETURN;

import board.model.vo.Board;

public class BoardDao {

	Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {		
			e.printStackTrace();
		} catch (IOException e) {	
			e.printStackTrace();
		}
	}

	

	

	
	
	
	public Board selectBoard(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Board b = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				b = new Board();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return b;
	}
	
	public int updateCount(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCount");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}








	public ArrayList<Board> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();	// ArrayList는 기본 생성자로 항상 객체 만들어서 초기화 하자
			
			while(rs.next()) {
				Board b = new Board(rs.getInt("B_NO"),
						rs.getInt("B_TYPE"),
						rs.getString("B_TITLE"),
						rs.getString("B_TEXT"),
						rs.getString("USER_ID"),
						rs.getInt("B_COUNT"),
						rs.getDate("B_TIME"),
						rs.getString("B_FLOG")
						);
				list.add(b);		
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return list;
		
	}


	






	
}