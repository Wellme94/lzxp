package com.etc.lzxp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.lzxp.entity.GoodsSort;
import com.etc.lzxp.entity.Goods_order;
import com.etc.lzxp.service.GoodsOrderService;
import com.etc.lzxp.service.GoodsSortService;

/**
 * Servlet implementation class GoodsServlet
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
		
		List<Goods_order> list =new ArrayList<Goods_order>();
		
		GoodsOrderService gos=new GoodsOrderService();
		
		if (request.getParameter("op") != null) {

			// 将op的值取出来 判断这个值
			String op = request.getParameter("op");

			if (op.equals("getAllOrder")) {
				
				list = gos.getAllOrder();
				
			} else if (op.equals("deleteOrder")) {

				// 删除操作
				String orderIdStr = request.getParameter("orderIdStr");
				
				String[] orderId=orderIdStr.split(",");
				
				for(int i=0;i<orderId.length;i++){
					
				gos.deleteOrder(Integer.parseInt(orderId[i]));
				
				}

				list = gos.getAllOrder();

			}else if (op.equals("getOrderByDate")) {
				
				String mindate=null;
				String maxdate=null;
				
				if(request.getParameter("mindate")!=null) {
					
					 mindate = request.getParameter("mindate");
				}
				if(request.getParameter("maxdate")!=null) {
					
					 maxdate = request.getParameter("maxdate");
				}
				
			list=gos.getOrderByDate(mindate, maxdate);
			
			//list=gos.getAllOrder();
			/*// 设置传递的数据
			request.setAttribute("mindate", mindate);
			request.setAttribute("maxdate", maxdate);*/
			
			}
			
		}

		request.setAttribute("list", list);

		// 再转发
		request.getRequestDispatcher("goods-order.jsp").forward(request, response);
	
	}

}
