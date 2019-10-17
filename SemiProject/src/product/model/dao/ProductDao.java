package product.model.dao;

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

import company.model.dao.CompanyDao;
import product.model.vo.ProductInfo;

public class ProductDao {

	private Properties prop = new Properties();
	public ProductDao() {
		String fileName = CompanyDao.class.getResource("/sql/product/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public int insertProduct(Connection conn, ProductInfo p_info) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_info.getP_code());
			pstmt.setString(2, p_info.getPro_code());
			pstmt.setString(3, p_info.getP_name());
			pstmt.setString(4, p_info.getP_price());
			pstmt.setString(5, p_info.getP_info());
			pstmt.setString(6, p_info.getC_name());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
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
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}
		return listCount;
	}
	public ArrayList<ProductInfo> selectProList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		ArrayList<ProductInfo> list =null;
		
		String query = prop.getProperty("selectProList");
		
		int startRow = (currentPage -1) * limit + 1;
		
		int endRow = startRow + limit -1;
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<ProductInfo>();
			//초기값 잡아 놓자
			
			while(rs.next()) {
				ProductInfo p = new ProductInfo(rs.getInt("ROWNUM"),
												rs.getString("P_CODE"),
												rs.getString("PRO_CODE"),
												rs.getString("P_NAME"),
												rs.getString("P_PRICE"),
												rs.getString("P_INFO"),
												rs.getString("C_NAME"));
			
				list.add(p);
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public ProductInfo selectProduct(Connection conn, int pro_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ProductInfo p = null;
		
		String query = prop.getProperty("selectProductInfo");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pro_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				p = new ProductInfo(rs.getInt("ROWNUM"),
												rs.getString("P_CODE"),
												rs.getString("PRO_CODE"),
												rs.getString("P_NAME"),
												rs.getString("P_PRICE"),
												rs.getString("P_INFO"),
												rs.getString("C_NAME"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return p;
	}

}
