package com.etc.lzxp.service;

import com.etc.lzxp.dao.GoodsOrderDao;
import com.etc.lzxp.entity.Goods_order;
import com.etc.util.PageData;

/**
 * @author Administrator
 *Good_order ��service
 */
public class GoodsOrderService {
	GoodsOrderDao god = new GoodsOrderDao();
	
	
	/**
	 * �����û�����״̬��ʾ����
	 * @param page
	 * @param pageSize
	 * @param userName
	 * @param userState
	 * @return
	 */
	public PageData<Goods_order> getOrder(int page,int pageSize,String userName,String userState){
		return god.getOrder(page, pageSize, userName, userState);
	}
}
