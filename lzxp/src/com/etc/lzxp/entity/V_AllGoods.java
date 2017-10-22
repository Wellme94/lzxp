package com.etc.lzxp.entity;

public class V_AllGoods {

    private int LTYPEID;
	private int STYPEID;
	private int GOODSID;
	private String GOODSNAME;
	private double GOODSPRICE;
	private String GOODSCONTENT;
	private int GOODSSTATE;
	private String PICTUREADDRESS;
	public int getLTYPEID() {
		return LTYPEID;
	}
	public void setLTYPEID(int lTYPEID) {
		LTYPEID = lTYPEID;
	}
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
	public String getPICTUREADDRESS() {
		return PICTUREADDRESS;
	}
	public void setPICTUREADDRESS(String pICTUREADDRESS) {
		PICTUREADDRESS = pICTUREADDRESS;
	}
	public V_AllGoods(int lTYPEID, int sTYPEID, int gOODSID, String gOODSNAME, double gOODSPRICE, String gOODSCONTENT,
			int gOODSSTATE, String pICTUREADDRESS) {
		super();
		LTYPEID = lTYPEID;
		STYPEID = sTYPEID;
		GOODSID = gOODSID;
		GOODSNAME = gOODSNAME;
		GOODSPRICE = gOODSPRICE;
		GOODSCONTENT = gOODSCONTENT;
		GOODSSTATE = gOODSSTATE;
		PICTUREADDRESS = pICTUREADDRESS;
	}
	
	public V_AllGoods() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "V_AllGoods [LTYPEID=" + LTYPEID + ", STYPEID=" + STYPEID + ", GOODSID=" + GOODSID + ", GOODSNAME="
				+ GOODSNAME + ", GOODSPRICE=" + GOODSPRICE + ", GOODSCONTENT=" + GOODSCONTENT + ", GOODSSTATE="
				+ GOODSSTATE + ", PICTUREADDRESS=" + PICTUREADDRESS + "]";
	}
	
	
}
