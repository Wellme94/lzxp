package com.etc.lzxp.entity;

public class UserAddress {
	private int ADDRESSID;
	private int USERID;
	private String USERADDRESS;
	private String RECEIVERTEL;
	private String RECEIVERNAME;
	public String getRECEIVERTEL() {
		return RECEIVERTEL;
	}
	public void setRECEIVERTEL(String rECEIVERTEL) {
		RECEIVERTEL = rECEIVERTEL;
	}
	public String getRECEIVERNAME() {
		return RECEIVERNAME;
	}
	public void setRECEIVERNAME(String rECEIVERNAME) {
		RECEIVERNAME = rECEIVERNAME;
	}
	public int getADDRESSID() {
		return ADDRESSID;
	}
	public void setADDRESSID(int aDDRESSID) {
		ADDRESSID = aDDRESSID;
	}
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public String getUSERADDRESS() {
		return USERADDRESS;
	}
	public void setUSERADDRESS(String uSERADDRESS) {
		USERADDRESS = uSERADDRESS;
	}
	@Override
	public String toString() {
		return "UserAddress [ADDRESSID=" + ADDRESSID + ", USERID=" + USERID + ", USERADDRESS=" + USERADDRESS
				+ ", RECEIVERTEL=" + RECEIVERTEL + ", RECEIVERNAME=" + RECEIVERNAME + "]";
	}
	
	public UserAddress(int aDDRESSID, int uSERID, String uSERADDRESS, String rECEIVERTEL, String rECEIVERNAME) {
		super();
		ADDRESSID = aDDRESSID;
		USERID = uSERID;
		USERADDRESS = uSERADDRESS;
		RECEIVERTEL = rECEIVERTEL;
		RECEIVERNAME = rECEIVERNAME;
	}
	
	public UserAddress() {
		// TODO Auto-generated constructor stub
	}
}
