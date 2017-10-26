
<%@page import="com.etc.lzxp.entity.V_AllGoods"%>
<%@page import="java.util.List"%>
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
		  //页面加载时调用函数   
		  $(function(){	
			 //如果flag不为1就加载页面
			  if(<%=session.getAttribute("flag")%>==null){
				  location.href="GetGoodsServlet?op=queryAllGoods";
			  }		  
		  });
		  //调用函数onload()
		
			
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
			
			  //点击查询按钮 进行商品名查询
			   $(function(){				   
				  $("#sch-btn").click(function(){
					  //获取关键字 
					  var keyword = $("#keyword").val();
					  /* alert("keyword:"+keyword); */
					  if(keyword=="输入关键字"||keyword==""){
						alert("请输入关键字！");  
					  }else{
						  location.href="stype.jsp?keyword="+keyword;	
					  }
				  });
				   
			   });					
			 //点击商品图片  获取商品Id进行对应商品的搜索
			  $(function(){
				  $(".name").click(function(){				  
					var goodId = $(this).prev().val(); 					 
					 location.href = "GetAllGoodsServlet?op=queryGoodsById&goodsId="+goodId;
				  });
				  
			  })
			  //点击大类  进行大类所有商品的搜索
			  $(function(){
				  $(".ltype").click(function(){
					var ltypeName = $(this).children('.ltypeName').val();
					location.href = "stype.jsp?keyword="+ltypeName;
					  
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
			 //点击更多商品 进行对应搜索
			 $(function(){
				$(".more").click(function(){
					//找到被激活的li对应的a标签内容
					var keyword = $(this).parent('.sct-hot').prev('.sct-tabs').find("li[class='active'] a").text();				
					/* alert(keyword); */
					location.href = "stype.jsp?keyword="+keyword;
								
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
								<li>欢迎<span class="log username"><%=user.getUSERNAME() %></span>来到零嘴小铺官方商城！</li>
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
						<a class="red hot_sh" href="javascript:void(0)">饼干</a>
						<a class = "hot_sh"  href="javascript:void(0)">牛肉</a>
						<a class = "hot_sh"  href="javascript:void(0)">豆干</a>
						<a class = "hot_sh"  href="javascript:void(0)">进口</a>
						<a class = "hot_sh"  href="javascript:void(0)">话梅</a>
						<a class = "hot_sh"  href="javascript:void(0)">瓜子</a>
					</div>
					<!--搜索框-->
					<div class="search-area">			
							<input class="sch-key" type="text"  id="keyword" value="" placeholder="商品搜索" >
							<input class="sch-btn" type="button" id = "sch-btn" value="搜 索">
						
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
									<h3><a href="javascript:void(0)" class = "ltype"  target="_blank"><input type="hidden" value="坚果炒货" class="ltypeName"/>
						<span class="icon-fire font-color"></span>&nbsp;坚果炒货</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="stype.jsp?keyword=嗑壳坚果">嗑壳坚果</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=果果仁仁">果果仁仁</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=特惠炒货">特惠炒货</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="javascript:void(0)" class = "ltype"  target="_blank"><input type="hidden" value="肉脯鱼干" class="ltypeName"/>
						<span class="icon-lab font-color"></span>&nbsp;肉脯鱼干</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="stype.jsp?keyword=猪肉系列">猪肉系列</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=牛肉系列">牛肉系列</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=鸡鸭系列">鸡鸭系列</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=海味系列">海味系列</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="javascript:void(0)" class = "ltype"  target="_blank"><input type="hidden" value="果干果脯" class="ltypeName"/>
						<span class="icon-food font-color"></span>&nbsp;果干果脯</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="stype.jsp?keyword=缤纷果干">缤纷果干</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=话梅山楂">话梅山楂</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=红枣葡萄">红枣葡萄</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="javascript:void(0)" class = "ltype"  target="_blank"><input type="hidden" value="糕点糖果" class="ltypeName"/>
						<span class="icon-search font-color"></span>&nbsp;糕点糖果</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="stype.jsp?keyword=糕点系列">糕点系列</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=饼干系列">饼干系列</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=糖果系列">糖果系列</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=果冻系列">果冻系列</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="javascript:void(0)" class = "ltype"  target="_blank"><input type="hidden" value="素食山珍" class="ltypeName"/>
						<span class="icon-data font-color"></span>&nbsp;素食山珍</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="stype.jsp?keyword=美味豆干">美味豆干</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=笋菌海带">笋菌海带</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=其他山珍">其他山珍</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="javascript:void(0)" class = "ltype"  target="_blank"><input type="hidden" value="花茶饮品" class="ltypeName"/>
						<span class="icon-cup font-color"></span>&nbsp;花茶饮品</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="stype.jsp?keyword=养生冲调">养生冲调</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=进口饮料">进口饮料</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="javascript:void(0)" class = "ltype"  target="_blank"><input type="hidden" value="进口食品" class="ltypeName"/>
						<span class="icon-paperplane font-color"></span>&nbsp;进口食品</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="stype.jsp?keyword=进口糕点">进口糕点</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=进口糖果">进口糖果</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=休闲零食">休闲零食</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="top-sort">
									<h3><a href="javascript:void(0)" class = "ltype"  target="_blank"><input type="hidden" value="精选礼盒" class="ltypeName"/>
						<span class="icon-shop font-color"></span>&nbsp;精选礼盒</a></h3></div>
								<div class="sub-sort">
									<ul class="sub-sort-list">
										<li>
											<a target="_blank" href="stype.jsp?keyword=零食礼盒">零食礼盒</a>
										</li>
										<li>
											<a target="_blank" href="stype.jsp?keyword=年货量贩装">年货量贩装</a>
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
							<a title="零嘴抢购" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/lunbo/lunbo-1.jpg" alt="零嘴抢购" /></a>
						</li>
						<li style="background-color:#e9e7ea">
							<a title="零嘴大礼包" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/lunbo/lunbo-2.jpg" alt="零嘴大礼包" /></a>
						</li>
						<li style="background-color:#faf0e6">
							<a title="零嘴上新尝鲜" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/lunbo/lunbo-3.jpg" alt="零嘴上新尝鲜" /></a>
						</li>
					</ul>
				</div>
				<!-- 热门抢购 -->
				<div class="rush-hot">
					<div class="rush-hot-cont rush-slide">
						<ul class="rhc-list rslide">
							<li>
								<a title="特惠上" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/lunbo-right1.jpg" alt=特惠上 " /></a>
				</li>
				</ul>
				</div><div class="rush-hot-cont rush-slide ">
				<ul class="rhc-list rslide ">
				<li>
					<a title="特惠下 " href="javascript:void(0)" target="_blank "><img class="lazy " data-original=" " src="img/lunbo-right2.jpg " alt=特惠下" /></a>
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
							<a title="主推" href="javascript:void(0)"><img class="lazy" data-original="" src="img/idx-activity/1.jpg" alt="主推"></a>
						</div>
					</li>
					<li> 
						<h3>先领券再购物</h3>
						<div class="act-list-cont">
							<a title="主推" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="img/idx-activity/2.jpg" alt="主推"></a>
						</div>
					</li>
					<li>
						<h3>先领券再购物</h3>
						<div class="act-list-cont">
							<a title="主推" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/3.jpg" alt="主推"></a>
						</div>
					</li>
					<li>
						<h3>满送专区</h3>
						<div class="act-list-cont">
							<a title="主推" href="javascript:void(0)"><img class="lazy" data-original="" src="img/idx-activity/4.jpg" alt="主推"></a>
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
							<a href="javascript:void(0);">大促特惠</a>
						</li>
						<li>
							<a href="javascript:void(0);">6月TOP榜</a>
						</li>
						<li>
							<a href="javascript:void(0)">新品尝鲜</a>
						</li>
					</ul>
				</div>
				<div class="star-area">
					<ul class="star-area-list">
						<li>
							<a title="专区" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-1.jpg" alt="专区"></a>
						</li>
						<li>
							<a title="专区" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-2.jpg" alt="专区"></a>
						</li>
						<li>
							<a title="专区" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-3.jpg" alt="专区"></a>
						</li>
						<li>
							<a title="专区" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-4.jpg" alt="专区"></a>
						</li>
						<li>
							<a title="专区" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-5.jpg" alt="专区"></a>
						</li>
					</ul>
					<ul class="star-area-list">
						<li>
							<a title="TOP" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-6.jpg" alt="TOP"></a>
						</li>
						<li>
							<a title="TOP" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-7.jpg" alt="TOP"></a>
						</li>
						<li>
							<a title="TOP" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-8.jpg" alt="TOP"></a>
						</li>
						<li>
							<a title="TOP" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-9.jpg" alt="TOP"></a>
						</li>
						<li>
							<a title="TOP" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-10.jpg" alt="TOP"></a>
						</li>
					</ul>
					<ul class="star-area-list">
						<li>
							<a title="新品" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-1.jpg" alt="新品"></a>
						</li>
						<li>
							<a title="新品" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-2.jpg" alt="新品"></a>
						</li>
						<li>
							<a title="新品" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-3.jpg" alt="新品"></a>
						</li>
						<li>
							<a title="新品" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-4.jpg" alt="新品"></a>
						</li>
						<li>
							<a title="新品" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/idx-activity/jx-5.jpg" alt="新品"></a>
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
								<a title="首页类目楼层-坚果炒货" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/jianguo/00.jpg" alt="首页类目楼层-坚果炒货" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
							<li>
								<a  href="javascript:void(0)">嗑壳坚果</a>
							</li>
							<li>
								<a  href="javascript:void(0)">果果仁仁</a>
							</li>
							<li>
								<a  href="javascript:void(0)">特惠炒货</a>
							</li>
						</ul>
						<div class="sct-hot">
							<a href="javascript:void(0)" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
							<a title="嗑壳坚果" target="_blank" href="javascript:void(0)">
						        <img class="lazy" data-original="" src="img/jianguo/01.jpg" alt="">
							</a>									
							</div><!--node-first  -->
							
							  <ul class="node-list">
							   <!-- 这里动态显示图片 -->
							   <% int step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==1){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>							  
						</ul><!-- class="node-list" -->
						
						</div><!-- sin-node -->
						<div class="sin-node">
							<div class="node-first">
								<a title="果果仁仁" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/jianguo/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								   <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==2){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>		
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="特惠炒货" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/jianguo/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								    <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==3){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>
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
								<a title="首页类目楼层-肉脯鱼干" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/rougan/00.jpg" alt="首页类目楼层-肉脯鱼干" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
							<li>
								<a href="javascript:void(0)">猪肉系列</a>
							</li>
							<li>
								<a href="javascript:void(0)">牛肉系列</a>
							</li>
							<li>
								<a href="javascript:void(0)">鸡鸭系列</a>
							</li>
						</ul>
						<div class="sct-hot">
							<a href="javascript:void(0)" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="猪肉系列" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/rougan/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								     <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==4){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>						

							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="牛肉系列" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/rougan/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								     <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==5){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>						
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="鸡鸭系列" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/rougan/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
							     <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==6){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>									
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
								<a title="首页类目楼层-果干果脯" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/guogan/00.jpg" alt="首页类目楼层-果干果脯" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
							<li>
								<a href="javascript:void(0)">缤纷果干</a>
							</li>
							<li>
								<a href="javascript:void(0)">话梅山楂</a>
							</li>
							<li>
								<a href="javascript:void(0)">红枣葡萄</a>
							</li>
						</ul>
						<div class="sct-hot">
							<a href="javascript:void(0)" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="缤纷果干" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/guogan/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list ">
								    <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==8){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>								
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="话梅山楂" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/guogan/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
							    <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==9){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>						
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="红枣葡萄" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/guogan/03.jpg" alt="">
								</a>
							</div>
						<ul class="node-list">
						     <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==10){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>
								
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
								<a title="首页类目楼层-山珍素食" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/sushi/00.jpg" alt="首页类目楼层-山珍素食" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
							<li>
								<a href="javascript:void(0)">美味豆干</a>
							</li>
							<li>
								<a href="javascript:void(0)">笋菌海带</a>
							</li>
							<li>
								<a href="javascript:void(0)">其他山珍</a>
							</li>
						</ul>
						<div class="sct-hot">
							<a href="javascript:void(0)" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="美味豆干" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/sushi/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list txtx">
								    <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==15){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="笋菌海带" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/sushi/02.jpg" alt="">
								</a>
							</div>
										
							<ul class="node-list">
								    <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==16){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>4){
										   break;
									   }
								   }
							   } 							   
						  %>
								<li>
									<div class="p-img">
										<a title="泡椒味海带结 218g" href="javascript:void(0)" target="_blank">
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

								
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="其他山珍" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/sushi/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								  <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==17){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>
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
								<a title="首页类目楼层-糖果糕点" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/candy/00.jpg" alt="首页类目楼层-糖果糕点" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
							<li>
								<a href="javascript:void(0)">糕点系列</a>
							</li>
							<li>
								<a href="javascript:void(0)">饼干系列</a>
							</li>
							<li>
								<a href="javascript:void(0)">糖果系列</a>
							</li>
						</ul>
						<div class="sct-hot">
							<a href="javascript:void(0)" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="糕点系列" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/candy/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								 <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==11){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>					
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="饼干系列" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/candy/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								  <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==12){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>
							
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="糖果系列" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/candy/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								  <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==13){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>		
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
								<a title="首页类目楼层-进口食品" href="javascript:void(0)" target="_blank"><img class="lazy" data-original="" src="img/jinkou/00.jpg" alt="首页类目楼层-进口食品" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="storey-cont">
					<div class="sc-title jk">
						<ul class="sct-tabs">
							<li>
								<a href="javascript:void(0)">进口糕点</a>
							</li>
							<li>
								<a href="javascript:void(0)">进口糖果</a>
							</li>
							<li>
								<a href="javascript:void(0)">休闲零食</a>
							</li>
						</ul>
						<div class="sct-hot">
							<a href="javascript:void(0)" target="_blank" class="more">更多商品&gt;</a>
						</div>
					</div>
					<div class="sc-info">
						<div class="sin-node">
							<div class="node-first">
								<a title="进口糕点" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/jinkou/01.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								  <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==20){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>
								
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
								<a title="进口糖果" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/jinkou/02.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								 <% step=0;
							   	for(V_AllGoods goods:(List<V_AllGoods>)request.getAttribute("list")){
								   if(goods.getSTYPEID()==21){
									   %>
									   		<li>
												<div class="p-img">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a title="<%=goods.getGOODSNAME()%>" href="javascript:void(0)" target="_blank" class = "name">
													<img class="lazy"  src=" <%=goods.getPICTUREADDRESS()%>" alt="<%=goods.getGOODSNAME()%>" style="display: block;"></a>
												</div>
												<div class="p-bg"></div>
												<div class="p-info">
													<input type="hidden" value ="<%=goods.getGOODSID()%>" id="goodsId"/>
													<a class="name" href="javascript:void(0)" target="_blank" title="<%=goods.getGOODSNAME()%>" >
													<%=goods.getGOODSNAME()%>
													</a>
													<span class="price">
														<small>￥</small><%=goods.getGOODSPRICE()%><small></small>
													</span>
												</div>
											</li> 	
									   <%
									   step++;
									   if(step>5){
										   break;
									   }
								   }
							   } 							   
						  %>
								
							</ul>
						</div>
						<div class="sin-node">
							<div class="node-first">
							<a title="休闲零食" target="_blank" href="javascript:void(0)">
									<img class="lazy" data-original="" src="img/jinkou/03.jpg" alt="">
								</a>
							</div>
							<ul class="node-list">
								<li>
									<div class="p-img">
										<a title="ZEK芝士鳕鱼肠" href="javascript:void(0)" target="_blank">
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
											<a title="张君雅小妹妹日式休闲丸子80g" href="#" target="_blank" >
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
											<a title="海牌海苔鱿鱼味20g" href="javascript:void(0)" target="_blank" >
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
											<a title="ZEK芝士鳕鱼肠" href="javascript:void(0)" target="_blank">
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
												<a title="张君雅小妹妹日式休闲丸子80g" href="#" target="_blank" >
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
												<a title="海牌海苔鱿鱼味20g" href="#" target="_blank" >
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
									<a target="_blank" href="javascript:void(0)">安全账户</a>
									<a target="_blank" href="javascript:void(0)">购物流程</a>
									<a target="_blank" href="javascript:void(0)">生日礼购物流程</a>
									
								</dd>

							</dl>
							<dl>
								<dt><strong>物流配送</strong></dt>
								<dd>
									<a target="_blank" href="javascript:void(0)">配送说明</a>
									<a target="_blank" href="javascript:void(0)">签收与验货</a>
								</dd>

							</dl>
							<dl>
								<dt><strong>付款说明</strong></dt>
								<dd>
									<a target="_blank" href="javascript:void(0)">发票制度</a>
									<a target="_blank" href="javascript:void(0)">公司转账</a>
									<a target="_blank" href="javascript:void(0)">在线支付</a>
								</dd>

							</dl>
							<dl>
								<dt><strong>客户服务</strong></dt>
								<dd>
									<a target="_blank" href="javascript:void(0)">退换货服务</a>
									<a target="_blank" href="javascript:void(0)">联系我们</a>
									<a target="_blank" href="javascript:void(0)">退款说明</a>
								</dd>

							</dl>
							<dl>
								<dt><strong>会员专区</strong></dt>
								<dd>
									<a target="_blank" href="javascript:void(0)">优惠券使用规则</a>
									<a target="_blank" href="javascript:void(0)">积分制度</a>
									<a target="_blank" href="javascript:void(0)">会员须知</a>
								</dd>

							</dl>
						</div>
					</div>

					<div class="foot-nav">
						<ul>
							<li>
								<a href="javascript:void(0)" target="_blank">关于我们</a>
								|
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">联系我们</a>
								|
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">客户服务</a>
								|
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">诚聘英才</a>
								|
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">商务合作</a>
								|
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">媒体报道</a>
								|
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">网站地图</a>
								|
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">站长招募</a>

							</li>
						</ul>
					</div>
					<div class="foot-copyright">
						Copyright@2007-2017 零嘴小铺电子商务有限公司 All rights Reserved<br/>
						<a target="_blank" href="javascript:void(0)">闽ICP备15022981号</a>
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

		<script type="text/javascript">
		//页面加载时初始化购物车中的信息
			$(".goods").empty();
			$(".total").empty();
			$("#goodsnum").text("");
			var sumgoods = 0;
			var sumprice = 0;
			var username = $('.username').text();
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
			//购物车中删除
			$(document).on("click",'.delete',function(index){
				var sumgoods = 0;
				var sumprice = 0;
				var username = $('.username').text();
				var goodsiddel=$(this).parent().parent().find("#GOODSID").val();
				var flag=confirm("是否要删除");
				if(flag){
					$(".goods").empty();
					$(".total").empty();
					$("#goodsnum").text("");
					$.post("${path}GoodsCartServlet",{"op":"queryGoodsDelete","UserName":username,"GoodsID":goodsiddel},function(listgc,status){			
					$.each(listgc,function(index,data){
					/* 购物车的的item- */							
					$(".goods").append("<li><input type='hidden' id='GOODSID' class='goodsiddel' value='"+data.GOODSID+"' /><div class='gd-lft'><a class='pic'><img src='"+data.GOODSPICTURE+"'/></a><p class='tit'>"+data.GOODSNAME+"</p></div><div class='gd-price'><span>￥"
					+data.GOODSPRICE+"<small>x"+data.GOODSCOUNT+"</small></span><a href='javascript:;' class='delete'"+data.GOODSID+"'>删除</a></div></li>");
					sumgoods += data.GOODSCOUNT;
					sumprice += (sumgoods*data.GOODSPRICE);
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

</body>
</html>