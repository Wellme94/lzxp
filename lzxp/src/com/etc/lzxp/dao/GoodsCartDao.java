package com.etc.lzxp.dao;

import java.util.List;

import com.etc.lzxp.entity.GoodsCart;
import com.etc.util.BaseDao;

public class GoodsCartDao {
	//查询用户的购物车所有商品
	
	public List<GoodsCart> selectAllCart(String username){					
		return (List<GoodsCart>) BaseDao.select("select * from SHOWCART where USERNAME = ?", GoodsCart.class, username);		
	}
	
	public List<GoodsCart> selectCart(String username,int goodsid){					
		return (List<GoodsCart>) BaseDao.select("select * from GOODSCART where USERNAME = ? and GOODSID = ?", GoodsCart.class, username,goodsid);		
	}
	
	//查询用户购物车中某个商品的数量
	public List<GoodsCart> selectCartById(int goodsid){					
		return (List<GoodsCart>) BaseDao.select("select * from GOODSCART where GOODSID = ?",GoodsCart.class,goodsid);		
	}
	
	//修改购物车中同商品的数量
	public boolean updateCount(String username,int goodsid,int count) {
		if (BaseDao.execute("update GOODSCART set GOODSCOUNT = ? where USERNAME = ? and GOODSID = ?",count,username,goodsid)>0) {
			return true;
		}
		return false;
	}
	
	//向购物车中添加新的商品
	public boolean addNewGoods(String username,int goodsid,int count,double price,String goodsname) {			
		if (BaseDao.execute("insert into GOODSCART (USERNAME,GOODSID,GOODSCOUNT,GOODSPRICE,GOODSNAME) values (?,?,?,?,?)",username,goodsid,count,price,goodsname)>0) {
			return true;
		}
		return false;
	}
	
	//删除购物车中的商品
	public boolean deleteGoods(int goodsid,String username) {
		if (BaseDao.execute("delete from GOODSCART where GOODSID = ? and USERNAME = ?",goodsid,username)>0) {
			return true;
		}
		return false;
	}
	
	public boolean deleteGoodsByName(String username) {
		if (BaseDao.execute("delete from GOODSCART where USERNAME = ?",username)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateGoodNumById(int goodscount,int goodsid) {
		if (BaseDao.execute("update GOODSCART set GOODSCOUNT = ? where GOODSID = ?",goodscount,goodsid)>0) {
			return true;
		}
		return false;
	}
}
