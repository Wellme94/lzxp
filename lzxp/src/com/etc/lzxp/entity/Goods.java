package com.etc.lzxp.entity;

public class Goods {
private  int     GOODSID;
private  String 	GOODSNAME;
private  int 	STYPEID;
private  double	GOODSPRICE;
private  String 	GOODSCONTENT;
private  int 	GOODSSTOCK;
private  int     GOODSSTATE;
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

@Override
public String toString() {
	return "Goods [GOODSID=" + GOODSID + ", GOODSNAME=" + GOODSNAME + ", STYPEID=" + STYPEID + ", GOODSPRICE="
			+ GOODSPRICE + ", GOODSCONTENT=" + GOODSCONTENT + ", GOODSSTOCK=" + GOODSSTOCK + ", GOODSSTATE="
			+ GOODSSTATE + "]";
}
public Goods() {
	// TODO Auto-generated constructor stub
}
}
