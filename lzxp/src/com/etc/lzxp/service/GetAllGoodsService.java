package com.etc.lzxp.service;

import com.etc.lzxp.dao.GetAllGoodsDao;
import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.ShowGoods;
import com.etc.util.PageData;

public class GetAllGoodsService {
	GetAllGoodsDao  gd = new GetAllGoodsDao();
	
public PageData<ShowGoods> getGoodsBystypeId(int page, int pageSize,int stypeId, String goodsName){
		 	       
		return gd.getGoodsBystypeId(page, pageSize,stypeId,goodsName);
    	
    }
	
}
