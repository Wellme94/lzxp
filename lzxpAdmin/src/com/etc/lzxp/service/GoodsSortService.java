package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.GoodsSortDao;
import com.etc.lzxp.entity.GoodsSort;
import com.etc.lzxp.entity.Goods_ltype;
import com.etc.lzxp.entity.Goods_stype;
import com.etc.util.BaseDao;

public class GoodsSortService {

	GoodsSortDao gsd=new GoodsSortDao();
	/**
	 * 显示商品分类
	 * @return
	 */
	public List<GoodsSort> getAllGoodsSort(){
		return gsd.getAllGoodsSort();
	}
	
	/**
	 * 根据商品小类id删除
	 * @param stypeId
	 * @return
	 */
	public boolean deleteType(int stypeId){
		return gsd.deleteType(stypeId);
	}
	
	/**
	 * 获取商品小类
	 * 
	 * @return
	 */
	public List<Goods_stype> getStype() {
		return (List<Goods_stype>) BaseDao.select("select * from goods_stype", Goods_stype.class, null);
	}
	
	/**
	 * 获取商品大类
	 * 
	 * @return
	 */
	public List<Goods_ltype> getLtype() {
		return (List<Goods_ltype>) BaseDao.select("select * from goods_ltype", Goods_ltype.class, null);
	}
}
