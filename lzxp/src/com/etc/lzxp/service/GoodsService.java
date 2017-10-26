package com.etc.lzxp.service;

import com.etc.lzxp.dao.GoodsDao;
import com.etc.lzxp.entity.Goods;

/**
 * 商品类的服务类
 * @author zhuzhen
 *
 */
public class GoodsService {
	
	GoodsDao gd = new GoodsDao();
	
	/**
	 * 通过GOODSID获取到GOODS
	 * @param goodsId
	 * @return
	 */
	public Goods getGoodsById(int goodsId){
		return gd.getGoodsById(goodsId);
	}
}
