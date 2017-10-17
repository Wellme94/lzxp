package com.etc.lzxp.dao;

import com.etc.lzxp.entity.Goods_order;
import com.etc.util.BaseDao;
import com.etc.util.PageData;

/**
 * @author Administrator
 *Goods_order µÄdao
 */
public class GoodsOrderDao {
	
	/**
	 * ÏÔÊ¾¶©µ¥
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public PageData<Goods_order> getOrder(int page,int pageSize){
		return BaseDao.getOraclePage("select * from goods_order", page, pageSize, Goods_order.class, null);
	}
}
