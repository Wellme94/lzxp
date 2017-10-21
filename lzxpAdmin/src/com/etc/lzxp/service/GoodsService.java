package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.GoodsDao;
import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.GoodsAndStype;
import com.etc.lzxp.entity.GoodsStypePicture;
import com.etc.lzxp.entity.Goods_stype;

public class GoodsService {
	GoodsDao gd = new GoodsDao();

	/**
	 * 显示所有商品信息
	 * 
	 * @return
	 */
	public List<GoodsStypePicture> getAllGoods() {
		return gd.getAllGoods();
	}

	/**
	 * 通过ID查找
	 * 
	 * @param goodsId
	 * @return
	 */
	public List<Goods> getGoodsBygoodsId(int goodsId) {
		return gd.getGoodsBygoodsId(goodsId);
	}

	/**
	 * 通过ID删除商品
	 * 
	 * @param goodsId
	 * @return
	 */
	public boolean deleteGoods(int goodsId) {
		return gd.deleteGoods(goodsId);
	}

	/**
	 * 修改商品信息
	 * 
	 * @param goods
	 * @return
	 */
	public boolean updateGoods(Goods goods, String goodsStypeName) {
		return gd.updateGoods(goods, goodsStypeName);
	}

	/**
	 * 获取商品小类
	 * 
	 * @return
	 */
	public List<Goods_stype> getStype() {
		return gd.getStype();
	}

	/**
	 * 增加商品（通过类型名获取获取小类型）
	 * 
	 * @param stypeName
	 * @return
	 */
	public boolean addGoods(Goods goods, String stypeName,String pictureAddress) {
		return gd.addGoods(goods, stypeName,pictureAddress);
	}

	/**
	 * 商品上架
	 * 
	 * @param goodsId
	 * @return
	 */
	public boolean upGoods(int goodsId) {
		return gd.upGoods(goodsId);
	}

	/**
	 * 商品下架
	 * 
	 * @param goodsId
	 * @return
	 */
	public boolean downGoods(int goodsId) {
		return gd.downGoods(goodsId);
	}
}
