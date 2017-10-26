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
		<script type="text/javascript">
			$(function () {
				
				
				/* 初始化性别 */
				if(${requestScope.userInfo.USERSEX.equals("男")}){
					$("#nan").prop("checked",true);
				}
				
				if(${requestScope.userInfo.USERSEX.equals("女")}){
					$("#nv").prop("checked",true);
				} 
				
				
				/* 结算点击事件 */
				$("#countOrder").click(function () {
					location.href="http://localhost:8080/lzxp/UsersServlet?op=countOrder";
					
				});
				
				
				/* 显示订单表格点击事件 */
				$("#myOrder").click(function () {
					//ajax
					$.post("GoodsOrderServlet",{"op":"showAll","userName":$("#userName").val(),"userState":"all"},function(pd,status){
						showContent(pd);
					});				
				});
				
				
				/* 绑定分页点击事件 */
				$(document).on("click",".pageNo",function(){
					//获取该页数
					var $page = $(this).text();
					//ajax事件
					$.post("GoodsOrderServlet",{"op":"showAll","userName":$("#userName").val(),"page":$page},function(pd,status){
						showContent(pd);
					});			
				});
				
				
				/* 上一页点击事件 */
				$(document).on("click","#prevPage",function(){
					//获取当前页数
					var $nowPage = 0;
					var $li = $(".pagination").find("li");
					 for(var i = 0;i<$li.size();i++){ 
						 if($li.eq(i).attr("class") =="active"){
							//如果页面被触发,获取该页面的页数
							$nowPage = $li.eq(i).text();
							break;
						} 
					}
					//ajax事件
					$.post("GoodsOrderServlet",{"op":"showAll","userName":$("#userName").val(),"prevPage":$nowPage},function(pd,status){
						showContent(pd);
					});
				});
				
				
				/* 下一页点击事件 */
				$(document).on("click","#nextPage",function(){
					//获取当前页数
					var $nowPage = 0;
					var $li = $(".pagination").find("li");
					 for(var i = 0;i<$li.size();i++){ 
						 if($li.eq(i).attr("class") =="active"){
							//如果页面被触发,获取该页面的页数
							$nowPage = $li.eq(i).text();
							break;
						} 
					}
					//ajax事件
					$.post("GoodsOrderServlet",{"op":"showAll","userName":$("#userName").val(),"nextPage":$nowPage},function(pd,status){
						showContent(pd);
					});
				});
				
				
				/* 我的订单 $$$$$$$未付款点击事件 */
				$("#noPay").click(function(){
					//ajax事件
					$.post("GoodsOrderServlet",{"op":"showAll","userName":$("#userName").val(),"userState":"noPay"},function(pd,status){
						showContent(pd);
					});
				});
				
				
				/* 我的订单 $$$$$待收货点击事件 */
				$("#noReceive").click(function () {
					//ajax事件
					$.post("GoodsOrderServlet",{"op":"showAll","userName":$("#userName").val(),"userState":"noReceive"},function(pd,status){
						showContent(pd);
					});
				});
				
				
				/* 我的订单 $$$$$$已完成点击事件 */
				$("#hasReceive").click(function () {
					//ajax事件
					$.post("GoodsOrderServlet",{"op":"showAll","userName":$("#userName").val(),"userState":"hasReceive"},function(pd,status){
						showContent(pd);
					});
				});
				
					/* 页面内容和分页的显示 */
				function showContent(pd){
					//获取订单信息
					if (pd != null) {
						//如果有订单信息
						//清空订单表控件，分页
						$("#tableContent").find("tr").remove();
						$(".pagination").find("li").remove()
						//显示信息
						 $.each(pd.data,function(index,order){
							 if (order.USERSTATE=="待付款") {
								 //待付款
								  $("#tableContent").append("<tr><td>"+order.ORDERDATE+"<input type='hidden' value='"+order.ORDERID+"'/></td>"+
											"<td>"+order.ORDERCONTENT+"</td>"+
											"<td class='orderbalance'>"+order.ORDERBALANCE+"</td>"+
											"<td>"+order.USERNAME+"</td>"+
											"<td>"+order.USERSTATE+"</td>"+
											"<td><a class='btn btn-danger gotoorder'>去付款</a></td></tr>");
							}else if(order.USERSTATE=="待收货"){
								//待收货
								 $("#tableContent").append("<tr><td>"+order.ORDERDATE+"<input type='hidden' value='"+order.ORDERID+"'/></td>"+
											"<td>"+order.ORDERCONTENT+"</td>"+
											"<td>"+order.ORDERBALANCE+"</td>"+
											"<td>"+order.USERNAME+"</td>"+
											"<td>"+order.USERSTATE+"</td>"+
											"<td><a class='btn btn-danger goReceive-btn'>确认收货</a></td></tr>");
							}else {
								 $("#tableContent").append("<tr><td>"+order.ORDERDATE+"<input type='hidden' value='"+order.ORDERID+"'/></td>"+
											"<td>"+order.ORDERCONTENT+"</td>"+
											"<td>"+order.ORDERBALANCE+"</td>"+
											"<td>"+order.USERNAME+"</td>"+
											"<td>"+order.USERSTATE+"</td>"+
											"<td></td></tr>");
							} 
						});
						
						//显示分页
						$(".pagination").append('<li><a href="#" id="prevPage">Prev</a></li>');
						for(var index=1;index<=pd.totalPage;index++){
							if(pd.page==index){
								//如果当前页面与显示页面一样
								$(".pagination").append('<li class="active"><a href="#" class="pageNo">'+index+'</a></li>');
							}else{
								$(".pagination").append('<li><a href="#" class="pageNo">'+index+'</a></li>');
							}	
						}
						$(".pagination").append('<li><a href="#" id="nextPage">Next</a></li>'); 
					}		
				}
					
				
			});
		</script>
		 <script type="text/javascript">
		 
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
		 
		 </script>
			
		<script type="text/javascript">
		//去付款的点击
		$(document).on("click",'.gotoorder',function(index){
			var orderbalance = $(this).parent().parent().find(".orderbalance").text();
			var username = $('.username').text();
			var orderid = $(this).parent().parent().find("input").val();
				location.href="OrderServlet?op=gotoOrder&UserName="+username+"&Orderid="+orderid+"&Orderbalance="+orderbalance;
		});
		</script>
				
	</head>
