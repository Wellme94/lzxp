package com.etc.lzxp.service;

import com.etc.lzxp.dao.GoodsDao;
import com.etc.lzxp.entity.Goods;

/**
 * ��Ʒ��ķ�����
 * @author zhuzhen
 *
 */
public class GoodsService {
	
	GoodsDao gd = new GoodsDao();
	
	/**
	 * ͨ��GOODSID��ȡ��GOODS
	 * @param goodsId
	 * @return
	 */
	public Goods getGoodsById(int goodsId){
		return gd.getGoodsById(goodsId);
	}
}
