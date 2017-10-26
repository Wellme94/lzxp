<%@page import="com.etc.lzxp.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!--  
    	付款页面
    -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>结算中心 - 零嘴铺子</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/layout.css">
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">

$(function () {
	/* 退出点击事件 */
	$("#exit").click(function () {
		
		location.href="http://localhost:8080/lzxp/UsersServlet?op=exit&isExit=true";
	});
	
	/* 结算点击事件 */
	$("#countOrder").click(function () {
		location.href="http://localhost:8080/lzxp/UsersServlet?op=countOrder";
		
	});
	
	
	/* 结算点击事件 */
	$("#countOrder").click(function () {
		location.href="http://localhost:8080/lzxp/UsersServlet?op=countOrder";
		
	});
	
});



</script>

</head>
<body class="order-page">
	<div id="dialogOverlay" class="dialogOverlay"></div>

<!-- header -->
<div class="toolbar">
	<div class="toolbar-cont wrap">
		<ul class="fl">
			<li id="headerUsername" class="headerUsername"></li>
			<% 
				if(request.getSession().getAttribute("user")!=null){
				//如果有传递过来用户信息
					Users user = (Users)request.getSession().getAttribute("user");					
			%>
					<li>欢迎<span class="log username"><%=user.getUSERNAME() %></span>来到零嘴小铺官方商城！</li>
			<%
				}else{
			%>
					<li>欢迎来到零嘴小铺官方商城！</li>
			<%
				}
			%>
			<li id="headerLogin" class="headerLogin none"><a class="log" href="login.jsp">[登录]</a></li>
			<li id="headerRegister" class="headerRegister none"><a class="reg" href="register.jsp">[注册]</a></li>				
			<li id="headerLogout" class="headerLogout none"><a class="log" href="#" id="exit">[退出]</a></li>
			
		</ul>
	
	</div>
</div>
	<div class="header">
<div class="head-main wrap clearfix">
	<div class="logo"><a href="/">零嘴小铺-LZXPSTORE</a><span>官方商城</span></div>
	<div class="hd-search">
		<div class="hot-tag">
							<span>热门搜索：</span>
						<a target="_blank" class="red" href="#">松子</a>
						<a target="_blank" href="#">牛肉</a>
						<a target="_blank" href="#">开心果</a>
						<a target="_blank" href="#">核桃</a>
						<a target="_blank" href="#">话梅</a>
						<a target="_blank" href="3">花生瓜子</a>
		</div>
		<div class="search-area">
			<form id="productSearchForm" action="#" method="get" target="_blank">
				<input class="sch-key" type="text" name="keyword" id="keyword" value="商品搜索">
				<input class="sch-btn" type="submit" value="搜 索">
			</form>
		</div>
	</div>
	<div class="hd-user">
		<!-- <div class="user-lppz"><a href="http://home.lppz.com/member/index.jhtml">我的良品</a></div> -->
		<div class="user-shoping">
			<a class="us-btn indexcart" href="#">购物车</a>
			<span class="us-num cart-cache-num"><b>0</b></span>
			<div class="cart-list cart-list-body">
				<span class="tit">最新加入的商品</span>
				<div class="cart-roll">
					<ul class="goods"></ul>
				</div>				
				<div class="total">
					<p>共<span class="red">0</span>件商品，共计<span class="sum">￥0.00</span></p>
					<a class="settle" href="#" id="countOrder">去购物车结算</a>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="menu">
	<div class="menu-main wrap">
		<ul class="menu-list">
	       <li><a href="index.jsp">首页</a></li>
					<li><a href="ltype.jsp">上新尝鲜</a></li>
		</ul>
	</div>
