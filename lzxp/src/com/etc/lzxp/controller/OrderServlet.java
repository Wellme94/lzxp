package com.etc.lzxp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.lzxp.entity.GoodsCart;
import com.etc.lzxp.entity.Goods_order;
import com.etc.lzxp.entity.UserAddress;
import com.etc.lzxp.entity.Users_info;
import com.etc.lzxp.service.GoodsCartService;
import com.etc.lzxp.service.GoodsService;
import com.etc.lzxp.service.OrdersService;
import com.etc.lzxp.service.UserAddressService;
import com.etc.lzxp.service.UsersService;
import com.google.gson.Gson;

/**
 * 商品的Servlet
 * @author zhuzhen
 *
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GoodsService gs= new GoodsService();
    private OrdersService os = new OrdersService();
    private GoodsCartService gcs = new GoodsCartService();
    private UsersService us = new UsersService();
    private UserAddressService uas = new UserAddressService();
    
    public OrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		HttpSession session = request.getSession();
		String backString=null;
		List<GoodsCart> listgc = null;
		List<UserAddress> listua = null;
		List<Goods_order> listgo = null;
		Users_info users_info = null;
		boolean result = true;
		if(request.getParameter("op")!=null){
			String op = request.getParameter("op");				
			/*判断是否是提交按钮的操作*/
			if(op.equals("submitOrder")){

				String username = request.getParameter("UserName");
				String ordercontent = "";
				int orderid = 0;
				double orderbalance = 0;
				String usertel = null;
				String  useraddress = null;
				
				int userid= us.getUserId(username);
				listgc=gcs.selectAllCart(username);
				int addressid =Integer.parseInt(request.getParameter("UserAddress"));
				listua=uas.selectAllAddressid(addressid);
				for (UserAddress userAddress : listua) {
					usertel = userAddress.getRECEIVERTEL();
					useraddress = userAddress.getUSERADDRESS();
				}
				for (GoodsCart goodscart : listgc) {					
					orderbalance += (goodscart.getGOODSPRICE()*goodscart.getGOODSCOUNT());
					ordercontent += "商品名："+goodscart.getGOODSNAME()+",单价："+goodscart.getGOODSPRICE()+",数量："+goodscart.getGOODSCOUNT()+";";					
				}
				Goods_order goodsOrder = new Goods_order(ordercontent,orderbalance,username,usertel,useraddress);
				os.addOrders(goodsOrder);
				listgo = os.selectByName(username);
				for (Goods_order goods_order : listgo) {
					orderid = goods_order.getORDERID();
					orderbalance = goods_order.getORDERBALANCE();
				}
				request.setAttribute("orderid", orderid);
				request.setAttribute("orderbalance", orderbalance);				
				gcs.deleteGoodsByName(username);
				request.getRequestDispatcher("paymoney.jsp").forward(request, response);				
			}
			
			if(op.equals("gotoOrder")) {
				String username = request.getParameter("UserName");
				int orderid = 0;
				double orderbalance = 0;
				String oBalance =null;
				String oId=null;
				if(request.getParameter("Orderid")!=null) {
					oId = request.getParameter("Orderid");
					
				}
				if (request.getParameter("Orderbalance")!=null) {
					oBalance= request.getParameter("Orderbalance");
				}
				request.setAttribute("orderid", oId);
				request.setAttribute("orderbalance", oBalance);		
				request.getRequestDispatcher("paymoney.jsp").forward(request, response);
				return;
			}
			
			if(op.equals("payOrder")){
				
				String username = request.getParameter("UserName");
				double orderbalance = 0;
				String usertel = null;
				String useraddress = null;
				int orderid= Integer.parseInt((String) request.getParameter("OrderId"));
						
				os.updateOrders(orderid,username);
				listgo = os.selectById(orderid);
				for (Goods_order goods_order : listgo) {
					orderbalance = goods_order.getORDERBALANCE();
					usertel = goods_order.getUSERTEL();
					useraddress = goods_order.getUSERADDRESS();
				}
				request.setAttribute("orderid", orderid);
				request.setAttribute("orderbalance", orderbalance);
				request.setAttribute("usertel", usertel);
				request.setAttribute("useraddress", useraddress);
				request.getRequestDispatcher("paysuccess.jsp").forward(request, response);				
			}
			
			if(op.equals("notOrder")){
				String username = "aaaa";
				int orderid = Integer.parseInt(request.getParameter("OrderId"));
									
				os.updateOrders(orderid,username);
				
				Gson g = new Gson();
				backString = g.toJson(result);
			}
			
			/*回传jsp页面*/
			PrintWriter  out = response.getWriter();
			out.print(backString);
			out.close();
		}
	}

		
}
