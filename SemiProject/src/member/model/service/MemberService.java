package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

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

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Member> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn,currentPage,limit);
		
		close(conn);
		
		return list;
	}

	public Member selectMemberGrade(String user_Id) {
		Connection conn = getConnection();

		Member member = new MemberDao().selectMemberGrade(conn, user_Id);
		
		close(conn);
		
		return member;
	}

	public int updateGrade(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateGrade(conn,member);
		System.out.println(result);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	

}
