package com.etc.lzxp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.HTMLReader.ParagraphAction;

import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.ShowGoods;
import com.etc.lzxp.service.GetAllGoodsService;
import com.etc.util.PageData;
import com.google.gson.Gson;

/**
 * Servlet implementation class SearchstypeServlet
 */
@WebServlet("/GetAllGoodsServlet")
public class GetAllGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GetAllGoodsService gs = new GetAllGoodsService();
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
        System.out.println("哈哈我来访问你了");
        PrintWriter out = response.getWriter();
        int page = 1;
        int pageSize = 1;
        int stypeId = 0;
        PageData<ShowGoods> pd = null; 
        String goodsName = "";
        String op = null;
        if(request.getParameter("page")!=null) {
        	page = Integer.parseInt(request.getParameter("page"));
        	System.out.println("page:"+page);
        }
        if(request.getParameter("stypeId")!=null) {
		    stypeId = Integer.parseInt(request.getParameter("stypeId"));
		    System.out.println("stypeId:"+stypeId);
		  }
        if(request.getParameter("goodsName")!=null) {
        	goodsName = request.getParameter("goodsName"); 
        	System.out.println("goodsName:"+goodsName);
        }
        if(request.getParameter("op")!=null) {
        	 op = request.getParameter("op");
        	if(op.equals("queryAll")) {
        		System.out.println(op);
        		pd = gs.getGoodsBystypeId(page, pageSize,stypeId,goodsName);
        		System.out.println("pd:"+pd);
        	}
        }
		//判断op 和 querystypeId是否传递过来
      /*  if(request.getParameter("op")!=null) {
        	String op = request.getParameter("op");
        	if(op.equals("queryAllStype")) {
        		System.out.println("op:"+op);	   
        		  int id  = Integer.parseInt(stypeId);
        		   pd =  ss.getGoodsBystypeId(page, pageSize,1,goodsName);
        		    System.out.println("pd:"+pd);				
        		}       		
        	}  */
        Gson g = new Gson();
		String jsonString = g.toJson(pd);					
		/*System.out.println();*/
		response.setContentType("application/json");
		out.print(jsonString);
		out.close();  
	}
  } 

        
