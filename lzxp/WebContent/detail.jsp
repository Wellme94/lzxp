<%@page import="com.etc.lzxp.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--
    	作者：offline
    	时间：2017-10-12
    	描述：商品详细页
    -->
<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Expires" content="0">
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<!--<meta name="keywords" content="网上商城,休闲零食，美食，牛肉干，鱼干，果干果脯，糕点糖果，素食山珍，茶水饮料，进口食品，礼盒，零嘴小铺 ">
	<meta name="description" content="零嘴小铺-专业的休闲食品网上购物商城，在线销售肉脯鱼干、果干果脯、糕点糖果、素食山珍、茶水饮料、进口食品、礼盒等数百种优质食品。便捷、诚信的服务，为您提供愉悦的休闲食品网上购物体验!">-->
		<title>零嘴小铺</title>
		<link rel="stylesheet" href="css/layout-style.css" />
		<script src="js/jquery.min.js"></script>
		<script src="js/common.js"></script>
		<script src="js/jquery.cookie.js"></script>
</head>
<body class="product-detail">
		<!-- header include -->
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<!--商品评价-->
		<script type="text/javascript">
			$(function() {
				$("#_btnsubmit").click(function() {
					$("#_articleContent").prepend("<h6>" + $("#_nickname").val() + new Date().toLocaleString() + "</h6><p>" + $("#_mycontent").val() + "</p>");
				});

			});
		</script>

		<script type="text/javascript">
			var username;
			$().ready(initPage);

			function checkname(callback) {
				$.ajax({
					url: "http://www.lppz.com/sso/checkname.jhtml",
					async: false,
					type: "GET",
					cache: false,
					dataType: 'jsonp',
					jsonp: 'callback',
					success: callback
				});
			}

			function initPage() {
				var $headerLogin = $("#headerLogin");
				var $headerRegister = $("#headerRegister");
				var $headerUsername = $("#headerUsername");
				var $headerLogout = $("#headerLogout");
				var $productSearchForm = $("#productSearchForm");
				var $keyword = $("#productSearchForm input");
				var defaultKeyword = "商品搜索";

				checkname(function(message) {
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
				});
			}
		</script>
		<!--<script type="text/javascript" src="http://116.211.81.199:8090/WebChatClient/js/init.js" charset="utf-8"></script>-->
		<script language="javascript" type="text/javascript" charset="utf-8">
			NTKF_PARAM = {
				siteid: "lppz_netinfo",
				uid: username || '',
				uname: username || ''

			};
		</script>
		<div id="out"></div>
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
						<a class="log" href="login.html">[登录]</a>
					</li>
					<li id="headerRegister" class="headerRegister none">
						<a class="reg" href="register.html">[注册]</a>
					</li>
					<li id="headerLogout" class="headerLogout none">
						<a class="log" href="#">[退出]</a>
					</li>
				</ul>
				<ul class="fr">
					<li class="thover ">
						<div class="top-user-info">
							<a class="my-lppz dorp-title">我的零嘴<i class="arrow"></i></a>
							<div class="my-lppz-layer">
								<div class="dorp-spacer"></div>
								<div class="user-info">
									<div class="m-pic">
										<img id="avatarImg" src="img/avatar.png" alt="用户头像" />
									</div>
									<div class="m-name" id="divlogin">
										<a class="nick" href="#" id="username"></a>
										<a class="level" href="###" title="" id="levelName"></a>
									</div>
									<!--<div class="m-phone" id="mobile"></div>-->
									<div class="m-name" id="divnologin">
										<a href="login.html">您好，请登录</a>
									</div>
								</div>
								<div class="menu-list">
									<div class="m-nav">
										<div class="item">
											<a href="#">我的订单</a>
										</div>
										<div class="item">
											<a href="#">我的关注</a>
										</div>
										<div class="item">
											<a href="#">我的优惠券<span id="spancouponcount">(<span class="num red" id="couponCount"></span>)</span>
											</a>
										</div>
										<div class="item">
											<a href="#">我的积分</a>
										</div>
									</div>
									<div class="m-btn">
										<div class="item">
											<a clstag="" href="#">签到有好礼</a>
										</div>
										<div class="item">
											<a clstag="" href="#">购物指南</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="header">
			<div class="head-main wrap clearfix">
				<div class="logo">
					<a href="#">零嘴小铺</a><span>官方商城</span></div>
				<div class="hd-search">
					<div class="hot-tag">
						<span>热门搜索：</span>
						<a class="red" href="#">松子</a>
						<a href="#">牛肉</a>
						<a href="#">开心果</a>
						<a href="#">核桃</a>
						<a href="#">话梅</a>
						<a href="#">花生瓜子</a>
					</div>
					<div class="search-area">
						<!--<form id="productSearchForm" action="#" method="post" >-->
						<input class="sch-key" type="text" name="keyword" id="keyword" value="商品搜索">
						<input class="sch-btn" type="submit" value="搜 索">
						<!--</form>-->
					</div>
				</div>
				<div class="hd-user">
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
								<a class="settle" href="myorder.html">去购物车结算</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				//刷新head里面的购物车
				function refreshCart() {
					$.ajax({
						url: "#",
						type: "GET",
						cache: false,
						dataType: 'jsonp',
						jsonp: 'callback',
						success: function(message) {
							message = decodeURI(decodeURIComponent(message));
							message = message.replace(/\+/g, ' ');
							$(".cart-list-body").html(message);
							var cartCacheNum = $.cookie('cart-cache-num');
							$('.cart-cache-num').html('<b>' + (!!cartCacheNum ? cartCacheNum : 0) + '</b>');
							$('#cartcount').html(!!cartCacheNum ? cartCacheNum : 0);
						}
					});
				}
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
					$('#cartcount').html(!!cartCacheNum ? cartCacheNum : 0);

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

					//删除购物车的方法
					function deleteHeadCart(itemId) {
						if(!confirm("您确定要删除吗？")) {
							return false;
						}

						$.ajax({
							url: "http://www.lppz.com/cart/delete.jhtml",
							type: "GET",
							data: {
								id: itemId
							},
							dataType: 'jsonp',
							jsonp: 'callback',
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
			</script>

			<div class="menu clearfix">
				<div class="menu-main wrap">
					<div class="goods-sort">
						<a class="goods-sort-btn" href="#"><span>商品分类</span><i class="icon"></i></a>
						<div class="goods-sort-nav" style="display: none;">
							<ul>
								<li>
									<div class="top-sort">
										<h3><a href="#">
							<i class="iconfont">&#xe610;</i>坚果炒货</a></h3></div>
									<div class="sub-sort">
										<ul class="sub-sort-list">
											<li>
												<a href="#">嗑壳坚果</a>
											</li>
											<li>
												<a href="#">果果仁仁</a>
											</li>
											<li>
												<a href="#">特惠炒货</a>
											</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="top-sort">
										<h3><a href="#">
							<i class="iconfont">&#xe613;</i>肉脯鱼干</a></h3></div>
									<div class="sub-sort">
										<ul class="sub-sort-list">
											<li>
												<a href="#">猪肉系列</a>
											</li>
											<li>
												<a href="#">牛肉系列</a>
											</li>
											<li>
												<a href="#">鸡鸭系列</a>
											</li>
											<li>
												<a href="#">海味系列</a>
											</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="top-sort">
										<h3><a href="#">
							<i class="iconfont">&#xe60b;</i>果干果脯</a></h3></div>
									<div class="sub-sort">
										<ul class="sub-sort-list">
											<li>
												<a href="#">缤纷果干</a>
											</li>
											<li>
												<a href="#">话梅山楂</a>
											</li>
											<li>
												<a href="#">红枣葡萄</a>
											</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="top-sort">
										<h3><a href="#">
							<i class="iconfont">&#xe608;</i>糕点糖果</a></h3></div>
									<div class="sub-sort">
										<ul class="sub-sort-list">
											<li>
												<a href="#">糕点系列</a>
											</li>
											<li>
												<a href="#">饼干系列</a>
											</li>
											<li>
												<a href="#">糖果系列</a>
											</li>
											<li>
												<a href="#">果冻系列</a>
											</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="top-sort">
										<h3><a href="#">
							<i class="iconfont">&#xe60f;</i>素食山珍</a></h3></div>
									<div class="sub-sort">
										<ul class="sub-sort-list">
											<li>
												<a href="#">美味豆干</a>
											</li>
											<li>
												<a href="#">笋菌海带</a>
											</li>
											<li>
												<a href="#">其他山珍</a>
											</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="top-sort">
										<h3><a href="#">
							<i class="iconfont">&#xe611;</i>花茶饮品</a></h3></div>
									<div class="sub-sort">
										<ul class="sub-sort-list">
											<li>
												<a href="#">养生冲调</a>
											</li>
											<li>
												<a href="#">进口饮料</a>
											</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="top-sort">
										<h3><a href="#">
							<i class="iconfont">&#xe601;</i>进口食品</a></h3></div>
									<div class="sub-sort">
										<ul class="sub-sort-list">
											<li>
												<a href="#">进口糕点</a>
											</li>
											<li>
												<a href="#">进口糖果</a>
											</li>
											<li>
												<a href="#">休闲零食</a>
											</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="top-sort">
										<h3><a href="#">
							<i class="iconfont">&#xe604;</i>精选礼盒</a></h3></div>
									<div class="sub-sort">
										<ul class="sub-sort-list">
											<li>
												<a href="#">零食礼盒</a>
											</li>
											<li>
												<a href="#">年货量贩装</a>
											</li>
										</ul>
									</div>
								</li>

							</ul>
						</div>
					</div>
					<ul class="menu-list">

					</ul>
				</div>
			</div>
		</div>
		<!-- content -->
		<div class="container wrap">
			<div class="place-site">
				<a class="home" href="index.html">首页</a>
				<span>&gt;</span>
				<a href="#">坚果炒货</a>
				<span>&gt;</span>
				<a href="#">嗑壳坚果</a>
			</div>
			<div class="details">
				<div class="detail-top clearfix">
					<div id="product_show" class="product-preview">
						<div class="product-pic">
							<div class="duct-zoom jqzoom">
								<img width="400" height="400" src="img/detail/01.jpg" alt="" jqimg="" />
							</div>
							<div id="duct-list">
								<a href="javascript:;" class="duct-control" id="duct_prev"></a>
								<a href="javascript:;" class="duct-control" id="duct_next"></a>
								<div class="duct-items">
									<ul class="dlist">
										<li class="current"><img class="lazy img-hover" alt="" src="img/detail/01.jpg" data-original="" large="img/detail/01.jpg" width="60" height="60"></li>
										<li><img class="lazy" alt="" src="img/detail/02.jpg" data-original="" large="img/detail/02.jpg" width="60" height="60"></li>
										<li><img class="lazy" alt="" src="img/detail/03.jpg" data-original="" large="img/detail/03.jpg" width="60" height="60"></li>
										<li><img class="lazy" alt="" src="img/detail/04.jpg" data-original="" large="img/detail/04.jpg" width="60" height="60"></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="product-share clearfix">
							<script>
								$(function() {
									$('.bdsharebuttonbox').one("mouseover", function() {
										$(this).append(shareCode);
									});
								})

								function shareCode() {
									window._bd_share_config = {
										"common": {
											"bdSnsKey": {},
											"bdText": "开心果（190g）（电商专供新包装）",
											"bdMini": "2",
											"bdMiniList": false,
											"bdPic": "http://img.lppz.com/group1/M00/01/FB/CghmzVdL0TSAchfkAAAIUy0ePi0872.jpg",
											"bdStyle": "0",
											"bdSize": "16"
										},
										"share": {}
									};
									with(document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
								}
							</script>
						</div>
					</div>
					<div class="product-param">
						<div class="primary">
							<div class="p-title" style="margin-left: 100px; margin-top: 50px;"><strong>伊朗开心果190g</strong></div>
							<div class="p-exp" style="margin-left: 130px;">清甜微咸</div>
							<div class="p-price" id="isscoreProduct" style="display:none;">
								<div class="mall basic">
									<div class="lb">价格：</div>
									<span><del>￥<span>25</span>.90</del>
									</span>
								</div>
							</div>

							<div class="p-price" id="commonProduct">
								<div class="promotion">
									<div class="lb">价格：</div>
									<div id="priceShow" class="cost">￥<span>25</span>.90</div>
								</div>
							</div>

							<div class="p-price" id="isscoreProduct1" style="display:none;">
								<div class="promotion">
									<div class="lb">兑换价：</div>
									<div id="pointShowTbar" class="cost"><span></span>积分</div>
								</div>
							</div>

							<div class="p-sales">
								<div class="lb">月销量：</div>
								<span class="mon-sales">1000</span>
							</div>
							<div class="p-grade pim">
								<div class="dt" style="margin-left: 83px;">商品评分：</div>
								<div class="dd"><span class="score-star "><i class="star05">分</i></span></div>
								<span class="sum-sales">（累计评价：<a  class="all-comment-num sum-sales-nums" href="#">0</a>）</span>
							</div>
						</div>
						<div class="choose">

							<div class="c-num pim" style="margin-top: 10px;">
								<div class="dt" style="margin-left: 60px;">数量：</div>
								<div class="dd">
									<span class="num-btn">
									<a id="decrease" class="decrease">-</a>
									<input class="quantity" type="text" onpaste="return false;" id="stockNumSelect" max="10" min="1" maxlength="4" value="1" name="quantity"/>
									<a id="increase" class="increase">+</a>
								</span>
									<span class="num-unit">件<small style="display:none;" >库存<span id="stockNum">1000</span>件</small>
									</span>
								</div>
							</div>
							<div class="join-buy">
								<a class="add-cart addToCart" href="javascript:;" style="margin-left: 30px;">加入购物车</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="productGroup11" class="fitting-suit"></div>

			<div class="content mgt">
				<div class="introduce" id="intro_top">
					<div class="intro-tit">
						<ul class="intro-tabs" id="intro_tabs">
							<li class="active">
								<a class="js" href="javascript:;">商品介绍</a>
							</li>
							<li>
								<a class="pj" href="javascript:;">商品评价</a>
							</li>
							<!--<li>
								<a class="wd" href="javascript:;">你问我答</a>
							</li>
							<li>
								<a class="xz" href="javascript:;">购买须知</a>
							</li>
							<li>
								<a class="fw" href="javascript:;">售后服务</a>
							</li>-->
						</ul>
						<div class="add-cart  ">
							<span id="priceShowTbar" class="price">
									￥<i>25</i>.90
								</span>
							<a class="shoping addToCart" href="javascript:;">加入购物车</a>
						</div>
					</div>
					<div class="intro-area">
						<div class="intro-item intr">
							<div class="param">

								<ul class="param-list">
									<li><span class="lab">产品标准号:</span>GBT 22165</li>
									<li><span class="lab">是否为有机食品:</span>否</li>
									<li><span class="lab">商品包装方式:</span>小袋装</li>
									<li><span class="lab">制作工艺:</span>烘炒</li>
									<li><span class="lab">保质期（天）:</span>180 </li>
									<li><span class="lab">生产产地:</span>福建省厦门市</li>
									<li><span class="lab">食品生产许可证号QS:</span>QS4201 1801 0226</li>
									<li><span class="lab">商品来源地:</span>国产</li>
									<li><span class="lab">储存方式:</span>常温</li>
								</ul>
							</div>
							<div class="description">
								<div class="title">
									<strong>商品介绍</strong>
								</div>
								<div class="lazy">

									<p> <img data-origin-width="790" data-origin-height="500" src="img/detail/001.jpg" _src="img/detail/001.jpg" style="max-width:100%;width:auto;height:auto;font-family:Helvetica, &quot;font-size:16px;white-space:normal;" class=" lazy" data-original="" />
										<img data-origin-width="790" data-origin-height="1344" src="img/detail/002.jpg" _src="img/detail/002.jpg" style="max-width:100%;width:auto;height:auto;font-family:Helvetica, &quot;font-size:16px;white-space:normal;" class=" lazy" data-original="" />
										<!-- <img data-origin-width="730" data-origin-height="1174" src="img/detail/003.jpg" _src="img/detail/003.jpg" style="max-width:100%;width:auto;height:auto;font-family:Helvetica, &quot;font-size:16px;white-space:normal;" <span style="font-family:Helvetica, &quot;font-size:16px;white-space:normal;"></span> -->
										<img data-origin-width="730" data-origin-height="1174" src="img/detail/003.jpg" _src="img/detail/003.jpg" style="max-width:100%;width:auto;height:auto;font-family:Helvetica, &quot;font-size:16px;white-space:normal;" class=" lazy" data-original="" />
										<img data-origin-width="790" data-origin-height="1955" src="img/detail/004.jpg" _src="img/detail/004.jpg" style="max-width:100%;width:auto;height:auto;font-family:Helvetica, &quot;font-size:16px;white-space:normal;" class=" lazy" data-original="" /> </p>
									<p> &nbsp; </p>

								</div>
							</div>

						</div>
					</div>

					<!--商品评价-->
					<div class="intro-area">
						<div class="intro-item intr">

							<div class="description">
								<div class="title">
									<strong>商品评价：</strong>
								</div>
								<div class="lazy">

									<!--评论区域-->
									<div id="comment">
										<p>
											<textarea id="_mycontent" rows="3" cols="100" placeholder="请输入评价" class="text-default text-focus"></textarea>
											<br/>
											<input type="text" id="_nickname" value="匿名" />
											<input type="button" id="_btnsubmit" value="发布" />
										</p>
										<article id="_articleContent">
											<h6>威猛先生 2017/10/15 下午2:33</h6>
											<p>买零食就来零嘴小铺！</p>
										</article>
									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="recbar">
					<div class="recbar-box">
						<h2>为您推荐</h2>
						<div class="rec-area">
							<ul class="recbar-list">
							</ul>
						</div>
					</div>
					<div class="recbar-box">
						<h2>大家还购买了</h2>
						<div class="rec-area">
							<ul class="recbar-list">
								<li>
									<a href="#" title="香卤铁蛋（香辣味）（128g)" class="pic"><img src="img/detail/a.jpg" alt="" class="lazy" data-original=""></a>
									<a href="#" class="tit">香卤铁蛋（香辣味）（128g)</a>
									<p><span class="price">价格 ￥12.9</span></p>
								</li>
								<li>
									<a href="#" title="Tipo牛奶味奶蛋酥脆面包干" class="pic"><img src="img/detail/b.jpg" alt="" class="lazy" data-original=""></a>
									<a href="#" class="tit">Tipo牛奶味奶蛋酥脆面包干</a>
									<p><span class="price">价格 ￥11.9</span></p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- 右侧功能菜单 -->
		<!-- 右侧功能菜单 -->
		<div class="right-navbar">
			<ul class="rnb-list">
				<li class="gw indexcart" style="margin-top: 280px;">
					<a href="#"><i class="icon">▪</i><span>购物车</span><small class="sum" id="cartcount">0</small></a>
				</li>

			</ul>
			<ul class="rnb-link">

				<li class="goback">
					<a class="hvr" href="#"><span>返回顶部</span><i class="icon">▪</i></a>
				</li>
			</ul>
		</div>
		<script language="javascript" type="text/javascript">
			NTKF_PARAM = {
				siteid: "kf_9893",
				settingid: "kf_9893_1407138307993",
				uid: username || '',
				uname: username || '',
				itemid: ''

					,
				ntalkerparam: {　　
					item: {　　
						id: ''　　
					}
				}

			}
		</script>
		<!--<script type="text/javascript" src="http://download.ntalker.com/t2d2/ntkfstat.js?siteid=kf_9893" charset="utf-8"></script>-->
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
								<a>安全账户</a>
								<a>购物流程</a>
								<a>生日礼购物流程</a>
							</dd>

						</dl>
						<dl>
							<dt><strong>物流配送</strong></dt>
							<dd>
								<a>配送说明</a>
								<a>签收与验货</a>
							</dd>

						</dl>
						<dl>
							<dt><strong>付款说明</strong></dt>
							<dd>
								<a>发票制度</a>
								<a>公司转账</a>
								<a>在线支付</a>
							</dd>

						</dl>
						<dl>
							<dt><strong>客户服务</strong></dt>
							<dd>
								<a>退换货服务</a>
								<a>联系我们</a>
								<a>退款说明</a>
							</dd>

						</dl>
						<dl>
							<dt><strong>会员专区</strong></dt>
							<dd>
								<a>优惠券使用规则</a>
								<a>积分制度</a>
								<a>会员须知</a>
							</dd>

						</dl>
					</div>
				</div>

				<div class="foot-nav">
					<ul>
						<li>
							<a>关于我们</a>
							|
						</li>
						<li>
							<a>联系我们</a>
							|
						</li>
						<li>
							<a>客户服务</a>
							|
						</li>
						<li>
							<a>诚聘英才</a>
							|
						</li>
						<li>
							<a>商务合作</a>
							|
						</li>
						<li>
							<a>媒体报道</a>
							|
						</li>
						<li>
							<a>网站地图</a>
							|
						</li>
						<li>
							<a>站长招募</a>

						</li>
					</ul>
				</div>
				<div class="foot-copyright">
					Copyright@2007-2017 零嘴小铺电子商务有限公司 All rights Reserved<br/>
					<a>闽ICP备15022981号</a>
					</br>
				</div>
			</div>
		</div>

		<script language="javascript">
			function doBind() {
				var chkBoxes = document.getElementsByName("chkBind");
				var x = '[';
				var count = 0;
				for(var i = 0; i < chkBoxes.length; i++) {
					if(chkBoxes[i].checked == true) {
						count++;
						var chkId = chkBoxes[i].id;
						var id = chkId.split(';');
						x += '{"memberNo":"';
						x += id[0];
						x += '","storeid":"';
						x += id[1];
						x += '"},';
					}
				}
				if(count > 0) {
					x = x.substring(0, x.length - 1);
				}
				x += ']';
				if(x == '[]') {
					alert("没有选择任何平台");
				} else {
					$.ajax({
						type: "get",
						dataType: "json",
						url: "http://www.lppz.com/sso/exeThirdAccountBind.jhtml",
						data: {
							"bind": x
						},
						success: function(data) {
							alert(data.msg);
							document.getElementById("ceng").style.display = "none";
							document.getElementById("Bing").style.display = "none";
						}
					});
				}
			}
		</script>

		<!--<script src="//configch2.veinteractive.com/tags/B105FE22/510E/4163/911D/0A070929DD44/tag.js" type="text/javascript" async></script>
	<script type="text/javascript" src="http://www.lppz.com/resources/shop/js/lp_public.js"></script>	-->

		<script type="text/javascript">
			var productMap = {};
			productMap['103e92b7305311e5a454005056a25157'] = {
				path: null,
				specificationValues: []
			};
			$(function() {

				//$('.intro-item.ask').wbExecute({
				//	exeFun: consultationList
				//});

				//$('.intro-item.comm').wbExecute({
				//	exeFun: reviewList
				//});

				//$("#intro_tabs li .pj").click(function(){
				//	reviewList();
				//});
				//$("#intro_tabs li .wd").click(function(){
				//	consultationList();
				//});

				var $addCart = $('.addToCart');
				var $addFavorite = $('.addFavorite');
				// 加入购物车 / 到货通知
				$addCart.click(function() {
					//加入到货通知
					if($addCart.attr('nostock')) {
						checkname(function(login) {
							if(login) {
								$.ajax({
									url: "http://www.lppz.com/member/email.jhtml",
									type: "GET",
									dataType: "jsonp",
									jsonp: "callback",
									cache: false,
									success: function(message) {
										if(message) {
											$('#notifyEmail').val(message);
										} else {
											$('#notifyEmail').val('');
										}
										hasUp($('#aogMessage'));
									}
								});
							} else {
								$.loginIframe({
									id: '11000703',
									operation: 'notify'
								});
							}
						});
						return;
					}
					//加入购物车
					var quantity = $('.quantity').val();
					quantity -= 0;
					if(/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
						$.ajax({
							url: "http://www.lppz.com/cart/add.jhtml",
							type: "GET",
							crossDomain: true,
							data: {
								sku: '11000703',
								quantity: quantity
							},
							jsonp: "callback",
							dataType: "jsonp",
							cache: false,
							success: function(message) {
								if(message.type == 'success') {
									refreshCart();
								}
								$.message(message);
							}
						});
					} else {
						$.message("warn", "购买数量必须为正整数");
					}
				});

				// 添加商品收藏
				$addFavorite.click(function() {
					checkname(function(login) {
						if(login) {
							$.ajax({
								url: "http://www.lppz.com/member/favorite/add.jhtml?skucode=11000703",
								type: "GET",
								dataType: "jsonp",
								jsonp: "callback",
								cache: false,
								success: function(message) {
									$.message(message);
									$("#favorite").attr("class", "follow-ok");
								}
							});
						} else {
							$.loginIframe({
								id: '11000703',
								operation: 'favor'
							});
						}
					});
				});

				// 规格值选择
				$specificationValue.click(function() {
					var $this = $(this);
					if($this.hasClass("locked")) {
						return false;
					}
					$this.parent().toggleClass("this").siblings().removeClass("this");
					$this.toggleClass("this").parent().siblings().children("a").removeClass("this");
					var selectedIds = new Array();
					$specificationValue.filter(".this").each(function(i) {
						selectedIds[i] = $(this).attr("val");
					});
					var locked = true;
					$.each(productMap, function(i, product) {
						if(product.specificationValues.length == selectedIds.length && contains(product.specificationValues, selectedIds)) {
							if(product.path != null) {
								location.href = "http://item.lppz.com" + product.path;
								locked = false;
							}
							return false;
						}
					});
					if(locked) {
						lockSpecificationValue();
					}
					//$specificationTitle.hide();
					return false;
				});

				// 锁定规格值
				lockSpecificationValue();

				// 浏览记录
				var historyProducts = getCookie("historyProduct");
				if(!historyProducts) {
					historyProducts = [];
				} else {
					historyProducts = eval('(' + historyProducts + ')');
				}
				var isInHistory = false;
				for(var i = historyProducts.length - 1; i >= 0; i--) {
					if(historyProducts[i].sku == escape('11000703')) {
						isInHistory = true;
						break;
					}
				}

				if(!isInHistory) {

					var historyProduct = {};
					historyProduct['sku'] = escape('11000703');
					historyProduct['pname'] = escape('开心果（190g）（电商专供新包装）');
					historyProduct['img'] = escape('http://img.lppz.com/group1/M00/01/FB/CghmzFdL0TSAJedIAAAQdqkuaUo582.jpg');
					historyProduct['path'] = escape('/11000703.html');
					historyProduct['pprice'] = escape('￥25.90');
					historyProduct['jifen'] = escape('');
					//	historyProduct['pmarketprice'] = escape('');
					historyProducts.push(historyProduct);

					if(historyProducts.length > 12) {
						historyProducts.shift();
					}

					addCookie("historyProduct", JSONstringify(historyProducts), {
						domain: ".lppz.com"
					});
				}

				var historyView = $('.gl-list');
				historyView.html('');
				for(var i = historyProducts.length - 1; i >= 0; i--) {
					var product = historyProducts[i];
					var price = product.jifen ? product.jifen + '积分' : product.pprice;
					var html = '<li>' +
						'<a href="http://item.lppz.com' + unescape(product.path) + '" title="' + unescape(product.pname) + '" class="pic">' +
						'<img src="' + unescape(product.img) + '" alt="" class="lazy" data-original="' + unescape(product.img) + '"/>' +
						'</a>' +
						'<a href="http://item.lppz.com' + unescape(product.path) + '" class="tit">' + unescape(product.pname) + '</a>' +
						'<p><span class="price">' + unescape(price) + '</span></p>' +
						'</li>';
					historyView.append(html);
				}

			});

			window.afterloadmember = function() {
				//更新页面动态信息
				updateProductInfo();
				//增加会员浏览记录
				addProductViewHistory();
				//商品评价
				//reviewList();
			}

			var $specificationValue = $("#specification a");
			var $specification = $("#specification dl");
			// 锁定规格值
			function lockSpecificationValue() {
				var selectedIds = [];
				$specificationValue.filter(".this").each(function(i) {
					selectedIds[i] = $(this).attr("val");
				});
				$specification.each(function() {
					var $this = $(this);
					var selectedId = $this.find("a.this").attr("val");
					var otherIds = $.grep(selectedIds, function(n, i) {
						return n != selectedId;
					});
					$this.find("a").each(function() {
						var $this = $(this);
						otherIds.push($this.attr("val"));
						var locked = true;
						$.each(productMap, function(i, product) {
							if(contains(product.specificationValues, otherIds)) {
								locked = false;
								return false;
							}
						});
						if(locked) {
							$this.addClass("locked");
						} else {
							$this.removeClass("locked");
						}
						otherIds.pop();
					});
				});
			}

			// 判断是否包含
			function contains(array, values) {
				var contains = true;
				for(i in values) {
					if($.inArray(values[i], array) < 0) {
						contains = false;
						break;
					}
				}
				return contains;
			}

			function showaog1(sku) {
				notifysku = sku;
				$.ajax({
					url: "http://www.lppz.com/member/email.jhtml",
					type: "GET",
					dataType: "jsonp",
					jsonp: "callback",
					cache: false,
					success: function(message) {
						if(message) {
							$('#notifyEmail').val(message);
						} else {
							$('#notifyEmail').val('');
						}
						hasUp($('#aogMessage'));
					}
				});
			}

			function addFavor(id) {
				$.ajax({
					url: "http://www.lppz.com/member/favorite/add.jhtml",
					type: "GET",
					data: {
						skucode: id
					},
					dataType: 'jsonp',
					jsonp: 'callback',
					cache: false,
					success: function(message) {
						$.message(message);
						$("#favorite").attr("class", "follow-ok");
					}
				});
			}

			function updateProductInfo() {
				$.ajax({
					url: "http://www.lppz.com/product/info/11000703.jhtml",
					type: "GET",
					dataType: "jsonp",
					jsonp: "callback",
					cache: false,
					beforeSend: function(XMLHttpRequest) {
						$("#productPromotions11").css({
							display: ""
						});
						$("#productGifts11").css({
							display: ""
						});
						$("#productGroup11").css({
							display: ""
						});
					},
					success: function(message) {
						message = decodeURIComponent(message); //alert(message);
						try {
							message = decodeURI(message);
						} catch(e) {};
						message = message.replace(/\+/g, ' ');
						message = eval('(' + message + ')');
						if(message.stock != undefined) { //update stock
							$('#stockNum').html(message.stock);
							var max = 99;
							if((max - 0) > (message.stock - 0)) {
								max = message.stock;
							}
							$('#stockNumSelect').attr('max', max);

							if((message.stock - 0) <= 0) {
								var btns = $('.addToCart');
								btns.html('&nbsp;&nbsp;到货通知');
								btns.attr('noStock', true);

								btns.each(function() {
									if($(this).hasClass('add-cart')) {
										$(this).removeClass('add-cart');
										$(this).addClass('aog-btn');
									}
								});
							}
						}

						if(message.isMarketable != 1) {
							var btns = $('.addToCart');
							btns.html('&nbsp;&nbsp;到货通知');
							btns.attr('noStock', true);

							btns.each(function() {
								if($(this).hasClass('add-cart')) {
									$(this).removeClass('add-cart');
									$(this).addClass('aog-btn');
								}
							});
						}

						if(message.price) { //update price
							var fp = (message.price - 0).toFixed(2);
							var sp = fp.split('\.');
							$('#priceShow').html('￥<span>' + sp[0] + '</span>.' + sp[1]);
							$('#priceShowTbar').html('￥<i>' + sp[0] + '</i>.' + sp[1]);
							$("#commonProduct").css({
								display: ""
							});
							$("#isscoreProduct").css({
								display: "none"
							});
							$("#isscoreProduct1").css({
								display: "none"
							});
						}
						if(message.require_score != undefined) {
							if((message.require_score - 0) > 0) {
								$("#commonProduct").css({
									display: "none"
								});
								$("#isscoreProduct").css({
									display: ""
								});
								$("#isscoreProduct1").css({
									display: ""
								});
								$('#priceShowTbar').html('<span>' + message.require_score + '</span>积分');
								$('#pointShowTbar').html('<span>' + message.require_score + '</span>积分');
							}
						}

						if(message.sale) {
							$('.mon-sales').html(message.sale);
						}

						if(message.productGroups == null || message.productGroups == undefined || message.productGroups == "") {
							$("#productGroup11").css({
								display: "none"
							});
						} else {
							$("#productGroup11").html(message.productGroups);

							// 套餐
							var sku = [];
							var promid = [];
							var prodgrp = [];
							var quantitysuit = [];
							var $cbxs = $("#suitListWrap .cb-ipt");
							var $suit_total = $(".suit-total strong");
							var price = parseFloat($("#j_pro_price").data("price"), 10);
							var $j_suit_number = $("#j_suit_number");

							var calcSuitPrice = function() {
								var cost = price;
								var num = 0;
								sku = [];
								promid = [];
								prodgrp = [];
								quantitysuit = [];
								sku.push($("input.skucode").val())
								//promid.push($("input.promid").val())
								//prodgrp.push($("input.prodgrp").val())

								$cbxs.each(function() {
									cost += this.checked ? parseFloat($(this).data("price"), 10) : 0;
									num += this.checked ? 1 : 0;
									this.checked && sku.push($(this).siblings("input.skucode").val());
									this.checked && promid.push($(this).siblings("input.promid").val());
									this.checked && prodgrp.push($(this).siblings("input.prodgrp").val());
									this.checked && quantitysuit.push($(this).siblings("input.quantitysuit").val());
								});
								$suit_total.html("￥" + cost.toFixed(2));
								$j_suit_number.html(num);
							}
							$("#suitListWrap").on("click", ".cb-ipt", function() {
								calcSuitPrice();
							});
							calcSuitPrice();

							var $gobuy = $('.go-buy');
							//立即购买
							var $addCart = $('.addToCart');
							var $addFavorite = $('.addFavorite');
							$gobuy.click(function() {

								//加入到货通知
								if($addCart.attr('nostock')) {
									checkname(function(login) {
										if(login) {
											$.ajax({
												url: "http://www.lppz.com/member/email.jhtml",
												type: "GET",
												dataType: "jsonp",
												jsonp: "callback",
												cache: false,
												success: function(message) {
													if(message) {
														$('#notifyEmail').val(message);
													} else {
														$('#notifyEmail').val('');
													}
													hasUp($('#aogMessage'));
												}
											});
										} else {
											$.loginIframe({
												id: '11000703',
												operation: 'notify'
											});
										}
									});
									return;
								}
								//加入购物车
								var quantity = $('.quantity').val();
								quantity -= 0;
								if(/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
									quantitysuit.unshift(quantity);
									$.ajax({
										url: "http://www.lppz.com/cart/add.jhtml",
										type: "GET",
										crossDomain: true,
										data: {
											sku: sku.join(","),
											promotionId: encodeURI(encodeURI(promid.join(","))),
											groupName: encodeURI(prodgrp.join(",")),
											quantity: encodeURI(encodeURI(quantitysuit.join(",")))
										},
										jsonp: "callback",
										dataType: "jsonp",
										cache: false,
										beforeSend: function(XMLHttpRequest) {
											XMLHttpRequest.setRequestHeader("RequestType", "ajax");
										},
										success: function(message) {
											if(message.type == 'success') {

											}
											$.message(message);
										}
									});
								} else {
									$.message("warn", "购买数量必须为正整数");
								}

							});
						}
						$("#intro_top").find(".intro-tit").topSuction({
							fixCls: "int-fixed"
						});

						if(message.promotionNames.indexOf("<li>") > 0) {
							$("#productPromotions11").parents(".p-favor").removeClass("none");
							$("#productPromotions11").replaceWith(message.promotionNames);
						}
						if(message.productGifts.indexOf("<li>") > 0) {
							$("#productGifts11").parents(".p-favor").removeClass("none");
							$("#productGifts11").replaceWith(message.productGifts);
						}
						// $("#productGifts11").html(message.productGifts); 

						//if (message.review) {
						//	$('.sum-sales-nums').html(message.review);
						//}
					},
					error: function() {
						$("#productPromotions11").css({
							display: ""
						});
						$("#productGifts11").css({
							display: ""
						});
						$("#productGroup11").css({
							display: ""
						});
					}
				});
			}
			//增加会员浏览记录
			function addProductViewHistory() {
				var img = '';
				img = escape('http://img.lppz.com/group1/M00/01/FB/CghmzFdL0TSAcHW3AABKd6wBjlY162.jpg');
				$.ajax({
					url: "http://www.lppz.com/member/addProductViewHistory.jhtml",
					type: "GET",
					dataType: "jsonp",
					data: {
						uid: encodeURI(username),
						sku: encodeURI('11000703'),
						price: encodeURI('25.9'),
						name: encodeURI('开心果（190g）（电商专供新包装）'),
						image: img
					},

					jsonp: "callback",
					cache: false,
					success: function(message) {

					}

				});
			}

			var curPage = 1,
				pageSize = 10;

			function consultationList() {
				if(window.consultationListExe) {
					return;
				}
				submitData = "curPage=" + curPage + "&pageSize=" + pageSize;
				$.ajax({
					type: "GET",
					url: "http://www.lppz.com/product/getConsultation/11000703.jhtml",
					dataType: "jsonp",
					jsonp: "callback",
					data: submitData,
					beforeSend: function(XMLHttpRequest) {
						$("#loadingMessage2").html("&nbsp;&nbsp;&nbsp;&nbsp;<span>请稍后，数据加载中！</span>");
						$("#loadingMessage2").css({
							display: ""
						});
					},
					success: function(data) { //如果调用成功
						data = decodeURI(decodeURIComponent(data));
						data = data.replace(/\+/g, ' ');
						data = eval('(' + data + ')');
						$("#showControlPage2").html(data.content);
						$("#loadingMessage2").css({
							display: "none"
						});
						$("#pageBar2").html(data.pageBar);
						window.consultationListExe = true;
					},
					error: function() {
						$("#loadingMessage2").css({
							display: ""
						});
						$("#loadingMessage2").html(
							"<span class=\"errorFont\">数据加载遇到错误，请稍后再试</span>");
					}
				});
			}

			function showReviewPages(curPageUser) {
				window.reviewListExe = false;
				curPage = curPageUser;
				reviewList();
			}

			function showConsultationPages(curPageUser) {
				window.consultationListExe = false;
				curPage = curPageUser;
				consultationList();
			}

			function JSONstringify(Json) {
				if($.browser.msie) {
					if($.browser.version == "7.0" || $.browser.version == "6.0") {
						var result = jQuery.parseJSON(Json);
					} else {
						var result = JSON.stringify(Json);
					}
				} else {
					var result = JSON.stringify(Json);
				}
				return result;

			}
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$.ajax({
					type: "GET",
					url: "http://www.lppz.com/product/hasFavor.jhtml",
					dataType: "jsonp",
					jsonp: "callback",
					data: {
						productId: '11000703'
					},
					success: function(data) { //如果调用成功
						if(data.type == "success") {
							$("#favorite").attr("class", "follow-ok");
						}
					}
				});
			});
		</script>
		<script>
			!(function($) {
				var template = [];
				template.push('<div class="lp-login-overlay"></div>');
				template.push('<div class="lp-login-dialog">');
				template.push('<div class="lld-head">');
				template.push('<span>您尚未登录</span>');
				template.push('<span class="close" id="jLldClose" title="关闭"></span>');
				template.push('</div>');
				template.push('<div class="lld-main">');
				template.push('<iframe src="https://login.lppz.com/login?viewType=window&service=http://item.lppz.com/return.html" style="border:none; width: 100%; height: 100%;" frameborder="0" scrolling="no"></iframe>');
				template.push('</div>');
				template.push('</div>');

				var $window = $(window),
					resizeTimer = null;

				var setPosition = function() {
					var winWidth = $window.width(),
						winHeight = $window.height(),
						wrap = $('.lp-login-dialog').get(0),
						width = wrap.offsetWidth,
						height = wrap.offsetHeight,
						left = (winWidth - width) / 2,
						top = (winHeight - height) / 2;

					var cssText = 'left:' + left + 'px;top:' + top + 'px; width: ' +
						'_left:expression((document.documentElement).scrollLeft+' + left + ');_top:expression((document.documentElement).scrollTop+' + top + ');';
					wrap.style.cssText = cssText;
				}

				var winResize = function() {
					resizeTimer && clearTimeout(resizeTimer);
					resizeTimer = setTimeout(function() {
						setPosition();
					}, 40);
				};

				$.loginIframe = function(options) {
					if(this.length === 0) {
						return false;
					}

					if(options && options.id) {
						template[7] = '<iframe src="https://login.lppz.com/login?viewType=window&service=http://item.lppz.com/return.html?id=' + options.id + '-' + options.operation + '" style="border:none; width: 100%; height: 100%;" frameborder="0" scrolling="no"></iframe>'
					}
					$(template.join('')).appendTo($('body'));

					var $lockMask = $('.lp-login-overlay'),
						$wrap = $('.lp-login-dialog');

					setPosition();

					// 关闭弹层
					$wrap.on('click', '.close', function() {
						var un = function() {
							$lockMask.html('').attr({
								"style": ""
							}).remove();
						};
						$window.off('resize');
						$wrap.off().html('').attr({
							'style': ''
						}).remove();
						$lockMask.animate({
							opacity: 0
						}, 300, un);
					});

					$window.on('resize', winResize);
				}
			}(jQuery));

			// 关闭弹层
			function closeLldDialog() {
				$('.lp-login-dialog .close').trigger('click');
			}
		</script>
		<script type="text/javascript" src="http://www.lppz.com/resources/shop/js/o_code.js"></script>
		<script type="text/javascript">
			var _gtc = _gtc || [];
			$(document).on('afterloadmember', function(o, username) {
				//聚合
				var _mvq = window._mvq || [];
				window._mvq = _mvq;
				_mvq.push(['$setAccount', 'm-28592-0']);

				_mvq.push(['$setGeneral', 'goodsdetail', '', /*用户名*/ username, /*用户id*/ '']);
				_mvq.push(['$logConversion']);

				_mvq.push(['setPageUrl', /*单品着陆页url*/ window.location.href]); //如果不需要特意指定单品着陆页url请将此语句删掉
				_mvq.push(['$addGoods', /*分类id*/ 'c51fe57124aa44978e9f0eec46240c0b', /*品牌id*/ '', /*商品名称*/ '开心果（190g）（电商专供新包装）', /*商品ID*/ '11000703', /*商品售价*/ '25.9', /*商品图片url*/ 'http://img.lppz.com/group1/M00/01/F8/CghmzVdGsFeARW03AAAiUxAMUNo874.jpg', /*分类名*/ '嗑壳坚果', /*品牌名*/ '', /*商品库存状态1或是0*/ '', /*网络价*/ '', /*收藏人数*/ '', /*商品下架时间*/ '']);
				_mvq.push(['$addPricing', /*价格描述*/ '']);
				_mvq.push(['$logData']);

				//爱投
				var _aitgoodsData = [{
					"pName": "开心果（190g）（电商专供新包装）", //商品名称 (必填)
					"price": '25.9', //商品售价 (必填)
					"clickUrl": window.location.href, //商品URL地址  (必填)
					"pid": "11000703", //商品唯一标识（ID） (必填)
					"imgUrl": "http://img.lppz.com/group1/M00/01/F8/CghmzVdGsFeARW03AAAiUxAMUNo874.jpg", //商品预览图URL地址 (必填)
					"bName": "", //商品品牌名称
					"bNameUrl": "", //品牌页URL地址
					"cName": "", //一级分类名称
					"subCategory": "嗑壳坚果", //二级分类名称
					"cPageUrl": "", //一级分类页url
					"startTime": "", //商品上架时间(13位或10位时间戳e.g.1441504971067)
					"invalidTime": "", //商品下架时间
					"originalPrice": "25.9", //商品原价
					"inventoryNum": "", //商品库存数量
					"star": "", //收藏人数
					"score": "" //商品评分
				}];

				_gtc.push(["fnSetAccount", "1009"]);
				_gtc.push(["v", "1"]);
				_gtc.push(["fnGeneral", "arrived"]); //到达
				_gtc.push(["fnGeneral", "addGoods", _aitgoodsData]); //商品
				var nGtc = document.createElement("script");
				nGtc.type = "text/javascript";
				nGtc.async = true;
				nGtc.src = ("https:" == document.location.protocol ? "https://sslcdn.istreamsche.com" : "http://ga.istreamsche.com") + "/stat/gtc.js";
				document.getElementsByTagName("head")[0].appendChild(nGtc);
			});
		</script>
		<script src="js/base.js"></script>
	</body>
</html>