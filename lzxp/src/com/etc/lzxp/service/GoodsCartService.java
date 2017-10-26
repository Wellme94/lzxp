package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.GoodsCartDao;
import com.etc.lzxp.entity.GoodsCart;

public class GoodsCartService {
	GoodsCartDao cartdao = new GoodsCartDao();
	
	public List<GoodsCart> selectCart(String username,int goodsid){
		return cartdao.selectCart(username,goodsid);
	}
	
	public List<GoodsCart> selectAllCart(String username){
		return cartdao.selectAllCart(username);
	}
	
	public List<GoodsCart> selectCartById(int goodsid){
		return cartdao.selectCartById(goodsid);
	}
	
	public boolean updateCount(String username,int goodsid,int count) {
		return cartdao.updateCount(username, goodsid, count);
	}
	
	public boolean addNewGoods(String username,int goodsid,int count,double price,String goodsname) {
		return cartdao.addNewGoods(username, goodsid, count, price,goodsname);
	}
	
	public boolean deleteGoods(int goodsid,String username) {
		return cartdao.deleteGoods(goodsid, username);
	}
	
	public boolean deleteGoodsByName(String username) {
		return cartdao.deleteGoodsByName(username);
	}
	
	public boolean updateGoodNumById(int goodscount,int goodsid) {
		return cartdao.updateGoodNumById(goodscount,goodsid);
	}
}
