<%@page import="com.etc.lzxp.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
	+ request.getContextPath() + "/";
	request.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--
    	作者：offline
    	时间：2017-10-12
    	描述：大类详细页
    -->
		<meta charset="utf-8" />
		<title>零嘴小铺-官方商城</title>
		<link rel="stylesheet" href="css/page_ltype.css" />
		<link rel="stylesheet" href="css/index_ltype.css">
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
		<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
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
				
			});
			
			
		
		</script>
</head>
<body>
	<!--
        	作者：offline
        	时间：2017-10-12
        	描述：toolbar
        -->
		<div id="out"></div>
		<!-- header -->
		<div class="toolbar">
			<div class="toolbar-cont wide">
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
					
					<li>
						<a class="log" href="login.jsp">[登录]</a>
					</li>
					<li>
						<a class="reg" href="register.jsp">[注册]</a>
					</li>
					<li>
						<a class="log" href="#" id="exit">[退出]</a>
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
										<c:if test="${sessionScope.user != null }">
										<!-- 如果用户不为空 -->
											<a href="${path }UsersServlet?op=userInfo">${sessionScope.user.USERNAME}已登录</a>
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
											<a target="_blank" href="myorder.jsp">我的订单</a>
										</div>
										<div class="item">
											<a target="_blank" href="#">我的关注</a>
										</div>
										<div class="item">
											<a target="_blank" href="#">我的优惠券<span id="spancouponcount">(<span class="num red" id="couponCount"></span>)</span>
											</a>
										</div>
										<div class="item">
											<a target="_blank" href="#">我的积分</a>
										</div>
									</div>
									<div class="">
										<div class="item">
											<a clstag="" href="#">签到有好礼</a>
										</div>
										<div class="item">
											<a target="_blank" clstag="" href="#">购物指南</a>
										</div>
									</div>
								</div>
								<div class="view-list">
									<div class="vl-title">
										<h4>最近浏览</h4>
										<a class="more" href="#" target="_blank">更多&nbsp;&gt;</a>
									</div>
									<ul class="vl-cont" id="ulHistory"></ul>
								</div>
							</div>
						</div>
					</li>

				</ul>

			</div>
		</div>

		<header>

			<div class="head-main wide clearfix">
				<!--
			        	作者：offline
			        	时间：2017-10-12
			        	描述：logo
			        -->
				<div id="head_logo">
					<img src="img/LOGO.png" />
					<img src="img/logo1.jpg" />
				</div>
				<!--
				
				搜索模块
			-->
				<div class="hd-search">
					<div class="hot-tag">
						<!--热门搜索-->
						<span>热门搜索：</span>
						<a class="red" href="#">松子</a>
						<a href="#">牛肉</a>
						<a href="#">开心果</a>
						<a href="#">核桃</a>
						<a href="#">话梅</a>
						<a href="#">花生瓜子</a>
					</div>
					<!--搜索框-->
					<div class="search-area">
						<!--<form id="productSearchForm" action="" method="get" target="_blank">-->
							<input class="sch-key" type="text" name="keyword" id="keyword" placeholder="商品搜索">
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
								<a class="settle" href="#" id="countOrder">去购物车结算</a>
							</div>
						</div>
					</div>

				</div>
			</div>

		</header>

		<!-- 首页内容顶部 -->
		<div class="idx-focus clearfix">
			<!-- 
			分类 
		-->
			<div class="focus-cont clearfix wide" style="background:#fedea5">
				<div class="all-sort">
					<a class="as-btn" href="#"><span>商品分类<i class="icon">▼</i></span></a>
					<div class="sort-nav">
						<ul>
							<li>
								<div class="top-sort">
									<h3><a href="#">
						<span class="icon-fire font-color"></span>&nbsp;坚果炒货</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="stype.jsp?stypeId=1">嗑壳坚果</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?stypeId=2">果果仁仁</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?stypeId=3">特惠炒货</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="#">
						<span class="icon-lab font-color"></span>&nbsp;肉脯鱼干</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="#">猪肉系列</a>
										</li>
										<li>
											<a target="_blank" href="#">牛肉系列</a>
										</li>
										<li>
											<a target="_blank" href="#">鸡鸭系列</a>
										</li>
										<li>
											<a target="_blank" href="#">海味系列</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="#">
						<span class="icon-food font-color"></span>&nbsp;果干果脯</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="#">缤纷果干</a>
										</li>
										<li>
											<a target="_blank" href="#">话梅山楂</a>
										</li>
										<li>
											<a target="_blank" href="#">红枣葡萄</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="#">
						<span class="icon-search font-color"></span>&nbsp;糕点糖果</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="#">糕点系列</a>
										</li>
										<li>
											<a target="_blank" href="#">饼干系列</a>
										</li>
										<li>
											<a target="_blank" href="#">糖果系列</a>
										</li>
										<li>
											<a target="_blank" href="#">果冻系列</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="#">
						<span class="icon-data font-color"></span>&nbsp;素食山珍</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="#">美味豆干</a>
										</li>
										<li>
											<a target="_blank" href="#">笋菌海带</a>
										</li>
										<li>
											<a target="_blank" href="#">其他山珍</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="#">
						<span class="icon-cup font-color"></span>&nbsp;花茶饮品</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="#">养生冲调</a>
										</li>
										<li>
											<a target="_blank" href="#">进口饮料</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="#">
						<span class="icon-paperplane font-color"></span>&nbsp;进口食品</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="#">进口糕点</a>
										</li>
										<li>
											<a target="_blank" href="#">进口糖果</a>
										</li>
										<li>
											<a target="_blank" href="#">休闲零食</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="#">
						<span class="icon-shop font-color"></span>&nbsp;精选礼盒</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="#">零食礼盒</a>
										</li>
										<li>
											<a target="_blank" href="#">年货量贩装</a>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- 
				幻灯 
			-->
				<div class="idx-slider">
					<ul class="islide">
						<li style="background-color:#feeaf2">
							<a title="零嘴抢购" href="#" target="_blank"><img class="lazy" data-original="" src="img/lunbo/lunbo-1.jpg" alt="零嘴抢购" /></a>
						</li>
						<li style="background-color:#e9e7ea">
							<a title="零嘴大礼包" href="#" target="_blank"><img class="lazy" data-original="" src="img/lunbo/lunbo-2.jpg" alt="零嘴大礼包" /></a>
						</li>
						<li style="background-color:#faf0e6">
							<a title="零嘴上新尝鲜" href="#" target="_blank"><img class="lazy" data-original="" src="img/lunbo/lunbo-3.jpg" alt="零嘴上新尝鲜" /></a>
						</li>
					</ul>
				</div>
				<!-- 热门抢购 -->
				<div class="rush-hot">
					<div class="rush-hot-cont rush-slide">
						<ul class="rhc-list rslide">
							<li>
								<a title="特惠上" href="#" target="_blank"><img class="lazy" data-original="" src="img/lunbo-right1.jpg" alt=特惠上 " /></a>
				</li>
				</ul>
				</div><div class="rush-hot-cont rush-slide ">
				<ul class="rhc-list rslide ">
				<li>
					<a title="特惠下 " href="# " target="_blank "><img class="lazy " data-original=" " src="img/lunbo-right2.jpg " alt=特惠下" /></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- index content -->
		<div class="index-main wide">
			<!-- 	
			活动
		 -->
			<div class="idx-activity">
				<ul class="act-list">
					<li>
						<h3>先领券再购物</h3>
						<div class="act-list-cont">
							<a title="主推" href="${requestScope.path }detail.jsp"><img class="lazy" data-original="" src="img/idx-activity/1.jpg" alt="主推"></a>
						</div>
					</li>
					<li> 
						<h3>先领券再购物</h3>
						<div class="act-list-cont">
							<a title="主推" href="#" target="_blank"><img class="lazy" data-original="img/idx-activity/2.jpg" alt="主推"></a>
						</div>
					</li>
					<li>
						<h3>先领券再购物</h3>
						<div class="act-list-cont">
							<a title="主推" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/3.jpg" alt="主推"></a>
						</div>
					</li>
					<li>
						<h3>满送专区</h3>
						<div class="act-list-cont">
							<a title="主推" href="#"><img class="lazy" data-original="" src="img/idx-activity/4.jpg" alt="主推"></a>
						</div>
					</li>
				</ul>
			</div>
			<!-- 
			活动精选	
		-->
			<div class="star-sku">
				<div class="star-tit">
					<h2>活动精选</h2>
					<ul class="star-tabs">
						<li>
							<a href="javascript:;">大促特惠</a>
						</li>
						<li>
							<a href="javascript:;">6月TOP榜</a>
						</li>
						<li>
							<a href="javascript:;">新品尝鲜</a>
						</li>
					</ul>
				</div>
				<div class="star-area">
					<ul class="star-area-list">
						<li>
							<a title="专区" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-1.jpg" alt="专区"></a>
						</li>
						<li>
							<a title="专区" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-2.jpg" alt="专区"></a>
						</li>
						<li>
							<a title="专区" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-3.jpg" alt="专区"></a>
						</li>
						<li>
							<a title="专区" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-4.jpg" alt="专区"></a>
						</li>
						<li>
							<a title="专区" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-5.jpg" alt="专区"></a>
						</li>
					</ul>
					<ul class="star-area-list">
						<li>
							<a title="TOP" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-6.jpg" alt="TOP"></a>
						</li>
						<li>
							<a title="TOP" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-7.jpg" alt="TOP"></a>
						</li>
						<li>
							<a title="TOP" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-8.jpg" alt="TOP"></a>
						</li>
						<li>
							<a title="TOP" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-9.jpg" alt="TOP"></a>
						</li>
						<li>
							<a title="TOP" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-10.jpg" alt="TOP"></a>
						</li>
					</ul>
					<ul class="star-area-list">
						<li>
							<a title="新品" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-1.jpg" alt="新品"></a>
						</li>
						<li>
							<a title="新品" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-2.jpg" alt="新品"></a>
						</li>
						<li>
							<a title="新品" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-3.jpg" alt="新品"></a>
						</li>
						<li>
							<a title="新品" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-4.jpg" alt="新品"></a>
						</li>
						<li>
							<a title="新品" href="#" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-5.jpg" alt="新品"></a>
						</li>
					</ul>
				</div>
			</div>

			<div id="5241292981705641" class="storey-food">
				<div class="stor-top">
					<div class="stor-title"><span>1F</span>
						<h2>坚果炒货</h2></div>
					<div class="stor-slide of-slide">
						<ul class="stor-list oslide">
							<li>
								<a title="首页类目楼层-坚果炒货" href="style.html" target="_blank"><img class="lazy" data-original="" src="img/jianguo/00.jpg" alt="首页类目楼层-坚果炒货" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
							<li>
								<a href="style.html#">嗑壳坚果</a>
							</li>
							<li>
								<a href="style.html">果果仁仁</a>
							</li>
							<li>
								<a href="style.html">特惠炒货</a>
							</li>
						</ul>
						<div class="sct-hot">
							<a href="style.html" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="嗑壳坚果" target="_blank" href="style.html">
									<img class="lazy" data-original="" src="img/jianguo/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="黑美人葵花籽" href="" target="_blank">
											<img class="lazy" data-original="#" src="img/jianguo/011.jpg" alt="黑美人葵花籽" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="黑美人葵花籽">
											黑美人葵花籽
										</a>
										<span class="price">
																	<small>￥</small>25.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="南瓜籽110g" href="#" target="_blank">
											<img class="lazy" data-original="#" src="img/jianguo/012.jpg" alt="南瓜籽110g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="南瓜籽110g">
											南瓜籽110g
										</a>
										<span class="price">
																	<small>￥</small>25.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="伊朗开心果190g" href="detail.jsp" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/013.jpg" alt="伊朗开心果190g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="detail.jsp" target="_blank" title="伊朗开心果190g">
											伊朗开心果190g
										</a>
										<span class="price">
																	<small>￥</small>29.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="黑美人葵花籽" href="#" target="_blank">
											<img class="lazy" data-original="#" src="img/jianguo/011.jpg" alt="黑美人葵花籽" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="黑美人葵花籽">
											黑美人葵花籽
										</a>
										<span class="price">
																	<small>￥</small>25.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="南瓜籽110g" href="#" target="_blank">
											<img class="lazy" data-original="#" src="img/jianguo/012.jpg" alt="南瓜籽110g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="南瓜籽110g">
											南瓜籽110g
										</a>
										<span class="price">
																	<small>￥</small>25.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="伊朗开心果190g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/013.jpg" alt="伊朗开心果190g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="伊朗开心果190g">
											伊朗开心果190g
										</a>
										<span class="price">
																	<small>￥</small>29.<small>90</small>
																</span>
									</div>
								</li>

							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="果果仁仁" target="_blank" href="style.html">
									<img class="lazy" data-original="" src="img/jianguo/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="甘栗80g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/021.jpg" alt="甘栗80g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="甘栗80g">
											甘栗80g
										</a>
										<span class="price">
																	<small>￥</small>19.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="烘烤薯片原味98g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/022.jpg" alt="烘烤薯片原味98g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="烘烤薯片原味98g">
											烘烤薯片原味98g
										</a>
										<span class="price">
																	<small>￥</small>18.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="欢乐套餐" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/023.jpg" alt="欢乐套餐" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="欢乐套餐">
											欢乐套餐
										</a>
										<span class="price">
																	<small>￥</small>33.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="甘栗80g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/021.jpg" alt="甘栗80g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="甘栗80g">
											甘栗80g
										</a>
										<span class="price">
																	<small>￥</small>19.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="烘烤薯片原味98g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/022.jpg" alt="烘烤薯片原味98g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="烘烤薯片原味98g">
											烘烤薯片原味98g
										</a>
										<span class="price">
																	<small>￥</small>18.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="欢乐套餐" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/023.jpg" alt="欢乐套餐" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="欢乐套餐">
											欢乐套餐
										</a>
										<span class="price">
																	<small>￥</small>33.<small>90</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="特惠炒货" target="_blank" href="style.html">
									<img class="lazy" data-original="" src="img/jianguo/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="蛋花玉米65g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/031.jpg" alt="蛋花玉米65g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="蛋花玉米65g">
											蛋花玉米65g
										</a>
										<span class="price">
																	<small>￥</small>16.<small>00</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="多味花生" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/032.jpg" alt="多味花生" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="多味花生">
											多味花生
										</a>
										<span class="price">
																	<small>￥</small>18.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="牛肉味兰花豆 " href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/033.jpg" alt="牛肉味兰花豆" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="牛肉味兰花豆">
											牛肉味兰花豆
										</a>
										<span class="price">
																	<small>￥</small>16.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="蛋花玉米65g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/031.jpg" alt="蛋花玉米65g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="蛋花玉米65g">
											蛋花玉米65g
										</a>
										<span class="price">
																	<small>￥</small>16.<small>00</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="多味花生" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/032.jpg" alt="多味花生" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="多味花生">
											多味花生
										</a>
										<span class="price">
																	<small>￥</small>18.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="牛肉味兰花豆 " href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jianguo/033.jpg" alt="牛肉味兰花豆" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="牛肉味兰花豆">
											牛肉味兰花豆
										</a>
										<span class="price">
																	<small>￥</small>16.<small>90</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div id="5241308875959967" class="storey-food">
				<div class="stor-top">
					<div class="stor-title"><span>2F</span>
						<h2>肉脯鱼干</h2></div>
					<div class="stor-slide of-slide">
						<ul class="stor-list oslide">
							<li>
								<a title="首页类目楼层-肉脯鱼干" href="" target="_blank"><img class="lazy" data-original="" src="img/rougan/00.jpg" alt="首页类目楼层-肉脯鱼干" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
							<li>
								<a href="#">猪肉系列</a>
							</li>
							<li>
								<a href="#">牛肉系列</a>
							</li>
							<li>
								<a href="#">鸡鸭系列</a>
							</li>
						</ul>
						<div class="sct-hot">
							<a href="#" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="猪肉系列" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/rougan/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="卤香猪蹄250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/011.jpg" alt="卤香猪蹄250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="卤香猪蹄250g">
											卤香猪蹄250g
										</a>
										<span class="price">
																	<small>￥</small>36.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="迷你烤香肠炭烤味" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/012.jpg" alt="迷你烤香肠炭烤味" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="迷你烤香肠炭烤味">
											迷你烤香肠炭烤味
										</a>
										<span class="price">
																	<small>￥</small>35.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="五香猪尾238g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/013.jpg" alt="五香猪尾238g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="五香猪尾238g">
											五香猪尾238g
										</a>
										<span class="price">
																	<small>￥</small>25.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="卤香猪蹄250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/011.jpg" alt="卤香猪蹄250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="卤香猪蹄250g">
											卤香猪蹄250g
										</a>
										<span class="price">
																	<small>￥</small>36.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="迷你烤香肠炭烤味" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/012.jpg" alt="迷你烤香肠炭烤味" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="迷你烤香肠炭烤味">
											迷你烤香肠炭烤味
										</a>
										<span class="price">
																	<small>￥</small>35.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="五香猪尾238g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/013.jpg" alt="五香猪尾238g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="五香猪尾238g">
											五香猪尾238g
										</a>
										<span class="price">
																	<small>￥</small>25.<small>90</small>
																</span>
									</div>
								</li>

							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="牛肉系列" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/rougan/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="麻辣牛板筋180g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/021.jpg" alt="麻辣牛板筋180g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="麻辣牛板筋180g">
											麻辣牛板筋180g
										</a>
										<span class="price">
																	<small>￥</small>33.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="秘制卤牛肉140g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/022.jpg" alt="秘制卤牛肉140g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="秘制卤牛肉140g">
											秘制卤牛肉140g
										</a>
										<span class="price">
																	<small>￥</small>39.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="泡椒牛肉165g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/023.jpg" alt="泡椒牛肉165g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="泡椒牛肉165g">
											泡椒牛肉165g
										</a>
										<span class="price">
																	<small>￥</small>24.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="麻辣牛板筋180g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/021.jpg" alt="麻辣牛板筋180g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="麻辣牛板筋180g">
											麻辣牛板筋180g
										</a>
										<span class="price">
																	<small>￥</small>33.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="秘制卤牛肉140g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/022.jpg" alt="秘制卤牛肉140g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="秘制卤牛肉140g">
											秘制卤牛肉140g
										</a>
										<span class="price">
																	<small>￥</small>39.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="泡椒牛肉165g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/023.jpg" alt="泡椒牛肉165g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="泡椒牛肉165g">
											泡椒牛肉165g
										</a>
										<span class="price">
																	<small>￥</small>24.<small>90</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="鸡鸭系列" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/rougan/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="奥尔良风味烤鸡翅178g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/031.jpg" alt="奥尔良风味烤鸡翅178g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="奥尔良风味烤鸡翅178g">
											奥尔良风味烤鸡翅178g
										</a>
										<span class="price">
																	<small>￥</small>19.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="酱香味鸭舌58g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/032.jpg" alt="酱香味鸭舌58g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="酱香味鸭舌58g">
											酱香味鸭舌58g
										</a>
										<span class="price">
																	<small>￥</small>24.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="鸭翅甜辣味150g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/033.jpg" alt="鸭翅甜辣味150g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="鸭翅甜辣味150g">
											鸭翅甜辣味150g
										</a>
										<span class="price">
																	<small>￥</small>23.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="奥尔良风味烤鸡翅178g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/031.jpg" alt="奥尔良风味烤鸡翅178g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="奥尔良风味烤鸡翅178g">
											奥尔良风味烤鸡翅178g
										</a>
										<span class="price">
																	<small>￥</small>19.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="酱香味鸭舌58g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/032.jpg" alt="酱香味鸭舌58g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="酱香味鸭舌58g">
											酱香味鸭舌58g
										</a>
										<span class="price">
																	<small>￥</small>24.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="鸭翅甜辣味150g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/rougan/033.jpg" alt="鸭翅甜辣味150g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="鸭翅甜辣味150g">
											鸭翅甜辣味150g
										</a>
										<span class="price">
																	<small>￥</small>23.<small>90</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div id="5241329588544783" class="storey-food">
				<div class="stor-top">
					<div class="stor-title"><span>3F</span>
						<h2>果干果脯</h2></div>
					<div class="stor-slide of-slide">
						<ul class="stor-list oslide">
							<li>
								<a title="首页类目楼层-果干果脯" href="" target="_blank"><img class="lazy" data-original="" src="img/guogan/00.jpg" alt="首页类目楼层-果干果脯" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
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
						<div class="sct-hot">
							<a href="#" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="缤纷果干" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/guogan/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="菠萝片（100g）" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/011.jpg" alt="菠萝片（100g）" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="菠萝片（100g）">
											菠萝片（100g）
										</a>
										<span class="price">
																	<small>￥</small>10.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="黄桃果干 98g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/012.jpg" alt="黄桃果干 98g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="黄桃果干 98g">
											黄桃果干 98g
										</a>
										<span class="price">
																	<small>￥</small>39.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="芒果干108g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/013.jpg" alt="芒果干108g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="芒果干108g">
											芒果干108g
										</a>
										<span class="price">
																	<small>￥</small>15.<small>80</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="菠萝片（100g）" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/011.jpg" alt="菠萝片（100g）" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="菠萝片（100g）">
											菠萝片（100g）
										</a>
										<span class="price">
																	<small>￥</small>10.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="黄桃果干 98g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/012.jpg" alt="黄桃果干 98g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="黄桃果干 98g">
											黄桃果干 98g
										</a>
										<span class="price">
																	<small>￥</small>39.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="芒果干108g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/013.jpg" alt="芒果干108g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="芒果干108g">
											芒果干108g
										</a>
										<span class="price">
																	<small>￥</small>15.<small>80</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="话梅山楂" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/guogan/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="山楂250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/021.jpg" alt="山楂250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="山楂250g">
											山楂250g
										</a>
										<span class="price">
																	<small>￥</small>15.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="果丹皮250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/022.jpg" alt="果丹皮250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="果丹皮250g">
											果丹皮250g
										</a>
										<span class="price">
																	<small>￥</small>11.<small>80</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="老婆梅140g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/023.jpg" alt="老婆梅140g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="老婆梅140g">
											老婆梅140g
										</a>
										<span class="price">
																	<small>￥</small>12.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="山楂250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/021.jpg" alt="山楂250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="山楂250g">
											山楂250g
										</a>
										<span class="price">
																	<small>￥</small>15.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="果丹皮250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/022.jpg" alt="果丹皮250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="果丹皮250g">
											果丹皮250g
										</a>
										<span class="price">
																	<small>￥</small>11.<small>80</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="老婆梅140g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/023.jpg" alt="老婆梅140g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="老婆梅140g">
											老婆梅140g
										</a>
										<span class="price">
																	<small>￥</small>12.<small>90</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="红枣葡萄" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/guogan/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">

								<li>
									<div class="p-img">
										<a title="阿胶蜜枣175g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/031.jpg" alt="阿胶蜜枣175g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="阿胶蜜枣175g">
											阿胶蜜枣175g
										</a>
										<span class="price">
																	<small>￥</small>7.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="黑加仑葡萄干250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/032.jpg" alt="黑加仑葡萄干250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="黑加仑葡萄干250g">
											黑加仑葡萄干250g
										</a>
										<span class="price">
																	<small>￥</small>15.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="精装红玛葡萄干250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/033.jpg" alt="精装红玛葡萄干250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="精装红玛葡萄干250g">
											精装红玛葡萄干250g
										</a>
										<span class="price">
																	<small>￥</small>11.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="阿胶蜜枣175g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/031.jpg" alt="阿胶蜜枣175g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="阿胶蜜枣175g">
											阿胶蜜枣175g
										</a>
										<span class="price">
																	<small>￥</small>7.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="黑加仑葡萄干250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/032.jpg" alt="黑加仑葡萄干250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="黑加仑葡萄干250g">
											黑加仑葡萄干250g
										</a>
										<span class="price">
																	<small>￥</small>15.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="精装红玛葡萄干250g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/guogan/033.jpg" alt="精装红玛葡萄干250g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="精装红玛葡萄干250g">
											精装红玛葡萄干250g
										</a>
										<span class="price">
																	<small>￥</small>11.<small>90</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div id="5241370405689776" class="storey-food">
				<div class="stor-top">
					<div class="stor-title"><span>4F</span>
						<h2>素食山珍</h2></div>
					<div class="stor-slide of-slide">
						<ul class="stor-list oslide">
							<li>
								<a title="首页类目楼层-山珍素食" href="" target="_blank"><img class="lazy" data-original="" src="img/sushi/00.jpg" alt="首页类目楼层-山珍素食" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
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
						<div class="sct-hot">
							<a href="#" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="美味豆干" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/sushi/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="鱼豆腐香辣味170g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/011.jpg" alt="鱼豆腐香辣味170g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="鱼豆腐香辣味170g">
											鱼豆腐香辣味170g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="风味豆干火辣味238g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/012.jpg" alt="风味豆干火辣味238g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="千页豆腐（麻辣味）（200g）">
											风味豆干火辣味238g
										</a>
										<span class="price">
																	<small>￥</small>8.<small>28</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="鸡蛋干酱香味158g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/013.jpg" alt="鸡蛋干酱香味158g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="鸡蛋干酱香味158g">
											鸡蛋干酱香味158g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="鱼豆腐香辣味170g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/011.jpg" alt="鱼豆腐香辣味170g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="鱼豆腐香辣味170g">
											鱼豆腐香辣味170g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="风味豆干火辣味238g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/012.jpg" alt="风味豆干火辣味238g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="千页豆腐（麻辣味）（200g）">
											风味豆干火辣味238g
										</a>
										<span class="price">
																	<small>￥</small>8.<small>28</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="鸡蛋干酱香味158g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/013.jpg" alt="鸡蛋干酱香味158g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="鸡蛋干酱香味158g">
											鸡蛋干酱香味158g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="笋菌海带" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/sushi/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="脆笋（香辣味）（188g）" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/021.jpg" alt="脆笋（香辣味）（188g）" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="脆笋（香辣味）（188g）">
											脆笋（香辣味）（188g）
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="泡椒味海带结 218g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/022.jpg" alt="泡椒味海带结 218g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="泡椒味海带结 218g">
											泡椒味海带结 218g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="香辣味扇贝裙边" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/023.jpg" alt="香辣味扇贝裙边" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="香辣味扇贝裙边">
											香辣味扇贝裙边
										</a>
										<span class="price">
																	<small>￥</small>12.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="脆笋（香辣味）（188g）" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/021.jpg" alt="脆笋（香辣味）（188g）" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="脆笋（香辣味）（188g）">
											脆笋（香辣味）（188g）
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="泡椒味海带结 218g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/022.jpg" alt="泡椒味海带结 218g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="泡椒味海带结 218g">
											泡椒味海带结 218g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="香辣味扇贝裙边" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/023.jpg" alt="香辣味扇贝裙边" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="香辣味扇贝裙边">
											香辣味扇贝裙边
										</a>
										<span class="price">
																	<small>￥</small>12.<small>90</small>
																</span>
									</div>
								</li>

							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="其他山珍" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/sushi/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="香酥小黄鱼118g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/031.jpg" alt="香酥小黄鱼118g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="香酥小黄鱼118g">
											香酥小黄鱼118g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="脆鱼干香辣味200g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/032.jpg" alt="脆鱼干香辣味200g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="脆鱼干香辣味200g">
											脆鱼干香辣味200g
										</a>
										<span class="price">
																	<small>￥</small>12.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="行走吃货套餐524g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/033.jpg" alt="行走吃货套餐524g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="行走吃货套餐524g">
											行走吃货套餐524g
										</a>
										<span class="price">
																	<small>￥</small>39.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="香酥小黄鱼118g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/031.jpg" alt="香酥小黄鱼118g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="香酥小黄鱼118g">
											香酥小黄鱼118g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="脆鱼干香辣味200g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/032.jpg" alt="脆鱼干香辣味200g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="脆鱼干香辣味200g">
											脆鱼干香辣味200g
										</a>
										<span class="price">
																	<small>￥</small>12.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="行走吃货套餐524g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/sushi/033.jpg" alt="行走吃货套餐524g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="行走吃货套餐524g">
											行走吃货套餐524g
										</a>
										<span class="price">
																	<small>￥</small>39.<small>90</small>
																</span>
									</div>
								</li>

							</ul>
						</div>
					</div>
				</div>
			</div>

			<div id="5241349037559137" class="storey-food">
				<div class="stor-top">
					<div class="stor-title"><span>5F</span>
						<h2>糕点糖果</h2></div>
					<div class="stor-slide of-slide">
						<ul class="stor-list oslide">
							<li>
								<a title="首页类目楼层-糖果糕点" href="" target="_blank"><img class="lazy" data-original="" src="img/candy/00.jpg" alt="首页类目楼层-糖果糕点" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
							<li>
								<a href="#">糕点系列</a>
							</li>
							<li>
								<a href="#">饼干系列</a>
							</li>
							<li>
								<a href="#">糖果系列</a>
							</li>
						</ul>
						<div class="sct-hot">
							<a href="#" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="糕点系列" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/candy/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="福多牌提拉米苏味蛋糕432g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/011.jpg" alt="福多牌提拉米苏味蛋糕432g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="福多牌提拉米苏味蛋糕432g">
											福多牌提拉米苏味蛋糕432g
										</a>
										<span class="price">
																	<small>￥</small>35.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="山核桃小酥165g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/012.jpg" alt="山核桃小酥165g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="山核桃小酥165g">
											山核桃小酥165g
										</a>
										<span class="price">
																	<small>￥</small>14.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="苏打夹心饼干(榴莲味)210g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/013.jpg" alt="苏打夹心饼干(榴莲味)210g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="手撕面包（电商专供）330g">
											苏打夹心饼干(榴莲味)210g
										</a>
										<span class="price">
																	<small>￥</small>19.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="福多牌提拉米苏味蛋糕432g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/011.jpg" alt="福多牌提拉米苏味蛋糕432g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="福多牌提拉米苏味蛋糕432g">
											福多牌提拉米苏味蛋糕432g
										</a>
										<span class="price">
																	<small>￥</small>35.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="山核桃小酥165g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/012.jpg" alt="山核桃小酥165g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="山核桃小酥165g">
											山核桃小酥165g
										</a>
										<span class="price">
																	<small>￥</small>14.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="苏打夹心饼干(榴莲味)210g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/013.jpg" alt="苏打夹心饼干(榴莲味)210g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="苏打夹心饼干(榴莲味)210g">
											苏打夹心饼干(榴莲味)210g
										</a>
										<span class="price">
																	<small>￥</small>19.<small>90</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="饼干系列" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/candy/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="杰克牌牛奶味方形威化饼干100g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/021.jpg" alt="杰克牌牛奶味方形威化饼干100g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="杰克牌牛奶味方形威化饼干100g">
											杰克牌牛奶味方形威化饼干100g
										</a>
										<span class="price">
																	<small>￥</small>15.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="苏打饼酸奶洋葱味" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/022.jpg" alt="苏打饼酸奶洋葱味" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="苏打饼酸奶洋葱味">
											苏打饼酸奶洋葱味
										</a>
										<span class="price">
																	<small>￥</small>19.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="小老板烤海苔卷盒装（原味）32.4g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/023.jpg" alt="小老板烤海苔卷盒装（原味）32.4g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="小老板烤海苔卷盒装（原味）32.4g">
											小老板烤海苔卷盒装（原味）32.4g
										</a>
										<span class="price">
																	<small>￥</small>16.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="杰克牌牛奶味方形威化饼干100g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/021.jpg" alt="杰克牌牛奶味方形威化饼干100g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="杰克牌牛奶味方形威化饼干100g">
											杰克牌牛奶味方形威化饼干100g
										</a>
										<span class="price">
																	<small>￥</small>15.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="苏打饼酸奶洋葱味" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/022.jpg" alt="苏打饼酸奶洋葱味" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="苏打饼酸奶洋葱味">
											苏打饼酸奶洋葱味
										</a>
										<span class="price">
																	<small>￥</small>19.<small>90</small>
																</span>
									</div>
								</li>

								<li>
									<div class="p-img">
										<a title="小老板烤海苔卷盒装（原味）32.4g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/023.jpg" alt="小老板烤海苔卷盒装（原味）32.4g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="小老板烤海苔卷盒装（原味）32.4g">
											小老板烤海苔卷盒装（原味）32.4g
										</a>
										<span class="price">
																	<small>￥</small>16.<small>90</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="糖果系列" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/candy/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="可乐糖60g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/031.jpg" alt="可乐糖60g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="可乐糖60g">
											可乐糖60g
										</a>
										<span class="price">
																	<small>￥</small>11.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="手造棒棒糖35g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/032.jpg" alt="手造棒棒糖35g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="手造棒棒糖35g">
											手造棒棒糖35g
										</a>
										<span class="price">
																	<small>￥</small>6.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="橡皮糖70g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/033.jpg" alt="橡皮糖70g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="橡皮糖70g">
											橡皮糖70g
										</a>
										<span class="price">
																	<small>￥</small>25.<small>00</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="可乐糖60g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/031.jpg" alt="可乐糖60g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="可乐糖60g">
											可乐糖60g
										</a>
										<span class="price">
																	<small>￥</small>11.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="手造棒棒糖35g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/032.jpg" alt="手造棒棒糖35g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="手造棒棒糖35g">
											手造棒棒糖35g
										</a>
										<span class="price">
																	<small>￥</small>6.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="橡皮糖70g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/candy/033.jpg" alt="橡皮糖70g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="橡皮糖70g">
											橡皮糖70g
										</a>
										<span class="price">
																	<small>￥</small>25.<small>00</small>
																</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div id="5241265443009357" class="storey-food">
				<div class="stor-top">
					<div class="stor-title"><span>6F</span>
						<h2>进口食品</h2></div>
					<div class="stor-slide of-slide">
						<ul class="stor-list oslide">
							<li>
								<a title="首页类目楼层-进口食品" href="" target="_blank"><img class="lazy" data-original="" src="img/jinkou/00.jpg" alt="首页类目楼层-进口食品" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
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
						<div class="sct-hot">
							<a href="#" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="进口糕点" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/jinkou/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="Tipo牛奶味奶蛋酥脆面包干(新老包装切换中)" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/011.jpg" alt="Tipo牛奶味奶蛋酥脆面包干(新老包装切换中)" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="Tipo牛奶味奶蛋酥脆面包干(新老包装切换中)">
											Tipo牛奶味奶蛋酥脆面包干(新老包装切换中)
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="养养牌冬荫功面(酸辣虾味浓汤面)" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/012.jpg" alt="养养牌冬荫功面(酸辣虾味浓汤面)" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="养养牌冬荫功面(酸辣虾味浓汤面)">
											养养牌冬荫功面(酸辣虾味浓汤面)
										</a>
										<span class="price">
																	<small>￥</small>18.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="CZA燕麦芝士酥 100g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/013.jpg" alt="CZA燕麦芝士酥 100g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="CZA燕麦芝士酥 100g">
											CZA燕麦芝士酥 100g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="Tipo牛奶味奶蛋酥脆面包干(新老包装切换中)" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/011.jpg" alt="Tipo牛奶味奶蛋酥脆面包干(新老包装切换中)" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="Tipo牛奶味奶蛋酥脆面包干(新老包装切换中)">
											Tipo牛奶味奶蛋酥脆面包干(新老包装切换中)
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="养养牌冬荫功面(酸辣虾味浓汤面)" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/012.jpg" alt="养养牌冬荫功面(酸辣虾味浓汤面)" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="养养牌冬荫功面(酸辣虾味浓汤面)">
											养养牌冬荫功面(酸辣虾味浓汤面)
										</a>
										<span class="price">
																	<small>￥</small>18.<small>90</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="CZA燕麦芝士酥 100g" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/013.jpg" alt="CZA燕麦芝士酥 100g" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="CZA燕麦芝士酥 100g">
											CZA燕麦芝士酥 100g
										</a>
										<span class="price">
																	<small>￥</small>9.<small>90</small>
																</span>
									</div>
								</li>

							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="进口糖果" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/jinkou/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="帕克大叔草莓味软糖（凝胶糖果）42g" href="" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/021.jpg" alt="帕克大叔草莓味软糖（凝胶糖果）42g" style="display: block;"></a>
									</div>

									<div class="p-info">
										<a class="name" href="#" target="_blank" title="帕克大叔草莓味软糖（凝胶糖果）42g">
											帕克大叔草莓味软糖（凝胶糖果）42g
										</a>
										<span class="price">
																	<small>￥</small>8.<small>00</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="喵喵肉垫棉花糖" href="" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/022.jpg" alt="喵喵肉垫棉花糖42g42g" style="display: block;"></a>
									</div>

									<div class="p-info">
										<a class="name" href="#" target="_blank" title="喵喵肉垫棉花糖">
											喵喵肉垫棉花糖
										</a>
										<span class="price">
																	<small>￥</small>8.<small>00</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="樱桃维生素C软糖80g" href="" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/023.jpg" alt="樱桃维生素C软糖80g" style="display: block;"></a>
									</div>

									<div class="p-info">
										<a class="name" href="#" target="_blank" title="樱桃维生素C软糖80g">
											樱桃维生素C软糖80g
										</a>
										<span class="price">
																	<small>￥</small>8.<small>00</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="帕克大叔草莓味软糖（凝胶糖果）42g" href="" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/021.jpg" alt="帕克大叔草莓味软糖（凝胶糖果）42g" style="display: block;"></a>
									</div>

									<div class="p-info">
										<a class="name" href="#" target="_blank" title="帕克大叔草莓味软糖（凝胶糖果）42g">
											帕克大叔草莓味软糖（凝胶糖果）42g
										</a>
										<span class="price">
																	<small>￥</small>8.<small>00</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="喵喵肉垫棉花糖" href="" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/022.jpg" alt="喵喵肉垫棉花糖42g42g" style="display: block;"></a>
									</div>

									<div class="p-info">
										<a class="name" href="#" target="_blank" title="喵喵肉垫棉花糖">
											喵喵肉垫棉花糖
										</a>
										<span class="price">
																	<small>￥</small>8.<small>00</small>
																</span>
									</div>
								</li>
								<li>
									<div class="p-img">
										<a title="樱桃维生素C软糖80g" href="" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/023.jpg" alt="樱桃维生素C软糖80g" style="display: block;"></a>
									</div>

									<div class="p-info">
										<a class="name" href="#" target="_blank" title="樱桃维生素C软糖80g">
											樱桃维生素C软糖80g
										</a>
										<span class="price">
																	<small>￥</small>8.<small>00</small>
																</span>
									</div>
								</li>

							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="休闲零食" target="_blank" href="#">
									<img class="lazy" data-original="" src="img/jinkou/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="ZEK芝士鳕鱼肠" href="#" target="_blank">
											<img class="lazy" data-original="" src="img/jinkou/031.jpg" alt="ZEK芝士鳕鱼肠" style="display: block;"></a>
									</div>
									<div class="p-bg"></div>
									<div class="p-info">
										<a class="name" href="#" target="_blank" title="ZEK芝士鳕鱼肠">
											ZEK芝士鳕鱼肠
										</a>
										<span class="price">
																	<small>￥</small>13.<small>90</small>
																</span>
									</div>

									<li>
										<div class="p-img">
											<a title="张君雅小妹妹日式休闲丸子80g" href="#" target="_blank">
												<img class="lazy" data-original="" src="img/jinkou/032.jpg" alt="张君雅小妹妹日式休闲丸子80g" style="display: block;"></a>
										</div>
										<div class="p-bg"></div>
										<div class="p-info">
											<a class="name" href="#" target="_blank" title="张君雅小妹妹日式休闲丸子80g">
												张君雅小妹妹日式休闲丸子80g
											</a>
											<span class="price">
																	<small>￥</small>9.<small>30</small>
																</span>
										</div>
									</li>
									<li>
										<div class="p-img">
											<a title="海牌海苔鱿鱼味20g" href="#" target="_blank">
												<img class="lazy" data-original="" src="img/jinkou/033.jpg" alt="海牌海苔鱿鱼味20g" style="display: block;"></a>
										</div>
										<div class="p-bg"></div>
										<div class="p-info">
											<a class="name" href="#" target="_blank" title="海牌海苔鱿鱼味20g">
												海牌海苔鱿鱼味20g
											</a>
											<span class="price">
																	<small>￥</small>12.<small>90</small>
																</span>
										</div>
									</li>
									<li>
										<div class="p-img">
											<a title="ZEK芝士鳕鱼肠" href="#" target="_blank">
												<img class="lazy" data-original="" src="img/jinkou/031.jpg" alt="ZEK芝士鳕鱼肠" style="display: block;"></a>
										</div>
										<div class="p-bg"></div>
										<div class="p-info">
											<a class="name" href="#" target="_blank" title="ZEK芝士鳕鱼肠">
												ZEK芝士鳕鱼肠
											</a>
											<span class="price">
																	<small>￥</small>13.<small>90</small>
																</span>
										</div>

										<li>
											<div class="p-img">
												<a title="张君雅小妹妹日式休闲丸子80g" href="#" target="_blank">
													<img class="lazy" data-original="" src="img/jinkou/032.jpg" alt="张君雅小妹妹日式休闲丸子80g" style="display: block;"></a>
											</div>
											<div class="p-bg"></div>
											<div class="p-info">
												<a class="name" href="#" target="_blank" title="张君雅小妹妹日式休闲丸子80g">
													张君雅小妹妹日式休闲丸子80g
												</a>
												<span class="price">
																	<small>￥</small>9.<small>30</small>
																</span>
											</div>
										</li>
										<li>
											<div class="p-img">
												<a title="海牌海苔鱿鱼味20g" href="#" target="_blank">
													<img class="lazy" data-original="" src="img/jinkou/033.jpg" alt="海牌海苔鱿鱼味20g" style="display: block;"></a>
											</div>
											<div class="p-bg"></div>
											<div class="p-info">
												<a class="name" href="#" target="_blank" title="海牌海苔鱿鱼味20g">
													海牌海苔鱿鱼味20g
												</a>
												<span class="price">
																	<small>￥</small>12.<small>90</small>
																</span>
											</div>
										</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<!-- 左侧楼层菜单 -->
			<div class="floor-nav">
				<span class="fn-tit">商品分类</span>
				<ul class="fn-list">
					<li class="jk">
						<a rel="5241292981705641" href="javascript:;"><i class="icon-fire font-color"></i><span>坚果炒货</span></a>
					</li>
					<li class="jk">
						<a rel="5241308875959967" href="javascript:;"><i class="icon-food font-color"></i><span>肉脯鱼干</span></a>
					</li>
					<li class="jk">
						<a rel="5241329588544783" href="javascript:;"><i class="icon-lab font-color"></i><span>果干果脯</span></a>
					</li>
					<li class="jk">
						<a rel="5241370405689776" href="javascript:;"><i class="icon-data font-color"></i><span>素食山珍</span></a>
					</li>
					<li class="jk">
						<a rel="5241349037559137" href="javascript:;"><i class="icon-search font-color"></i><span>糕点糖果</span></a>
					</li>
					<li class="jk">
						<a rel="5241265443009357" href="javascript:;"><i class="icon-paperplane font-color"></i><span>进口食品</span></a>
					</li>
				</ul>
			</div>

			<div id="Bing">
			</div>
			<div class="mask-layer" id="ceng" style="display:none"></div>

			<!-- 右侧功能菜单 -->
			<!-- 右侧功能菜单 -->
			<div class="right-navbar">
				<ul class="rnb-list">
					<li class="kf">
						<a class="hvr" id="ntkf_chat_entrance" onclick="initCustomer()" href="javascript:;"><span>客服咨询</span><i class="icon">▪</i></a>
					</li>
					<li class="gw indexcart">
						<a href="#"><i class="icon">▪</i><span>购物车</span><small class="sum" id="cartcount">0</small></a>
					</li>
					<li class="hy">
						<a class="hvr"  href="user.html"><span>会员中心</span><i class="icon">▪</i></a>
					</li>
					<li class="yh">
						<a class="hvr"  href="#"><span>我的优惠券</span><i class="icon">▪</i></a>
					</li>
					<li class="sc">
						<a class="hvr"  href="#"><span>我的关注</span><i class="icon">▪</i></a>
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

				}
			</script>
			
			<!-- footer include -->
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
			
			<!--  我的零嘴-->
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

			<script src="//configch2.veinteractive.com/tags/B105FE22/510E/4163/911D/0A070929DD44/tag.js" type="text/javascript" async></script>
			<script type="text/javascript" src="http://www.lppz.com/resources/shop/js/lp_public.js"></script>
			<!-- 公用JS -->
			<script src="http://www.lppz.com/resources/shop/js/base.js"></script>
			<script type="text/javascript" src="http://www.lppz.com/resources/shop/js/o_code.js"></script>

			<!––到达&重定向––>
			<script type="text/javascript">
				var _gtc = _gtc || [];
				_gtc.push(["fnSetAccount", "1009"]);
				_gtc.push(["v", "1"]);
				_gtc.push(["fnGeneral", "arrived"]); //到达
				var nGtc = document.createElement("script");
				nGtc.type = "text/javascript";
				nGtc.async = true;
				nGtc.src = ("https:" == document.location.protocol ? "https://sslcdn.istreamsche.com" : "http://ga.istreamsche.com") + "/stat/gtc.js";
				document.getElementsByTagName("head")[0].appendChild(nGtc);
			</script>

			<script type="text/javascript">
				$(function() {
					//判断是否弹窗
					$.ajax({
						type: "get",
						cache: false,
						url: "http://www.lppz.com/sso/qryOpenBinTip.jhtml",
						success: function(data) {
							var v = eval("(" + data + ")");
							if(v.flag == '1') {
								//查询可绑定的第三方账号
								$.ajax({
									type: "get",
									cache: false,
									url: "http://www.lppz.com/sso/qryThirdAccountBind.jhtml",
									success: function(data) {
										var v = eval("(" + data + ")");
										if(v.flag == 's') {
											document.getElementById("ceng").style.display = ""; //显示  
											document.getElementById("Bing").innerHTML = v.con;
											var $pupModal = $(".popup-modal");
											var $pupModalHeight = $pupModal.height();
											var $pupModalWidth = $pupModal.width();
											var closePupModal = function() {
												$pupModal.hide();
												$(".mask-layer").remove();
											};
											$pupModal.css({
												"margin-top": -$pupModalHeight / 2,
												"margin-left": -$pupModalWidth / 2
											});
											$pupModal.find(".pm-title").on("click", "a", function() {
												closePupModal();
											});
											$pupModal.find(".pm-btn").on("click", ".cancel", function() {
												closePupModal();
											});
										}
									}
								});
							}
						}
					});
				});
			</script>


</body>
</html>