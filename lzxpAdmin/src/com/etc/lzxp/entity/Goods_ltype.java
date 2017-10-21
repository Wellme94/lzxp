package com.etc.lzxp.entity;

import java.io.Serializable;

public class Goods_ltype implements Serializable{

	/**
	 * 商品大类的实体类
	 */
	private static final long serialVersionUID = 1L;
	
	private int LTYPEID;
	private String LTYPENAME;
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
	public Goods_ltype(int lTYPEID, String lTYPENAME) {
		super();
		LTYPEID = lTYPEID;
		LTYPENAME = lTYPENAME;
	}
	
	public Goods_ltype() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Goods_ltype [LTYPEID=" + LTYPEID + ", LTYPENAME=" + LTYPENAME + "]";
	}
	
}
