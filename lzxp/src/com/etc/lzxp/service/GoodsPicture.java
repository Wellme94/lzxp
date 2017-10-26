package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.GoodsPictureDao;
import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.Goods_Picture;

public class GoodsPicture {
	GoodsPictureDao gpa = new GoodsPictureDao();
	public List<Goods_Picture> selectPictureById(int goodsId){
		return gpa.selectPictureById(goodsId);
	}
}
