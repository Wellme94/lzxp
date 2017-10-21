package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.GoodsOrderDao;
import com.etc.lzxp.entity.Goods_order;

public class GoodsOrderService {

	GoodsOrderDao god=new GoodsOrderDao();
	/**
	 * 显示所有交易信息
	 * @return
	 */
	public List<Goods_order> getAllOrder(){
		return god.getAllOrder();
	}
	
	/**
	 * 根据ID删除
	 * @param orderId
	 * @return
	 */
	public boolean deleteOrder(int orderId){
		return god.deleteOrder(orderId);
	}
	
	/**
	 * 根据时间范围查询
	 * @param mindate
	 * @param maxdate
	 * @return
	 */
	public List<Goods_order> getOrderByDate(String mindate, String maxdate){
		return god.getOrderByDate(mindate, maxdate);
	}
}
