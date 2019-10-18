package company.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import company.model.dao.CompanyDao;
import company.model.vo.Company;

public class CompanyService {

	public Company companyInfo(String c_name) {
		Connection conn = getConnection();
		
		Company result = new CompanyDao().compnayInfo(conn,c_name);
		
		close(conn);
		
		return result;
	}

}
