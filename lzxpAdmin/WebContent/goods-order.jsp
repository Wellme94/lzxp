<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<!--  
	后台主页面
-->
<head>
<title>系统后台</title>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />

<!-- <script src="js/jquery.min.js"></script> -->
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.tables.js"></script>

<!--弹框的外部包-->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- 弹框的外部包 -->

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
					$("#msg").text("");
				}
			});
		}
		
		
		/* 未处理订单点击事件 */
		$("#getAllSSwcl").click(function () {
			/* 将消息提醒取消 */
			$.post("SellerMessageServlet",{"op":"cancelMessage"},function(data,status){
			});
		});
		
		/* 删除商品 */

		$(".delete")
				.click(
						function() {
							//提示用户
							$
									.confirm({
										title : '删除',
										content : '是否确定要删除？',
										buttons : {
											ok : {
												text : "确定",
												btnClass : 'btn-blue',
												action : function() {
													//获取复选框对象
													var checkBox = $("input[type='checkbox']");
													//遍历复选框
													var orderIdStr = "";
													for (var i = 1; i < checkBox
															.size(); i++) {
														if (checkBox
																.eq(i)
																.prop("checked")) {
															//如果复选框的选项被选择，则获取被选中行中隐藏的id
															var orderId = checkBox
																	.eq(i)
																	.parents(
																			"tr")
																	.find(
																			"input")
																	.val();
															orderIdStr += orderId
																	+ ",";
														}
													}
													location.href = "GoodsOrderServlet?op=deleteOrder&orderIdStr="
															+ orderIdStr;
												}
											},
											cancel : {
												text : "取消",
												btnClass : 'btn-green',
											},
										}
									});
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

			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>商品管理</span></a>
				<ul>
					<li><a href="GoodsServlet?op=getAllGoods">商品列表</a></li>
					<li><a href="GoodsSortServlet?op=getAllGoodsSort">商品分类</a></li>
					<li><a href="GoodsStateServlet?op=getGoodsState">商品状态</a></li>
				</ul></li>

			<li class="submenu active open"><a href="#"><i
					class="icon icon-th-list"></i> <span>交易记录管理</span></a>
				<ul>
					<li class="active"><a href="GoodsOrderServlet?op=getAllOrder">交易记录</a></li>
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
		<div id="content-header">
			<h1>商品列表</h1>
			
			<!-- 消息提醒 -->
			<marquee id="msg" style="color:red; font-size:20px" direction=right behavior=alternate scrollamount=6 height=100 width=50% onmouseover=this.stop() onmouseout=this.start()></marquee>
			
			<div class="btn-group">
				<a class="btn btn-large tip-bottom delete " title="删除记录"><i
					class="icon-remove"></i></a>
			</div>
		</div>

		<!-- 内容 -->
		<div id="breadcrumb">
			<a href="index.jsp" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i>后台管理</a> <a href="#" class="current">交易记录</a>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
			
				<form action="GoodsOrderServlet?op=getOrderByDate" method="post">
					<div class="text-c">
						日期范围： <input type="date"
							onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
							id="mindate" name="mindate" class="input-text Wdate"
							style="width: 120px;"> - <input type="date"
							onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
							id="maxdate" name="maxdate" class="input-text Wdate"
							style="width: 120px;"> 
						<button type="submit" class="btn btn-success" id="searchbtn"
							name=""> 搜记录</button>
					</div>
				</form>
			
			
				<div class="span12">

					<div class="widget-box">
						<div class="widget-title">

							<h5>商品交易记录</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th><input type="checkbox" id="chooseAll"></th>
										<th>交易日期</th>
										<th>交易内容</th>
										<th>交易金额</th>
										<th>买家</th>
										<th>交易状态</th>
									</tr>
								</thead>
								<tbody>

									<c:if test="${requestScope.list!=null}">
										<c:forEach items="${requestScope.list}" var="trade">

											<tr class="gradeA">
												<td><input type="checkbox" value="${trade.ORDERID}"
													name="GOODSID"></td>
												<td>${trade.ORDERDATE}</td>
												<td>${trade.ORDERCONTENT}</td>
												<td>${trade.ORDERBALANCE}</td>
												<td>${trade.USERNAME}</td>
												<td>${trade.USERSTATE}</td>
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
