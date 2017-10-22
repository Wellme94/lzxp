package com.etc.lzxp.dao;

import java.util.List;

import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.V_SearchGoods;
import com.etc.util.BaseDao;
import com.etc.util.PageData;

public class GetAllGoodsDao {
    
    /**
     * 根据Goods的stypeId 将所有的商品取出
     * @param page
     * @param pageSize
     * @param stypeid
     * @param goodsName 
     * @param goodsState 
     * @return
     */
	//通过商品Id将对应的商品数据找出
	public List<V_SearchGoods> getGoodsById(int goodsId, int goodsState) {
		// TODO Auto-generated method stub
		String sql = "select * from V_SEARCHGOODS where  GOODSID = ? and  GOODSSTATE = ?";   
		return (List<V_SearchGoods>) BaseDao.select(sql,V_SearchGoods.class, goodsId,goodsState);
	}
	 //查找视图中的数据
	  public PageData<V_SearchGoods> getGoodsBykeyword(int page, int pageSize, String keyword, int goodsState){
			
	    	String sql = "select * from V_SEARCHGOODS where  (STYPENAME =? or GOODSNAME like ?) and  GOODSSTATE = ?";        
			return BaseDao.getOraclePage(sql, page, pageSize, V_SearchGoods.class,keyword,"%"+keyword+"%",goodsState);
	    	
	    } 
}
