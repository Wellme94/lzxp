package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.UserAddressDao;
import com.etc.lzxp.entity.UserAddress;


public class UserAddressService {
	UserAddressDao useraddressdao = new UserAddressDao();
	
	public List<UserAddress> selectAllAddressid(int addressid){
		return useraddressdao.selectAllAddressid(addressid);
	}
	
	public List<UserAddress> selectAllAddress(int userid){
		return useraddressdao.selectAllAddress(userid);
	}
	
	public boolean addNewAddress(int userid,String useraddress,String receivertel,String receivername) {
		return useraddressdao.addNewAddress(userid, useraddress, receivertel, receivername);
	}
	
	public boolean deleteAddress(int addressid) {
		return useraddressdao.deleteAddress(addressid);
	}
}
