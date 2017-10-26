<%@page import="com.etc.lzxp.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>零嘴小铺</title>
		<link href="css/public.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/base.css" />
		<script type="text/javascript" src="js/jquery_cart.js"></script>
		<link rel="stylesheet" type="text/css" href="css/buyConfirm.css" />
		<script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
		<script src="js/unslider.min.js" type="text/javascript"></script>
		<script src="js/index.js" type="text/javascript"></script>
		<script type="text/javascript">
			window.onload = function() {
				new tab('test4-input-input_tab1-input_tab2', '-');
			}

			function tab(o, s, cb, ev) { //tab换类
				var $ = function(o) {
					return document.getElementById(o)
				};
				var css = o.split((s || '_'));
				if(css.length != 4) return;
				this.event = ev || 'onclick';
				o = $(o);
				if(o) {
					this.ITEM = [];
					o.id = css[0];
					var item = o.getElementsByTagName(css[1]);
					var j = 1;
					for(var i = 0; i < item.length; i++) {
						if(item[i].className.indexOf(css[2]) >= 0 || item[i].className.indexOf(css[3]) >= 0) {
							if(item[i].className == css[2]) o['cur'] = item[i];
							item[i].callBack = cb || function() {};
							item[i]['css'] = css;
							item[i]['link'] = o;
							this.ITEM[j] = item[i];
							item[i]['Index'] = j++;
							item[i][this.event] = this.ACTIVE;
						}
					}
					return o;
				}
			}
			tab.prototype = {
				ACTIVE: function() {
					var $ = function(o) {
						return document.getElementById(o)
					};
					this['link']['cur'].className = this['css'][3];
					this.className = this['css'][2];
					try {
						$(this['link']['id'] + '_' + this['link']['cur']['Index']).style.display = 'none';
						$(this['link']['id'] + '_' + this['Index']).style.display = 'block';
					} catch(e) {}
					this.callBack.call(this);
					this['link']['cur'] = this;
				}
			}
		</script>
	</head>

	<body>
		<!--顶部快捷菜单-->
		<div class="shortcut_v2013 alink_v2013">
			<div class="w">
				<ul class="fl 1h">
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
					<li class="fl">
						<div class="menu_hd">
							<a href="login.jsp">请登录</a>
						</div>
					</li>
					<li class="fl">
						<div class="menu_hd">
							<a href="register.jsp">免费注册</a>
						</div>
					</li>
				</ul>
			<!-- 	<ul class="fr 1h">
					<li class="fl">
						<div class="menu_hd">
							<a href="myorder.html">我的订单</a>
						</div>
					</li>
				</ul> -->
				<span class="clr"></span>
			</div>
		</div>
		<!--顶部快捷菜单-->

		<!--顶部Logo及搜索-->
		<div class="header_2013">
			<div class="w">
				<div class="logo_v2013">
					<a href="#">
						<img class="border_r" src="images/order/logo_info.png" width="200" height="100" style="margin-top: 30px;margin-left: 30px;">
					</a>
				</div>
			</div>
		</div>
		<!--顶部Logo及搜索-->

		<!--  导航条    start-->
		<!--	<div class="yHeader">
		<div class="shop_Nav">
			<div class="pullDown">
				<h2 class="pullDownTitle"><i></i>全部商品分类</h2>
			</div>

			<ul class="Menu_box">
				<li><a href="" target="_blank" class="yMenua">首页</a></li>
				<li><a href="" target="_blank">大划算</a></li>
				<li><a href="" target="_blank">抢拍</a></li>
				<li><a href="" target="_blank">锡货专场</a></li>
				<li><a href="" target="_blank">锡货超市</a></li>
			</ul>
            <div class="fr r_icon"><i class="i01"></i><span>30天退货</span><i class="i02"></i><span>满59包邮</span></div>
		</div>
 	</div>-->
		<!--  导航条    end-->

		<!--订单提交body部分开始-->

		<div class="border_top_cart">

			<div class="container payment-con">
				<form target="_blank" action="#" id="pay-form" method="post">
					<div class="order-info">
						<div class="msg">
							<h3>您的订单已完成！～耐心等待到货哦~~亲</h3>
							<p></p>

							<p class="post-date">订单完成后，1天内发货</p>
						</div>
						<div class="info">
							<p>
								金额：<span class="pay-total"><%=request.getAttribute("orderbalance")%>元</span>
							</p>
							<p>
								订单号：<%=request.getAttribute("orderid")%></p>
							<p>
								地址信息：普通快递 <span class="line">/</span><%=request.getAttribute("usertel")%><span class="line">/</span><%=request.getAttribute("useraddress")%><span class="line">/</span>个人电子发票 </p>
						</div>
						<div class="icon-box">
							<i class="iconfont"><img src="images/order/yes_ok.png"></i>
						</div>
					</div>

					<div class="xm-plain-box">
						<!-- 选择支付方式 -->
				</form>
				</div>
				<!-- 底部 -->
				<div class="bottom-links">
					<ul class="clearfix cols">
						<li class="col" style="margin-left: 225px;">
							<div class="bottom-links-title">关于我们</div>
							<ul class="clearfix bottom-links-items">
								<li>
									<a href="#">招聘英才</a>
								</li>
								<li>
									<a href="#">公司简介</a>
								</li>
								<li>
									<a href="#">合作洽谈</a>
								</li>
								<li>
									<a href="#">联系我们</a>
								</li>
							</ul>
						</li>
						<li class="col">
							<div class="bottom-links-title">客服中心</div>
							<ul class="clearfix bottom-links-items">
								<li>
									<a href="#">收货地址</a>
								</li>
								<li>
									<a href="#">个人资料</a>
								</li>
								<li>
									<a href="#">修改密码</a>
								</li>
							</ul>
						</li>
						<li class="col">
							<div class="bottom-links-title">售后服务</div>
							<ul class="clearfix bottom-links-items">
								<li>
									<a href="#">退换货政策</a>
								</li>
								<li>
									<a href="#">退款说明</a>
								</li>
								<li>
									<a href="#">联系卖家</a>
								</li>
							</ul>
						</li>
						<li class="col">
							<div class="bottom-links-title">帮助中心</div>
							<ul class="clearfix bottom-links-items">
								<li>
									<a href="#">FAQ</a>
								</li>
								<li>
									<a href="#">积分兑换</a>
								</li>
								<li>
									<a href="#">积分细则</a>
								</li>
								<li>
									<a href="#">已购商品</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="footer_v2013 bottom-about">
					<div class="w">
						<p class="foot_p1">
							<a href="#">首页</a>|
							<a href="#">招聘英才</a>|
							<a href="#">广告合作</a>|
							<a href="#">联系我们</a>|
							<a href="#">关于我们</a>
						</p>
						<pre>
    经营许可证：闽B2-20130223备案许可证：闽ICP备13041162号-1360网站安全检测平台
    ©2013-2014 福建云电商网络科技发展有限公司   版权所有
                </pre>
					</div>
				</div>
				<!-- 底部 -->
				<div class="fixed-buttons">
					<ul>
						<li><img id="imgBtn-to-top" src="images/order/back_top.png" /></li>
					</ul>
				</div>

	</body>
</html>