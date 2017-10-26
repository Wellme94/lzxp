package com.etc.lzxp.dao;

import java.util.List;

import com.etc.lzxp.entity.GoodsCart;
import com.etc.lzxp.entity.Goods_Picture;
import com.etc.util.BaseDao;

public class GoodsPictureDao {	
	public List<Goods_Picture> selectPictureById(int goodsid){					
		return (List<Goods_Picture>) BaseDao.select("select * from GOODS_PICTURE where GOODSID=?",Goods_Picture.class,goodsid);		
	}
}
