package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public int insertMember(Member m) {
		Connection conn = getConnection();

		int result = new MemberDao().insertMember(conn, m);

		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member loginMember(Member m) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, m);
		
		close(conn);
		
		return loginUser;
	}

}
