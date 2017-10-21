package com.etc.lzxp.service;

import com.etc.lzxp.dao.SellerMessageDao;

/**
 * @author Administrator
 *消息 service
 */
public class SellerMessageService {
	 
	SellerMessageDao smd = new SellerMessageDao();
	/**
	 * 查看消息表中是否有内容为1（未接订单）的内容
	 * @return true 有 false 无
	 */
	public boolean hasOrderMessage(){
		return smd.hasOrderMessage();
	}
	
	/**
	 * 取消消息提醒
	 * @return
	 */
	public boolean cancelMessage(){
		return smd.cancelMessage();
	}
}
