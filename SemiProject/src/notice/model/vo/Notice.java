package notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int B_NO;//게시판 고유번호
	private int B_TYPE;//게시판카테고리
	private String B_TITLE;//게시판 제목
	private String B_TEXT;//게시판 내용
	private	String USER_ID;//게시판 작성자
	private int B_COUNT;//조회수
	private Date B_TIME;//작성일자
	private String B_FLOG;//삭제여부
	
	public Notice() {
		
	}
	
	public Notice(String USER_ID,String b_TITLE,  String b_TEXT) {
		super();
		this.USER_ID=USER_ID;
		this.B_TITLE = b_TITLE;
		this.B_TEXT =b_TEXT;
	
	}
	

	public Notice(int b_NO, int b_TYPE, String b_TITLE, String b_TEXT, String uSER_ID, int b_COUNT, Date b_TIME) {
		super();
		B_NO = b_NO;
		B_TYPE = b_TYPE;
		B_TITLE = b_TITLE;
		B_TEXT = b_TEXT;
		USER_ID = uSER_ID;
		B_COUNT = b_COUNT;
		B_TIME = b_TIME;
	}

	public Notice(int b_NO, int b_TYPE, String b_TITLE, String b_TEXT, String uSER_ID, int b_COUNT, Date b_TIME,
			String b_FLOG) {
		super();
		B_NO = b_NO;
		B_TYPE = b_TYPE;
		B_TITLE = b_TITLE;
		B_TEXT = b_TEXT;
		USER_ID = uSER_ID;
		B_COUNT = b_COUNT;
		B_TIME = b_TIME;
		B_FLOG = b_FLOG;
	}

	public int getB_NO() {
		return B_NO;
	}

	public void setB_NO(int b_NO) {
		B_NO = b_NO;
	}

	public int getB_TYPE() {
		return B_TYPE;
	}

	public void setB_TYPE(int b_TYPE) {
		B_TYPE = b_TYPE;
	}

	public String getB_TITLE() {
		return B_TITLE;
	}

	public void setB_TITLE(String b_TITLE) {
		B_TITLE = b_TITLE;
	}

	public String getB_TEXT() {
		return B_TEXT;
	}

	public void setB_TEXT(String b_TEXT) {
		B_TEXT = b_TEXT;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public int getB_COUNT() {
		return B_COUNT;
	}

	public void setB_COUNT(int b_COUNT) {
		B_COUNT = b_COUNT;
	}

	public Date getB_TIME() {
		return B_TIME;
	}

	public void setB_TIME(Date b_TIME) {
		B_TIME = b_TIME;
	}

	public String getB_FLOG() {
		return B_FLOG;
	}

	public void setB_FLOG(String b_FLOG) {
		B_FLOG = b_FLOG;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [B_NO=" + B_NO + ", B_TYPE=" + B_TYPE + ", B_TITLE=" + B_TITLE + ", B_TEXT=" + B_TEXT
				+ ", USER_ID=" + USER_ID + ", B_COUNT=" + B_COUNT + ", B_TIME=" + B_TIME + ", B_FLOG=" + B_FLOG + "]";
	}
	
	
}
