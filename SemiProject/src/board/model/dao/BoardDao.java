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

import board.model.vo.Attachment;
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

	public ArrayList<Board> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Board>list = null;
		
		String query = prop.getProperty("selectList");
		
		// 쿼리문 실행시 조건절에 넣을 변수들(rownum에 대한 조건 시 필요)
		int startRow = (currentPage-1)*limit +1;	
		// ex) 2page면 시작 번호가 11번일 것이다.
		int endRow = startRow + limit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, 1); 	// 1은 게시판 타입을 의미함 -> 1=일반게시판, 2=사진게시판
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<Board>();	// 컬렉션(ArrayList)는 반드시 기본생성자로 초기화 해놓고 활용하자!!
			
			while(rs.next()) {
				Board b = new Board(rs.getInt("bNo"),
							rs.getString("bType"),
							rs.getString("bTitle"),
							rs.getString("bText"),
							rs.getString("userId"),
							rs.getDate("bTime"),
							rs.getInt("bCount")
						);
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
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

	public Board selectBoard(Connection conn, int bid) {
	
		
		return null;
	}

	public ArrayList selectBList(Connection conn) {
	Statement stmt =null;
	ResultSet rs =null;
	ArrayList list =null;
	try {
	while(rs.next()){
			list.add(new Board(rs.getInt ("bNo"), rs.getString ("bType"), rs.getString("bTitle"), rs.getString("bText"), rs.getString("userId"), rs.getDate("bTime"), rs.getInt("bCount")));
		}} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}
	return list;
	}

	public ArrayList<Attachment> selectThumbnail(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectThumbnail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();	//중요쓰!!!
			
			while(rs.next()) {
				Attachment at = new Attachment();
				at.setfId(rs.getInt("fid"));
				at.setbId(rs.getInt("bid"));
				at.setOriginName(rs.getString("origin_name"));
				at.setChangeName(rs.getString("change_name"));
				at.setFilePath(rs.getString("file_path"));
				at.setUploadDate(rs.getDate("upload_date"));
				
				list.add(at);
			}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rs);
			}
			
			return list;
		}
	public Attachment selectAttachment(Connection conn, int fid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Attachment at = null;
		
		String query = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, fid);
			
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				at = new Attachment();
				
				at.setOriginName(rs.getString("origin_name"));
				at.setChangeName(rs.getString("change_name"));
				at.setFilePath(rs.getString("file_path"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return at;
	}
	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list=new ArrayList();
			
			while(rs.next()) {
				list.add(new Attachment(rs.getInt("bid"),
										rs.getString("change_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
