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
import board.model.vo.QNA;
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
	
	public int getQNAListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		int listCount = 0;
		
		String query = prop.getProperty("getQNAListCount");
		
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

	public ArrayList<QNA> selectQNAList(Connection conn, int currentPage,int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<QNA> list = null;
		
		String query = prop.getProperty("selectQNAList");
		
		int startRow = (currentPage-1)*limit+1;
		int endRow = startRow + limit -1;
		
		System.out.println(startRow);
		System.out.println(endRow);
		Member member = new Member();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			/* pstmt.setString(4, member.getUserId()); */
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<QNA>();
			
			while(rs.next()) {
				QNA b = new QNA(rs.getInt("bId"),
						rs.getInt("bType"),
						rs.getString("bName"),
						rs.getString("bTitle"),
						rs.getString("bText"),
						rs.getString("bWritter"),
						rs.getDate("bTime"),
						rs.getString("status"));
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

	public QNA selectQna(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		QNA b = null;
		
		String query = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				b = new QNA(rs.getInt("bid"),
							  rs.getInt("btype"),
							  rs.getString("bname"),
							  rs.getString("btitle"),
							  rs.getString("btext"),
							  rs.getString("bwritter"),
							  rs.getDate("btime"),
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

	public int updateQNA(Connection conn, QNA b) {
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
