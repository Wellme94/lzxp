package com.etc.lzxp.dao;

import com.etc.lzxp.entity.Goods_order;
import com.etc.util.BaseDao;
import com.etc.util.PageData;

/**
 * @author Administrator
 *Goods_order ��dao
 */
public class GoodsOrderDao {
	
	/**
	 * �����û�����״̬��ʾ����
	 * @param page
	 * @param pageSize
	 * @param userName
	 * @param userState
	 * @return
	 */
	public PageData<Goods_order> getOrder(int page,int pageSize,String userName,String userState){
		return BaseDao.getOraclePage("select * from goods_order where username=? and userstate like ? order by to_date('ORDERDATE','yyyy-mm-dd hh24:mi:ss') desc", page, pageSize, Goods_order.class, userName,userState);
	}
}
