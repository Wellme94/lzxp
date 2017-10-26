package com.etc.lzxp.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.etc.lzxp.entity.GoodsCart;
import com.etc.lzxp.entity.Goods_order;
import com.etc.util.BaseDao;

public class OrdersDao {

	/**
	 * 这里先不考虑同步问题 如果要考虑同步问题可以加锁
	 * 
	 * @param scd
	 * @return
	 */
	public boolean addOrders(Goods_order goodsorder) {		
		return (BaseDao.execute(				
				"insert into GOODS_ORDER (ORDERCONTENT,ORDERBALANCE,USERNAME,USERTEL,USERADDRESS) values(?,?,?,?,?)",
				goodsorder.getORDERCONTENT(),goodsorder.getORDERBALANCE(),goodsorder.getUSERNAME(),goodsorder.getUSERTEL(),goodsorder.getUSERADDRESS())> 0);
	}
	
	
	public boolean updateOrders(int orderid,String username) {		
		return (BaseDao.execute("update GOODS_ORDER set SALLERSTATE = '未接单',USERSTATE = '待发货' where ORDERID = ? and USERNAME = ?",orderid,username))>0;
	}
	
	public List<Goods_order> selectByName(String username){	
		return (List<Goods_order>) BaseDao.select("select * from GOODS_ORDER where ORDERID= (select max(cast(GOODS_ORDER.ORDERID as int)) from GOODS_ORDER) and USERNAME=?", Goods_order.class, username);	
	}
	
	
	public List<Goods_order> selectById(int orderid){	
		return (List<Goods_order>) BaseDao.select("select * from GOODS_ORDER where ORDERID= ?", Goods_order.class, orderid);	
	}
}
