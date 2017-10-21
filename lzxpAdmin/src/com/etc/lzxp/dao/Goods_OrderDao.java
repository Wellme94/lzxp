package com.etc.lzxp.dao;

import java.util.List;

import com.etc.lzxp.entity.Goods_order;
import com.etc.util.BaseDao;

public class Goods_OrderDao {
	public List<Goods_order> getAllGOBySallerState_WJD() {
		return (List<Goods_order>) BaseDao.select("select * from goods_order where SALLERSTATE=?",
				Goods_order.class, "未接单");
	}
	public List<Goods_order> getAllGOBySallerState_NotWJD() {
		return (List<Goods_order>) BaseDao.select( "select * from goods_order where SALLERSTATE!='未接单'",
				Goods_order.class, null);
	}
	
	/**
	 * 修改
	 * @param 
	 * @return
	 */
	public boolean uGOByIdSS_WJD(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='已接单' where ORDERID=? and SALLERSTATE=?",
				goods_Order.getORDERID(),
				goods_Order.getSALLERSTATE()) > 0;
	}
	
	public boolean uGOByIdSS_YJD(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='派送中',USERSTATE='待收货' where ORDERID=? and SALLERSTATE=?",
				goods_Order.getORDERID(),
				goods_Order.getSALLERSTATE()) > 0;
	}
	
	public boolean updateGoods_OrderBySallerState_WJD(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='已接单' where SALLERSTATE=?",
				goods_Order.getSALLERSTATE()) > 0;
	}
	
	public boolean updateGoods_OrderBySallerState_YJD(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='派送中',USERSTATE='待收货' where SALLERSTATE=?",
				goods_Order.getSALLERSTATE()) > 0;
	}

	public boolean updateGoods_OrderBySallerState_PSZ(Goods_order goods_Order) {
		return BaseDao.execute("update Goods_Order  set SALLERSTATE='已收货',USERSTATE='已收货' where SALLERSTATE=?",
				goods_Order.getSALLERSTATE()) > 0;
	}
}
