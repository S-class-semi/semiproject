package product.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import product.model.dao.ProductDao;
import product.model.vo.ProductImgFile;
import product.model.vo.ProductInfo;

public class ProductService {

	public int insertProduct(ProductInfo p_info, ArrayList<ProductImgFile> imgList) {
		Connection conn = getConnection();
		
		ProductDao pDao = new ProductDao();
		String c_name = p_info.getC_name();
		String p_code = p_info.getP_code();
		
		int result1 = pDao.insertProduct(conn,p_info);
		int result2 = pDao.inserimgFile(conn,imgList,c_name,p_code); 
		
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

	public ProductInfo selectProduct(String c_code) {
		Connection conn = getConnection();
		
		ProductInfo productinfo = new ProductDao().selectProduct(conn,c_code);
		
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

	public ArrayList<ProductImgFile> selectImgList(String c_code) {
		Connection conn = getConnection();
		ArrayList<ProductImgFile> imglist = new ProductDao().selectImgList(conn,c_code);
		
		close(conn);
		
		return imglist;
	}

	public int deleteImgFile(String p_code) {
		Connection conn = getConnection();
		
		int result = new ProductDao().deleteImgFile(conn,p_code);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertProduct(String p_code, String c_name, ArrayList<ProductImgFile> imgList) {
		Connection conn = getConnection();
		
		int result = new ProductDao().inserimgFile(conn, imgList, c_name, p_code);
		if(result>0) {
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




}
