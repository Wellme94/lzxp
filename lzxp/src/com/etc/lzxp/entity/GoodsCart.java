package com.etc.lzxp.entity;

public class GoodsCart {
	private String USERNAME;
	private int GOODSID;
	private int GOODSCOUNT;
	private double GOODSPRICE;
	private String GOODSNAME;
	private String GOODSPICTURE;
	public GoodsCart(String uSERNAME, int gOODSID, int gOODSCOUNT, double gOODSPRICE, String gOODSNAME,
			String gOODSPICTURE) {
		super();
		USERNAME = uSERNAME;
		GOODSID = gOODSID;
		GOODSCOUNT = gOODSCOUNT;
		GOODSPRICE = gOODSPRICE;
		GOODSNAME = gOODSNAME;
		GOODSPICTURE = gOODSPICTURE;
	}
	public String getGOODSPICTURE() {
		return GOODSPICTURE;
	}
	public void setGOODSPICTURE(String gOODSPICTURE) {
		GOODSPICTURE = gOODSPICTURE;
	}
	public String getGOODSNAME() {
		return GOODSNAME;
	}
	public void setGOODSNAME(String gOODSNAME) {
		GOODSNAME = gOODSNAME;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public int getGOODSID() {
		return GOODSID;
	}
	public void setGOODSID(int gOODSID) {
		GOODSID = gOODSID;
	}
	public int getGOODSCOUNT() {
		return GOODSCOUNT;
	}
	public void setGOODSCOUNT(int gOODSCOUNT) {
		GOODSCOUNT = gOODSCOUNT;
	}
	public double getGOODSPRICE() {
		return GOODSPRICE;
	}
	public void setGOODSPRICE(double gOODSPRICE) {
		GOODSPRICE = gOODSPRICE;
	}
	
	
	
	@Override
	public String toString() {
		return "GoodsCart [USERNAME=" + USERNAME + ", GOODSID=" + GOODSID + ", GOODSCOUNT=" + GOODSCOUNT
				+ ", GOODSPRICE=" + GOODSPRICE + ", GOODSNAME=" + GOODSNAME + ", GOODSPICTURE=" + GOODSPICTURE + "]";
	}
	
	
	
	public GoodsCart(int gOODSID, int gOODSCOUNT, double gOODSPRICE, String gOODSNAME) {
		super();
		GOODSID = gOODSID;
		GOODSCOUNT = gOODSCOUNT;
		GOODSPRICE = gOODSPRICE;
		GOODSNAME = gOODSNAME;
	}
	
	
	public GoodsCart(int gOODSID, int gOODSCOUNT, double gOODSPRICE, String gOODSNAME, String gOODSPICTURE) {
		super();
		GOODSID = gOODSID;
		GOODSCOUNT = gOODSCOUNT;
		GOODSPRICE = gOODSPRICE;
		GOODSNAME = gOODSNAME;
		GOODSPICTURE = gOODSPICTURE;
	}
	public GoodsCart() {
		// TODO Auto-generated constructor stub
	}
}
