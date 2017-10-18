package com.etc.lzxp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class GoodsServlet
 * Goods操作
 */
@WebServlet("/GoodsServlet")
public class GoodsServlet extends HttpServlet {
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
		

		if (request.getParameter("op")!=null) {
			//获取op
			String op = request.getParameter("op");
			
			if ("Goods".equals(op)) {
				
				/**
				 * 搜索商品
				 */
				//获取商品名
				String goodsName = request.getParameter("keyword");
				
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
