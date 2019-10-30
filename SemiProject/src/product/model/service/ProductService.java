package product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import product.model.dao.ProductDao;
import product.model.vo.Order;
import product.model.vo.ProductImgFile;
import product.model.vo.ProductInfo;

public class ProductService {

	public int insertProduct(ProductInfo p_info, ArrayList<ProductImgFile> imgList) {
		Connection conn = getConnection();
		
		System.out.println("처음 삽입 부분입니다.");
		ProductDao pDao = new ProductDao();
		String c_name = p_info.getC_name();
		String p_code = p_info.getP_code();
		String pro_code = p_info.getPro_code();
		
		int result1 = pDao.insertProduct(conn,p_info);
		int result2 = pDao.inserimgFile(conn,imgList,c_name,p_code,pro_code); 
		
		int result = 0;
		if(result1 >0 && result2 >0) {
			commit(conn);
			result = 1;
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int insertProduct(String p_code, String c_name, ArrayList<ProductImgFile> imgList) {
		Connection conn = getConnection();
		
		System.out.println("업데이트 부분입니다.");
		int result = new ProductDao().inserimgFile(conn, imgList, c_name, p_code);
		System.out.println("S - c_name : " + c_name);
		System.out.println("S - p_code : " + p_code);
		System.out.println("S - imgList : " + imgList);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new ProductDao().getListCount(conn);
		
		close(conn);
		return listCount;
	}

	/*
	 * public ArrayList<ProductInfo> selectProList(int currentPage, int limit) {
	 * Connection conn = getConnection(); ArrayList<ProductInfo> list = new
	 * ProductDao().selectProList(conn,currentPage,limit);
	 * 
	 * close(conn); return list; }
	 */

	public ProductInfo selectProduct(String p_code) {
		Connection conn = getConnection();
		
		ProductInfo productinfo = new ProductDao().selectProduct(conn,p_code);
		
		close(conn);
		return productinfo;
	}

	public ArrayList<ProductInfo> selectProList(int currentPage, int limit, String c_name) {
		Connection conn = getConnection();
		ArrayList<ProductInfo> list = new ProductDao().selectProList(conn,currentPage,limit,c_name);
		
		close(conn);
		return list;
	}

	public int deleteProduct(String p_code) {
		Connection conn = getConnection();
		
		int result = new ProductDao().deleteProduct(conn,p_code);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<ProductImgFile> selectImgList(String p_code, String c_name) {
		Connection conn = getConnection();
		ArrayList<ProductImgFile> imglist = new ProductDao().selectImgList(conn,p_code,c_name);
		
		close(conn);
		
		return imglist;
	}

	public int deleteImgFile(String p_code, String c_name) {
		Connection conn = getConnection();
		
		int result = new ProductDao().deleteImgFile(conn,p_code,c_name);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	public int updateProduct(ProductInfo p_info) {
		Connection conn = getConnection();
		
		int result = new ProductDao().updateProduct(conn ,p_info);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int p_codeCheck(String p_code) {
		Connection conn = getConnection();
		
		int result = new ProductDao().p_codeCheck(conn,p_code);
		
		close(conn);
		
		return result;
	}

	public int updateImgFile(String p_code, String c_name) {
		Connection conn = getConnection();
		
		int result = new ProductDao().updateImgfile(conn, p_code,c_name);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteImgFile(String failedpath) {
		Connection conn = getConnection();
		
		int result = new ProductDao().updateImgFile(conn,failedpath);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	

	

	public int dailySales(String pname) {
		
		Connection conn = getConnection();
		
		int num = 0;
		num = new ProductDao().dailySales(conn, pname);
		
		close(conn);
		
		return num;
	}

	public ArrayList<Order> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Order> list = new ProductDao().selectOrderList(conn,currentPage,limit);
		
		close(conn);
		
		return list;
	}

	public int getOrderListCount() {
		Connection conn = getConnection();
		int listCount = new ProductDao().getOrderListCount(conn);
		
		close(conn);
		return listCount;
	}

	public ArrayList<ProductInfo> selectProListC() {
		Connection conn = getConnection();
		
		ArrayList<ProductInfo> all_pro = new ProductDao().selectProductC(conn);
		
		close(conn);
		return all_pro;
	}
	
	public ArrayList<ProductInfo> selectProListB() {
		Connection conn = getConnection();
		
		ArrayList<ProductInfo> all_pro = new ProductDao().selectProductB(conn);
		
		close(conn);
		
		return all_pro;
	}
	
	public ArrayList<ProductInfo> selectProListK() {
		Connection conn = getConnection();
		
		ArrayList<ProductInfo> all_pro = new ProductDao().selectProductK(conn);
		
		close(conn);
		
		return all_pro;
	}
	
	public ArrayList<ProductInfo> selectProListT() {
		Connection conn = getConnection();
		
		ArrayList<ProductInfo> all_pro = new ProductDao().selectProductT(conn);
		
		close(conn);
		
		return all_pro;
	}


	public ArrayList<ProductImgFile> selectImgListC() {
		Connection conn = getConnection();
		
		ArrayList<ProductImgFile> imgList = new ProductDao().selectImgListC(conn);
		
		close(conn);
		return imgList;
	}

	
	public ArrayList<ProductImgFile> selectImgListB() {
		Connection conn = getConnection();
		
		ArrayList<ProductImgFile> imgList = new ProductDao().selectImgListB(conn);
		
		close(conn);
		return imgList;
	}

	
	public ArrayList<ProductImgFile> selectImgListK() {
		Connection conn = getConnection();
		
		ArrayList<ProductImgFile> imgList = new ProductDao().selectImgListK(conn);
		
		close(conn);
		return imgList;
	}

	
	public ArrayList<ProductImgFile> selectImgListT() {
		Connection conn = getConnection();
		
		ArrayList<ProductImgFile> imgList = new ProductDao().selectImgListT(conn);
		
		close(conn);
		return imgList;
	}




	//찬화꺼



}
