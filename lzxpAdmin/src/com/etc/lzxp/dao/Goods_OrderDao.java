package com.etc.lzxp.dao;

import java.util.List;

import com.etc.lzxp.entity.Goods_order;
import com.etc.util.BaseDao;

public class Goods_OrderDao {
	public List<Goods_order> getAllGOBySallerState_WJD() {
		return (List<Goods_order>) BaseDao.select("select * from goods_order where SALLERSTATE=?",
				Goods_order.class, "δ�ӵ�");
	}
	public List<Goods_order> getAllGOBySallerState_NotWJD() {
		return (List<Goods_order>) BaseDao.select( "select * from goods_order where SALLERSTATE!='δ�ӵ�'",
				Goods_order.class, null);
	}
	
	/**
	 * �޸�
	 * @param 
	 * @return
	 */
	public boolean uGOByIdSS_WJD(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='�ѽӵ�' where ORDERID=? and SALLERSTATE=?",
				goods_Order.getORDERID(),
				goods_Order.getSALLERSTATE()) > 0;
	}
	
	public boolean uGOByIdSS_YJD(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='������',USERSTATE='���ջ�' where ORDERID=? and SALLERSTATE=?",
				goods_Order.getORDERID(),
				goods_Order.getSALLERSTATE()) > 0;
	}
	
	public boolean updateGoods_OrderBySallerState_WJD(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='�ѽӵ�' where SALLERSTATE=?",
				goods_Order.getSALLERSTATE()) > 0;
	}
	
	public boolean updateGoods_OrderBySallerState_YJD(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='������',USERSTATE='���ջ�' where SALLERSTATE=?",
				goods_Order.getSALLERSTATE()) > 0;
	}

	public boolean updateGoods_OrderBySallerState_PSZ(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='���ջ�',USERSTATE='���ջ�' where SALLERSTATE=?",
				goods_Order.getSALLERSTATE()) > 0;
	}
}
