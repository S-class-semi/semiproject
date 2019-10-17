package product.model.vo;

import java.io.Serializable;

public class ProductPage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3401960319111458105L;

	private int currentPage;
	private int pListCount;
	private int limit;
	private int maxPage;
	private int startPage;
	private int endPage;
	public ProductPage() {
		super();
	}
	public ProductPage(int currentPage, int pListCount, int limit, int maxPage, int startPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.pListCount = pListCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getpListCount() {
		return pListCount;
	}
	public void setpListCount(int pListCount) {
		this.pListCount = pListCount;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ProductPage [currentPage=" + currentPage + ", pListCount=" + pListCount + ", limit=" + limit
				+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
