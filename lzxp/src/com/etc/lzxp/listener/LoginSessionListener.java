package com.etc.lzxp.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.etc.lzxp.entity.Users;


@WebListener
public class LoginSessionListener implements HttpSessionAttributeListener{  
	//创建一个Map,用来存储用户信息
	//key为用户名，value为HttpSession对象
	Map<String, HttpSession> map = new HashMap<>();
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		System.out.println("用户登录啦！");
		//session被添加时，获取session对象的key
		String name = se.getName();
		if ("user".equals(name)) {
			//如果key的值为user,获取用户信息
			Users user = (Users)se.getValue();
			if (map.containsKey(user.getUSERNAME())) {
				//如果之前用户名已登录
				//移除之前的用户的session
				HttpSession session = map.get(user.getUSERNAME());
				//备份之前用户信息
				Users beforeUser = (Users) session.getAttribute(name);
				session.removeAttribute(name);
				//设置session信息
				session.setAttribute("msg", "您的用户已经被占用！！");
				
			}
			//添加用户的信息到map中
			map.put(user.getUSERNAME(), se.getSession());
		}
		
	}
	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		
	}
	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		//获取session对象的key
		String name = se.getName();
		if ("user".equals(name)) {
			//如果key的值为user
			//获取用户信息
			Users user = (Users)se.getValue();
			if (map.containsKey(user.getUSERNAME())) {
				//如果登录的用户名与正在登录的用户名相等
				//获取session对象
				HttpSession session = map.get(user.getUSERNAME());
				//备份之前的数据
				Users beforeUser = (Users)session.getAttribute(name);
				//移除正在运行的session对象
				session.removeAttribute(name);
				//设置移除用户消息
				session.setAttribute("msg","您的用户已被占用！");
			}
			//存储用户信息
			map.put(user.getUSERNAME(),se.getSession());
		}
		
	}
	  
  
}  