package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5219066150385199445L;
	private int bId;//게시판 고유번호
	private String bType;//게시판카테고리
	private	int bName;//게시판 종류
	private String bTitle;//게시판 제목
	private String bText;//게시판 내용
	private	String bWritter;//게시판 작성자
	private Date bTime;//작성일자
	private int bCount;//조회수
	private String Status;//삭제여부
	
	
	public Board() {
		super();
	}


	public Board(int bId, String bType, int bName, String bTitle, String bText, String bWritter, Date bTime, int bCount,
			String status) {
		super();
		this.bId = bId;
		this.bType = bType;
		this.bName = bName;
		this.bTitle = bTitle;
		this.bText = bText;
		this.bWritter = bWritter;
		this.bTime = bTime;
		this.bCount = bCount;
		Status = status;
	}


	public int getbId() {
		return bId;
	}


	public void setbId(int bId) {
		this.bId = bId;
	}


	public String getbType() {
		return bType;
	}


	public void setbType(String bType) {
		this.bType = bType;
	}


	public int getbName() {
		return bName;
	}


	public void setbName(int bName) {
		this.bName = bName;
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


	public String getbWritter() {
		return bWritter;
	}


	public void setbWritter(String bWritter) {
		this.bWritter = bWritter;
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


	public String getStatus() {
		return Status;
	}


	public void setStatus(String status) {
		Status = status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Board [bId=" + bId + ", bType=" + bType + ", bName=" + bName + ", bTitle=" + bTitle + ", bText=" + bText
				+ ", bWritter=" + bWritter + ", bTime=" + bTime + ", bCount=" + bCount + ", Status=" + Status + "]";
	}


	


		
}