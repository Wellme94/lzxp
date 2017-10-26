<%@page import="com.etc.lzxp.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getLocalPort() + request.getContextPath()
			+ "/";
	//折中处理一下
	pageContext.setAttribute("path",path);
%>
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
		<style type="text/css">
		 #gp {
		   font-size:20px ;
		 }
		
		</style>
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
				
				/* 结算点击事件 */
				$("#countOrder").click(function () {
					location.href="http://localhost:8080/lzxp/UsersServlet?op=countOrder";
					
				});

			});

			  //点击查询按钮 进行商品名查询
			   $(function(){				   
				  $("#sch-btn").click(function(){
					  //获取关键字 
					  var keyword = $("#keyword").val();					 					  
					  if(keyword=="商品搜索"||keyword.length == 0 || keyword.match(/^\s+$/g)){
						  alert("请输入关键字！");
					  }else{
					     location.href="stype.jsp?keyword="+keyword;	
					  }
				  });		   
			   });		
			  
			   //点击热门 关键字进行商品的模糊查询
				 $(function(){
					$(".hot_sh").click(function(){					
						var hotword = $(this).text();
						/* alert("hotword:"+hotword); */
						location.href = "stype.jsp?keyword="+hotword;
					});
				 });
			   
		</script>
		<div id="out"></div>
		<!-- header -->
		<div class="toolbar">
			<div class="toolbar-cont wrap">
				<ul class="fl">
					<li id="headerUsername" class="headerUsername"></li>
					<% 
						Users user=null;
						if(request.getSession().getAttribute("user")!=null){
							//如果有传递过来用户信息
							user = (Users)request.getSession().getAttribute("user");
							%>
								<li>欢迎<span class="log username"><%=user.getUSERNAME() %></span>来到零嘴小铺官方商城！</li>
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
									<!-- 判断用户是否已登录 -->
										<c:if test="${sessionScope.user != null }">
										<!-- 如果用户不为空 -->
											<a href="user.jsp">${sessionScope.user.USERNAME}已登录</a>
										</c:if>
										<c:if test="${sessionScope.user == null }">
										<!-- 如果用户为空 -->
											<a href="login.jsp">您还未登录</a>
										</c:if>
										
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
					<a href="index.jsp">零嘴小铺</a><span>官方商城</span></div>
				<div class="hd-search">
					<div class="hot-tag">
						<span>热门搜索：</span>
							<a class="red hot_sh" href="javascript:void(0)">饼干</a>
							<a class = "hot_sh"  href="javascript:void(0)">牛肉</a>
							<a class = "hot_sh"  href="javascript:void(0)">豆干</a>
							<a class = "hot_sh"  href="javascript:void(0)">进口</a>
							<a class = "hot_sh"  href="javascript:void(0)">话梅</a>
							<a class = "hot_sh"  href="javascript:void(0)">瓜子</a>
					</div>
					<div class="search-area">
						<!--<form id="productSearchForm" action="#" method="post" >-->
				        <input class="sch-key" type="text" name="keyword" id="keyword" value="" onfocus="if (value =='商品搜索'){value =''}" onblur="if (value ==''){value='商品搜索'}">
						<input class="sch-btn" type="button" id = "sch-btn" value="搜 索"/>
						<!--</form>-->
					</div>
				</div>
				<div class="hd-user">
					<div class="user-shoping">
						<a class="us-btn indexcart" href="#">购物车</a>
						<span class="us-num cart-cache-num"><b id="goodsnum">0</b></span>
						<div class="cart-list cart-list-body">
							<span class="tit">最新加入的商品</span>
							<div class="cart-roll">
								<ul class="goods"></ul>
							</div>
							<div class="total">								
							</div>
						</div>
					</div>
				</div>
			</div>
		
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
						<div class="product-pic" id = "product-pic">					
					 <c:if test="${requestScope.list!=null}">
					     <c:forEach items="${requestScope.list}" var="showgoods" >                           
						 <div class="duct-zoom jqzoom">
								<img width="400" height="400" src="${showgoods.PICTUREADDRESS}"  />
							</div>
							<div id="duct-list">
								<a href="javascript:;" class="duct-control" id="duct_prev"></a>
								<a href="javascript:;" class="duct-control" id="duct_next"></a>
								<div class="duct-items">
									<ul class="dlist">
										<li class="current"><img class="lazy img-hover" alt="" src="${showgoods.PICTUREADDRESS}" data-original="" large="${showgoods.PICTUREADDRESS}" width="60" height="60"></li>
										<li><img class="lazy" alt="" src="${showgoods.PICTUREADDRESS}" data-original="" large="${showgoods.PICTUREADDRESS}" width="60" height="60"></li>
										<li><img class="lazy" alt="" src="${showgoods.PICTUREADDRESS}" data-original="" large="${showgoods.PICTUREADDRESS}" width="60" height="60"></li>
										<li><img class="lazy" alt="" src="${showgoods.PICTUREADDRESS}" data-original="" large="${showgoods.PICTUREADDRESS}" width="60" height="60"></li>
									</ul>
								</div>
							</div><!-- duct-list  -->	       
						      </c:forEach>						      
						  </c:if>
	                       
						</div><!-- product-pic 拼接-->
						<div class="product-share clearfix">
					
						</div>
					</div>
					<div class="product-param">
						<div class="primary">					
						<c:if test="${requestScope.list!=null}">
					     <c:forEach items="${requestScope.list}" var="showgoods" >  
							<div class="p-title" style="margin-left: 100px; margin-top: 50px;"><strong>${showgoods.GOODSNAME}</strong><input type="hidden" id ="goodsId" value ="${showgoods.GOODSID}"/></div>
							<div class="p-exp" style="margin-left: 130px;">${showgoods.GOODSCONTENT}</div>							
									<div class="lb" id = "gp">价格：<strong>${showgoods.GOODSPRICE}</strong></div>																

							<div class="p-sales">
								<div class="lb">月销量：</div>
								<span class="mon-sales">1000</span>
							</div>
							<div class="p-grade pim">
								<div class="dt" style="margin-left: 83px;">商品评分：</div>
								<div class="dd"><span class="score-star "><i class="star05">分</i></span></div>
								<span class="sum-sales">（累计评价：<a  class="all-comment-num sum-sales-nums" href="#">0</a>）</span>
							</div>
						  </c:forEach>
						</c:if>	
						</div><!-- primary 拼接-->
						<div class="choose">

							<div class="c-num pim" style="margin-top: 10px;">
								<div class="dt" style="margin-left: 60px;">数量：</div>
								<div class="dd">
									<span class="num-btn">
									<a id="decrease" class="decrease">-</a>
									<input class="quantity" type="text" onpaste="return false;" id="stockNumSelect" max="1000" min="1" maxlength="4" value="1" name="quantity"/>
									<a id="increase" class="increase">+</a>
								</span>
									<span class="num-unit">件<small style="display:none;" >库存<span id="stockNum">1000</span>件</small>
									</span>
								</div>
							</div>
							<div class="join-buy" style="display:inline-block">
								<a class="add-cart addToCart" href="javascript:;" style="margin-left: 30px;">加入购物车</a>
							</div>
							<!-- 立即购买 -->
							<a href="#" id="payNow" style="margin-left: 0;">
								<img alt="立即购买" src="images/paynow.png">
							</a>
						</div><!-- choose 拼接-->
					</div><!-- product-param -->
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
			
			<ul class="rnb-link">

				<li class="goback">
					<a class="hvr" href="#"><span>返回顶部</span><i class="icon">▪</i></a>
				</li>
			</ul>
		</div>
		<script language="javascript" type="text/javascript">

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

		</script>

		<!--<script src="//configch2.veinteractive.com/tags/B105FE22/510E/4163/911D/0A070929DD44/tag.js" type="text/javascript" async></script>
	<script type="text/javascript" src="http://www.lppz.com/resources/shop/js/lp_public.js"></script>	-->
	
<script type="text/javascript">
		//页面加载时初始化购物车中的信息
			$(".goods").empty();
			$(".total").empty();
			$("#goodsnum").text("");
			var sumgoods = 0;
			var sumprice = 0;
			var username = $('.username').text();
			/* alert(username) */
			$.post("${path}GoodsCartServlet",{"op":"queryShopCart","UserName":username},function(listgc,status){
				$.each(listgc,function(index,data){
					/* 购物车的的item- */							
					$(".goods").append("<li><input type='hidden' id='GOODSID' class='goodsiddel' value='"+data.GOODSID+"' /><div class='gd-lft'><a class='pic'><img src='"+data.GOODSPICTURE+"'/></a><p class='tit'>"+data.GOODSNAME+"</p></div><div class='gd-price'><span>￥"
						+data.GOODSPRICE+"<small>x"+data.GOODSCOUNT+"</small></span><a href='javascript:;' class='delete'>删除</a></div></li>");
			   	   sumgoods += data.GOODSCOUNT;
			   	   sumprice += (sumgoods*data.GOODSPRICE);
				});			
				$(".total").append("<p>共<span class='red'>"+sumgoods+"</span>件商品，共计<span class='sum+'>￥"+sumprice.toFixed(2)+"</span></p><a class='settle' href='javascript:;'>去购物车结算</a>");
				$("#goodsnum").text(sumgoods);
			});	

		</script>	

		<script type="text/javascript">
		//加入购物车
			var $addCart = $('.addToCart');
			$addCart.click(function() {	
			$(".goods").empty();
			$(".total").empty();
			$("#goodsnum").text("");
			var cartid = $('#goodsId').val();
			var quantity = $('.quantity').val();
			var username = $('.username').text();
			var sumgoods = 0;
			var sumprice = 0;
			var price = 0;
			quantity -= 0;
			if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
				$.post("${path}GoodsCartServlet",{"op":"queryGoodsById","UserName":username,"GoodsID":cartid,"GoodsCount":quantity},function(listgc,status){			
					$.each(listgc,function(index,data){
												
						$(".goods").append("<li><input type='hidden' id='GOODSID' class='goodsiddel' value='"+data.GOODSID+"' /><div class='gd-lft'><a class='pic'><img src='"+data.GOODSPICTURE+"'/></a><p class='tit'>"+data.GOODSNAME+"</p></div><div class='gd-price'><span>￥"
							+data.GOODSPRICE+"<small>x"+data.GOODSCOUNT+"</small></span><a href='javascript:;' class='delete'>删除</a></div></li>");
				   	   sumgoods += data.GOODSCOUNT;				   	   
				   	   sumprice += (data.GOODSCOUNT*data.GOODSPRICE);
					});			
					$(".total").append("<p>共<span class='red'>"+sumgoods+"</span>件商品，共计<span class='sum+'>￥"+sumprice.toFixed(2)+"</span></p><a class='settle' href='javascript:;'>去购物车结算</a>");
					$("#goodsnum").text(sumgoods);
				});		
			} else {
				alert("购买数量必须为正整数");
				}
			});	
		</script>

