package company.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				compnay = new Company(rs.getString("USERID"),
									rs.getString("C_NAME"),
									rs.getInt("USER_T"),
									rs.getString("C_NUMBER"),
									rs.getString("C_ADD"),
									rs.getString("C_PHON"),
									rs.getString("C_MANAGER"),
									rs.getString("C_CONTACT"),
									rs.getString("C_EMAIL"),
									rs.getString("C_FLOG"));
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
			pstmt.setString(6, company.getC_phone());
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
			pstmt.setString(2,company.getC_phone());
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




}
