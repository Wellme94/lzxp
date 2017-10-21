<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
	商品管理——商品状态
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>系统后台</title>
<meta charset="UTF-8" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />

<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.tables.js"></script>

<script type="text/javascript">
	$(function() {
		
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
		
		
		//商品上架
		$(".upGoods").click(function() {

			var goodsId = $(this).parents("tr").find("input").val();
			alert(goodsId);
			location.href = "GoodsStateServlet?op=upGoods&goodsId=" + goodsId;
		});

		$(".downGoods").click(
				function() {

					var goodsId = $(this).parents("tr").find("input").val();
					alert(goodsId);
					location.href = "GoodsStateServlet?op=downGoods&goodsId="
							+ goodsId;
				});

	});
</script>

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

			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>订单管理</span></a>
				<ul>
					<li class="" id="receiveOrder"><a  id="getAllSSycl" href="Goods_OrderServlet?op=getAllSSycl&active=1" >已接订单</a></li>
					<li class="" id="noReceiveOrder"><a href="Goods_OrderServlet?op=getAllSSwcl&active=2" id="getAllSSwcl" >未接订单</a></li>
						
				</ul></li>

			<li class="submenu active open"><a href="#"><i
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
		<i class="icon-arrow-left icon-white"></i> <span>Style:</span> <a
			href="#grey"
			style="background-color: #555555; border-color: #aaaaaa;"></a> <a
			href="#blue" style="background-color: #2D2F57;"></a> <a href="#red"
			style="background-color: #673232;"></a>
	</div>

	<div id="content">
		
		<!-- 消息提醒 -->
		<marquee id="msg" style="color:red; font-size:20px" direction=right behavior=alternate scrollamount=6 height=100 width=50% onmouseover=this.stop() onmouseout=this.start()></marquee>
		
		<!-- 内容 -->
		<div id="breadcrumb">
			<a href="index.jsp" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i>后台管理</a> <a href="#" class="current">商品状态</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<h5>商品状态</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th><input type="checkbox"></th>
										<th>商品名</th>
										<th>商品状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${requestScope.list!=null}">
										<c:forEach items="${requestScope.list}" var="goods">

											<tr class="gradeA">
												<td><input type="checkbox" value="${goods.GOODSID}"
													name="STYPEID"></td>
												<td>${goods.GOODSNAME}</td>
												<c:if test="${goods.GOODSSTATE == 0}">
													<td>下架</td>
												</c:if>
												<c:if test="${goods.GOODSSTATE == 1}">
													<td>上架</td>
												</c:if>
												<td>
												<a class="btn btn-large tip-bottom upGoods" title="上架"><i class="icon-arrow-up"></i></a> 
												
												<a class="btn btn-large tip-bottom downGoods"  title="下架"><i class="icon-arrow-down"></i></a></td>
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
				<div id="footer" class="span12">版权所有 &copy; 2007-2017
					零嘴小铺电子商务有限公司 闽ICP备15022981号</div>
			</div>
		</div>
	</div>


</body>
</html>