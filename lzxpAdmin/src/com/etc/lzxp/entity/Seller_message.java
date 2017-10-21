package com.etc.lzxp.entity;

/**
 * @author Administrator
 *œ˚œ¢Ã·–—
 */
public class Seller_message {
	private int MESSAGEID;
	private int MESSAGECONTENT;
	
	public Seller_message() {
		// TODO Auto-generated constructor stub
	}

	public Seller_message(int mESSAGEID, int mESSAGECONTENT) {
		super();
		MESSAGEID = mESSAGEID;
		MESSAGECONTENT = mESSAGECONTENT;
	}

	public int getMESSAGEID() {
		return MESSAGEID;
	}

	public void setMESSAGEID(int mESSAGEID) {
		MESSAGEID = mESSAGEID;
	}

	public int getMESSAGECONTENT() {
		return MESSAGECONTENT;
	}

	public void setMESSAGECONTENT(int mESSAGECONTENT) {
		MESSAGECONTENT = mESSAGECONTENT;
	}

	@Override
	public String toString() {
		return "Seller_message [MESSAGEID=" + MESSAGEID + ", MESSAGECONTENT=" + MESSAGECONTENT + "]";
	}
	
}

