package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.GetGoodsDao;
import com.etc.lzxp.entity.V_AllGoods;
import com.etc.util.PageData;

public class GetGoodsService {
       
	   GetGoodsDao gd = new GetGoodsDao();
	   
	   public List<V_AllGoods> getAllGoodsByLtype(int goodsState){
			   
	   return gd.getAllGoodsByLtype(goodsState);
		   
	   }
	
	
}
