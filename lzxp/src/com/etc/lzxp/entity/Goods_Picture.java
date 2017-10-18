package com.etc.lzxp.entity;

public class Goods_Picture {

	private int PICTUREID;
	private int GOODSID;
	private String PICTUREADDRESS;
	public int getPICTUREID() {
		return PICTUREID;
	}
	public void setPICTUREID(int pICTUREID) {
		PICTUREID = pICTUREID;
	}
	public int getGOODSID() {
		return GOODSID;
	}
	public void setGOODSID(int gOODSID) {
		GOODSID = gOODSID;
	}
	public String getPICTUREADDRESS() {
		return PICTUREADDRESS;
	}
	public void setPICTUREADDRESS(String pICTUREADDRESS) {
		PICTUREADDRESS = pICTUREADDRESS;
	}
	public Goods_Picture(int pICTUREID, int gOODSID, String pICTUREADDRESS) {
		super();
		PICTUREID = pICTUREID;
		GOODSID = gOODSID;
		PICTUREADDRESS = pICTUREADDRESS;
	}
	
	
	@Override
	public String toString() {
		return "Goods_Picture [PICTUREID=" + PICTUREID + ", GOODSID=" + GOODSID + ", PICTUREADDRESS=" + PICTUREADDRESS
				+ "]";
	}
	public Goods_Picture() {
		// TODO Auto-generated constructor stub
	}
}
