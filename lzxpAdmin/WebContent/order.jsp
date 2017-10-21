<%@page import="java.util.ArrayList"%>
<%@page import="com.etc.lzxp.entity.Goods_order"%>
<%@page import="java.util.List"%>
<%@page import="com.etc.lzxp.service.Goods_OrderService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";

	//折中处理一下
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>系统后台</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="js/jquery.min.js"></script>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/uniform.css" />
		<link rel="stylesheet" href="css/select2.css" />		
		<link rel="stylesheet" href="css/unicorn.main.css" />
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />	
		<link rel="stylesheet" type="text/css" href="css/iconfont.css">
		<scriptsrc="//cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>	
	   
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>



</head>
<body>
		
		<div id="header">
	
		<h1>
			<a href="#">零嘴小铺</a>
		</h1>
		
	</div>

	<!-- 左侧菜单栏 -->
	<div id="sidebar">
		<ul>
			<li><a href="index.jsp"><i class="icon icon-home"></i> <span>后台首页</span></a></li>


				<li class="submenu active open">
					<a href="#"><i class="icon icon-th-list"></i> <span>订单管理</span></a>
					<ul>
						<li class="" id="receiveOrder"><a  id="getAllSSycl" href="Goods_OrderServlet?op=getAllSSycl&active=1" >已接订单</a></li>
						<li class="" id="noReceiveOrder"><a href="Goods_OrderServlet?op=getAllSSwcl&active=2" id="getAllSSwcl" >未接订单</a></li>
						
					</ul>
				</li>

				<li class="submenu"><a href="#"><i
					class="icon icon-th-list"></i> <span>商品管理</span></a>
				<ul>
					<li class="active"><a href="GoodsServlet?op=getAllGoods">商品列表</a></li>
					<li><a href="GoodsSortServlet?op=getAllGoodsSort">商品分类</a></li>
					<li><a href="GoodsStateServlet?op=getGoodsState">商品状态</a></li>
				</ul></li>

			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>交易记录管理</span></a>
				<ul>
					<li><a href="GoodsOrderServlet?op=getAllOrder">交易记录</a></li>
				</ul></li>

			<!-- <li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>评论管理</span></a>
				<ul>
					<li><a href="#">评论列表</a></li>
					<li><a href="#">意见反馈</a></li>
				</ul></li> -->
		</ul>
		</div>
		
		<div id="style-switcher">
			<i class="icon-arrow-left icon-white"></i>
			<span>Style:</span>
			<a href="#grey" style="background-color: #555555;border-color: #aaaaaa;"></a>
			<a href="#blue" style="background-color: #2D2F57;"></a>
			<a href="#red" style="background-color: #673232;"></a>
		</div>
		
		<div id="content">
			<div id="content-header">
				<h1>订单管理</h1>
				
				<!-- 消息提醒 -->
				<marquee id="msg" style="color:red; font-size:20px" direction=right behavior=alternate scrollamount=6 height=100 width=50% onmouseover=this.stop() onmouseout=this.start()></marquee>
				
				<div class="btn-group">
				 
				<a class="btn btn-large tip-bottom" title="确认订单" id="surebtn" ><i class="iconfont icon-qianshoushenpitongguo-xianxing"></i></a>
				<a class="btn btn-large tip-bottom" title="配送" id="surebtnP" ><i class="iconfont icon-yunshuzhongwuliu-xianxing"></i></a>
					<a class="btn btn-large tip-bottom" title="确认所有未接订单" id="updateGOSSWJD" href="Goods_OrderServlet?op=updateGoods_OrderBySallerState_WJD"><i class="iconfont icon-qianshoushenpitongguo"></i></a>
					<a class="btn btn-large tip-bottom" title="配送所有" id="updateGOSSYJD" href="Goods_OrderServlet?op=updateGoods_OrderBySallerState_YJD"><i class="iconfont icon-yunshuzhongwuliu"></i></a>
					<a class="btn btn-large tip-bottom" title="确认收货" id="updateGOSSPSZ" href="Goods_OrderServlet?op=updateGoods_OrderBySallerState_PSZ"><i class="iconfont icon-chaibaoguoqujian"></i></a>
				</div>
			</div>
		
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>后台首页</a>
				<a href="#" class="current">订单管理</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						
						
						<div class="widget-box">
							<div class="widget-title">
							
								<h5>订单信息列表</h5>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered data-table">
									<thead>
									<tr>
									<th><input type="checkbox"></th>
									<th>订单id</th>
									<th>下单日期</th>
									<th>订单内容</th>
									<th>订单价格</th>
									<th>买家用户名</th>
									<th>联系方式</th>
									<th>收货地址</th>
									<th>订单状态</th>
									<th>付款状态</th>
									</tr>
									</thead>
									<tbody>
									
									
		<c:if test="${requestScope.list!=null}">
	 	  <c:forEach items="${requestScope.list}" var="go">
		<tr class="gradeA">
		<td>
		
		<input type="checkbox" value="${go.ORDERID}" id="orderId" name="orderID" class = "orderID"></td>
			<td>${go.ORDERID}</td>
			<td>${go.ORDERDATE}</td>
			<td>${go.ORDERCONTENT}</td>
			<td>${go.ORDERBALANCE}</td>
			<td>${go.USERNAME}</td>
			<td>${go.USERTEL}</td>
			<td>${go.USERADDRESS}</td>
			<td class="SALLERSTATE">${go.SALLERSTATE}</td>
			<td>${go.USERSTATE}</td>			
		</tr>
		
		
	     </c:forEach>
       </c:if>
							
													
									</tbody>
									</table>  
							</div>
						</div>
					</div>
				</div>
				
				<div class="row-fluid">
					<div id="footer" class="span12">
						 版权所有 &copy; 2008-2016 厦门中软卓越教育服务有限公司  闽ICP备14019087号

					</div>
				</div>
			</div>
		</div>
		
		
           
            <script src="js/jquery.min.js"></script>
            <script src="js/jquery.ui.custom.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery.uniform.js"></script>
            <script src="js/select2.min.js"></script>
            <script src="js/jquery.dataTables.min.js"></script>
            <script src="js/unicorn.js"></script>
            <script src="js/unicorn.tables.js"></script>
            <script type="text/javascript" scr="js/iconfont.js"></script>
            
            
            <!-- lay外置插件 -->
