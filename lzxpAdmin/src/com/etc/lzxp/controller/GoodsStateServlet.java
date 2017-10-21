package com.etc.lzxp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.lzxp.entity.GoodsAndStype;
import com.etc.lzxp.entity.GoodsStypePicture;
import com.etc.lzxp.service.GoodsService;

/**
 * @author Administrator 商品管理---商品状态
 */
@WebServlet("/GoodsStateServlet")
public class GoodsStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<GoodsStypePicture> list = new ArrayList<>();

		if (request.getParameter("op") != null) {
			// 如果op不为空
			String op = request.getParameter("op");

			GoodsService gs = new GoodsService();

			if (op.equals("getGoodsState")) {
				// 商品状态显示
				list = gs.getAllGoods();

			} else if (op.equals("upGoods")) {
				//商品上架
				String goodsId = request.getParameter("goodsId");

				gs.upGoods(Integer.parseInt(goodsId));

				list = gs.getAllGoods();
			}else if (op.equals("downGoods")) {
				//商品下架
				String goodsId = request.getParameter("goodsId");

				gs.downGoods(Integer.parseInt(goodsId));

				list = gs.getAllGoods();
			}
			// 设置传递参数
			request.setAttribute("list", list);
			// 页面跳转
			request.getRequestDispatcher("goods-state.jsp").forward(request, response);
		}
	}

}
