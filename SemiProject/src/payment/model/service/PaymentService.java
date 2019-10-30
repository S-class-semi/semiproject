package payment.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import payment.model.dao.PaymentDao;
import payment.model.vo.Payment;

public class PaymentService {

	public int insertPayment(Payment pm) {
		Connection conn = getConnection();
		
		int result = new PaymentDao().insertPayment(conn, pm);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}




}
