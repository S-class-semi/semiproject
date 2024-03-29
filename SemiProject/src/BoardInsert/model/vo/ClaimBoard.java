package BoardInsert.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ClaimBoard implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int bId; 		// 게시판 고유 번호
	private int bType;		// 게시판 타입(1. 일반 게시판, 2. 사진 게시판)
	private String cId;		// 게시판 분류(공통, 운동, 등산, 게임, 낚시, 요리, 기타)
	private String bTitle;	// 게시판 제목
	private String bContent;// 게시판 내용
	private String bWriter;	// 게시판 작성자
	private int bCount;		// 게시판 조회수
	private Date createDate;// 게시판 작성일
	private Date modifyDate;// 게시판 수정일
	private String status;	// 게시판 상태(Y,N)
	
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public int getbType() {
		return bType;
	}
	public void setbType(int bType) {
		this.bType = bType;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "ClaimBoard [bId=" + bId + ", bType=" + bType + ", cId=" + cId + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", bWriter=" + bWriter + ", bCount=" + bCount + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	

	
}

	