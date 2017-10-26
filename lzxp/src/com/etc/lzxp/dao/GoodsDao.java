package com.etc.lzxp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.etc.lzxp.entity.Goods;
import com.etc.util.BaseDao;
import com.etc.util.PageData;

/**
 * 在实际中*不太好
 * @author zhuzhen
 *
 */
public class GoodsDao {
	/**
	 * 通过GOODSID查找到GOODS
	 * @param goodsId
	 * @return
	 */
	public Goods getGoodsById(int goodsId){
		List<Goods> list= (List<Goods>)BaseDao.select("select * from GOODS where GOODSID=?", Goods.class, goodsId);
		if (list.isEmpty()) {
			return null;
		}
		return list.get(0);
	}
	
}
