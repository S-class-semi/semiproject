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
	public Company compnayInfo(Connection conn, String c_name) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Company compnay = null;
		
		String qeury = prop.getProperty("loginCompany");
		
		try {
			pstmt = conn.prepareStatement(qeury);
			pstmt.setString(1, c_name);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				compnay = new Company(rs.getString("C_NAME"),
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
	public int idCheck(Connection conn, int c_number) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("c_numberCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, c_number);
			
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
	public int idCheck(Connection conn, String c_name) {
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
