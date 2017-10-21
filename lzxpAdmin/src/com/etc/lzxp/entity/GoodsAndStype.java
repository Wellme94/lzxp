package com.etc.lzxp.entity;

import java.io.Serializable;

/**
 * @author Administrator
 *Goods表和Goods_stype 的联合表 实体
 */
public class GoodsAndStype implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 169466162409890080L;
	private int GOODSID;
	private String GOODSNAME;
	private int STYPEID;
	private double GOODSPRICE;
	private String GOODSCONTENT;
	private int GOODSSTOCK;
	private int GOODSSTATE;
	private int LTYPEID;//大类型id
	private String STYPENAME;//小类型名
	
	public GoodsAndStype() {
		// TODO Auto-generated constructor stub
	}
	public GoodsAndStype(int gOODSID, String gOODSNAME, int sTYPEID, double gOODSPRICE, String gOODSCONTENT,
			int gOODSSTOCK, int gOODSSTATE, int lTYPEID, String sTYPENAME) {
		super();
		GOODSID = gOODSID;
		GOODSNAME = gOODSNAME;
		STYPEID = sTYPEID;
		GOODSPRICE = gOODSPRICE;
		GOODSCONTENT = gOODSCONTENT;
		GOODSSTOCK = gOODSSTOCK;
		GOODSSTATE = gOODSSTATE;
		LTYPEID = lTYPEID;
		STYPENAME = sTYPENAME;
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
	public int getSTYPEID() {
		return STYPEID;
	}
	public void setSTYPEID(int sTYPEID) {
		STYPEID = sTYPEID;
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
	public int getGOODSSTOCK() {
		return GOODSSTOCK;
	}
	public void setGOODSSTOCK(int gOODSSTOCK) {
		GOODSSTOCK = gOODSSTOCK;
	}
	public int getGOODSSTATE() {
		return GOODSSTATE;
	}
	public void setGOODSSTATE(int gOODSSTATE) {
		GOODSSTATE = gOODSSTATE;
	}
	public int getLTYPEID() {
		return LTYPEID;
	}
	public void setLTYPEID(int lTYPEID) {
		LTYPEID = lTYPEID;
	}
	public String getSTYPENAME() {
		return STYPENAME;
	}
	public void setSTYPENAME(String sTYPENAME) {
		STYPENAME = sTYPENAME;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GoodsAndStype [GOODSID=" + GOODSID + ", GOODSNAME=" + GOODSNAME + ", STYPEID=" + STYPEID
				+ ", GOODSPRICE=" + GOODSPRICE + ", GOODSCONTENT=" + GOODSCONTENT + ", GOODSSTOCK=" + GOODSSTOCK
				+ ", GOODSSTATE=" + GOODSSTATE + ", LTYPEID=" + LTYPEID + ", STYPENAME=" + STYPENAME + "]";
	}
	
	
}
