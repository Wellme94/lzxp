package com.etc.lzxp.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.lzxp.entity.Users;
import com.etc.lzxp.entity.UsersData;
import com.etc.lzxp.entity.Users_info;
import com.etc.util.BaseDao;

/**
 * @author Administrator
 *�û�Users Dao
 */
public class UsersDao {
	List<Users> list = new ArrayList<>();
	
	/**
	 * �ж��Ƿ��¼�ɹ�
	 * @param user
	 * @return
	 */
	public boolean isLogin(Users user){
		list = (List<Users>) BaseDao.select("select * from users where username=? and userpwd=?", Users.class, user.getUSERNAME(),user.getUSERPWD());
		if (list.size()>0) {
			//����в鵽���û�
			return true;
		}
		return false;
	}
	
	/**
	 * �ж��û����Ƿ����
	 * @param userName
	 * @return
	 */
	public boolean judgeUserName(String userName){
		list = (List<Users>) BaseDao.select("select * from users where username=?", Users.class, userName);
		if (list.size()>0) {
			//����в鵽���û�
			return true;
		}
		return false;
	}
	
	/**
	 * ע��
	 * @param user �û�
	 * @param userTel �绰
	 * @return �Ƿ���ӳɹ� 
	 */
	public boolean isRegister(Users user,String userTel){
		//��ȡ����
		Connection conn = BaseDao.getConn();
		//�����ֶ��ύ
		try {
			conn.setAutoCommit(false);
			//����û���
			BaseDao.execute("insert into users values(?,?,?)", conn, null,user.getUSERNAME(),user.getUSERPWD());
			//��ȡ�û�id
			list=  (List<Users>) BaseDao.select("select userid from users where username=?",conn,Users.class, user.getUSERNAME());
			int useId= list.get(0).getUSERID();
			//����û������
			BaseDao.execute("insert into users_info values(null,?,null,?)", conn, useId,userTel);
			//�ύ
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//��������Զ��ع�
			try {
				conn.rollback();
				return false;
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			//�ͷ���Դ
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
		
	}
	
}
