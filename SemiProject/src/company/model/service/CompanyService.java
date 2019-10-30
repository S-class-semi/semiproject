package company.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import company.model.dao.CompanyDao;
import company.model.vo.Company;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class CompanyService {

	public Company companyInfo(String userid) {
		Connection conn = getConnection();
		
		Company result = new CompanyDao().compnayInfo(conn,userid);
		
		close(conn);
		
		return result;
	}

	public int idCheck(String c_number) {
		Connection conn = getConnection();
		int result = new CompanyDao().idCheck(conn, c_number);
		
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

	public int companyUpdate(Company company) {
		Connection conn = getConnection();
		
		int result = new CompanyDao().companyUpdate(conn,company);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public Company chenge(String c_name) {
		Connection conn = getConnection();
		
		Company com = new CompanyDao().cheng(conn,c_name);
		
		close(conn);
		return com;
	}

	public int nameCheck(String c_name) {
		Connection conn = getConnection();
		int result = new CompanyDao().nameCheck(conn,c_name);

		close(conn);
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new CompanyDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Company> selectSellerList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Company> list = new CompanyDao().selectSellerList(conn,currentPage,limit);
		
		close(conn);
		
		return list;
	}

	public Company sellerdetail(String user_Id) {
		Connection conn = getConnection();

		Company company = new CompanyDao().sellerdetail(conn, user_Id);
		
		close(conn);
		
		return company;
	}

	public int updateGrade(Company company) {
		Connection conn = getConnection();
		
		int result = new CompanyDao().updateUserT(conn,company);
		System.out.println(result);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int updateGrade1(Company company) {
		Connection conn = getConnection();
		
		int result = new CompanyDao().updateUserT1(conn,company);
		System.out.println(result);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	



}
