package product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable{
	
/**
	 * 
	 */
	private static final long serialVersionUID = 4531729822786885808L;
//	ONO	NUMBER
//	PNO	NUMBER
//	QUANTITY	NUMBER
//	BUYDATE	DATE
//	STATUS	VARCHAR2(5 BYTE)
//	USER_ID	VARCHAR2(20 BYTE)
	private int ono;
	private int pno;
	private String pname;
	private int quantity;
	private Date buydate;
	private String status;
	private String user_Id;
	
	public Order() {
		
	}

	public Order(int ono, int pno, String pname, int quantity, Date buydate, String status, String user_Id) {
		super();
		this.ono = ono;
		this.pno = pno;
		this.pname = pname;
		this.quantity = quantity;
		this.buydate = buydate;
		this.status = status;
		this.user_Id = user_Id;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getBuydate() {
		return buydate;
	}

	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Order [ono=" + ono + ", pno=" + pno + ", pname=" + pname + ", quantity=" + quantity + ", buydate="
				+ buydate + ", status=" + status + ", user_Id=" + user_Id + "]";
	}
	
}