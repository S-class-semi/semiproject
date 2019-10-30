package payment.model.vo;

public class Userselect {

	private String USER_ID;
	private int P_CODE;
	
	public Userselect() {
		super();
	}

	public Userselect(String uSER_ID, int p_CODE) {
		super();
		USER_ID = uSER_ID;
		P_CODE = p_CODE;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public int getP_CODE() {
		return P_CODE;
	}

	public void setP_CODE(int p_CODE) {
		P_CODE = p_CODE;
	}

	@Override
	public String toString() {
		return "Userselect [USER_ID=" + USER_ID + ", P_CODE=" + P_CODE + "]";
	}


	
}
