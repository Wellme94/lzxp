package com.etc.lzxp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.lzxp.entity.Users;
import com.etc.lzxp.service.UsersService;
import com.google.gson.Gson;


/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsersService us = new UsersService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//����·��
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
				+ request.getContextPath() + "/";
		//����������Ӧ����
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//���ûỰ
		HttpSession session = request.getSession();
		//����jason��ʽ����
		response.setContentType("application/json");
		PrintWriter out= response.getWriter();
		if (request.getParameter("op")!=null) {
			//���op��Ϊ��
			String op = request.getParameter("op");
			if ("isLogin".equals(op)) {
				//�ж��Ƿ��¼�ɹ�
				//��ȡ�û���Ϣ
				String userName = request.getParameter("userName");
				String userPwd = request.getParameter("userPwd");
				//�����û�
				Users user = new Users(0, userName, userPwd);
				//����UsersService����
				if (us.isLogin(user)) {
					//�����¼�ɹ��������û��Ự��Ϣ
					session.setAttribute("user", user);
					//����Cookie
					Cookie cookie1 = new Cookie("userName", userName);
					Cookie cookie2 = new Cookie("userPwd", userPwd);
					//����cookie
					response.addCookie(cookie1);
					response.addCookie(cookie2);
					
				}
				//��ӡjson
				printJson(out, us.isLogin(user));
				
				
				
			}else if ("judgeUserName".equals(op)) {
				//�ж��û��Ƿ��Ѿ��ظ�
				//��ȡ�û���
				String userName = request.getParameter("userName");
				//�ж��û��Ƿ����
				printJson(out, us.judgeUserName(userName));
				
				
				
			}else if ("register".equals(op)) {
				//ע��
				//��ȡ����Ϣ
				if ((request.getParameter("username")!="")&&(request.getParameter("username")!="")
						&&(request.getParameter("mobile")!="")) {
					//�������Ϊ�յ����
					String userName = request.getParameter("username");
					String userPwd = request.getParameter("password");
					String userTel = request.getParameter("mobile");
					//�����û�
					Users user = new Users(0, userName, userPwd);
					//�ж��Ƿ�ע��ɹ�
					if (us.isRegister(user, userTel)) {
						//����ɹ�
						/*//����cookie
						Cookie cookie1 = new Cookie("userName", userName);
						Cookie cookie2 = new Cookie("userPwd", userPwd);
						//����cookie
						response.addCookie(cookie1);
						response.addCookie(cookie2);*/
						//��ת������ҳ
						response.sendRedirect("login.jsp");
					}else{
						//��������ע��ҳ��
						response.sendRedirect("register.html");
					}
				}else{
					//��������ע��ҳ��
					response.sendRedirect("register.html");
				}
				
				
			}else if ("exit".equals(op)) {
				//�˳��û�
				//����˳�
				if (request.getParameter("isExit")!=null) {			
					//�Ƴ��Ự�е��û���Ϣ
					session.invalidate();
					//�˳�����ҳ
					response.sendRedirect("index.html");
				}
				
				
			}else if("countOrder".equals(op)){
				//���㶩��
				//�ж��Ƿ��Ѿ���¼��
				System.out.println(session.getAttribute("user"));
				if (session.getAttribute("user")!=null) {
					//����Ѿ���¼�ˣ�ֱ����ת������ҳ��
					response.sendRedirect("myorder.html");
				}else{
					//��ת���û���¼ҳ��
					response.sendRedirect("login.jsp");
				}
			}
			
			
			
		}
		
		
	}
	//ajax��ӡ
	private void printJson(PrintWriter out,Object result){
		//����Json
		Gson gson = new Gson();
		//ת����Json��ʽ
		String str = gson.toJson(result);
		//��ӡ
		out.print(str);
		//�ͷ���Դ
		out.close();
	}

}
