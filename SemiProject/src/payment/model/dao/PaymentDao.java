package payment.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import payment.model.vo.Payment;

public class PaymentDao {
	
	private Properties prop = new Properties();
	
	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPayment(Connection conn, Payment pm) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertPayment");
			try {
				pstmt = conn.prepareStatement(query);

				pstmt.setInt(1, pm.getPAY_NO());
				pstmt.setInt(2, pm.getPAY_TYPE());
				pstmt.setInt(3, pm.getPAY_TYPE());
				pstmt.setString(4, pm.getUSER_ID());
				pstmt.setInt(5, pm.getADD_TYPE());
				pstmt.setString(6, pm.getPAY_NAME());
				pstmt.setDate (7, pm.getPAY_TIME());
				pstmt.setDate (8, pm.getPAY_SAPN());
				pstmt.setString(9, pm.getPAY_FLOG());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			return result;
		}
	
	
	
	
}
			