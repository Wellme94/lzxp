package com.etc.lzxp.entity;

/**
 * @author Administrator
 *用户详情类
 */
public class Users_info {
	private int INFOID;
	private int USERID;
	private String USERSEX;
	private String USERTEL;
	public Users_info() {
		// TODO Auto-generated constructor stub
	}
	public Users_info(int iNFOID, int uSERID, String uSERSEX, String uSERTEL) {
		super();
		INFOID = iNFOID;
		USERID = uSERID;
		USERSEX = uSERSEX;
		USERTEL = uSERTEL;
	}
	public int getINFOID() {
		return INFOID;
	}
	public void setINFOID(int iNFOID) {
		INFOID = iNFOID;
	}
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public String getUSERSEX() {
		return USERSEX;
	}
	public void setUSERSEX(String uSERSEX) {
		USERSEX = uSERSEX;
	}
	public String getUSERTEL() {
		return USERTEL;
	}
	public void setUSERTEL(String uSERTEL) {
		USERTEL = uSERTEL;
	}
	
}