</head>
<body>

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
					<a >零嘴小铺</a><span>官方商城</span></div>

				<div class="hd-user">
					<div class="user-search">
						<!--<form id="productSearchForm" action="#" method="get" target="_blank">-->
							<input class="sch-key" type="text" name="keyword" id="keyword" value="商品搜索" onfocus="if (value =='商品搜索'){value =''}" onblur="if (value ==''){value='商品搜索'}">
							<input class="sch-btn" type="button" value="" id="sch-btn">
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
								<a class="settle" href="cartlist.html" id="countOrder">去购物车结算</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		

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
									<a href="#panel-2" data-toggle="tab" id="myOrder">我的订单</a>
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
											<div class="uc-recently">
												<div class="uc-recently-top">
													<h3>基本信息</h3></div>
												<div class="uc-recently-box">
													<div class="usre-data-top clearfix">
														<div class="uc-info">
															<div class="ui-avatar">
																<img id="avatarImg" src="img/avatar.png" alt="用户头像" />
																<span class="layer"></span>
																<span class="mask"><a class="edit member-image">编辑头像</a></span>
															</div>
															<div class="ui-mate">
															</div>
														</div>
													</div>
													<div class="user-data-cont">
							
														<ul class="data-form-list">
															<li>
																<input  type="hidden" name="infoId" id="infoId" value="${requestScope.userInfo.INFOID }" />
																<div class="lab-txt">昵称：</div>
																<div class="lab-for"><input class="tx-ipt" type="text" name="userName" id="userName" value="${sessionScope.user.USERNAME }" readonly="readonly"/></div>
															</li>
															
															<li>
																<div class="lab-txt"><span>*</span>性别：</div>
																<div class="lab-for">
																	<!-- 性别 -->
																	
																		<label><input class="rd-ipt gender" type="radio" name="gender"  value="男" id="nan"/>男</label>
																		<label><input class="rd-ipt gender" type="radio" name="gender"  value="女" id="nv"/>女</label>
																	
																</div>
															</li>

															<li>
																<div class="lab-txt">手机号：</div>
																<div class="lab-for"><input class="tx-ipt" type="text" name="userTel" id="userTel" value="${requestScope.userInfo.USERTEL }" /></div>
															</li>

															<li>

																<div class="data-submit-btn">
																	<button class="save" id="save">保存</button>

																</div>
															</li>
														</ul>
													</div>
												</div>
											</div>
									</div>
								</div>
							</div>
							<div data-tab="My_order" class="tab-pane" id="panel-2">
								<div class="uc-recently">
									<div class="uc-recently-top">
										<h3>我的订单</h3></div>
									<div class="uc-recently-box">
										<div class="recent-type">
											<a class="current"  id="noPay" href="#">待付款</a>
											<a class="no-pay"  id="noReceive" href="#">待收货</a>
											<a class="no-pay"  id="hasReceive" href="#">已完成</a>
											
										</div>
										<form action="#" name="form1" id="form1" mothed="get">
											
	
	<!-- 表单内容 -->									
	<div class="container">
	<div class="row clearfix">		<div class="col-md-9 column">
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>订单时间</th>
						<th>订单内容</th>
						<th>订单金额</th>
						<th>收货人</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="tableContent">
					<tr>
						<td colspan="5">
							<div class="uc-no-result">
								<span>您暂时没有符合条件的订单哦！</span>
							</div>
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<div class="col-md-5 column">
		</div>
	</div>
