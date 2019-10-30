package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QNA implements Serializable{
	
/**
	 * 
	 */
	private static final long serialVersionUID = 3471439654131312419L;
//	BID   NUMBER,
//	BTYPE   NUMBER,
//	BNAME   VARCHAR2(20),
//	BTITLE   VARCHAR2(100 BYTE),
//	BTEXT   VARCHAR2(4000 BYTE),
//	BWRITTER   VARCHAR2(40 BYTE),
//	BTIME   DATE default sysdate,
//	STATUS   VARCHAR2(10 BYTE)
	
	private int bId;
	private int bType;
	private String bName;
	private String bTitle;
	private String bText;
	private String bWritter;
	private Date bTime;
	private String status;
	
	public QNA() {
		
	}

	public QNA(int bId, int bType, String bName, String bTitle, String bText, String bWritter, Date bTime,
			String status) {
		super();
		this.bId = bId;
		this.bType = bType;
		this.bName = bName;
		this.bTitle = bTitle;
		this.bText = bText;
		this.bWritter = bWritter;
		this.bTime = bTime;
		this.status = status;
	}

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

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
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
		return "QNA [bId=" + bId + ", bType=" + bType + ", bName=" + bName + ", bTitle=" + bTitle + ", bText=" + bText
				+ ", bWritter=" + bWritter + ", bTime=" + bTime + ", status=" + status + "]";
	}

	

}
