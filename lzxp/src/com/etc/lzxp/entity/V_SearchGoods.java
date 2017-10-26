package com.etc.lzxp.entity;

import java.io.Serializable;

public class V_SearchGoods implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4261997915233516668L;
	private int LTYPEID;
	private String LTYPENAME;
	private int STYPEID;
	private String STYPENAME;
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
	public String getLTYPENAME() {
		return LTYPENAME;
	}
	public void setLTYPENAME(String lTYPENAME) {
		LTYPENAME = lTYPENAME;
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
	
	
	
	public V_SearchGoods(int lTYPEID, String lTYPENAME, int sTYPEID, String sTYPENAME, int gOODSID, String gOODSNAME,
			double gOODSPRICE, String gOODSCONTENT, int gOODSSTATE, String pICTUREADDRESS) {
		super();
		LTYPEID = lTYPEID;
		LTYPENAME = lTYPENAME;
		STYPEID = sTYPEID;
		STYPENAME = sTYPENAME;
		GOODSID = gOODSID;
		GOODSNAME = gOODSNAME;
		GOODSPRICE = gOODSPRICE;
		GOODSCONTENT = gOODSCONTENT;
		GOODSSTATE = gOODSSTATE;
		PICTUREADDRESS = pICTUREADDRESS;
	}
	
	@Override
	public String toString() {
		return "V_SearchGoods [LTYPEID=" + LTYPEID + ", LTYPENAME=" + LTYPENAME + ", STYPEID=" + STYPEID
				+ ", STYPENAME=" + STYPENAME + ", GOODSID=" + GOODSID + ", GOODSNAME=" + GOODSNAME + ", GOODSPRICE="
				+ GOODSPRICE + ", GOODSCONTENT=" + GOODSCONTENT + ", GOODSSTATE=" + GOODSSTATE + ", PICTUREADDRESS="
				+ PICTUREADDRESS + "]";
	}
	public V_SearchGoods() {
		// TODO Auto-generated constructor stub
	}
} 
