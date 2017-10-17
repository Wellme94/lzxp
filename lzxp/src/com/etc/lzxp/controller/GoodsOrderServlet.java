package com.etc.lzxp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.lzxp.entity.Goods_order;
import com.etc.lzxp.entity.UserState;
import com.etc.lzxp.entity.Users;
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
		int pageSize = 2;
		
		GoodsOrderService gos = new GoodsOrderService();
		
		if (request.getParameter("op")!=null) {
			//获取op
			String op = request.getParameter("op");
			
			if ("showAll".equals(op)) {
				
				/**
				 * 显示所有订单,分页显示，上一页，下一页
				 */
				//获取订单状态
				if (request.getParameter("userState")!=null) {
					//如果商品状态不为空
					if ("all".equals(request.getParameter("userState"))) {
						//所有
						UserState.US="%";
					}else if("noPay".equals(request.getParameter("userState"))){
						//未付款状态
						UserState.US = "待付款";
					}else if ("noReceive".equals(request.getParameter("userState"))) {
						//待收货状态
						UserState.US="待收货";
					}else if ("hasReceive".equals(request.getParameter("userState"))) {
						//已收货状态
						UserState.US="已收货";
					}
				}
				
				if (request.getParameter("page")!=null) {
					page= Integer.parseInt(request.getParameter("page"));
				}
				if (request.getParameter("pageSize")!=null) {
					page= Integer.parseInt(request.getParameter("pageSize"));
				}
				
				//获取用户名
				String userName = request.getParameter("userName");
				
				//点击上一页
				if (request.getParameter("prevPage")!=null) {
					//如果当前页面不为空
					int nowPage = Integer.parseInt(request.getParameter("prevPage"));
					if (nowPage >1) {
						//如果当前页面大于1，则上一页
						page = nowPage-1;
					}			
				}
				
				
				//点击上一页
				if (request.getParameter("nextPage")!=null) {
					//如果当前页面不为空
					int nowPage = Integer.parseInt(request.getParameter("nextPage"));
					//获取总页数
					pd = gos.getOrder(page, pageSize,userName,UserState.US);
					int tatalPage = pd.getTotalPage();
					if (nowPage <tatalPage) {
						//如果当前页面小于总页数，则下一页
						page = nowPage+1;
					}else{
						//否则，固定在该页
						page = tatalPage;
					}			
				}
				
				
				/**
				 * 根据订单的用户状态搜索
				 */
			
				//调用gos的方法，获取商品名
				pd = gos.getOrder(page, pageSize,userName,UserState.US);
				//ajax打印
				printJson(out, pd);
				
			
			}/*else if ("noPay".equals(op)) {*/
				/**
				 * 根据订单的用户状态搜索
				 */
				/*String userName = null;
				if (request.getParameter("userName")!=null) {
					//如果用户名不为空
					userName = request.getParameter("userName");
				}
				if (request.getParameter("userState")!=null) {
					//如果订单的用户状态不为空
					if ("noPay".equals(request.getParameter("userState"))) {
						System.out.println(11111);
						//如果为未付款状态
						userState = "未付款";
						//根据状态查询
						pd = gos.getOrderByNoPay(page, pageSize, userName, userState);
					}
				}
				//ajax打印
				printJson(out, pd);*/
			
			/*}*/
		
		
		
		
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
