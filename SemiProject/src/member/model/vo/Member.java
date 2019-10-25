package member.model.vo;

import java.sql.Date;

public class Member {
	private String user_Id;
	private int user_G;
	private int user_T;
	private String user_Pwd;
	private String nickname;
	private int space;
	private int point;
	private String context;
	private Date birth;
	private String gender;
	private String status;
	
	public Member(String user_Id, int user_G, String nickname, int point, String gender) {
		super();
		this.user_Id = user_Id;
		this.user_G = user_G;
		this.nickname = nickname;
		this.point = point;
		this.gender = gender;
	}

	public Member(String user_Id, String user_Pwd) {
		super();
		this.user_Id = user_Id;
		this.user_Pwd = user_Pwd;
	}

	public Member(int user_G, int point) {
		super();
		this.user_G = user_G;
		this.point = point;
	}

	public Member(String user_Id, String user_Pwd, String nickname, int space) {
		super();
		this.user_Id = user_Id;
		this.user_Pwd = user_Pwd;
		this.nickname = nickname;
		this.space = space;
	}

	public Member() {}

	public Member(String user_Id, int user_G, int user_T, String user_Pwd, String nickname, int space, int point,
			String context, Date birth, String gender, String status) {
		super();
		this.user_Id = user_Id;
		this.user_G = user_G;
		this.user_T = user_T;
		this.user_Pwd = user_Pwd;
		this.nickname = nickname;
		this.space = space;
		this.point = point;
		this.context = context;
		this.birth = birth;
		this.gender = gender;
		this.status = status;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public int getUser_G() {
		return user_G;
	}

	public void setUser_G(int user_G) {
		this.user_G = user_G;
	}

	public int getUser_T() {
		return user_T;
	}

	public void setUser_T(int user_T) {
		this.user_T = user_T;
	}

	public String getUser_Pwd() {
		return user_Pwd;
	}

	public void setUser_Pwd(String user_Pwd) {
		this.user_Pwd = user_Pwd;
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
		return "Member [user_Id=" + user_Id + ", user_G=" + user_G + ", user_T=" + user_T + ", user_Pwd=" + user_Pwd
				+ ", nickname=" + nickname + ", space=" + space + ", point=" + point + ", context=" + context
				+ ", birth=" + birth + ", gender=" + gender + ", status=" + status + "]";
	}
	
	
	
}
