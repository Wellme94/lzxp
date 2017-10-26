﻿package com.etc.lzxp.dao;

import com.etc.lzxp.entity.Goods_order;
import com.etc.util.BaseDao;
import com.etc.util.PageData;

/**
 * @author Administrator
 *Goods_order 的dao
 */
public class GoodsOrderDao {
	
	/**
	 * 根据用户名和状态显示订单
	 * @param page
	 * @param pageSize
	 * @param userName
	 * @param userState
	 * @return
	 */
	public PageData<Goods_order> getOrder(int page,int pageSize,String userName,String userState){
		return BaseDao.getOraclePage("select * from goods_order where username=? and userstate like ? order by to_date('ORDERDATE','yyyy-mm-dd hh24:mi:ss') desc", page, pageSize, Goods_order.class, userName,userState);
	}
	
	
	/**
	 * 通过订单id 用户确认收货
	 * @param orderId
	 * @return
	 */
	public boolean updateOrderUserState(int orderId){
		
		return BaseDao.execute("update goods_order set userstate='已收货',sallerstate='已收货' where orderid=?", orderId)>0;
	}
}
