package com.etc.lzxp.dao;

import java.util.List;

import com.etc.lzxp.entity.Seller_message;
import com.etc.util.BaseDao;

/**
 * @author Administrator
 *消息提示dao
 */
public class SellerMessageDao {
	
	/**
	 * 查看消息表中是否有内容为1（未接订单）的内容
	 * @return true 有 false 无
	 */
	public boolean hasOrderMessage(){
		//获取信息内容为1(有未接订单)的内容
		 List<Seller_message> list = (List<Seller_message>) BaseDao.select("select * from seller_message where messagecontent=1", Seller_message.class, null);
	
		 if (list.size()==0) {
			//如果没有未接订单
			 return false;
		}
		 return true;
	}
	
	/**
	 * 取消消息提醒
	 * @return
	 */
	public boolean cancelMessage(){
		return BaseDao.execute("update seller_message set messagecontent=0 where messageid=1", null)>0;
	}
}
