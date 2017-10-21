package com.etc.lzxp.dao;

import java.util.List;

import com.etc.lzxp.entity.GoodsSort;
import com.etc.lzxp.entity.Goods_ltype;
import com.etc.lzxp.entity.Goods_stype;
import com.etc.util.BaseDao;

public class GoodsSortDao {

	/**
	 * 商品分类显示
	 * @return
	 */
	public List<GoodsSort> getAllGoodsSort() {
		return (List<GoodsSort>) BaseDao.select("select * from goods_ltype,goods_stype where goods_ltype.ltypeid=goods_stype.ltypeid order by ltypename", GoodsSort.class, null);
	}
	
	/**
	 * 根据商品小类id删除
	 * @param stypeId
	 * @return
	 */
	public boolean deleteType(int stypeId) {
		return BaseDao.execute("delete from goods_stype where stypeId=?", stypeId) > 0;
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
