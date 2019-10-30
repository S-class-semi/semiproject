package company.model.dao;

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

import company.model.vo.Company;

public class CompanyDao {
	private Properties prop = new Properties();
	public CompanyDao() {
		String fileName = CompanyDao.class.getResource("/sql/company/company-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public Company compnayInfo(Connection conn, String userid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Company compnay = null;
		
		String qeury = prop.getProperty("loginCompany");
		
		try {
			pstmt = conn.prepareStatement(qeury);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
//				private String userid;
//				private int user_t;
//				private String c_number;
//				private String c_name;
//				private String c_add;
//				private String c_phone;
//				private String c_manager;
//				private String c_contact;
//				private String c_email;
//				private String c_flog;
				compnay = new Company(rs.getString("userid"),
									rs.getInt("user_t"),
									rs.getString("c_number"),
									rs.getString("c_name"),
									rs.getString("c_add"),
									rs.getString("c_phon"),
									rs.getString("c_manager"),
									rs.getString("c_contact"),
									rs.getString("c_email"),
									rs.getString("c_flog"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return compnay;
	}
	public int idCheck(Connection conn, String c_number) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("c_numberCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c_number);
			
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

	public int admission(Connection conn, Company company) {
		PreparedStatement pstmt = null;

		int  result = 0;
		
		String query = prop.getProperty("c_admission");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, company.getUserid());
			pstmt.setString(2, company.getC_name());
			pstmt.setInt(3, company.getUser_t());
			pstmt.setString(4, company.getC_number());
			pstmt.setString(5, company.getC_add());
			pstmt.setString(6, company.getC_phon());
			pstmt.setString(7, company.getC_manager());
			pstmt.setString(8, company.getC_contact());
			pstmt.setString(9, company.getC_email());
			pstmt.setString(10, company.getC_flog());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);

		}
		
		return result;
	}
	public int companyUpdate(Connection conn, Company company) {
		PreparedStatement pstmt= null;
		
		int result = 0 ;
		
		String query = prop.getProperty("companyUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, company.getC_add());
			pstmt.setString(2,company.getC_phon());
			pstmt.setString(3, company.getC_manager());
			pstmt.setString(4, company.getC_contact());
			pstmt.setString(5, company.getC_email());
			pstmt.setString(6, company.getC_name());
			
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public Company cheng(Connection conn, String c_name) {
		PreparedStatement pstmt = null;
		
		return null;
	}
	public int nameCheck(Connection conn, String c_name) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("c_nameCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c_name);
			
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
	public ArrayList<Company> selectSellerList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Company> list = null;
		
		String query = prop.getProperty("selectSellerList");
		
	
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 3);
			pstmt.setString(3, "N");
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<Company>();
			
			while(rs.next()) {
				
//				private String userid;
//				private int user_t;
//				private String c_number;
//				private String c_name;
//				private String c_add;
//				private String c_phone;
//				private String c_manager;
//				private String c_contact;
//				private String c_email;
//				private String c_flog;
				
				
				Company c = new Company(rs.getString("userid"),
						rs.getInt("user_t"),
						rs.getString("c_number"),
						rs.getString("c_name"),
						rs.getString("c_add"),
						rs.getString("c_phon"),
						rs.getString("c_manager"),
						rs.getString("c_contact"),
						rs.getString("c_email"),
						rs.getString("c_flog"));
						
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	public Company sellerdetail(Connection conn, String user_Id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Company company = null;
		
		String query = prop.getProperty("sellerdetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_Id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				company =new Company(rs.getString("userid"),
									 rs.getInt("user_t"),
									 rs.getString("c_number"),
									 rs.getString("c_name"),
									 rs.getString("c_add"),
									 rs.getString("c_phon"),
									 rs.getString("c_manager"),
									 rs.getString("c_contact"),
									 rs.getString("c_email"),
									 rs.getString("c_flog"));
					
				
//				private String userid;
//				private int user_t;
//				private String c_number;
//				private String c_name;
//				private String c_add;
//				private String c_phon;
//				private String c_manager;
//				private String c_contact;
//				private String c_email;
//				private String c_flog;
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return company;
	}
	public int updateUserT(Connection conn, Company company) {
		PreparedStatement pstmt = null;
		int result=0;
		
		
		String query = prop.getProperty("updateUserT");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, 2);
			pstmt.setString(2, company.getUserid());
			
			result = pstmt.executeUpdate();
	
			
			
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateUserT1(Connection conn, Company company) {
		PreparedStatement pstmt = null;
		int result=0;
		
		
		String query = prop.getProperty("updateUserT1");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, 2);
			pstmt.setString(2, company.getUserid());
			
			result = pstmt.executeUpdate();
	
			
			
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}




}
