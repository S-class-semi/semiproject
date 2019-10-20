package company.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import company.model.dao.CompanyDao;
import company.model.vo.Company;

public class CompanyService {

	public Company companyInfo(String userid) {
		Connection conn = getConnection();
		
		Company result = new CompanyDao().compnayInfo(conn,userid);
		
		close(conn);
		
		return result;
	}

	public int idCheck(int c_number) {
		Connection conn = getConnection();
		int result = new CompanyDao().idCheck(conn, c_number);
		
		close(conn);
		
		return result;
	}

	public int idCheck(String c_name) {
		Connection conn = getConnection();
		int result = new CompanyDao().idCheck(conn,c_name);
		
		close(conn);
		return result;
	}

	public int admission(Company companyAdmission) {
		Connection conn = getConnection();
		
		int result = new CompanyDao().admission(conn,companyAdmission);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}



}
