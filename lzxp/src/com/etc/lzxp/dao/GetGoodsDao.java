package com.etc.lzxp.dao;

import java.util.List;

import com.etc.lzxp.entity.V_AllGoods;
import com.etc.util.BaseDao;
import com.etc.util.PageData;

public class GetGoodsDao {
    
	
	public  List<V_AllGoods> getAllGoodsByLtype(int goodsState){
		
		String sql = "select * from v_allgoods where goodsState = ?";
		
		return (List<V_AllGoods>) BaseDao.select(sql, V_AllGoods.class,goodsState);
		
	}
	
	
}
