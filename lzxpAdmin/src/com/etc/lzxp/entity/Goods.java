package com.etc.lzxp.entity;

import java.io.Serializable;
/**
 * 商品实体类
 * @author acer
 *
 */
public class Goods implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int GOODSID;
	private String GOODSNAME;
	private int STYPEID;
	private double GOODSPRICE;
	private String GOODSCONTENT;
	private int GOODSSTOCK;
	private int GOODSSTATE;
	
	

	public Goods(int gOODSID, String gOODSNAME, int sTYPEID, double gOODSPRICE, String gOODSCONTENT, int gOODSSTOCK,
			int gOODSSTATE) {
		super();
		GOODSID = gOODSID;
		GOODSNAME = gOODSNAME;
		STYPEID = sTYPEID;
		GOODSPRICE = gOODSPRICE;
		GOODSCONTENT = gOODSCONTENT;
		GOODSSTOCK = gOODSSTOCK;
		GOODSSTATE = gOODSSTATE;
	}
	
	public Goods() {
		// TODO Auto-generated constructor stub
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Goods [GOODSID=" + GOODSID + ", GOODSNAME=" + GOODSNAME + ", STYPEID=" + STYPEID + ", GOODSPRICE="
				+ GOODSPRICE + ", GOODSCONTENT=" + GOODSCONTENT + ", GOODSSTOCK=" + GOODSSTOCK + ", GOODSSTATE="
				+ GOODSSTATE + "]";
	}
	
	

}
