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
		//绝对路径
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
				+ request.getContextPath() + "/";
		//设置请求响应编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//设置会话
		HttpSession session = request.getSession();
		//设置jason格式编码
		response.setContentType("application/json");
		PrintWriter out= response.getWriter();
		if (request.getParameter("op")!=null) {
			//如果op不为空
			String op = request.getParameter("op");
			if ("isLogin".equals(op)) {
				//判断是否登录成功
				//获取用户信息
				String userName = request.getParameter("userName");
				String userPwd = request.getParameter("userPwd");
				//创建用户
				Users user = new Users(0, userName, userPwd);
				//调用UsersService方法
				if (us.isLogin(user)) {
					//如果登录成功，传递用户会话信息
					session.setAttribute("user", user);
					//设置Cookie
					Cookie cookie1 = new Cookie("userName", userName);
					Cookie cookie2 = new Cookie("userPwd", userPwd);
					//设置cookie
					response.addCookie(cookie1);
					response.addCookie(cookie2);
					
				}
				//打印json
				printJson(out, us.isLogin(user));
				
				
				
			}else if ("judgeUserName".equals(op)) {
				//判断用户是否已经重复
				//获取用户名
				String userName = request.getParameter("userName");
				//判断用户是否存在
				printJson(out, us.judgeUserName(userName));
				
				
				
			}else if ("register".equals(op)) {
				//注册
				//获取表单信息
				if ((request.getParameter("username")!="")&&(request.getParameter("username")!="")
						&&(request.getParameter("mobile")!="")) {
					//如果均不为空的情况
					String userName = request.getParameter("username");
					String userPwd = request.getParameter("password");
					String userTel = request.getParameter("mobile");
					//创建用户
					Users user = new Users(0, userName, userPwd);
					//判断是否注册成功
					if (us.isRegister(user, userTel)) {
						//如果成功
						//设置cookie
						Cookie cookie1 = new Cookie("userName", userName);
						Cookie cookie2 = new Cookie("userPwd", userPwd);
						//设置cookie
						response.addCookie(cookie1);
						response.addCookie(cookie2);
						//跳转到分类页
						response.sendRedirect("login.jsp");
					}else{
						//继续返回注册页面
						response.sendRedirect("register.html");
					}
				}else{
					//继续返回注册页面
					response.sendRedirect("register.html");
				}
				
				
			}else if ("exit".equals(op)) {
				//退出用户
				//如果退出
				
				if (request.getParameter("isExit")!=null) {	
					//移除会话中的用户消息
					session.removeAttribute("user");
					//退出到首页
					response.sendRedirect("index.html");
				}
				
				
			}else if("countOrder".equals(op)){
				//结算订单
				//判断是否已经登录了
				/*System.out.println(11111);
				System.out.println(session.getAttribute("user"));*/
				if (session.getAttribute("user")!=null) {
					//如果已经登录了，直接跳转到结算页面
					response.sendRedirect("myorder.html");
				}else{
					//跳转到用户登录页面
					response.sendRedirect("login.jsp");
				}
			}
			
			
			
		}
		
		
	}
	//ajax打印
	private void printJson(PrintWriter out,Object result){
		//创建Json
		Gson gson = new Gson();
		//转化成Json格式
		String str = gson.toJson(result);
		//打印
		out.print(str);
		//释放资源
		out.close();
	}

}
