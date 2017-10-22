package com.etc.lzxp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.HTMLReader.ParagraphAction;

import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.V_SearchGoods;
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
		  //编码设置
		request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
		//绝对路径
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
		+ request.getContextPath() + "/";
        response.setContentType("application/json");    
        System.out.println("哈哈我来访问你了");
        PrintWriter out = response.getWriter();
        PageData<V_SearchGoods> pd = null; 
        List<V_SearchGoods> list = null; 
        int page = 1;
        int pageSize = 4;                
        String keyword = "";
        int goodsState = 1;
        String op = null;
        int goodsId = 0;
        if(request.getParameter("page")!=null) {
        	if(!request.getParameter("page").equals("")) {
        	page = Integer.parseInt(request.getParameter("page"));
        	System.out.println("page:"+page);
        	}
        }      
        if(request.getParameter("keyword")!=null) {
        	keyword = request.getParameter("keyword");       	
        	System.out.println("keyword:"+keyword);
        }      
        if(request.getParameter("goodsId")!=null) {
        	if(request.getParameter("goodsId").length()>0) {
        	goodsId = Integer.parseInt(request.getParameter("goodsId"));
        	System.out.println("goodsId:"+goodsId);
        	}
        }
        if(request.getParameter("goodsState")!=null){
        	if(request.getParameter("stypeId").length()>0) {
        	goodsState = Integer.parseInt(request.getParameter("goodsState"));
         }
        }
        //页面请求操作
		if(request.getParameter("op")!=null) {
			op=request.getParameter("op");
			if(op.equals("queryAll")) {			      			  
			    pd = gs.getGoodsBykeyword(page, pageSize, keyword, goodsState);
			    System.out.println("pd:"+pd);
		  }else if(op.equals("queryGoodsById")) {
		    	 list = gs.getGoodsById(goodsId,goodsState);
		    	 System.out.println("list:"+list);
		    }
		}
		//list不为空
   	     if(list!=null) {
   	    	 request.setAttribute("list", list);
   	    	 request.getRequestDispatcher("detail.jsp").forward(request, response);
   	     }     
        //如果pd不为空
        if(pd!=null) {        	    		
    		Gson g = new Gson();
    		String jsonString = g.toJson(pd);
    		System.out.println("js："+jsonString);
    		out.print(jsonString);
    		out.close(); 
        }      
	}	
  } 

        
