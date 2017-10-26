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
import com.etc.lzxp.entity.UserAddress;
import com.etc.lzxp.entity.Users_info;
import com.etc.lzxp.service.GoodsCartService;
import com.etc.lzxp.service.GoodsService;
import com.etc.lzxp.service.OrdersService;
import com.etc.lzxp.service.UserAddressService;
import com.etc.lzxp.service.UsersService;
import com.google.gson.Gson;

/**
 * ��Ʒ��Servlet
 * @author zhuzhen
 *
 */
@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GoodsService gs= new GoodsService();
    private OrdersService os = new OrdersService();
    private GoodsCartService gcs = new GoodsCartService();
    private UsersService us = new UsersService();
    private UserAddressService uas = new UserAddressService();
    
    public AddressServlet() {
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
		Users_info users_info = null;
		String username = null;
		if(request.getParameter("op")!=null){
			String op = request.getParameter("op");
			//��ʼ���ջ���ַ�͹��ﳵ�е���Ʒ��Ϣ
			if(op.equals("queryAllAddress")){	
				if(request.getParameter("UserName")!= null){
					username = (String) request.getParameter("UserName");
				}
				int userid= us.getUserId(username);
				listua = uas.selectAllAddress(userid);
				Gson g = new Gson();
				backString = g.toJson(listua);
			}
			
			//��ʼ��ҳ�����Ϣ��ʾ
			if(op.equals("queryAllGoods")){	
				if(request.getParameter("UserName")!= null){
					username = (String) request.getParameter("UserName");
				}
				listgc= gcs.selectAllCart(username);
				Gson g = new Gson();
				backString = g.toJson(listgc);
			}
			
			//����û����ջ���ַ			
			if(op.equals("queryAddress")){	
				String useraddress = null;
				String receivertel = null;
				String receivername = null;
				if(request.getParameter("UserName")!=null){
						username = (String) request.getParameter("UserName");
						useraddress = (String) request.getParameter("UserAddress");
						receivertel = (String) request.getParameter("ReceiverTel");
						receivername = (String) request.getParameter("ReceiverName");						
				}
					int userid= us.getUserId(username);
					//�����ݴ浽�ջ���ַ����
					uas.addNewAddress(userid, useraddress, receivertel, receivername);
					listua= uas.selectAllAddress(userid);					
					Gson g = new Gson();
					backString = g.toJson(listua);
				}						
			
			//ɾ���û����ջ���ַ			
			if(op.equals("querydeleteAddress")){	
				if(request.getParameter("UserName")!=null){
						username = (String) request.getParameter("UserName");
						int addressid = Integer.parseInt(request.getParameter("AddressId"));
						uas.deleteAddress(addressid);
				}
					int userid= us.getUserId(username);
					//����������ɾ��					
					listua= uas.selectAllAddress(userid);					
					Gson g = new Gson();
					backString = g.toJson(listua);
				}
			
			/*�ж��Ƿ����ύ��ť�Ĳ���*/
			if(op.equals("submitOrder")){
				
			}
			/*�ش�jspҳ��*/
			PrintWriter  out = response.getWriter();
			out.print(backString);
			out.close();
		}
	}

		
}