<script src="js/jquery-2.1.0.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="layui/layer.css">
<script src="layui/layer.js" type="text/javascript"></script>
<!-- lay外置插件 -->

<script type="text/javascript">
/**
 * 状态改变
 */
 $(function(){
	 
 
	 
	 /* 菜单样式初始化 */
	 if (${requestScope.active !=null}) {
		//如果active不未空
		if (${"1".equals(requestScope.active)}) {
			//如果为1，为已接单
			$("#receiveOrder").attr("class","active");
		}else{
			//如果为2
			$("#noReceiveOrder").attr("class","active");
		}
	}
	 
	 /* 订单消息提醒 */
		setInterval(message, 1000);
		function message() {
			$.post("SellerMessageServlet",{"op":"message"},function(data,status){
				if (data) {
					//如果有消息
					$("#msg").text("您有新订单~");
				}else{
					//没消息
					$("#msg").text("");;
				}
			});
		}
	 
		/* 未处理订单点击事件 */
		$("#getAllSSwcl").click(function () {
			/* 将消息提醒取消 */
			$.post("SellerMessageServlet",{"op":"cancelMessage"},function(data,status){
			});
		});
		
	 
	 /* 判断状态是否为未接单   */
	 $("#surebtn").click(function(){
		var orderId = "";
		//id写入字符串
		 $('input:checkbox:checked').each(function(){			
		 var SALLERSTATE = $(this).parents("tr").find("td").eq(8).text();
		 $(".SALLERSTATE").val(SALLERSTATE);
		 if (SALLERSTATE=="未接单") {
			orderId += $(this).val()+",";  
		}else {
			/* 操作失败 */
			layer.msg('操作失败', {icon: 5});
			alert(500);
			return false;
		}
		 
            });
		location.href="${path}Goods_OrderServlet?op=uGOByIdSs_WJD&orderId="+orderId;
	 });
	  	
	 /* 判断状态是否为已接单   */
	 $("#surebtnP").click(function(){
			var orderId = "";
			 $('input:checkbox:checked').each(function(){			
				var SALLERSTATE = $(this).parents("tr").find("td").eq(8).text();
				 $(".SALLERSTATE").val(SALLERSTATE);
				 if (SALLERSTATE!="已接单") {
				orderId += $(this).val()+",";   
				}
				 else {
					 /* 操作失败 */
					 alert(500);
					layer.msg('操作失败', {icon: 5});
					return false;
					
				}
	            });
			 location.href="${path}Goods_OrderServlet?op=uGOByIdSs_YJD&orderId="+orderId;
		 });

 });
	
</script>
	</body>
</html>