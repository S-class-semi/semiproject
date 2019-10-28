package board.model.dao;

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

import board.model.vo.Board;
import member.model.vo.Member;

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
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				listCount=rs.getInt(1);	
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}
		return listCount;
	}

	public ArrayList<Board> selectQNAList(Connection conn, int currentPage,int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectQNAList");
		
		int startRow = (currentPage-1)*limit+1;
		int endRow = startRow + limit -1;
		Member member = new Member();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, 1);
			/* pstmt.setString(4, member.getUserId()); */
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rs.next()) {
				Board b = new Board(rs.getInt("bId"),
						rs.getString("bType"),
						rs.getInt("bName"),
						rs.getString("bTitle"),
						rs.getString("bText"),
						rs.getString("bWritter"),
						rs.getDate("bTime"),
						rs.getInt("bCount"),
						rs.getString("Status"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
								
		
		return list;
	}

	public Board selectQna(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Board b = null;
		
		String query = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				b = new Board(rs.getInt("bid"),
							  rs.getString("btype"),
							  rs.getInt("bname"),
							  rs.getString("btitle"),
							  rs.getString("btext"),
							  rs.getString("bwritter"),
							  rs.getDate("btime"),
							  rs.getInt("bcount"),
							  rs.getString("status"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return b;
	}

	public int updateQNA(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateQNA");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b.getbId());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	/*
	 * public int updateQNA(Connection conn, int bid) { PreparedStatement pstmt =
	 * null; int result = 0;
	 * 
	 * String query = prop.getProperty("updateQNA");
	 * 
	 * try { pstmt = conn.prepareStatement(query); pstmt.setInt(1, bid);
	 * 
	 * result = pstmt.executeUpdate();
	 * 
	 * }catch(SQLException e) { e.printStackTrace(); }finally { close(pstmt); }
	 * 
	 * return result; }
	 */

}
