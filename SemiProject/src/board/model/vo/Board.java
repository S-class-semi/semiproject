package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5219066150385199445L;
	private int B_NO;//게시판 고유번호
	private String B_TYPE;//게시판카테고리
	private	int B_NAME;//게시판 종류
	private String B_TITLE;//게시판 제목
	private String B_TEXT;//게시판 내용
	private	String USER_ID;//게시판 작성자
	private Date B_TIME;//작성일자
	private int B_COUNT;//조회수
	private String B_FLOG;//삭제여부
	
	
	public Board() {
		super();
	}


	public Board(int b_NO, String b_TYPE, int b_NAME, String b_TITLE, String b_TEXT, String uSER_ID, Date b_TIME,
			int b_COUNT, String b_FLOG) {
		super();
		B_NO = b_NO;
		B_TYPE = b_TYPE;
		B_NAME = b_NAME;
		B_TITLE = b_TITLE;
		B_TEXT = b_TEXT;
		USER_ID = uSER_ID;
		B_TIME = b_TIME;
		B_COUNT = b_COUNT;
		B_FLOG = b_FLOG;
	}


	public int getB_NO() {
		return B_NO;
	}


	public void setB_NO(int b_NO) {
		B_NO = b_NO;
	}


	public String getB_TYPE() {
		return B_TYPE;
	}


	public void setB_TYPE(String b_TYPE) {
		B_TYPE = b_TYPE;
	}


	public int getB_NAME() {
		return B_NAME;
	}


	public void setB_NAME(int b_NAME) {
		B_NAME = b_NAME;
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


	public Date getB_TIME() {
		return B_TIME;
	}


	public void setB_TIME(Date b_TIME) {
		B_TIME = b_TIME;
	}


	public int getB_COUNT() {
		return B_COUNT;
	}


	public void setB_COUNT(int b_COUNT) {
		B_COUNT = b_COUNT;
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
		return "Board [B_NO=" + B_NO + ", B_TYPE=" + B_TYPE + ", B_NAME=" + B_NAME + ", B_TITLE=" + B_TITLE
				+ ", B_TEXT=" + B_TEXT + ", USER_ID=" + USER_ID + ", B_TIME=" + B_TIME + ", B_COUNT=" + B_COUNT
				+ ", B_FLOG=" + B_FLOG + "]";
	}


		
}