</div>

	<!--  分页开始 -->
<div class="row">
<div class="col-md-2"></div>
<div class="col-md-8">
			<ul class="pagination">
					<!-- 由jQuery进行处理 -->
					
					
			</ul>
		</div>
	<div class="col-md-2"></div>	
</div>
<!--  分页结束 -->
											
											
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
												<!-- <div class="sl-txt">安全等级：</div> -->
												<div class="sl-state"><!-- <span class="rank">低</span><span class="icon"></span> --><span class="hint">设置支付密码，保障账户安全</span></div>
											</div>
										</div>
										<div class="safe-setting">
											<ul class="clearfix">
												<li>
													<div class="sf-info already"><em><i class="icon"></i>登录密码</em><span>登录密码能够保证您的账户安全，让您购物更放心</span></div>
													<div class="sf-op">
														<a class="text-btn" href="#updatePwd" data-toggle="modal">修改密码</a>
													</div>
												</li>
												<!-- <li>
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
												</li> -->

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
											<a class="current" >所有评价</a>
											<a class="no-pay" >待评价（0）</a>
											<a class="no-pay" >已评价（0）</a>
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
									<a target="_blank" >安全账户</a>
									<a target="_blank" >购物流程</a>
									<a target="_blank" >生日礼购物流程</a>
									
								</dd>

							</dl>
							<dl>
								<dt><strong>物流配送</strong></dt>
								<dd>
									<a target="_blank" >配送说明</a>
									<a target="_blank" >签收与验货</a>
								</dd>

							</dl>
							<dl>
								<dt><strong>付款说明</strong></dt>
								<dd>
									<a target="_blank" >发票制度</a>
									<a target="_blank">公司转账</a>
									<a target="_blank" >在线支付</a>
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
			
		
		<!-- 修改密码模态窗口 -->
		<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			
			<div class="modal fade" id="updatePwd" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				<div class="modal-dialog" >
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel" style="text-align:center">
								修改密码
							</h4>
						</div>
						<div class="modal-body">
							
							<div class="row clearfix">
							<div class="col-md-1 column"></div>
			<div class="col-md-10 column">
				
				<div class="form-group">
					<input type="hidden" name="userName" value="${sessionScope.user.USERNAME }" id="userName"/>
					 <label for="inputPassword3" class="col-sm-3 control-label" name="beforePwd">原密码：</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="beforePwd" />
					</div>
				</div>
				
				<div class="form-group" style="margin-top:50px">
					 <label for="inputPassword3" class="col-sm-3 control-label" name="newPwd">新密码：</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="newPwd" />
					</div>
				</div>
				
				<div class="form-group" style="margin-top:100px">
				<div class=" col-sm-4"></div>
					<div class=" col-sm-4">
						 <button id="changePwd-btn" class="btn btn-danger" style="width:140px" data-dismiss="modal" >提交</button>
					</div>
				<div class=" col-sm-4"></div>
				</div>
			<div class="col-md-1 column"></div>
		</div>
	</div>
							
							
						</div>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
		
		
			<!-- lay外置插件 -->
			
			<link rel="stylesheet" href="layui/layer.css">
			<script src="layui/layer.js" type="text/javascript"></script>
			<!-- lay外置插件 -->
		
			<script type="text/javascript">
			$(function () {
				
				
				
				/* 保存点击事件 */
				$("#save").click(function () {
					
					//获取文本框信息,并传递，ajax
					var $infoId = $("#infoId").val();
					//获取性别
					var $userSex = $("input[name='gender']");
					
					if($userSex.eq(0).prop("checked")){
						$userSex=$("#nan").val();
					}else{
						$userSex=$("#nv").val();
					}
					var $userTel = $("#userTel").val();
					//传递数据，ajax
					$.post("UsersServlet",{"op":"updateUserInfo","infoId":$infoId,"userSex":$userSex,"userTel":$userTel},function(data,status){
						//个人资料选项卡,选中
						$("#panel-1").click();
						if(data == true){
							//保存成功
							console.log("1");
							layer.alert('保存成功', {icon: 1});
								
						}else{
							console.log("2");
							layer.alert('保存失败', {icon: 1});
						}
					});
					
				});
				
				
				/* 修改密码点击事件 */
				$("#changePwd-btn").click(function () {
					//获取文本信息
					var $uesrName = $("#userName").val();
					var $beforePwd= $("#beforePwd").val();
					var $newPwd = $("#newPwd").val();
					//ajax
					$.post("UsersServlet",{"op":"changePwd","beforePwd":$beforePwd,"newPwd":$newPwd,"userName":$uesrName},function(data,status){
						
						layer.alert(data, {icon: 1});
						//清空密码输入框
						$("#beforePwd").val("");
						$("#newPwd").val("");
						if ("操作成功"==data) {
							alert(data);
							//页面跳转,到登录页面
							location.href="login.jsp";
						}
						
					});
					
				});
				
				
				
				/* 待收货点击事件 */
				$(document).on("click",".goReceive-btn",function(){
					//获取该订单id
					var $orderId = $(this).parents("tr").find("input").val();
					//提示确认要收货吗？
					layer.confirm('确认收货？', {icon: 3, title:'提示'}, function(index){
						
						//获取当前页数
						var $nowPage = 0;
						var $li = $(".pagination").find("li");
						 for(var i = 0;i<$li.size();i++){ 
							 if($li.eq(i).attr("class") =="active"){
								//如果页面被触发,获取该页面的页数
								$nowPage = $li.eq(i).text();
								break;
							} 
						}
						 
						//ajax
					  	$.post("GoodsOrderServlet",{"op":"goReceiver","orderId":$orderId},function(data,status){
					  		if (data == false) {
					  			//操作失败
								layer.alert('操作失败', {icon: 1});
								
							}else{
								//操作成功
					  			layer.alert('操作成功', {icon: 1});
					  			/* 显示待收货表格点击事件 */
								$("#noReceive").click();
							}
					  	});
					  
					
					  layer.close(index);
					});  
					
				});
				
				
			});
		</script>
		
		
		
		</body>
</html>