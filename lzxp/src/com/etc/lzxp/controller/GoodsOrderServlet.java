package com.etc.lzxp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.lzxp.entity.Goods_order;
import com.etc.lzxp.service.GoodsOrderService;
import com.etc.util.PageData;
import com.google.gson.Gson;

/**
 * Servlet implementation class GoodsOrderServlet
 * 订单表的Servlet
 */
@WebServlet("/GoodsOrderServlet")
public class GoodsOrderServlet extends HttpServlet {
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
		PageData<Goods_order> pd = new PageData<>();
		//初始化页码
		int page = 1;
		int pageSize = 5;
		
		GoodsOrderService gos = new GoodsOrderService();
		
		if (request.getParameter("op")!=null) {
			//获取op
			String op = request.getParameter("op");
			
			if ("showAll".equals(op)) {
				/**
				 * 显示所有订单
				 */
				if (request.getParameter("page")!=null) {
					page= Integer.parseInt(request.getParameter("page"));
				}
				if (request.getParameter("pageSize")!=null) {
					page= Integer.parseInt(request.getParameter("pageSize"));
				}
				//调用gos的方法
				
				
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
