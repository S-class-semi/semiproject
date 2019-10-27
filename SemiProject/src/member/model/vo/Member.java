package member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private int userG;
	private int userT;
	private String userPwd;
	private String nickname;
	private int space;
	private int point;
	private String context;
	private Date birth;
	private String gender;
	private String status;
	
	public Member() {}
	
	
	
	public Member(String userId, String nickname, String gender) {
		super();
		this.userId = userId;
		this.nickname = nickname;
		this.gender = gender;
	}

	

	public Member(String userId, String nickname, int space, String context, String gender) {
		super();
		this.userId = userId;
		this.nickname = nickname;
		this.space = space;
		this.context = context;
		this.gender = gender;
	}



	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}



	public Member(String userId, String userPwd, String nickname, int space) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickname = nickname;
		this.space = space;
	}

	public Member(String userId, int userG, int userT, String userPwd, String nickname, int space, int point,
			String context, Date birth, String gender, String status) {

		this.userId = userId;
		this.userG = userG;
		this.userT = userT;
		this.userPwd = userPwd;
		this.nickname = nickname;
		this.space = space;
		this.point = point;
		this.context = context;
		this.birth = birth;
		this.gender = gender;
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getUserG() {
		return userG;
	}

	public void setUserG(int userG) {
		this.userG = userG;
	}

	public int getUserT() {
		return userT;
	}

	public void setUserT(int userT) {
		this.userT = userT;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getSpace() {
		return space;
	}

	public void setSpace(int space) {
		this.space = space;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userG=" + userG + ", userT=" + userT + ", userPwd=" + userPwd
				+ ", nickname=" + nickname + ", space=" + space + ", point=" + point + ", context=" + context
				+ ", birth=" + birth + ", gender=" + gender + ", status=" + status + "]";
	}



	public char[] getUserNo() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
