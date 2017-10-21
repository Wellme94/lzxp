package com.etc.lzxp.entity;

import java.io.Serializable;


/**
 * @author Administrator
 *goods goods_stype goods_picture联合类
 */
public class GoodsStypePicture implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8195160269790188083L;
	private int GOODSID;
	private String GOODSNAME;
	private int STYPEID;
	private double GOODSPRICE;
	private String GOODSCONTENT;
	private int GOODSSTOCK;
	private int GOODSSTATE;
	private int LTYPEID;//大类型id
	private String STYPENAME;//小类型名
	private int PICTUREID;
	private String PICTUREADDRESS;
	public GoodsStypePicture() {
		// TODO Auto-generated constructor stub
	}
	public GoodsStypePicture(int gOODSID, String gOODSNAME, int sTYPEID, double gOODSPRICE, String gOODSCONTENT,
			int gOODSSTOCK, int gOODSSTATE, int lTYPEID, String sTYPENAME, int pICTUREID, String pICTUREADDRESS) {
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
		PICTUREID = pICTUREID;
		PICTUREADDRESS = pICTUREADDRESS;
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
	public int getPICTUREID() {
		return PICTUREID;
	}
	public void setPICTUREID(int pICTUREID) {
		PICTUREID = pICTUREID;
	}
	public String getPICTUREADDRESS() {
		return PICTUREADDRESS;
	}
	public void setPICTUREADDRESS(String pICTUREADDRESS) {
		PICTUREADDRESS = pICTUREADDRESS;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GoodsStypePicture [GOODSID=" + GOODSID + ", GOODSNAME=" + GOODSNAME + ", STYPEID=" + STYPEID
				+ ", GOODSPRICE=" + GOODSPRICE + ", GOODSCONTENT=" + GOODSCONTENT + ", GOODSSTOCK=" + GOODSSTOCK
				+ ", GOODSSTATE=" + GOODSSTATE + ", LTYPEID=" + LTYPEID + ", STYPENAME=" + STYPENAME + ", PICTUREID="
				+ PICTUREID + ", PICTUREADDRESS=" + PICTUREADDRESS + "]";
	}
	
	
}
