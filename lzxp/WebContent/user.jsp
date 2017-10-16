<%@page import="com.etc.lzxp.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--
    	作者：offline
    	时间：2017-10-12
    	描述：个人中心
   -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>个人中心</title>
		<link rel="stylesheet" href="css/lp_member.css">
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

	</head>
</head>
<body>
<!-- header -->

		<script type="text/javascript">
			var username;
			$().ready(function() {
				$.ajax({
					url: "http://www.lppz.com/sso/checkname.jhtml",
					type: "GET",
					cache: false,
					dataType: 'jsonp',
					jsonp: 'callback',
					success: function(message) {
						if(message == '#') {
							window.location.href = "https://reg.lppz.com/bind/index.jhtml";
						}
						username = message;
						if(username) {
							$headerUsername.html("您好 <a href=\"http://home.lppz.com/member/index.jhtml\" class=\"user\">" + username + "</a>，").show();
							$headerLogout.show();
							$headerLogin.hide();
							$headerRegister.hide();
							$('.alipay').parent().hide();
							$('.qq').parent().hide();
							$('.weibo').parent().hide();
						} else {
							$headerLogout.hide();
							$headerLogin.show();
							$headerRegister.show();
							$('.alipay').parent().show();
							$('.qq').parent().show();
							$('.weibo').parent().show();
						}

						if(window.afterloadmember) {
							window.afterloadmember();
						}

						$(document).trigger('afterloadmember', username);
					}
				});

				var $headerLogin = $("#headerLogin");
				var $headerRegister = $("#headerRegister");
				var $headerUsername = $("#headerUsername");
				var $headerLogout = $("#headerLogout");
				var $productSearchForm = $("#productSearchForm");
				var $keyword = $("#productSearchForm input");
				var defaultKeyword = "商品搜索";

			});
		</script>

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
								<li>欢迎<span class="log"><%=user.getUSERNAME() %></span>来到零嘴小铺官方商城！</li>
							<%
						}else{
							%>
							<li>欢迎来到零嘴小铺官方商城！</li>
							<%
						}
					%>
					<li id="headerLogin" class="headerLogin none">
						<a class="log" href="login.jsp">[登录]</a>
					</li>
					<li id="headerRegister" class="headerRegister none">
						<a class="reg" href="register.html">[注册]</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="header">
			<div class="head-main wrap clearfix">
				<div class="logo">
					<a href="#">零嘴小铺</a><span>官方商城</span></div>

				<div class="hd-user">
					<div class="user-search">
						<!--<form id="productSearchForm" action="#" method="get" target="_blank">-->
							<input class="sch-key" type="text" name="keyword" id="keyword" value="商品搜索" onfocus="if (value =='商品搜索'){value =''}" onblur="if (value ==''){value='商品搜索'}">
							<input class="sch-btn" type="submit" value="">
					    <!--</form>-->
					</div>
					<div class="user-shoping">
						<a class="us-btn indexcart" href="cartlist.html">购物车</a>
						<span class="us-num cart-cache-num"><b>0</b></span>
						<div class="cart-list cart-list-body">
							<span class="tit">最新加入的商品</span>
							<div class="cart-roll">
								<ul class="goods"></ul>
							</div>
							<div class="total">
								<p>共<span class="red">0</span>件商品，共计<span class="sum">￥0.00</span></p>
								<a class="settle" href="cartlist.html">去购物车结算</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(function() {
				var $keyword = $("#productSearchForm input");
				var defaultKeyword = "商品搜索";
				//搜索框进入
				$keyword.focus(function() {
					if($keyword.val() == defaultKeyword) {
						$keyword.val("");
					}
				});
				//搜索框离开
				$keyword.blur(function() {
					if($keyword.val() == "") {
						$keyword.val(defaultKeyword);
					}
				});

				//页面购物车数量
				var cartCacheNum = $.cookie('cart-cache-num');
				$('.cart-cache-num').html('<b>' + (!!cartCacheNum ? cartCacheNum : 0) + '</b>');

				//显示购物车详情
				var getcartdelay;
				$('.indexcart').mouseenter(function() {
					clearTimeout(getcartdelay);
					getcartdelay = setTimeout(function() {
						refreshCart();
					}, 500);
				});
				//删除购物车
				$('.delete-header-cart-item').die().live('click', function() {
					var catItemId = $(this).attr('cart-item-id')
					deleteHeadCart(catItemId);
				});
				//刷新head里面的购物车
				function refreshCart() {
					$.ajax({
						url: "http://www.lppz.com/cart/cartHeadData.jhtml",
						type: "GET",
						cache: false,
						dataType: "jsonp",
						jsonp: "callback",
						success: function(message) {
							message = decodeURI(decodeURIComponent(message));
							message = message.replace(/\+/g, ' ');
							$(".cart-list-body").html(message);
							var cartCacheNum = $.cookie('cart-cache-num');
							$('.cart-cache-num').html('<b>' + (!!cartCacheNum ? cartCacheNum : 0) + '</b>');
						}
					});
				}
				//删除购物车的方法
				function deleteHeadCart(itemId) {
					if(!confirm("您确定要删除吗？")) {
						return false;
					}

					$.ajax({
						url: "http://www.lppz.com/cart/delete.jhtml",
						type: "POST",
						data: {
							id: itemId
						},
						dataType: "jsonp",
						jsonp: "callback",
						cache: false,
						success: function(data) {
							if(data.type == "success") {
								refreshCart();
							} else {
								$.message(data);
							}
						}
					});
				}
			});

			$.fn.tabs_users = function(control) {
				var element = $(this);
				control = $(control);
				element.delegate("li", "click", function() {
					var tabName = $(this).attr("data-tab");
					//点击li的时候触发change.tabs自定义事件 
					element.trigger("change.tabs", tabName);
				});

				//给element绑定一个change.tabs自定义事件
				element.bind("change.tabs", function(e, tabName) {
					element.find("li").removeClass("active");
					element.find(">[data-tab='" + tabName + "']").addClass("active");
				});
				element.bind("change.tabs", function(e, tabName) {
					control.find(">[data-tab]").removeClass("active");
					control.find(">[data-tab='" + tabName + "']").addClass("active");
				});
				//激活第一个选项卡 
				var firstName = element.find("li:first").attr("data-tab");
				element.trigger("change.tabs", firstName);
				return this;

			};
		</script>

		<body class="product-detail">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-2 column">
						<div class="tabbable" id="tabs-882322">
							<ul class="nav nav-tabs" id="tabs_users" style="border: 0;">
								<li data-tab="Personal_data" id="first" style="border: 0;">
									<a href="#panel-1" data-toggle="tab">个人资料</a>
								</li>
								<li data-tab="My_order" style="border: 0;">
									<a href="#panel-2" data-toggle="tab">我的订单</a>
								</li>
								<li data-tab="Security_Center" style="border: 0;">
									<a href="#panel-3" data-toggle="tab">安全中心</a>
								</li>
								<li data-tab="Receiving_address" style="border: 0;">
									<a href="#panel-4" data-toggle="tab">收货地址</a>
								</li>
								<li data-tab="My_comments" style="border: 0;">
									<a href="#panel-5" data-toggle="tab">我的评论</a>
								</li>
							</ul>

						</div>
					</div>
					<div class="col-md-10 column">
						<div class="tab-content">
							<div data-tab="Personal_data" class="tab-pane" id="panel-1">
								<div class="user-main clearfix">
									<div class="user-content">
										<form action="#" name="form1" id="form1" method="post">
											<div class="uc-recently">
												<div class="uc-recently-top">
													<h3>基本信息</h3></div>
												<div class="uc-recently-box">
													<div class="usre-data-top clearfix">
														<div class="uc-info">
															<div class="ui-avatar">
																<img id="avatarImg" src="img/avatar.png" alt="用户头像" />
																<span class="layer"></span>
																<span class="mask"><a class="edit member-image" href="#">编辑头像</a></span>
															</div>
															<div class="ui-mate">
																<div class="u-name"><span>威猛先生</span></div>
															</div>
														</div>
													</div>
													<div class="user-data-cont">

														<ul class="data-form-list">
															<li>
																<div class="lab-txt">昵称：</div>
																<div class="lab-for"><input class="tx-ipt" type="text" name="lpNickName" id="lpNickName" value="" /></div>
															</li>
															<li>
																<div class="lab-txt"><span>*</span>真实姓名：</div>
																<div class="lab-for email"><input class="tx-ipt" type="text" name="name" id="name" value="" /></div>
															</li>
															<li>
																<div class="lab-txt"><span>*</span>性别：</div>
																<div class="lab-for">
																	<label><input class="rd-ipt" type="radio" name="gender"  value="_2"/>男</label>
																	<label><input class="rd-ipt" type="radio" name="gender"  value="_1"/>女</label>
																	<label><input class="rd-ipt" type="radio" name="gender"  value="_0"/>保密</label>
																</div>
															</li>

															<li>
																<div class="lab-txt">手机号：</div>
																<div class="lab-for email">
																	180××××3375
																</div>
															</li>

															<li>

																<div class="submit-btn">
																	<a class="save" href="#">提交</a>
																</div>

																<div class="data-submit-btn">
																	<button class="save" type="button" onclick="submitPro()">保存</button>

																</div>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div data-tab="My_order" class="tab-pane" id="panel-2">
								<div class="uc-recently">
									<div class="uc-recently-top">
										<h3>我的订单</h3></div>
									<div class="uc-recently-box">
										<div class="recent-type">
											<a class="current" href="#">待付款（0）</a>
											<a class="no-pay" href="#">待收货（0）</a>
											<a class="no-pay" href="#">已完成（0）</a>
											<a class="no-pay" href="#">已取消（0）</a>
										</div>
										<form action="#" name="form1" id="form1" mothed="get">
											<table class="order-list my-order">
												<tbody>
													<tr class="ol-select">
														<td>&nbsp;</td>
														<td>&nbsp;</td>
														<td>&nbsp;</td>
														<td>
															<select class="slt-opt" name="orderDate" id="orderDate" onchange="selectValue();">
																<option value="1">最近一个月</option>
																<option value="3">最近三个月</option>
																<option value="12">最近一年</option>
															</select>
														</td>
														<td>
															<select class="slt-opt" name="orderType" id="orderType" onchange="selectValue();">
																<option value="waitPay" selected="selected">待付款</option>
																<option value="tobeReceipt">待收货</option>
																<option value="completed">已完成</option>
																<option value="cancelled">已取消</option>
															</select>
														</td>

													</tr>
													<tr>
														<th width="240">订单信息</th>
														<th>收货人</th>
														<th>订单金额</th>
														<th>订单时间</th>
														<th>状态</th>
														<th>平台</th>
														<th>操作</th>
													</tr>
													<tr>
														<td colspan="7">
															<div class="uc-no-result">
																<span>您暂时没有符合条件的订单哦！</span>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</form>
									</div>
								</div>
							</div>
							<div data-tab="Security_Center" class="tab-pane" id="panel-3">
								<div class="uc-recently">
									<div class="uc-recently-top">
										<h3>账户安全</h3></div>
									<div class="uc-recently-box">
										<div class="recent-wrap">
											<div class="safe-level clearfix">
												<div class="sl-txt">安全等级：</div>
												<div class="sl-state"><span class="rank">低</span><span class="icon"></span><span class="hint">设置支付密码，保障账户安全</span></div>
											</div>
										</div>
										<div class="safe-setting">
											<ul class="clearfix">
												<li>
													<div class="sf-info already"><em><i class="icon"></i>登录密码</em><span>登录密码能够保证您的账户安全，让您购物更放心</span></div>
													<div class="sf-op">
														<a class="text-btn" href="#">修改密码</a>
													</div>
												</li>
												<li>
													<div class="sf-info already"><em><i class="icon"></i>验证手机</em><span>您验证的手机：180****3375</span></div>
													<div class="sf-op">
														<a class="text-btn" href="#">修改手机</a>
													</div>
												</li>
												<li>
													<div class="sf-info "><em><i class="icon"></i>设置支付密码</em><span>支付密码能够保证您的账户安全，让您购物更放心</span></div>
													<div class="sf-op">
														<a class="view-btn" href="#">立即设置</a>
													</div>
												</li>

											</ul>
										</div>
									</div>
								</div>
							</div>
							<div data-tab="Receiving_address" class="tab-pane" id="panel-4">
								<div class="uc-recently">
									<div class="uc-recently-top">
										<h3>收货地址</h3></div>
									<div class="uc-recently-box">
										<div class="recent-wrap receive-addr-top clearfix">
											<a class="view-btn add-new-receiver" href="javascript:;">新增收货地址</a>
											<span class="desc mlt">您已创建<em class="red receiver-nums">1</em>个收货地址，最多可创建<em class="red">5</em>个</span>
										</div>
										<div class="receive-addr-list">

											<div class="addr-item" id="0c500d1c6a804694853bbc17c8806117">
												<div class="addr-info">
													<dl>
														<dt>威猛先生<span class="default">默认地址</span></dt>
														<dd>
															<div class="lab">收&nbsp;&nbsp;货&nbsp;&nbsp;人：</div>
															<div class="intr">威猛先生</div>
														</dd>
														<dd>
															<div class="lab">所在地区：</div>
															<div class="intr">福建省厦门市思明区</div>
														</dd>
														<dd>
															<div class="lab">地　　址：</div>
															<div class="intr">海怡大厦</div>
														</dd>
														<dd>
															<div class="lab">邮政编码：</div>
															<div class="intr">350700</div>
														</dd>
														<dd>
															<div class="lab">手　　机：</div>
															<div class="intr">18039023375</div>
														</dd>
													</dl>
												</div>
												<div class="addr-op">
													<a class="view-btn receiver-edit" receiverid="0c500d1c6a804694853bbc17c8806117" href="javascript:;">编辑</a>
												</div>
												<a href="javascript:;" receiverid="0c500d1c6a804694853bbc17c8806117" class="addr-del">删除</a>
											</div>

										</div>

									</div>
								</div>
							</div>

							<div data-tab="My_comments" class="tab-pane" id="panel-5">

								<div class="uc-recently">
									<div class="uc-recently-top">
										<h3>我的评价</h3></div>
									<div class="uc-recently-box">
										<div class="recent-type">
											<a class="current" href="#">所有评价</a>
											<a class="no-pay" href="#">待评价（0）</a>
											<a class="no-pay" href="#">已评价（0）</a>
										</div>
										<table class="user-comm-tab">
											<tbody>
												<tr>
													<th width="70">&nbsp;</th>
													<th width="300">商品信息</th>
													<th>购买时间</th>
													<th>评价状态</th>
												</tr>

											</tbody>
										</table>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>

			<!-- footer -->
			<div class="footer">
				<div class="foot-service">
					<ul>
						<li class="zp"><em>100%</em>
							<p>正品保证</p>
						</li>
						<li class="th"><em>10天</em>
							<p>无理由退换货</p>
						</li>
						<li class="by"><em>满68元</em>
							<p>全场包邮</p>
						</li>
						<li class="jf"><em>积分抵现金</em>
							<p>100积分=1元</p>
						</li>
						<li class="yh"><em>开箱验货</em>
							<p>先验货再签收</p>
						</li>
						<li class="sd"><em>多仓就近发货</em>
							<p>快速直达</p>
						</li>
					</ul>
				</div>
				<div class="foot-area">
					<div class="foot-cont clearfix">
						<div class="fc-link">
							<dl>
								<dt><strong>购物指南</strong></dt>
								<dd>
									<a target="_blank" href="#">安全账户</a>
									<a target="_blank" href="#">购物流程</a>
									<a target="_blank" href="#">生日礼购物流程</a>
									
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
						Copyright@2007-2017 零嘴小铺电子商务有限公司 All rights Reserved<br/>
						<a target="_blank" href="#">闽ICP备15022981号</a>
						</br>
					</div>
				</div>
			</div>
			<!--<script src="//configch2.veinteractive.com/tags/B105FE22/510E/4163/911D/0A070929DD44/tag.js" type="text/javascript" async></script>
			<script type="text/javascript" src="http://www.lppz.com/resources/shop/js/lp_public.js"></script>
			<script type="text/javascript" src="http://track.blueview.cc/lppz?pid=1&cid=1047&cha=85&clientId=c68c0a5c5b016f241a3dc9ea512698c4"></script>

			
			<script src="http://www.lppz.com/resources/shop/js/basic.js"></script>
			<script src="http://www.lppz.com/resources/shop/js/flexslider.js"></script>

			
			<script src="http://www.lppz.com/resources/shop/js/upload/vendor/jquery.ui.widget.js"></script>
			<script src="http://www.lppz.com/resources/shop/js/upload/jquery.iframe-transport.js"></script>
			<script src="http://www.lppz.com/resources/shop/js/upload/jquery.fileupload.js"></script>
			<script src="http://www.lppz.com/resources/shop/js/upload/jquery.cookie.js"></script>-->

			<input id="fileupload" type="file" style="display:none;" name="file" data-url="http://home.lppz.com/member/editMemberImage.jhtml" multiple>
			<script type="text/javascript">
				$(function() {
					$('#fileupload').fileupload({
						headers: {
							token: $.cookie('token')
						},
						done: function(e, data) {
							var resultStrint = data.result;
							var result = eval('(' + resultStrint + ')');
							if(result.success) {
								$('#avatarImg').attr('src', result.path);
							} else {
								alert(result.msg);
							}
						}
					});

					$('.member-image').click(function() {
						$('#fileupload').trigger('click');
					});

					//签到
					$('.do-sign-in').die().live('click', function() {
						$.ajax('http://home.lppz.com/member/signIn.jhtml', {
							type: 'get',
							success: function(message) {
								message = eval('(' + message + ')');
								if(message.type == 'success') {
									alertModal(
										"签到成功！恭喜您获得" + message.content + "积分",
										"",
										function() {
											var thisModal = ".alert-modal";
											$(thisModal).css({
												"width": "400px"
											});
											$(thisModal + " .am-cont-icon").addClass("am-ok-icon");
											$(thisModal + " .am-btn").html('<a href="javascript:;" class="confirm" onclick="alertModalClose()">我知道了</a>')
										});
									var mpb = $('.my-point-balance');
									mpb.html((mpb.html() - 0) + (message.content - 0));
								} else {
									alertModal(
										message.content,
										"",
										function() {
											var thisModal = ".alert-modal";
											$(thisModal).css({
												"width": "400px"
											});
											$(thisModal + " .am-cont-icon").removeClass("am-ok-icon");
											$(thisModal + " .am-btn").html('<a href="javascript:;" class="confirm" onclick="alertModalClose()">我知道了</a>')
										});
								}
							}
						});
					});
				});
			</script>
		</body>
</html>