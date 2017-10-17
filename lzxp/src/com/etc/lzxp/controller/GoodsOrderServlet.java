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
 * �������Servlet
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
		//����������Ӧ����
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//����jason��ʽ����
		response.setContentType("application/json");
		PrintWriter out= response.getWriter();
		PageData<Goods_order> pd = new PageData<>();
		
		//��ʼ��ҳ��
		int page = 1;
		int pageSize = 2;
		
		GoodsOrderService gos = new GoodsOrderService();
		
		if (request.getParameter("op")!=null) {
			//��ȡop
			String op = request.getParameter("op");
			
			if ("showAll".equals(op)) {
				
				/**
				 * ��ʾ���ж���,��ҳ��ʾ����һҳ����һҳ
				 */
				//��ȡ����״̬
				if (request.getParameter("userState")!=null) {
					//�����Ʒ״̬��Ϊ��
					if ("all".equals(request.getParameter("userState"))) {
						//����
						UserState.US="%";
					}else if("noPay".equals(request.getParameter("userState"))){
						//δ����״̬
						UserState.US = "������";
					}else if ("noReceive".equals(request.getParameter("userState"))) {
						//���ջ�״̬
						UserState.US="���ջ�";
					}else if ("hasReceive".equals(request.getParameter("userState"))) {
						//���ջ�״̬
						UserState.US="���ջ�";
					}
				}
				
				if (request.getParameter("page")!=null) {
					page= Integer.parseInt(request.getParameter("page"));
				}
				if (request.getParameter("pageSize")!=null) {
					page= Integer.parseInt(request.getParameter("pageSize"));
				}
				
				//��ȡ�û���
				String userName = request.getParameter("userName");
				
				//�����һҳ
				if (request.getParameter("prevPage")!=null) {
					//�����ǰҳ�治Ϊ��
					int nowPage = Integer.parseInt(request.getParameter("prevPage"));
					if (nowPage >1) {
						//�����ǰҳ�����1������һҳ
						page = nowPage-1;
					}			
				}
				
				
				//�����һҳ
				if (request.getParameter("nextPage")!=null) {
					//�����ǰҳ�治Ϊ��
					int nowPage = Integer.parseInt(request.getParameter("nextPage"));
					//��ȡ��ҳ��
					pd = gos.getOrder(page, pageSize,userName,UserState.US);
					int tatalPage = pd.getTotalPage();
					if (nowPage <tatalPage) {
						//�����ǰҳ��С����ҳ��������һҳ
						page = nowPage+1;
					}else{
						//���򣬹̶��ڸ�ҳ
						page = tatalPage;
					}			
				}
				
				
				/**
				 * ���ݶ������û�״̬����
				 */
			
				//����gos�ķ�������ȡ��Ʒ��
				pd = gos.getOrder(page, pageSize,userName,UserState.US);
				//ajax��ӡ
				printJson(out, pd);
				
			
			}/*else if ("noPay".equals(op)) {*/
				/**
				 * ���ݶ������û�״̬����
				 */
				/*String userName = null;
				if (request.getParameter("userName")!=null) {
					//����û�����Ϊ��
					userName = request.getParameter("userName");
				}
				if (request.getParameter("userState")!=null) {
					//����������û�״̬��Ϊ��
					if ("noPay".equals(request.getParameter("userState"))) {
						System.out.println(11111);
						//���Ϊδ����״̬
						userState = "δ����";
						//����״̬��ѯ
						pd = gos.getOrderByNoPay(page, pageSize, userName, userState);
					}
				}
				//ajax��ӡ
				printJson(out, pd);*/
			
			/*}*/
		
		
		
		
		}
		
	}
	
	
	//ajax��ӡ
	private void printJson(PrintWriter out,Object result){
		//����Json
		Gson gson = new Gson();
		//ת����Json��ʽ
		String str = gson.toJson(result);
		//��ӡ
		out.print(str);
		//�ͷ���Դ
		out.close();
	}

}