<script type="text/javascript">
		//立即购买
			var $addCart = $('#payNow');
			$addCart.click(function() {
			//判断用户是否已经登录	
			 
			if(<%=(user!=null)%>){
				
					//用户已登录
			
				$(".goods").empty();
				$(".total").empty();
				$("#goodsnum").text("");
				var cartid = $('#goodsId').val();
				var quantity = $('.quantity').val();
				var username = $('.username').text();
				quantity -= 0;
				if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
					$.post("${path}GoodsCartServlet",{"op":"paynow","UserName":username,"GoodsID":cartid,"GoodsCount":quantity},function(listgc,status){
						location.href="http://localhost:8080/lzxp/myorder2.jsp";
					});		
				} else {
					alert("购买数量必须为正整数");
					}
				
			
			}else{
				//页面跳转登录页面
				location.href="login.jsp";
			}
			
		
			});	
		</script>


		<script type="text/javascript">
			//购物车中删除
			$(document).on("click",'.delete',function(index){
				var sumgoods = 0;
				var sumprice = 0;
				$("#goodsnum").text("");
				var username = $('.username').text();
				var goodsiddel=$(this).parent().parent().find("#GOODSID").val();
				var flag=confirm("是否要删除");
				if(flag){
					$(".goods").empty();
					$(".total").empty();
					$.post("${path}GoodsCartServlet",{"op":"queryGoodsDelete","UserName":username,"GoodsID":goodsiddel},function(listgc,status){			
					$.each(listgc,function(index,data){
					/* 购物车的的item- */							
					$(".goods").append("<li><input type='hidden' id='GOODSID' class='goodsiddel' value='"+data.GOODSID+"' /><div class='gd-lft'><a class='pic'><img src='"+data.GOODSPICTURE+"'/></a><p class='tit'>"+data.GOODSNAME+"</p></div><div class='gd-price'><span>￥"
					+data.GOODSPRICE+"<small>x"+data.GOODSCOUNT+"</small></span><a href='javascript:;' class='delete'"+data.GOODSID+"'>删除</a></div></li>");
					sumgoods += data.GOODSCOUNT;
					sumprice += (data.GOODSCOUNT*data.GOODSPRICE);
					});			
					$(".total").append("<p>共<span class='red'>"+sumgoods+"</span>件商品，共计<span class='sum+'>￥"+sumprice.toFixed(2)+"</span></p><a class='settle' href='javascript:;'>去购物车结算</a>");
					$("#goodsnum").text(sumgoods);
					});
				}else{
					
				}
			});

		</script>

		<script type="text/javascript">
		//购物车结算按钮的点击
		var username = $('.username').text();
		$(document).on("click",'.settle',function(index){
							$.post("${path}GoodsCartServlet",{"op":"submitOrder","UserName":username},function(result,status){
								if(result == true){
									//如果登录成功,页面跳转
									location.href="http://localhost:8080/lzxp/myorder2.jsp";
								}else{
									//如果失败
									location.href="http://localhost:8080/lzxp/login.jsp";
								}
							});
						});
		</script>
		<script type="text/javascript" src="http://www.lppz.com/resources/shop/js/o_code.js"></script>
		<script type="text/javascript">

		</script>
		<script src="js/base.js"></script>
	</body>
</html>