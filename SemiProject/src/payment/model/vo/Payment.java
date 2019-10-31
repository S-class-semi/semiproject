package payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Payment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9136359375880192792L;

	private String user_id;
	private String o_name;
	private String o_phone;
	private String p_name;
	private String p_code;
	private String Address;
	private String box;
	private String email;
	private String payselect;
	
	
	public Payment(String user_id, String o_name, String o_phone, String p_name, String p_code, String address,
			String box, String email, String payselect, String totalprice) {
		super();
		this.user_id = user_id;
		this.o_name = o_name;
		this.o_phone = o_phone;
		this.p_name = p_name;
		this.p_code = p_code;
		Address = address;
		this.box = box;
		this.email = email;
		this.payselect = payselect;
		this.totalprice = totalprice;
	}

	public Payment(String user_id, String o_name, String o_phone, String p_name, String address, String box,
			String email, String payselect, String totalprice) {
		super();
		this.user_id = user_id;
		this.o_name = o_name;
		this.o_phone = o_phone;
		this.p_name = p_name;
		Address = address;
		this.box = box;
		this.email = email;
		this.payselect = payselect;
		this.totalprice = totalprice;
	}
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	private String totalprice;
	public Payment() {
		super();
	}
	public Payment(String user_id, String o_name, String o_phone, String address, String box, String email,
			String payselect, String totalprice) {
		super();
		this.user_id = user_id;
		this.o_name = o_name;
		this.o_phone = o_phone;
		Address = address;
		this.box = box;
		this.email = email;
		this.payselect = payselect;
		this.totalprice = totalprice;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_phone() {
		return o_phone;
	}
	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getBox() {
		return box;
	}
	public void setBox(String box) {
		this.box = box;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPayselect() {
		return payselect;
	}
	public void setPayselect(String payselect) {
		this.payselect = payselect;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	@Override
	public String toString() {
		return "Payment [user_id=" + user_id + ", o_name=" + o_name + ", o_phone=" + o_phone + ", p_name=" + p_name
				+ ", p_code=" + p_code + ", Address=" + Address + ", box=" + box + ", email=" + email + ", payselect="
				+ payselect + ", totalprice=" + totalprice + "]";
	}

	
	 
	 
	 
	}
