package com.etc.lzxp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.lzxp.service.SellerMessageService;
import com.google.gson.Gson;

/**
 * Servlet implementation class SellerMessageServlet
 * 商家消息提醒的Servlet
 */
@WebServlet("/SellerMessageServlet")
public class SellerMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		//设置请求，响应编码
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//设置jason格式编码
		response.setContentType("application/json");
		PrintWriter out= response.getWriter();
		SellerMessageService sms = new SellerMessageService();

		if (request.getParameter("op")!=null) {
			//获取op
			String op = request.getParameter("op");
			if ("message".equals(op)) {
				/**
				 * 页面消息局部刷新
				 */
				//调用service方法
				boolean hasOrder = sms.hasOrderMessage();
				//打印
				printJson(out, hasOrder);
			
			}else if ("cancelMessage".equals(op)) {
				/**
				 * 取消消息提醒
				 */
				printJson(out, sms.cancelMessage());
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
