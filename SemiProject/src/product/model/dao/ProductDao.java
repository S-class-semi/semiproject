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
import product.model.vo.Order;
import product.model.vo.ProductImgFile;
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

	
	public ProductInfo selectProduct(Connection conn, String p_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ProductInfo p = null;
		
		String query = prop.getProperty("selectProductInfo");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_code);
			
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
	public ArrayList<ProductInfo> selectProList(Connection conn, int currentPage, int limit, String c_name) {
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
			pstmt.setString(3, c_name);
			
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
	public int deleteProduct(Connection conn, String p_code) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_code);
			
			result =pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int inserimgFile(Connection conn, String c_name, String p_code, String pro_code, ArrayList<ProductImgFile> imgList) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insetImgFile");
		
		try {
			for(int i=0; i<imgList.size();i++) {
				ProductImgFile file = imgList.get(i);
				
				pstmt=conn.prepareStatement(query);
				
				pstmt.setString(1, c_name);
				pstmt.setString(2, p_code);
				pstmt.setString(3, pro_code);
				pstmt.setString(4, file.getOrigin_name());
				pstmt.setString(5, file.getChange_name());
				pstmt.setString(6, file.getFile_path());
				pstmt.setInt(7, file.getFile_level());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("삽입분   result값 : " +result);
		if(result == imgList.size()) {
			return result;
		}else {
			return 0;
		}
		
	}
	public int inserimgFile(Connection conn, ArrayList<ProductImgFile> imgList, String c_name, String p_code, String pro_code) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insetImgFile");
		
		try {
			for(int i=0; i<imgList.size();i++) {
				ProductImgFile file = imgList.get(i);
				
				pstmt=conn.prepareStatement(query);
				
				pstmt.setString(1, c_name);
				pstmt.setString(2, p_code);
				pstmt.setString(3, pro_code);
				pstmt.setString(4, file.getOrigin_name());
				pstmt.setString(5, file.getChange_name());
				pstmt.setString(6, file.getFile_path());
				pstmt.setInt(7, file.getFile_level());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("삽입분   result값 : " +result);
		if(result == imgList.size()) {
			return result;
		}else {
			return 0;
		}
	}
	
	public ArrayList<ProductImgFile> selectImgList(Connection conn, String p_code, String c_name) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ProductImgFile> filelist = null;
		
		String query = prop.getProperty("selectImgFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_code);
			pstmt.setString(2, c_name);
			rs = pstmt.executeQuery();
			
			filelist = new ArrayList<ProductImgFile>();
			
			while(rs.next()) {
				ProductImgFile file = new ProductImgFile(rs.getString("C_NAME"),
														rs.getString("P_CODE"),
														rs.getString("PRO_CODE"),
														rs.getString("ORIGIN_NAME"),
														rs.getString("CHANGE_NAME"),
														rs.getString("FILE_PATH"),
														rs.getDate("UPLOAD_DATE"),
														rs.getInt("FILE_LEVEL"),
														rs.getString("STATUS"));
				filelist.add(file);
				System.out.println("파일이 출력되니?" +file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return  filelist;
	}
	

	public int deleteImgFile(Connection conn, String p_code, String c_name) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("delteImgFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_code);
			pstmt.setString(2, c_name);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateProduct(Connection conn, ProductInfo p_info) {
		PreparedStatement pstmt= null;
		
		int result = 0;
		
		String query = prop.getProperty("updateProduct");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_info.getP_name());
			pstmt.setString(2, p_info.getP_price());
			pstmt.setString(3, p_info.getP_info());
			pstmt.setString(4, p_info.getP_code());
			pstmt.setString(5, p_info.getC_name());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int p_codeCheck(Connection conn, String p_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		String query = prop.getProperty("p_codeCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_code);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result= rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return result;
	}
	public int updateImgfile(Connection conn, String p_code, String c_name) {
		PreparedStatement pstmt = null;
	
		int result = 0;
		
		String query = prop.getProperty("updateImg");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_code);
			pstmt.setString(2, c_name);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public int updateImgFile(Connection conn, String failedpath) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateImgFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, failedpath);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int dailySales(Connection conn, String pname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		
		
		String query = prop.getProperty("dailySales");
		System.out.println(pname);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pname); 
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("SUM(P_PRICE)");

			}
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return num;
	}
	public ArrayList<Order> selectOrderList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		ArrayList<Order> list =null;
		
		String query = prop.getProperty("selectOrderList");
		
		int startRow = (currentPage -1) * limit + 1;
		
		int endRow = startRow + limit -1;
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, "N");
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<Order>();
			//초기값 잡아 놓자
			
			while(rs.next()) {
//				private int ono;
//				private int pno;
//				private int quantity;
//				private Date buydate;
//				private String status;
//				private String user_Id;
				
				Order o = new Order(rs.getInt("ono"),
												rs.getInt("pno"),
												rs.getString("pname"),
												rs.getInt("quantity"),
												rs.getDate("buydate"),
												rs.getString("status"),
												rs.getString("user_Id"));
												
			
				list.add(o);
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public int getOrderListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		int listCount = 0;
		
		String query = prop.getProperty("getOrderListCount");
		
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
	//찬화꺼
	public ArrayList<ProductInfo> selectProductC(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		String query = prop.getProperty("selectproductClist");
		ArrayList<ProductInfo> all_pro = new ArrayList<ProductInfo>();
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductInfo p = new ProductInfo(rs.getString("P_CODE"),
												rs.getString("PRO_CODE"),
												rs.getString("P_NAME"),
												rs.getString("P_PRICE"),
												rs.getString("P_INFO"),
												rs.getString("C_NAME"));
				all_pro.add(p);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return all_pro;
	}
	
	public ArrayList<ProductInfo> selectProductB(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		String query = prop.getProperty("selectproductBlist");
		ArrayList<ProductInfo> all_pro = new ArrayList<ProductInfo>();
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductInfo p = new ProductInfo(rs.getString("P_CODE"),
												rs.getString("PRO_CODE"),
												rs.getString("P_NAME"),
												rs.getString("P_PRICE"),
												rs.getString("P_INFO"),
												rs.getString("C_NAME"));
				all_pro.add(p);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return all_pro;
	}
	
	public ArrayList<ProductInfo> selectProductK(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		String query = prop.getProperty("selectproductKlist");
		ArrayList<ProductInfo> all_pro = new ArrayList<ProductInfo>();
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductInfo p = new ProductInfo(rs.getString("P_CODE"),
												rs.getString("PRO_CODE"),
												rs.getString("P_NAME"),
												rs.getString("P_PRICE"),
												rs.getString("P_INFO"),
												rs.getString("C_NAME"));
				all_pro.add(p);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return all_pro;
	}
	
	public ArrayList<ProductInfo> selectProductT(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		String query = prop.getProperty("selectproductTlist");
		ArrayList<ProductInfo> all_pro = new ArrayList<ProductInfo>();
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductInfo p = new ProductInfo(rs.getString("P_CODE"),
												rs.getString("PRO_CODE"),
												rs.getString("P_NAME"),
												rs.getString("P_PRICE"),
												rs.getString("P_INFO"),
												rs.getString("C_NAME"));
				all_pro.add(p);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return all_pro;
	}
	
	public ArrayList<ProductImgFile> selectImgListC(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ProductImgFile> CList = null;
		
		String query = prop.getProperty("selectImgCList");
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			CList = new ArrayList<ProductImgFile>();
			
			while(rs.next()) {
				ProductImgFile file = new ProductImgFile(rs.getString("C_NAME"),
														rs.getString("P_CODE"),
														rs.getString("PRO_CODE"),
														rs.getString("ORIGIN_NAME"),
														rs.getString("CHANGE_NAME"),
														rs.getString("FILE_PATH"),
														rs.getDate("UPLOAD_DATE"),
														rs.getInt("FILE_LEVEL"),
														rs.getString("STATUS"));
				CList.add(file);
				System.out.println("파일이 출력되니?" +file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return  CList;
	}
	
	public ArrayList<ProductImgFile> selectImgListB(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ProductImgFile> CList = null;
		
		String query = prop.getProperty("selectImgBList");
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			CList = new ArrayList<ProductImgFile>();
			
			while(rs.next()) {
				ProductImgFile file = new ProductImgFile(rs.getString("C_NAME"),
														rs.getString("P_CODE"),
														rs.getString("PRO_CODE"),
														rs.getString("ORIGIN_NAME"),
														rs.getString("CHANGE_NAME"),
														rs.getString("FILE_PATH"),
														rs.getDate("UPLOAD_DATE"),
														rs.getInt("FILE_LEVEL"),
														rs.getString("STATUS"));
				CList.add(file);
				System.out.println("파일이 출력되니?" +file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return  CList;
	}
	
	public ArrayList<ProductImgFile> selectImgListK(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ProductImgFile> CList = null;
		
		String query = prop.getProperty("selectImgKList");
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			CList = new ArrayList<ProductImgFile>();
			
			while(rs.next()) {
				ProductImgFile file = new ProductImgFile(rs.getString("C_NAME"),
														rs.getString("P_CODE"),
														rs.getString("PRO_CODE"),
														rs.getString("ORIGIN_NAME"),
														rs.getString("CHANGE_NAME"),
														rs.getString("FILE_PATH"),
														rs.getDate("UPLOAD_DATE"),
														rs.getInt("FILE_LEVEL"),
														rs.getString("STATUS"));
				CList.add(file);
				System.out.println("파일이 출력되니?" +file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return  CList;
	}
	
	public ArrayList<ProductImgFile> selectImgListT(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ProductImgFile> CList = null;
		
		String query = prop.getProperty("selectImgTList");
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			CList = new ArrayList<ProductImgFile>();
			
			while(rs.next()) {
				ProductImgFile file = new ProductImgFile(rs.getString("C_NAME"),
														rs.getString("P_CODE"),
														rs.getString("PRO_CODE"),
														rs.getString("ORIGIN_NAME"),
														rs.getString("CHANGE_NAME"),
														rs.getString("FILE_PATH"),
														rs.getDate("UPLOAD_DATE"),
														rs.getInt("FILE_LEVEL"),
														rs.getString("STATUS"));
				CList.add(file);
				System.out.println("파일이 출력되니?" +file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return  CList;
	}
	public ProductImgFile selecttodayimg(Connection conn, String imgnum) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String query = prop.getProperty("selecttodayimg");
		ProductImgFile img = null;
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, imgnum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
			img = 	new ProductImgFile(rs.getString("C_NAME"),
						rs.getString("P_CODE"),
						rs.getString("PRO_CODE"),
						rs.getString("ORIGIN_NAME"),
						rs.getString("CHANGE_NAME"),
						rs.getString("FILE_PATH"),
						rs.getDate("UPLOAD_DATE"),
						rs.getInt("FILE_LEVEL"),
						rs.getString("STATUS"));	
			}
			 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return img;
	}
	

	
	
	

}
