package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.Goods_OrderDao;
import com.etc.lzxp.entity.Goods_order;

public class Goods_OrderService {
	Goods_OrderDao god = new Goods_OrderDao();
	
	public   List<Goods_order> getAllGOBySallerState_WJD(){
		return god.getAllGOBySallerState_WJD();
	}
	
	public  List<Goods_order> getAllGOBySallerState_NotWJD(){
		return god.getAllGOBySallerState_NotWJD();
	}
	
	public boolean getuGOIdSS_WJD(Goods_order goods_Order){
		return god.uGOByIdSS_WJD(goods_Order);
	}
	
	public boolean getuGOIdSS_YJD(Goods_order goods_Order){
		return god.uGOByIdSS_YJD(goods_Order);
	}
	
	public boolean getUpdateGOSSWJD(Goods_order goods_Order){
		return god.updateGoods_OrderBySallerState_WJD(goods_Order);
	}
	
	public boolean getUpdateGOSSYJD(Goods_order goods_Order){
		return god.updateGoods_OrderBySallerState_YJD(goods_Order);
	}
	
	public boolean getUpdateGOSSPSZ(Goods_order goods_Order){
		return god.updateGoods_OrderBySallerState_PSZ(goods_Order);
	}

}
