package product.model.vo;

import java.io.Serializable;

public class ProductInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4699021069772009175L;
	
	private int p_number;
	private String p_code;
	private String pro_code;
	private String p_name;
	private String p_price;
	private String p_info;
	private String c_name;
	
	
	
	public ProductInfo() {
		super();
	}
	public ProductInfo(String p_code, String p_name, String p_price, String p_info, String c_name) {
		super();
		this.p_code = p_code;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_info = p_info;
		this.c_name = c_name;
	}


	public ProductInfo(int p_number, String p_code, String pro_code, String p_name, String p_price, String p_info,
			String c_name) {
		super();
		this.p_number = p_number;
		this.p_code = p_code;
		this.pro_code = pro_code;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_info = p_info;
		this.c_name = c_name;
	}
	
	
	
	
	public ProductInfo(String p_code, String pro_code, String p_name, String p_price, String p_info, String c_name) {
		super();
		this.p_code = p_code;
		this.pro_code = pro_code;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_info = p_info;
		this.c_name = c_name;
	}
	
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getPro_code() {
		return pro_code;
	}
	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public int getP_number() {
		return p_number;
	}


	public void setP_number(int p_number) {
		this.p_number = p_number;
	}


	@Override
	public String toString() {
		return "ProductInfo [p_number=" + p_number + ", p_code=" + p_code + ", pro_code=" + pro_code + ", p_name="
				+ p_name + ", p_price=" + p_price + ", p_info=" + p_info + ", c_name=" + c_name + "]";
	}
	
	
	
}
