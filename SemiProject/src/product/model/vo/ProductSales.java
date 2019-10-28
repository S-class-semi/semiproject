package product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ProductSales implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8935533308902479212L;

	private int pay_num;
	private int p_num;
	private String p_name;
	private int p_price;
	private Date p_time;
	private String flog;
	private int sum;
	public ProductSales() {
		super();
	}
	public ProductSales(int pay_num, int p_num, String p_name, int p_price, Date p_time, String flog) {
		super();
		this.pay_num = pay_num;
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_time = p_time;
		this.flog = flog;
	}
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public ProductSales(int sum) {
		super();
		this.sum = sum;
	}
	public ProductSales(int pay_num, int p_num, String p_name, int p_price, String flog) {
		super();
		this.pay_num = pay_num;
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_price = p_price;
		this.flog = flog;
	}
	
	
	public ProductSales(String p_name) {
		super();
		this.p_name = p_name;
	}
	public ProductSales(String p_name, String flog) {
		super();
		this.p_name = p_name;
		this.flog = flog;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public Date getP_time() {
		return p_time;
	}
	public void setP_time(Date p_time) {
		this.p_time = p_time;
	}
	public String getFlog() {
		return flog;
	}
	public void setFlog(String flog) {
		this.flog = flog;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ProductSales [pay_num=" + pay_num + ", p_num=" + p_num + ", p_name=" + p_name + ", p_price=" + p_price
				+ ", p_time=" + p_time + ", flog=" + flog + ", sum=" + sum + "]";
	}
	public ProductSales(int p_num, String p_name, int p_price) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_price = p_price;
	}
	
	
	
}
