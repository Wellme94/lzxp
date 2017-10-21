<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--  
	后台主页面
-->
	<head>
		<title>零嘴小铺后台管理系统</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/fullcalendar.css" />	
		<link rel="stylesheet" href="css/unicorn.main.css" />
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function () {
			
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
			
		});
		
	</script>
	
	
	</head>
<body>
		<div id="header">
			<h1><a href="#">零嘴小铺后台管理系统</a></h1>		
		</div>
		
         <!-- 左侧菜单栏 -->   
		<div id="sidebar">
			<ul>
				<li class="active"><a href="index.jsp"><i class="icon icon-home"></i> <span>后台首页</span></a></li>

				<li class="submenu">
					<a href="#"><i class="icon icon-th-list"></i> <span>订单管理</span> </a>
					<ul>
						<li class="" id="receiveOrder"><a  id="getAllSSycl" href="Goods_OrderServlet?op=getAllSSycl&active=1" >已接订单</a></li>
						<li class="" id="noReceiveOrder"><a href="Goods_OrderServlet?op=getAllSSwcl&active=2" id="getAllSSwcl" >未接订单</a></li>
						
					</ul>
				</li>

				<li class="submenu">
					<a href="#"><i class="icon icon-th-list"></i> <span>商品管理</span></a>
					<ul>
						<li><a href="GoodsServlet?op=getAllGoods">商品列表</a></li>
						<li><a href="GoodsSortServlet?op=getAllGoodsSort">商品分类</a></li>
						<li><a href="GoodsStateServlet?op=getGoodsState">商品状态</a></li>
					</ul>
				</li>
				
				<li class="submenu">
					<a href="#"><i class="icon icon-th-list"></i> <span>交易记录管理</span></a>
					<ul>
						<li><a href="GoodsOrderServlet?op=getAllOrder">交易记录</a></li>		
					</ul>
				</li>

	          <!-- <li class="submenu">
					<a href="#"><i class="icon icon-th-list"></i> <span>评论管理</span></a>
					<ul>
						<li><a href="#">评论列表</a></li>
						<li><a href="#">意见反馈</a></li>
					</ul>
				</li> -->

			</ul>
		</div>
		
		<div id="style-switcher">
			<i class="icon-arrow-left icon-white"></i>
			<span>Style:</span>
			<a href="#grey" style="background-color: #555555;border-color: #aaaaaa;"></a>
			<a href="#blue" style="background-color: #2D2F57;"></a>
			<a href="#red" style="background-color: #673232;"></a>
		</div>
		
		<!-- 后台首页 -->
		<div id="content">
			<div id="content-header">
				<h1>零嘴小铺</h1>
				
				<!-- 消息提醒 -->
				<marquee id="msg" style="color:red; font-size:20px" direction=right behavior=alternate scrollamount=6 height=100 width=50% onmouseover=this.stop() onmouseout=this.start()></marquee>
				
			</div>
			<div id="breadcrumb">
				<a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>零嘴小铺后台首页</a>
				<a href="#" class="current">零嘴小铺后台</a>
			</div>
			<div class="container-fluid">
				<!-- <div class="row-fluid">
					<div class="span12 center" style="text-align: center;">					
						<ul class="stat-boxes">
							<li>
							<div class="left peity_bar_neutral">订单管理</div>
								<div class="right">已处理   未处理</div>
							</li>
							<li>
								<div class="left peity_bar_neutral">类型信息的管理</div>
								<div class="right">
									商品管理
								</div>
							</li>
							<li>
								<div class="left peity_bar_bad"><span>新闻列表和增加</span></div>
								<div class="right">
									交易记录管理
								</div>
							</li>
							<li>
								<div class="left peity_line_good"><span>系统有关设置</span></div>
								<div class="right">
									系统设置
								</div>
							</li>
						</ul>
					</div>	
				</div> 
				
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box widget-calendar">
							<div class="widget-title"><span class="icon"><i class="icon-calendar"></i></span><h5>信息操作</h5></div>
							<div class="widget-content nopadding">
								<div class="calendar"></div>
							</div>
						</div>
					</div>
				</div>-->
				
				<div class="row-fluid">
					<div id="footer" class="span12">
						 版权所有 &copy; 2007-2017 零嘴小铺电子商务有限公司  闽ICP备15022981号
					</div>
				</div>
			</div>
		</div>
		
            <script src="js/excanvas.min.js"></script>
            <script src="js/jquery.min.js"></script>
            <script src="js/jquery.ui.custom.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery.flot.min.js"></script>
            <script src="js/jquery.flot.resize.min.js"></script>
            <script src="js/jquery.peity.min.js"></script>
            <script src="js/fullcalendar.min.js"></script>
            <script src="js/unicorn.js"></script>
            <script src="js/unicorn.dashboard.js"></script>
</body>
</html>