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
	//����һ��Map,�����洢�û���Ϣ
	//keyΪ�û�����valueΪHttpSession����
	Map<String, HttpSession> map = new HashMap<>();
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		System.out.println("�û���¼����");
		//session�����ʱ����ȡsession�����key
		String name = se.getName();
		if ("user".equals(name)) {
			//���key��ֵΪuser,��ȡ�û���Ϣ
			Users user = (Users)se.getValue();
			if (map.containsKey(user.getUSERNAME())) {
				//���֮ǰ�û����ѵ�¼
				//�Ƴ�֮ǰ���û���session
				HttpSession session = map.get(user.getUSERNAME());
				//����֮ǰ�û���Ϣ
				Users beforeUser = (Users) session.getAttribute(name);
				session.removeAttribute(name);
				//����session��Ϣ
				session.setAttribute("msg", "�����û��Ѿ���ռ�ã���");
				
			}
			//����û�����Ϣ��map��
			map.put(user.getUSERNAME(), se.getSession());
		}
		
	}
	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		
	}
	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		//��ȡsession�����key
		String name = se.getName();
		if ("user".equals(name)) {
			//���key��ֵΪuser
			//��ȡ�û���Ϣ
			Users user = (Users)se.getValue();
			if (map.containsKey(user.getUSERNAME())) {
				//�����¼���û��������ڵ�¼���û������
				//��ȡsession����
				HttpSession session = map.get(user.getUSERNAME());
				//����֮ǰ������
				Users beforeUser = (Users)session.getAttribute(name);
				//�Ƴ��������е�session����
				session.removeAttribute(name);
				//�����Ƴ��û���Ϣ
				session.setAttribute("msg","�����û��ѱ�ռ�ã�");
			}
			//�洢�û���Ϣ
			map.put(user.getUSERNAME(),se.getSession());
		}
		
	}
	  
  
}  