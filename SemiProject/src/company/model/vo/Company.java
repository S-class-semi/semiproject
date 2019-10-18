package company.model.vo;

import java.io.Serializable;

public class Company implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8080893958562438547L;
	
	private String c_name;
	private int user_t;
	private String c_number;
	private String c_add;
	private String c_phone;
	private String c_manager;
	private String c_contact;
	private String c_email;
	private String c_flog;
	public Company() {
		super();
	}
	public Company(String c_name, int user_t, String c_number, String c_add, String c_phone, String c_manager,
			String c_contact, String c_email, String c_flog) {
		super();
		this.c_name = c_name;
		this.user_t = user_t;
		this.c_number = c_number;
		this.c_add = c_add;
		this.c_phone = c_phone;
		this.c_manager = c_manager;
		this.c_contact = c_contact;
		this.c_email = c_email;
		this.c_flog = c_flog;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getUser_t() {
		return user_t;
	}
	public void setUser_t(int user_t) {
		this.user_t = user_t;
	}
	public String getC_number() {
		return c_number;
	}
	public void setC_number(String c_number) {
		this.c_number = c_number;
	}
	public String getC_add() {
		return c_add;
	}
	public void setC_add(String c_add) {
		this.c_add = c_add;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_manager() {
		return c_manager;
	}
	public void setC_manager(String c_manager) {
		this.c_manager = c_manager;
	}
	public String getC_contact() {
		return c_contact;
	}
	public void setC_contact(String c_contact) {
		this.c_contact = c_contact;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_flog() {
		return c_flog;
	}
	public void setC_flog(String c_flog) {
		this.c_flog = c_flog;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Company [c_name=" + c_name + ", user_t=" + user_t + ", c_number=" + c_number + ", c_add=" + c_add
				+ ", c_phone=" + c_phone + ", c_manager=" + c_manager + ", c_contact=" + c_contact + ", c_email="
				+ c_email + ", c_flog=" + c_flog + "]";
	}
	
	
}
