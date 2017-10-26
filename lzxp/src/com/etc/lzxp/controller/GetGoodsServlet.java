package com.etc.lzxp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.lzxp.entity.V_AllGoods;
import com.etc.lzxp.service.GetGoodsService;

/**
 * Servlet implementation class GetGoodsServlet
 */
@WebServlet("/GetGoodsServlet")
public class GetGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

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
		//绝对路径
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
		+ request.getContextPath() + "/";
        //编码设置
		request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        GetGoodsService gs = new GetGoodsService();
        List<V_AllGoods> list = new ArrayList<V_AllGoods>();
        HttpSession session = request.getSession();
		int goodsState = 1;
        String op = null;
        if(request.getParameter("op")!=null) {
        	op= request.getParameter("op");
        	if(op.equals("queryAllGoods")) {
        	    list = gs.getAllGoodsByLtype(goodsState);
        	}
        	
        }   
        session.setAttribute("flag",1);
        request.setAttribute("list", list);
        //转发
        request.getRequestDispatcher("ltype.jsp").forward(request,response);
		
		
	}
}
