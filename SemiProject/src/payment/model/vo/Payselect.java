package payment.model.vo;

public class Payselect {

	private int PAY_TYPE;
	private String PAY_SELECT;

	
	public Payselect() {
		super();
	}

	public Payselect(int pAY_TYPE, String pAY_SELECT) {
		super();
		PAY_TYPE = pAY_TYPE;
		PAY_SELECT = pAY_SELECT;
	}

	public int getPAY_TYPE() {
		return PAY_TYPE;
	}

	public void setPAY_TYPE(int pAY_TYPE) {
		PAY_TYPE = pAY_TYPE;
	}

	public String getPAY_SELECT() {
		return PAY_SELECT;
	}

	public void setPAY_SELECT(String pAY_SELECT) {
		PAY_SELECT = pAY_SELECT;
	}

	@Override
	public String toString() {
		return "Payselect [PAY_TYPE=" + PAY_TYPE + ", PAY_SELECT=" + PAY_SELECT + "]";
	}

}
