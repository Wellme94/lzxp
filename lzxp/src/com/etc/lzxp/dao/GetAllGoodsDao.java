package com.etc.lzxp.dao;

import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.ShowGoods;
import com.etc.util.BaseDao;
import com.etc.util.PageData;

public class GetAllGoodsDao {
    
    /**
     * 根据Goods的stypeId 将所有的商品取出
     * @param page
     * @param pageSize
     * @param stypeid
     * @param goodsName 
     * @return
     */
	
    public PageData<ShowGoods> getGoodsBystypeId(int page, int pageSize,int stypeId, String goodsName){
		
    	String sql = "select goods.goodsid,goods.goodsname,"
    			+ "goods.stypeid,goods.goodsprice,goods.goodscontent,"
    			+ "goods.goodsstock,goods.goodsstate,GOODS_PICTURE.pictureid,"
    			+ "GOODS_PICTURE.pictureaddress from goods inner join GOODS_PICTURE on goods.GOODSID = GOODS_PICTURE.GOODSID "
    			+ "where goods.STYPEID = ? and goods.GOODSNAME like ?";        
		return BaseDao.getOraclePage(sql, page, pageSize, ShowGoods.class, stypeId,"%"+goodsName+"%");
    	
    }
	
}
