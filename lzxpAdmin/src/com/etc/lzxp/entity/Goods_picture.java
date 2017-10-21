package com.etc.lzxp.entity;

import java.io.Serializable;

/**
 * @author Administrator
 *
 */
public class Goods_picture implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4601019300280238402L;
	private int PICTUREID;
	private int GOODSID;
	private String PICTUREADDRESS;
	
	public Goods_picture() {
		// TODO Auto-generated constructor stub
	}

	public Goods_picture(int pICTUREID, int gOODSID, String pICTUREADDRESS) {
		super();
		PICTUREID = pICTUREID;
		GOODSID = gOODSID;
		PICTUREADDRESS = pICTUREADDRESS;
	}

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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Goods_picture [PICTUREID=" + PICTUREID + ", GOODSID=" + GOODSID + ", PICTUREADDRESS=" + PICTUREADDRESS
				+ "]";
	}
	
	
}
