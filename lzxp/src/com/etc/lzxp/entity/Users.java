package com.etc.lzxp.entity;

import java.io.Serializable;

/**
 * @author Administrator
 *�û�ʵ����
 */
public class Users implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6014857340366646613L;
	private int USERID;
	private String USERNAME;
	private String USERPWD;
    public Users() {
		// TODO Auto-generated constructor stub
	}
	public Users(int uSERID, String uSERNAME, String uSERPWD) {
		super();
		USERID = uSERID;
		USERNAME = uSERNAME;
		USERPWD = uSERPWD;
	}
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getUSERPWD() {
		return USERPWD;
	}
	public void setUSERPWD(String uSERPWD) {
		USERPWD = uSERPWD;
	}
	@Override
	public String toString() {
		return "Users [USERID=" + USERID + ", USERNAME=" + USERNAME + ", USERPWD=" + USERPWD + "]";
	}
	
	
}
