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

	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn, userId);
		
		close(conn);
		
		return result;
	}

	public int nickCheck(String nickname) {
		Connection conn = getConnection();
		int result = new MemberDao().nickCheck(conn, nickname);
		
		close(conn);
		
		return result;
	}

	public Member selectMember(String userId) {
		Connection conn = getConnection();

		Member member = new MemberDao().selectMember(conn, userId);
		
		close(conn);
		
		return member;
	}

	public int updateMember(Member member) {
			Connection conn = getConnection();
			
			int result = new MemberDao().updateMember(conn, member);
			
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			
			close(conn);
			
			return result;
		
	}

	public int deleteMember(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}

}
