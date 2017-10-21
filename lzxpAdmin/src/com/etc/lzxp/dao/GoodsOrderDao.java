package com.etc.lzxp.dao;

import java.util.List;
import com.etc.lzxp.entity.Goods_order;
import com.etc.util.BaseDao;

public class GoodsOrderDao {
	/**
	 * 显示所有交易信息
	 * @return
	 */
	public List<Goods_order> getAllOrder() {
		return (List<Goods_order>) BaseDao.select("select * from goods_order order by orderDate", Goods_order.class, null);
	}

	/**
	 * 根据ID删除
	 * @param orderId
	 * @return
	 */
	public boolean deleteOrder(int orderId) {
		return BaseDao.execute("delete from goods_order where orderId=?", orderId) > 0;
	}
	
	/**
	 * 根据时间范围查询
	 * @param mindate
	 * @param maxdate
	 * @return
	 */
		public List<Goods_order> getOrderByDate(String mindate, String maxdate) {
			return (List<Goods_order>) BaseDao.select(
					"select * from Goods_order where to_char(orderDate,'yyyy-mm-dd') between ? and ?",
					Goods_order.class, mindate, maxdate);

		}
}
