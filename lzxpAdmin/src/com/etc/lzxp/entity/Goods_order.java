package com.etc.lzxp.entity;

import java.io.Serializable;

public class Goods_order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String ORDERID;
	private String ORDERDATE;
	private String ORDERCONTENT;
	private double ORDERBALANCE;
	private String USERNAME;
	private String USERTEL;
	private String USERADDRESS;
	private String SALLERSTATE;
	private String USERSTATE;
	public String getORDERID() {
		return ORDERID;
	}
	public void setORDERID(String oRDERID) {
		ORDERID = oRDERID;
	}
	public String getORDERDATE() {
		return ORDERDATE;
	}
	public void setORDERDATE(String oRDERDATE) {
		ORDERDATE = oRDERDATE;
	}
	public String getORDERCONTENT() {
		return ORDERCONTENT;
	}
	public void setORDERCONTENT(String oRDERCONTENT) {
		ORDERCONTENT = oRDERCONTENT;
	}
	public double getORDERBALANCE() {
		return ORDERBALANCE;
	}
	public void setORDERBALANCE(double oRDERBALANCE) {
		ORDERBALANCE = oRDERBALANCE;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getUSERTEL() {
		return USERTEL;
	}
	public void setUSERTEL(String uSERTEL) {
		USERTEL = uSERTEL;
	}
	public String getUSERADDRESS() {
		return USERADDRESS;
	}
	public void setUSERADDRESS(String uSERADDRESS) {
		USERADDRESS = uSERADDRESS;
	}
	public String getSALLERSTATE() {
		return SALLERSTATE;
	}
	public void setSALLERSTATE(String sALLERSTATE) {
		SALLERSTATE = sALLERSTATE;
	}
	public String getUSERSTATE() {
		return USERSTATE;
	}
	public void setUSERSTATE(String uSERSTATE) {
		USERSTATE = uSERSTATE;
	}
	public Goods_order(String oRDERID, String oRDERDATE, String oRDERCONTENT, double oRDERBALANCE, String uSERNAME,
			String uSERTEL, String uSERADDRESS, String sALLERSTATE, String uSERSTATE) {
		super();
		ORDERID = oRDERID;
		ORDERDATE = oRDERDATE;
		ORDERCONTENT = oRDERCONTENT;
		ORDERBALANCE = oRDERBALANCE;
		USERNAME = uSERNAME;
		USERTEL = uSERTEL;
		USERADDRESS = uSERADDRESS;
		SALLERSTATE = sALLERSTATE;
		USERSTATE = uSERSTATE;
	}

	public Goods_order() {
		// TODO Auto-generated constructor stub
	}
}
