package product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ProductImgFile implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1391557858038803253L;
	
	private String c_name;
	private String p_code;
	private String origin_name;
	private String change_name;
	private String file_path;
	private Date upload_date;
	private int file_level;
	private String status;
	
	
	public ProductImgFile() {
		super();
	}
	
	
	public ProductImgFile(String c_name, String p_code, String origin_name, String change_name, String file_path,
			Date upload_date, int file_level, String status) {
		super();
		this.c_name = c_name;
		this.p_code = p_code;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.file_path = file_path;
		this.upload_date = upload_date;
		this.file_level = file_level;
		this.status = status;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getChange_name() {
		return change_name;
	}
	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	public int getFile_level() {
		return file_level;
	}
	public void setFile_level(int file_level) {
		this.file_level = file_level;
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
		return "ProductImgFile [c_name=" + c_name + ", p_code=" + p_code + ", origin_name=" + origin_name
				+ ", change_name=" + change_name + ", file_path=" + file_path + ", upload_date=" + upload_date
				+ ", file_level=" + file_level + ", status=" + status + "]";
	}
	
	
	

	
}
