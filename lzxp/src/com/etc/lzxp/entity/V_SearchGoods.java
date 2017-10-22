package com.etc.lzxp.entity;

public class V_SearchGoods {

	private int STYPEID;
	private int GOODSID;
	private String GOODSNAME;
	private double GOODSPRICE;
	private String GOODSCONTENT;
	private int GOODSSTATE;
	private String STYPENAME;
	private String PICTUREADDRESS;
	public int getSTYPEID() {
		return STYPEID;
	}
	public void setSTYPEID(int sTYPEID) {
		STYPEID = sTYPEID;
	}
	public int getGOODSID() {
		return GOODSID;
	}
	public void setGOODSID(int gOODSID) {
		GOODSID = gOODSID;
	}
	public String getGOODSNAME() {
		return GOODSNAME;
	}
	public void setGOODSNAME(String gOODSNAME) {
		GOODSNAME = gOODSNAME;
	}
	public double getGOODSPRICE() {
		return GOODSPRICE;
	}
	public void setGOODSPRICE(double gOODSPRICE) {
		GOODSPRICE = gOODSPRICE;
	}
	public String getGOODSCONTENT() {
		return GOODSCONTENT;
	}
	public void setGOODSCONTENT(String gOODSCONTENT) {
		GOODSCONTENT = gOODSCONTENT;
	}
	public int getGOODSSTATE() {
		return GOODSSTATE;
	}
	public void setGOODSSTATE(int gOODSSTATE) {
		GOODSSTATE = gOODSSTATE;
	}
	public String getSTYPENAME() {
		return STYPENAME;
	}
	public void setSTYPENAME(String sTYPENAME) {
		STYPENAME = sTYPENAME;
	}
	public String getPICTUREADDRESS() {
		return PICTUREADDRESS;
	}
	public void setPICTUREADDRESS(String pICTUREADDRESS) {
		PICTUREADDRESS = pICTUREADDRESS;
	}
	public V_SearchGoods(int sTYPEID, int gOODSID, String gOODSNAME, double gOODSPRICE, String gOODSCONTENT,
			int gOODSSTATE, String sTYPENAME, String pICTUREADDRESS) {
		super();
		STYPEID = sTYPEID;
		GOODSID = gOODSID;
		GOODSNAME = gOODSNAME;
		GOODSPRICE = gOODSPRICE;
		GOODSCONTENT = gOODSCONTENT;
		GOODSSTATE = gOODSSTATE;
		STYPENAME = sTYPENAME;
		PICTUREADDRESS = pICTUREADDRESS;
	}
	@Override
	public String toString() {
		return "V_SearchGoods [STYPEID=" + STYPEID + ", GOODSID=" + GOODSID + ", GOODSNAME=" + GOODSNAME
				+ ", GOODSPRICE=" + GOODSPRICE + ", GOODSCONTENT=" + GOODSCONTENT + ", GOODSSTATE=" + GOODSSTATE
				+ ", STYPENAME=" + STYPENAME + ", PICTUREADDRESS=" + PICTUREADDRESS + "]";
	} 
	
	public V_SearchGoods() {
		// TODO Auto-generated constructor stub
	}
} 
