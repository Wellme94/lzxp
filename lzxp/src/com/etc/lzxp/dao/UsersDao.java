package com.etc.lzxp.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.lzxp.entity.Users;
import com.etc.lzxp.entity.Users_info;
import com.etc.util.BaseDao;

/**
 * @author Administrator
 *用户Users Dao
 */
public class UsersDao {
	List<Users> list = new ArrayList<>();
	
	/**
	 * 判断是否登录成功
	 * @param user
	 * @return
	 */
	public boolean isLogin(Users user){
		list = (List<Users>) BaseDao.select("select * from users where username=? and userpwd=?", Users.class, user.getUSERNAME(),user.getUSERPWD());
		if (list.size()>0) {
			//如果有查到该用户
			return true;
		}
		return false;
	}
	
	/**
	 * 判断用户名是否存在
	 * @param userName
	 * @return
	 */
	public boolean judgeUserName(String userName){
		list = (List<Users>) BaseDao.select("select * from users where username=?", Users.class, userName);
		if (list.size()>0) {
			//如果有查到该用户
			return true;
		}
		return false;
	}
	
	/**
	 * 注册
	 * @param user 用户
	 * @param userTel 电话
	 * @return 是否添加成功 
	 */
	public boolean isRegister(Users user,String userTel){
		//获取连接
		Connection conn = BaseDao.getConn();
		//设置手动提交
		try {
			conn.setAutoCommit(false);
			//添加用户表
			BaseDao.execute("insert into users values(?,?,?)", conn, null,user.getUSERNAME(),user.getUSERPWD());
			//获取用户id
			list=  (List<Users>) BaseDao.select("select userid from users where username=?",conn,Users.class, user.getUSERNAME());
			int useId= list.get(0).getUSERID();
			//添加用户详情表
			BaseDao.execute("insert into users_info values(null,?,null,?)", conn, useId,userTel);
			//提交
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//如果出错，自动回滚
			try {
				conn.rollback();
				return false;
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			//释放资源
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
		
	}
	
	/**
	 * 获取用户详细信息
	 * @param user用户
	 * @return 用户详细信息
	 */
	public List<Users_info> getUserInfo(Users user){
		//获取用户ID
		list = (List<Users>) BaseDao.select("select userid from users where username=?", Users.class, user.getUSERNAME());
		//获取用户详细信息
		return (List<Users_info>) BaseDao.select("select * from users_info where userid=?", Users_info.class, list.get(0).getUSERID());
	}
	
	/**
	 * 根据用户详情ID修改用户详情信息表
	 * @param userInfo 用户详情信息
	 * @return true false
	 */
	public boolean updateUserInfoById(Users_info userInfo){
		return BaseDao.execute("update users_info set usersex=?,usertel=? where infoid=?", userInfo.getUSERSEX(),userInfo.getUSERTEL(),userInfo.getINFOID())>0;
	}
	
	
	/**
	 * 修改密码
	 * @param userName用户名
	 * @param beforPwd 原始密码
	 * @param newPwd 新密码
	 * @return 结果
	 */
	public String updatePwd(String userName,String beforePwd,String newPwd){
		//获取表格原始密码
		 List<Users> list =(List<Users>) BaseDao.select("select * from users where username=? and userpwd=?", Users.class, userName,beforePwd);
		 if (list.size()>0) {
			 //修改密码
			 if (BaseDao.execute("update users set userpwd=? where username=?", newPwd,userName)>0) {
				//操作成功
				 return "操作成功";
			}else{
				return "操作失败";
			}
		}else{
			//如果没有数据，则输入的原始密码有误
			return "原密码有误,请重新输入";
		}
	}
	
	/**
	 * 获取用户地址
	 * @param user用户
	 * @return 用户详细信息
	 */
	public int getUserId(String username){
		//获取用户ID
		int userid = 0;
		list = (List<Users>) BaseDao.select("select * from USERS where USERNAME=?", Users.class,username);
		if(!list.isEmpty()) {
			for (Users users : list) {
				userid = users.getUSERID();
			}			
		}
		return userid;
	}
}
