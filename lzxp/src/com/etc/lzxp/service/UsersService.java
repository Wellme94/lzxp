package com.etc.lzxp.service;

import java.util.List;

import com.etc.lzxp.dao.UsersDao;
import com.etc.lzxp.entity.Users;
import com.etc.lzxp.entity.Users_info;

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
	
	
	/**
	 * ��ȡ�û���ϸ��Ϣ
	 * @param user�û�
	 * @return �û���ϸ��Ϣ
	 */
	public List<Users_info> getUserInfo(Users user){
		return ud.getUserInfo(user);
	}
	
	/**
	 * �����û�����ID�޸��û�������Ϣ��
	 * @param userInfo �û�������Ϣ
	 * @return true false
	 */
	public boolean updateUserInfoById(Users_info userInfo){
		return ud.updateUserInfoById(userInfo);
	}
}
