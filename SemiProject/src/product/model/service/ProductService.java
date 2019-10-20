package product.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import product.model.dao.ProductDao;
import product.model.vo.ProductInfo;

public class ProductService {

	public int insertProduct(ProductInfo p_info) {
		Connection conn = getConnection();
		
		int result = new ProductDao().insertProduct(conn,p_info);
		
		if(result >0) {
			commit(conn);
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

	public ArrayList<ProductInfo> selectProList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<ProductInfo> list = new ProductDao().selectProList(conn,currentPage,limit);
		
		close(conn);
		return list;
	}

	public ProductInfo selectProduct(int pro_id) {
		Connection conn = getConnection();
		
		ProductInfo productinfo = new ProductDao().selectProduct(conn,pro_id);
		
		
		
		close(conn);
		return productinfo;
	}



}
