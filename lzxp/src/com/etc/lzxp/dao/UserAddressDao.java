package com.etc.lzxp.dao;

import java.util.List;

import com.etc.lzxp.entity.UserAddress;
import com.etc.util.BaseDao;

public class UserAddressDao {
	//查询用户所有的收货地址
	
	public List<UserAddress> selectAllAddressid(int addressid){					
		return (List<UserAddress>) BaseDao.select("select * from USERS_ADDRESS where ADDRESSID = ?", UserAddress.class, addressid);		
	}
		
	public List<UserAddress> selectAllAddress(int userid){					
		return (List<UserAddress>) BaseDao.select("select * from USERS_ADDRESS where USERID = ?", UserAddress.class, userid);		
	}
	
	//添加用户的新的收货地址
	public boolean addNewAddress(int userid,String useraddress,String receivertel,String receivername) {	
		if (BaseDao.execute("insert into USERS_ADDRESS (USERID,USERADDRESS,RECEIVERTEL,RECEIVERNAME) values (?,?,?,?)",userid,useraddress,receivertel,receivername)>0) {
			return true;
		}
		return false;
	}
	
	//删除用户的收货地址
	public boolean deleteAddress(int addressid) {
		if (BaseDao.execute("delete from USERS_ADDRESS where ADDRESSID = ?",addressid)>0) {
			return true;
		}
		return false;
	}
}
