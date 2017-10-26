package com.etc.lzxp.service;


import java.util.List;

import com.etc.lzxp.dao.OrdersDao;
import com.etc.lzxp.entity.Goods_order;


public class OrdersService {
	private OrdersDao od = new OrdersDao();
	
	/**
	 * Ìí¼Ó¶©µ¥
	 * @param scd
	 * @return
	 */
	public boolean addOrders(Goods_order goodsOrder){
		return od.addOrders(goodsOrder);
	}
	
	public boolean updateOrders(int orederid,String username){
		return od.updateOrders(orederid,username);
	}
	
	public List<Goods_order> selectByName(String username){
		return od.selectByName(username);
	}
	
	public List<Goods_order> selectById(int orderid){
		return od.selectById(orderid);
	}
}