</div>	</div>	
	<div class="container order mgtop" style="width:1200px;margin:0 auto">
		<div id="dialog" class="dialog">
			<dl>
				<dt>请在新打开的页面中完成付款</dt><dd>付款完成前请不要关闭此窗口</dd><dd>完成付款后请点击下面按钮</dd>
			</dl>
			<div>
				<a href="#">完成付款</a>
				<a href="#">遇到问题</a>
			</div>
			<a href="javascript:;" id="other">选择其它支付方式</a>
		</div>
		<div class="span24">
			<div class="result">
						<div class="title">您的订单已提交成功，正在等待您的付款！</div>
					
				<table>
					<tr>
						<th colspan="4">订单信息:</th>
					</tr>
					<tr>
						<td width="100">订单编号:</td>
						<td width="340">
							<strong id="orderid"><%=request.getAttribute("orderid")%></strong>
							<a href="#">[查看订单]</a>
						</td>
						
							<td width="100">订单金额:</td>
							<td>
								<strong>￥<%=request.getAttribute("orderbalance")%>元</strong>
							</td>
					</tr>
					<tr>
						<td>配送方式:</td>
						<td>普通快递</td>
						<td>支付方式:</td>
						<td>网上支付</td>
					</tr>
						<tr>
							<td colspan="4"  style="color:#ff0000;font-size:14px;">请您在4小时内支付，未支付订单将保留至2017-10-18 18:22，逾期失效！</td>
						</tr>
				</table>
				
							<form id="paymentForm" action="#" method="post" target="_blank">
								<input type="hidden" name="type" value="payment" />
								<input type="hidden" name="sn" value="LPB2017101800000001" />
								<table id="paymentPlugin" class="paymentPlugin">
									<tr>
										<th colspan="4">支付方式:</th>
									</tr>
										<tr>
													<td>
														<input type="radio" id="alipay" name="paymentPluginId" value="alipay" checked="checked" />
														<label for="alipay">
																<em title="支付宝即时交易" style="background-image: url(images/alipay.png);">&nbsp;</em>
														</label>
													</td>
													<td>
														<input type="radio" id="chinapay" name="paymentPluginId" value="chinapay" />
														<label for="chinapay">
																<em title="银联即时交易" style="background-image: url(images/chinapay.png);">&nbsp;</em>
														</label>
													</td>
													<td>
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
										</tr>
								</table>
								<input type="button" id="paymentButton" class="paymentButton" value="立即支付" />
							</form>
					
			</div>
		</div>
	</div>
	<!--footer include-->   
	<!-- footer -->
	<div class="footer">
		<div class="foot-service">
			<ul>
				<li class="zp"><em>100%</em><p>正品保证</p></li>
				<li class="th"><em>10天</em><p>无理由退换货</p></li>
				<li class="by"><em>满68元</em><p>全场包邮</p></li>
				<li class="jf"><em>积分抵现金</em><p>100积分=1元</p></li>
				<li class="yh"><em>开箱验货</em><p>先验货再签收</p></li>
				<li class="sd"><em>多仓就近发货</em><p>快速直达</p></li>
			</ul>
		</div>
		<div class="foot-area">
			<div class="foot-cont clearfix" style="margin-left:20%">
				
				<div class="fc-link">
							<dl>
								<dt><strong>购物指南</strong></dt>
									<dd>
											<a target="_blank" href="#">安全账户</a>
											<a target="_blank" href="#">购物流程</a>
											<a target="_blank" href="#">老顾客重置密码</a>
											<a target="_blank" href="#">生日礼购物流程</a>
											<a target="_blank" href="#">找回密码</a>
									</dd>
									
							</dl>
							<dl>
								<dt><strong>物流配送</strong></dt>
									<dd>
											<a target="_blank" href="#">配送说明</a>
											<a target="_blank" href="#">签收与验货</a>
									</dd>
									
							</dl>
							<dl>
								<dt><strong>付款说明</strong></dt>
									<dd>
											<a target="_blank" href="#">发票制度</a>
											<a target="_blank" href="#">公司转账</a>
											<a target="_blank" href="#">在线支付</a>
									</dd>
									
							</dl>
							<dl>
								<dt><strong>客户服务</strong></dt>
									<dd>
											<a target="_blank" href="#">退换货服务</a>
											<a target="_blank" href="#">联系我们</a>
											<a target="_blank" href="#">退款说明</a>
									</dd>
									
							</dl>
							<dl>
								<dt><strong>会员专区</strong></dt>
									<dd>
											<a target="_blank" href="#">优惠券使用规则</a>
											<a target="_blank" href="#">积分制度</a>
											<a target="_blank" href="#">会员须知</a>
									</dd>
									
							</dl>
				</div>
				
			</div>
			
			<div class="foot-nav">
				<ul>
							<li>
								<a href="#" target="_blank">关于我们</a>
								|
							</li>
							<li>
								<a href="#" target="_blank">联系我们</a>
								|
							</li>
							<li>
								<a href="#" target="_blank">客户服务</a>
								|
							</li>
							<li>
								<a href="#" target="_blank">诚聘英才</a>
								|
							</li>
							<li>
								<a href="#" target="_blank">商务合作</a>
								|
							</li>
							<li>
								<a href="#" target="_blank">媒体报道</a>
								|
							</li>
							<li>
								<a href="#" target="_blank">网站地图</a>
								|
							</li>
							<li>
								<a href="#" target="_blank">站长招募</a>
								
							</li>
				</ul>
			</div>
			<div class="foot-copyright">
				Copyright@2007-2017 零嘴小铺电子商务有限公司 All rights Reserved<br/><a target="_blank" href="#">鄂ICP备15022981号</a>
			</div>
		</div>
	</div>
	

<script type="text/javascript">
		//购物车结算按钮的点击
		$(document).on("click",'#paymentButton',function(){
			var username = $('.username').text();
			var orderid = $("#orderid").text();	
			location.href="OrderServlet?op=payOrder&UserName="+username+"&OrderId="+orderid;
		});	

		</script>
		</script>
		<script type="text/javascript">

		</script>
		<script type="text/javascript" src="http://www.lppz.com/resources/shop/js/o_code.js"></script>
		<script type="text/javascript">

		</script>
		<script src="js/base.js"></script>


</body>

</html>

