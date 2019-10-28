package member.model.dao;

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

import member.model.vo.Member;


public class MemberDao {
	
	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getNickname());
			pstmt.setInt(4, m.getSpace());
			
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member loginMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginUser = new Member(rs.getString("USER_ID"),
										rs.getInt("USER_G"),
										rs.getInt("USER_T"),
										rs.getString("USER_PWD"),
										rs.getString("NICKNAME"),
										rs.getInt("SPACE"),
										rs.getInt("POINT"),
										rs.getString("CONTEXT"),
										rs.getDate("BIRTH"),
										rs.getString("GENDER"),
										rs.getString("STATUS"),
										rs.getString("KAKAO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return loginUser;
	}
	
	public Member selectMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member = new Member(rs.getString("USER_ID"),
									rs.getInt("USER_G"),
									rs.getInt("USER_T"),
									rs.getString("USER_PWD"),
									rs.getString("NICKNAME"),
									rs.getInt("SPACE"),
									rs.getInt("POINT"),
									rs.getString("CONTEXT"),
									rs.getDate("BIRTH"),
									rs.getString("GENDER"),
									rs.getString("STATUS"),
									rs.getString("KAKAO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return member;
	}

	public int idCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);	// 1은 의미상 resultSet 테이블의 첫 번째 컬럼명이랑 동일함
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
			close(rs);
		}
		
		return result;
	}

	public int nickCheck(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("nickCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);	// 1은 의미상 resultSet 테이블의 첫 번째 컬럼명이랑 동일함
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
			close(rs);
		}
		
		return result;
	}

	public int findPwd(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserPwd());
			pstmt.setString(2, member.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
		}
		
		return result;
	}

	public int kakaoCheck(Connection conn, String kakaoId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("kakaoCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, kakaoId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);	// 1은 의미상 resultSet 테이블의 첫 번째 컬럼명이랑 동일함
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
			close(rs);
		}
		
		return result;
	}

	public int kakaoMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("kakaoMember");
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getNickname());
			pstmt.setInt(3, m.getSpace());
			pstmt.setString(4, m.getKakao());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member kakaoLogin(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Member loginUser = null;
		
		String query = prop.getProperty("kakaoLogin");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getKakao());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginUser = new Member(rs.getString("USER_ID"),
										rs.getInt("USER_G"),
										rs.getInt("USER_T"),
										rs.getString("USER_PWD"),
										rs.getString("NICKNAME"),
										rs.getInt("SPACE"),
										rs.getInt("POINT"),
										rs.getString("CONTEXT"),
										rs.getDate("BIRTH"),
										rs.getString("GENDER"),
										rs.getString("STATUS"),
										rs.getString("KAKAO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return loginUser;
	}
	///정원이꺼
	
	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getNickname());
			pstmt.setInt(2, member.getSpace());
			pstmt.setString(3,  member.getContext());
			pstmt.setString(4,  member.getGender());
			pstmt.setString(5,  member.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,  userId);
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;

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

	public ArrayList<Member> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("selectUserList");
		
	
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 3);
			pstmt.setString(3, "N");
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<Member>();
			
			while(rs.next()) {
				
//				private String user_Id;
//				private int user_G;
//				private int user_T;
//				private String user_Pwd;
//				private String nickname;
//				private int space;
//				private int point;
//				private String context;
//				private Date birth;
//				private String gender;
//				private String status;
				
				
				Member b = new Member(rs.getString("USER_ID"),
						rs.getInt("USER_G"),
						rs.getInt("USER_T"),
						rs.getString("USER_PWD"),
						rs.getString("NICKNAME"),
						rs.getInt("SPACE"),
						rs.getInt("POINT"),
						rs.getString("CONTEXT"),
						rs.getDate("BIRTH"),
						rs.getString("GENDER"),
						rs.getString("STATUS"),
						rs.getString("KAKAO"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public Member selectMemberGrade(Connection conn, String user_Id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_Id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member =new Member(rs.getString("USER_ID"),
						rs.getInt("USER_G"),
						rs.getInt("USER_T"),
						rs.getString("USER_PWD"),
						rs.getString("NICKNAME"),
						rs.getInt("SPACE"),
						rs.getInt("POINT"),
						rs.getString("CONTEXT"),
						rs.getDate("BIRTH"),
						rs.getString("GENDER"),
						rs.getString("STATUS"),
						rs.getString("KAKAO"));
				
//				private String user_Id;
//				private int user_G;
//				private int user_T;
//				private String user_Pwd;
//				private String nickname;
//				private int space;
//				private int point;
//				private String context;
//				private Date birth;
//				private String gender;
//				private String status;
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return member;
	}

	public int updateGrade(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result=0;
		
		String query = prop.getProperty("updateGrade");
	
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getNickname());
			pstmt.setInt(2, member.getUserG());
			pstmt.setInt(3, member.getPoint());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getUserId());
			
			result = pstmt.executeUpdate();
			
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
