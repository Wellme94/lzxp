package com.etc.lzxp.service;

import com.etc.lzxp.dao.UsersDao;
import com.etc.lzxp.entity.Users;

public class UsersService {
	UsersDao ud = new UsersDao();
	/**
	 * �ж��Ƿ��¼�ɹ�
	 * @param user
	 * @return
	 */
	public boolean isLogin(Users user){
		return ud.isLogin(user);
	}
	
	/**
	 * �ж��û����Ƿ����
	 * @param userName
	 * @return
	 */
	public boolean judgeUserName(String userName){
		return ud.judgeUserName(userName);
	}
	
	/**
	 * ע��
	 * @param user �û�
	 * @param userTel �绰
	 * @return �Ƿ���ӳɹ� 
	 */
	public boolean isRegister(Users user,String userTel){
		return ud.isRegister(user, userTel);
	}
}
