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

import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.GoodsCart;
import com.etc.lzxp.entity.Goods_Picture;
import com.etc.lzxp.entity.Users_info;
import com.etc.lzxp.service.GoodsCartService;
import com.etc.lzxp.service.GoodsPicture;
import com.etc.lzxp.service.GoodsService;
import com.etc.lzxp.service.OrdersService;
import com.etc.lzxp.service.UsersService;
import com.google.gson.Gson;

/**
 * ��Ʒ��Servlet
 * @author yangxin
 *
 */
@WebServlet("/GoodsCartServlet")
public class GoodsCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GoodsService gs= new GoodsService();
    private OrdersService os = new OrdersService();
    private GoodsCartService gcs = new GoodsCartService();
    private UsersService us = new UsersService();
    private GoodsPicture gp = new GoodsPicture();
    List<GoodsCart> listgc = new ArrayList<GoodsCart>();
    
    public GoodsCartServlet() {
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
		
		Users_info users_info = null;
		boolean result = true;
		int count = 0;
		String username = null;
		if(request.getParameter("op")!=null){
			String op = request.getParameter("op");
			//��ʼ�����ﳵ
			if(op.equals("queryShopCart")){	
				if(request.getParameter("UserName")!= null&&!request.getParameter("UserName").equals("")){
					username = (String) request.getParameter("UserName");
					listgc= gcs.selectAllCart(username);
				}else {
					session.setAttribute("goodscart", listgc);
					listgc = (List<GoodsCart>) session.getAttribute("goodscart");
				}				
				Gson g = new Gson();
				backString = g.toJson(listgc);
			}
			
			//�ѹ��ﳵ�е���Ʒɾ��
			if(op.equals("queryGoodsDelete")){								
				if(request.getParameter("UserName")!=null&&!request.getParameter("UserName").equals("")){
					int goodsid= Integer.parseInt(request.getParameter("GoodsID"));
					username = (String) request.getParameter("UserName");						
					gcs.deleteGoods(goodsid, username);
					listgc= gcs.selectAllCart(username);
					Gson g = new Gson();
					backString = g.toJson(listgc);
				}else {
					int goodsid= Integer.parseInt(request.getParameter("GoodsID"));	
					GoodsCart goodscartdel = new GoodsCart();
					listgc = (List<GoodsCart>)session.getAttribute("goodscart");
					for(int i=0; i<listgc.size();i++) {
						if(goodsid==listgc.get(i).getGOODSID()) {
							listgc.remove(i);
						}
					}	
					request.getSession().setAttribute("goodscart", listgc);
					Gson g = new Gson();
					backString = g.toJson(listgc);
				}
			}	
			
			//�ѵ������Ʒ��ӵ����ﳵ
			if(op.equals("queryGoodsById")){
				if(request.getParameter("UserName")!=null&&!request.getParameter("UserName").equals("")){
					username = (String) request.getParameter("UserName");
					int goodsid= Integer.parseInt(request.getParameter("GoodsID"));					
					int goodscount = Integer.valueOf(request.getParameter("GoodsCount"));					
					Goods goods =gs.getGoodsById(goodsid);
					//�����ݴ浽���ﳵ����
					listgc= gcs.selectCart(username,goodsid);
					if(!listgc.isEmpty()){
						
						List<GoodsCart> list = gcs.selectCartById(goodsid);
						for (GoodsCart goodsCart : list) {
							count = goodsCart.getGOODSCOUNT();
						}
						int sum=count+goodscount;
						gcs.updateCount(username, goodsid, sum);
					}else{	
						
						gcs.addNewGoods(username,goodsid,goodscount,goods.getGOODSPRICE(),goods.getGOODSNAME());
					}								
					listgc= gcs.selectAllCart(username);
					Gson g = new Gson();
					backString = g.toJson(listgc);
				}else {
					int goodsid= Integer.parseInt(request.getParameter("GoodsID"));
					int goodscount = Integer.valueOf(request.getParameter("GoodsCount"));
				    List<Goods_Picture> listpicture =  (List<Goods_Picture>) gp.selectPictureById(goodsid);
					String goodspicture = null;
					for (Goods_Picture goods_Picture : listpicture) {
						goodspicture = goods_Picture.getPICTUREADDRESS();
					}
					Goods goods = gs.getGoodsById(goodsid);
					double goodsprice = goods.getGOODSPRICE();
					String goodsname = goods.getGOODSNAME();
					boolean flaggood=true;					
					//�����ݴ浽Session	
					listgc = (List<GoodsCart>)session.getAttribute("goodscart");					
					if(listgc.size()>0) {
						for (GoodsCart goodsCart : listgc) {
							if(goodsid==goodsCart.getGOODSID()) {								
								goodsCart.setGOODSCOUNT(goodscount+goodsCart.getGOODSCOUNT());		
								flaggood = false;
								}																
						}						
						if(flaggood) {							
							GoodsCart goodscart = new GoodsCart(goodsid, goodscount, goodsprice,goodsname,goodspicture);
							listgc.add(goodscart);								
						}
					}else {
 							GoodsCart goodscart = new GoodsCart(goodsid, goodscount, goodsprice,goodsname,goodspicture);
							listgc.add(goodscart);	
						}
					request.getSession().removeAttribute("goodscart");
					session.setAttribute("goodscart", listgc);
					}
					Gson g = new Gson();
					backString = g.toJson(listgc);				
			}	
			
			//��������
			if(op.equals("paynow")){
				if(request.getParameter("UserName")!=null&&!request.getParameter("UserName").equals("")){
					username = (String) request.getParameter("UserName");
					int goodsid= Integer.parseInt(request.getParameter("GoodsID"));					
					int goodscount = Integer.valueOf(request.getParameter("GoodsCount"));					
					Goods goods =gs.getGoodsById(goodsid);					
					//�����ݴ浽���ﳵ����
					listgc= gcs.selectCart(username,goodsid);
					if(!listgc.isEmpty()){
						
						List<GoodsCart> list = gcs.selectCartById(goodsid);	
						for (GoodsCart goodsCart : list) {
							count = goodsCart.getGOODSCOUNT();
						}
						int sum=count+goodscount;
						gcs.updateCount(username, goodsid, sum);
					}else{	
						
						gcs.addNewGoods(username,goodsid,goodscount,goods.getGOODSPRICE(),goods.getGOODSNAME());
					}								
							
				}
			}
			/*�ж��Ƿ����ύ��ť�Ĳ���*/
			if(op.equals("submitOrder")){
				username = request.getParameter("UserName");
				listgc = gcs.selectAllCart(username);					
				if(!listgc.isEmpty()){
					//�洢���ݵ����ݿ���										
					result = true;
					Gson g = new Gson();
					backString = g.toJson(result);
					//��ת��֧��ҳ��
				}
				else{
					result = false;
					Gson g = new Gson();
					backString = g.toJson(result);
				}
			}
			/*�ش�jspҳ��*/
			PrintWriter out = response.getWriter();
			out.print(backString);
			//System.out.println("backString :"+backString);
			out.close();
		}
	}		
}
