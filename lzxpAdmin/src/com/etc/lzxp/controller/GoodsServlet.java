package com.etc.lzxp.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.GoodsAndStype;
import com.etc.lzxp.entity.GoodsStypePicture;
import com.etc.lzxp.entity.Goods_stype;
import com.etc.lzxp.service.GoodsService;

/**
 * Servlet implementation class GoodsServlet
 */
@WebServlet("/GoodsServlet")
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "images";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
 
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
		
		List<GoodsStypePicture> list =new ArrayList<GoodsStypePicture>();
		
		GoodsService gs= new GoodsService();
		
		if (request.getParameter("op") != null) {

			// 将op的值取出来 判断这个值
			String op = request.getParameter("op");

			if (op.equals("getAllGoods")) {
				// 查询所有，调用Service中的方法 
				list = gs.getAllGoods();

			}   else if (op.equals("addGoods")) {
				/**
				 * 增加商品
				 */
				
				String goodsName = null;
				String stypeName = null;
				double goodsPrice =1;
				String goodsContent = null;
				int goodsStock = 0;
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				 
				ServletFileUpload upload = new ServletFileUpload(factory);
				String tableName = "";
				Integer month = 0;
				String fileName = "";//文件名
				String path ="";//存储路径
				try {
				    List items = upload.parseRequest(request);
				    InputStream is = null;
				    Iterator iter = items.iterator();
				    while(iter.hasNext()) {
				        FileItem item = (FileItem)iter.next();
				        // 判断该属性是否是file类型
				        if (!item.isFormField()) {
				        	//获取文件名
							fileName = item.getName();
							//存储路径
							/*path =request.getRealPath("/img/"+fileName);*/
							File uploadedFile = new File("E://git/lzxp/WebContent/img/jianguo/"+fileName);//存到前台
							/*File myFile = new File(path);//存到后台
*/							//写数据
							item.write(uploadedFile);
				         } else {
				            // 不是file类型的话，就利用getFieldName判断name属性获取相应的值
				        	 String name = item.getFieldName();
				        	 String value = item.getString("utf-8");
				             if("goodsName".equals(name)) {
				                 goodsName = value;
				          }else if (name.equals("stype")) {
							//小类型
							stypeName = value;
							if ("default".equals(stypeName)) {
								stypeName = null;
									}
				          }else if (name.equals("goodsPrice")) {
									//价格
									
									if (!"".equals(value)) {
										//如果价格不为空值
										goodsPrice= Double.parseDouble(value);
									}
				          }else if (name.equals("goodsContent")) {
									//内容
									goodsContent = value;
						  }else{
									//库存
									if (!"".equals(name)) {
										//如果库存不为空值
										goodsStock = Integer.parseInt(value);
									}
								}
				         }
				    }
				} catch(Exception e) {
				    e.printStackTrace();
				}
				
			   
				//创建商品对象
				Goods goods = new Goods(0, goodsName, 0, goodsPrice, goodsContent, goodsStock, 0);
				
				// 调用service的add方法
				boolean updateSucess = gs.addGoods(goods, stypeName,"img/jianguo/"+fileName);
				//获取所有商品
				list = gs.getAllGoods();
				//设置操作结果参数
				request.setAttribute("updateSucess", updateSucess);
		        
			}  else if (op.equals("deleteGoods")) {

				// 删除操作
				String goodsIdStr = request.getParameter("goodsIdStr");
				
				String[] goodsId=goodsIdStr.split(",");
				
				for(int i=0;i<goodsId.length;i++){
					
					boolean updateSucess = gs.deleteGoods(Integer.parseInt(goodsId[i]));
					
					request.setAttribute("updateSucess", updateSucess);
				}
				
				/*System.out.println(request.getParameter("nowPage"));
				if (request.getParameter("nowPage")!=null) {
					//如果当前不为空
					//获取当前页面
					int nowPage = Integer.parseInt(request.getParameter("nowPage"));
					//设置传递参数
//					request.setAttribute("nowPage", nowPage);
//				}*/

				list = gs.getAllGoods();

			}else if (op.equals("updateGoods")) {

				/**
				 * 修改商品
				 */
				int goodsId = Integer.parseInt(request.getParameter("goodsId"));
				
				String goodsName = request.getParameter("goodsName");
				String goodsStype = "坚果炒货";
				if (!"default".equals(request.getParameter("goodsStype"))) {
					//如果商品小类不为空
					goodsStype = request.getParameter("goodsStype");
				}
				double goodsPrice = Double.parseDouble(request.getParameter("goodsPrice"));
				String goodsContent = request.getParameter("goodsContent");
				int stypeStock = Integer.parseInt(request.getParameter("goodsStock"));
				
				Goods goods=new Goods(goodsId,goodsName, 0,goodsPrice,goodsContent,stypeStock,0);
				//增加商品
				boolean updateSucess =gs.updateGoods(goods, goodsStype);
				
				list = gs.getAllGoods();
				request.setAttribute("updateSucess", updateSucess);
			
			}
		}

		// 将结果返回给goods-list.jsp
		
		//获取商品的小类
		List<Goods_stype> stypeList = gs.getStype();
		
		//传递商品小类参数
		request.setAttribute("stypeList", stypeList);
		// 先设置要传递的数据
		request.setAttribute("list", list);

		// 再转发
		request.getRequestDispatcher("goods-list.jsp").forward(request, response);
	
	}

}
