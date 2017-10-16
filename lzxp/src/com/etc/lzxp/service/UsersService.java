package com.etc.lzxp.service;

import com.etc.lzxp.dao.UsersDao;
import com.etc.lzxp.entity.Users;

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
}
