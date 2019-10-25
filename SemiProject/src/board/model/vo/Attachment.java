package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2655181871562762115L;
	private int fId;
	private int bId;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String status;
	
	
	public Attachment() {
		super();
	}


	public Attachment(int fId, int bId, String originName, String changeName, String filePath, Date uploadDate,
			int fileLevel, String status) {
		super();
		this.fId = fId;
		this.bId = bId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}


	public Attachment(int bId, String changeName) {
		this.bId = bId;
		this.changeName = changeName;
	}


	public int getfId() {
		return fId;
	}


	public void setfId(int fId) {
		this.fId = fId;
	}


	public int getbId() {
		return bId;
	}


	public void setbId(int bId) {
		this.bId = bId;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	public int getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
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
		return "Attachment [fId=" + fId + ", bId=" + bId + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", status="
				+ status + "]";
	}
	


}
