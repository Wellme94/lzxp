package com.etc.lzxp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.Goods_order;
import com.etc.lzxp.service.Goods_OrderService;
import com.google.gson.Gson;

/**
 * Servlet implementation class Users_Goods_OrderServlet
 */
@WebServlet("/Goods_OrderServlet")
public class Goods_OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Goods_OrderService gos = new Goods_OrderService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Goods_OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		List<Goods_order> list = new ArrayList<Goods_order>();
		if (request.getParameter("op") != null) {
			// 将op的值取出来 判断这个值
			String op = request.getParameter("op");
			if (op.equals("getAllSSycl")) {
				// 查询所有已处理订单
				//获取参数
				String active = request.getParameter("active");
				//设置传递的参数
				request.setAttribute("active", active);
				list = gos.getAllGOBySallerState_NotWJD();
			}
			else if (op.equals("getAllSSwcl")) {
				list = gos.getAllGOBySallerState_WJD();
				String active = request.getParameter("active");
				request.setAttribute("active", active);
			}
			else if (op.equals("updateGoods_OrderBySallerState_WJD")) {
                       
				// 修改操作
				String SALLERSTATE = "未接单";
				Goods_order goods_Order=new Goods_order(null, null, null, 0, null, null, null, SALLERSTATE, null);
				gos.getUpdateGOSSWJD(goods_Order);
				list = gos.getAllGOBySallerState_NotWJD();
			}
			else if (op.equals("updateGoods_OrderBySallerState_YJD")) {

				// 修改操作
				String SALLERSTATE = "已接单";
				Goods_order goods_Order=new Goods_order(null, null, null, 0, null, null, null, SALLERSTATE, null);
				gos.getUpdateGOSSYJD(goods_Order);
				list = gos.getAllGOBySallerState_NotWJD();

			}
			else if (op.equals("updateGoods_OrderBySallerState_PSZ")) {

				// 修改操作
				String SALLERSTATE = "派送中";
				Goods_order goods_Order=new Goods_order(null, null, null, 0, null, null, null, SALLERSTATE, null);
				gos.getUpdateGOSSPSZ(goods_Order);
				list = gos.getAllGOBySallerState_NotWJD();

			}
			else if (op.equals("uGOByIdSs_WJD")) {
				// 修改操作
                String orderId =  request.getParameter("orderId"); 
                String orderid[] = orderId.split(",");
                String id = orderid[0];
                int i = 0;
				for (; i < orderid.length; i++) {
				String ORDERID = orderid[i].toString();
					String SALLERSTATE = "未接单";
				
				Goods_order goods_Order=new Goods_order(ORDERID, null, null, 0, null, null, null, SALLERSTATE, null);
				gos.getuGOIdSS_WJD(goods_Order);
				
				list = gos.getAllGOBySallerState_NotWJD();
				}
				
			}
			else if (op.equals("uGOByIdSs_YJD")) {
                System.out.println("确认订单操作...");
			// 修改操作
           
           String orderId =  request.getParameter("orderId"); 
           String orderid[] = orderId.split(",");
           String id = orderid[0];
           int i = 0;
           if (id.equals("no")) {
        	   i=1;
           }
        	   for (; i < orderid.length; i++) {
        		   String ORDERID = orderid[i].toString();
        		   String SALLERSTATE = "已接单";
        		   
        		   Goods_order goods_Order=new Goods_order(ORDERID, null, null, 0, null, null, null, SALLERSTATE, null);
        		   gos.getuGOIdSS_YJD(goods_Order);
        		   
        		   list = gos.getAllGOBySallerState_NotWJD();
        	   }
		}
			}
		
		// 先设置要传递的数据
		request.setAttribute("list", list);

		// 再转发
		request.getRequestDispatcher("order.jsp").forward(request, response);

	}

	
}
