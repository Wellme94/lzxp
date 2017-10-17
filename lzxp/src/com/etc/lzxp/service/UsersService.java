package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.UsersDao;
import com.etc.lzxp.entity.Users;
import com.etc.lzxp.entity.Users_info;

public class UsersService {
	UsersDao ud = new UsersDao();
	/**
	 * 判断是否登录成功
	 * @param user
	 * @return
	 */
	public boolean isLogin(Users user){
		return ud.isLogin(user);
	}
	
	/**
	 * 判断用户名是否存在
	 * @param userName
	 * @return
	 */
	public boolean judgeUserName(String userName){
		return ud.judgeUserName(userName);
	}
	
	/**
	 * 注册
	 * @param user 用户
	 * @param userTel 电话
	 * @return 是否添加成功 
	 */
	public boolean isRegister(Users user,String userTel){
		return ud.isRegister(user, userTel);
	}
	
	
	/**
	 * 获取用户详细信息
	 * @param user用户
	 * @return 用户详细信息
	 */
	public List<Users_info> getUserInfo(Users user){
		return ud.getUserInfo(user);
	}
	
	/**
	 * 根据用户详情ID修改用户详情信息表
	 * @param userInfo 用户详情信息
	 * @return true false
	 */
	public boolean updateUserInfoById(Users_info userInfo){
		return ud.updateUserInfoById(userInfo);
	}
}
