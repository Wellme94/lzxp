package com.etc.lzxp.entity;

/**
 * @author Administrator
 *商品小类
 */
public class Goods_stype {
	private int STYPEID;//小类型id
	private int LTYPEID;//大类型id
	private String STYPENAME;//小类型名
	public Goods_stype() {
		// TODO Auto-generated constructor stub
	}
	public Goods_stype(int sTYPEID, int lTYPEID, String sTYPENAME) {
		super();
		STYPEID = sTYPEID;
		LTYPEID = lTYPEID;
		STYPENAME = sTYPENAME;
	}
	public int getSTYPEID() {
		return STYPEID;
	}
	public void setSTYPEID(int sTYPEID) {
		STYPEID = sTYPEID;
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
	@Override
	public String toString() {
		return "Goods_stype [STYPEID=" + STYPEID + ", LTYPEID=" + LTYPEID + ", STYPENAME=" + STYPENAME + "]";
	}
	
	
}
