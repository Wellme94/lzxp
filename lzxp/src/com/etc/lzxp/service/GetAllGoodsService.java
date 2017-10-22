package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.GetAllGoodsDao;
import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.V_SearchGoods;
import com.etc.util.PageData;

public class GetAllGoodsService {
	GetAllGoodsDao  gd = new GetAllGoodsDao();
	
//通过商品Id查找视图中对应的商品	
public List<V_SearchGoods> getGoodsById(int goodsId, int goodsState) {
	// TODO Auto-generated method stub
	return gd.getGoodsById(goodsId,goodsState);
}

//通过关键字 和 商品字段 查找视图中对应的数据
public PageData<V_SearchGoods> getGoodsBykeyword(int page, int pageSize, String keyword, int goodsState){
     
	return gd.getGoodsBykeyword(page, pageSize,keyword,goodsState);
	
}

/*
public PageData<ShowGoods> getGoodsByName(int page, int pageSize, String gName, int goodsState) {
	// TODO Auto-generated method stub
	return gd.getGoodsByName(page,pageSize,gName,goodsState);
}

public PageData<ShowGoods> getGoodsByName(int page, int pageSize, int goodsState, String goodsName) {
	// TODO Auto-generated method stub
	return gd.getGoodsByName(page,pageSize,goodsState,goodsName);
}

public PageData<ShowGoods> getGoodsBystypeId(int page, int pageSize, String goodsName, int goodsState) {
	// TODO Auto-generated method stub
	return gd.getGoodsBystypeId(page,pageSize,goodsName,goodsState);
}
//通过小类的类名  查找所有商品
public PageData<ShowGoods> getGoodsBystypeId(int page, int pageSize, int stypeId, int goodsState) {
	// TODO Auto-generated method stub
	return gd.getGoodsBystypeId(page,pageSize,stypeId,goodsState);
}*/
	
}
