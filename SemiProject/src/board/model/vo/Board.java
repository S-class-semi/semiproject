package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5219066150385199445L;
	private int bNo;//게시판 고유번호
	private String bType;//게시판카테고리
	private String bTitle;//게시판 제목
	private String bText;//게시판 내용
	private	String userId;//게시판 작성자
	private Date bTime;//작성일자
	private int bCount;//조회수
	private String bFlog;//삭제여부
	public Board() {
		super();
	}
	
	
	public Board(int bNo, String bType, String bTitle, String bText, String userId, Date bTime, int bCount) {
		super();
		this.bNo = bNo;
		this.bType = bType;
		this.bTitle = bTitle;
		this.bText = bText;
		this.userId = userId;
		this.bTime = bTime;
		this.bCount = bCount;
	}


	public Board(int bNo, String bType, String bTitle, String bText, String userId, Date bTime, int bCount,
			String bFlog) {
		super();
		this.bNo = bNo;
		this.bType = bType;
		this.bTitle = bTitle;
		this.bText = bText;
		this.userId = userId;
		this.bTime = bTime;
		this.bCount = bCount;
		this.bFlog = bFlog;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbType() {
		return bType;
	}
	public void setbType(String bType) {
		this.bType = bType;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbText() {
		return bText;
	}
	public void setbText(String bText) {
		this.bText = bText;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getbTime() {
		return bTime;
	}
	public void setbTime(Date bTime) {
		this.bTime = bTime;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	public String getbFlog() {
		return bFlog;
	}
	public void setbFlog(String bFlog) {
		this.bFlog = bFlog;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bType=" + bType + ", bTitle=" + bTitle + ", bText=" + bText + ", userId="
				+ userId + ", bTime=" + bTime + ", bCount=" + bCount + ", bFlog=" + bFlog + "]";
	}
	
	
}