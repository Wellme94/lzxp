package com.etc.lzxp.entity;
/**
 * 显示商品 类结合表Goods  Goods_Picture
 * @author 
 *
 */
public class ShowGoods {
	private  int     GOODSID;
	private  String 	GOODSNAME;
	private  int 	STYPEID;
	private  double	GOODSPRICE;
	private  String 	GOODSCONTENT;
	private  int 	GOODSSTOCK;
	private  int     GOODSSTATE;   
	private int PICTUREID;
	private String PICTUREADDRESS;
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
	public ShowGoods(int gOODSID, String gOODSNAME, int sTYPEID, double gOODSPRICE, String gOODSCONTENT, int gOODSSTOCK,
			int gOODSSTATE, int pICTUREID, String pICTUREADDRESS) {
		super();
		GOODSID = gOODSID;
		GOODSNAME = gOODSNAME;
		STYPEID = sTYPEID;
		GOODSPRICE = gOODSPRICE;
		GOODSCONTENT = gOODSCONTENT;
		GOODSSTOCK = gOODSSTOCK;
		GOODSSTATE = gOODSSTATE;
		PICTUREID = pICTUREID;
		PICTUREADDRESS = pICTUREADDRESS;
	}

	@Override
	public String toString() {
		return "ShowGoods [GOODSID=" + GOODSID + ", GOODSNAME=" + GOODSNAME + ", STYPEID=" + STYPEID + ", GOODSPRICE="
				+ GOODSPRICE + ", GOODSCONTENT=" + GOODSCONTENT + ", GOODSSTOCK=" + GOODSSTOCK + ", GOODSSTATE="
				+ GOODSSTATE + ", PICTUREID=" + PICTUREID + ", PICTUREADDRESS=" + PICTUREADDRESS + "]";
	}
	public ShowGoods() {
		// TODO Auto-generated constructor stub
	}
	
	
}
