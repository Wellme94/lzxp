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
				
				
				/* 我的订单$$$$$$$$$去付款点击事件 */
				$(document).on("click",".goPay",function(){
					//获取订单编号
					var $orderId = $(this).parents("tr").find("input").val();
					//页面跳转
					location.href="http://localhost:8080/lzxp/GoodsOrderServlet?op=myOrder&orderId="+$orderId;
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
								  $("#tableContent").append("<tr><td>"+order.ORDERDATE+"<input type='hidden' value='"+order.ORDERID+"'/></td>"+
											"<td>"+order.ORDERCONTENT+"</td>"+
											"<td>"+order.ORDERBALANCE+"</td>"+
											"<td>"+order.USERNAME+"</td>"+
											"<td>"+order.USERSTATE+"</td>"+
											"<td><button class='btn btn-default btn-danger' class='goPay'>去付款</button></td></tr>");
							}else{
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
				}/* function showContent(pd) */
				
				 $(".sch-btn").click(function(){
					   alert("模糊查询"); 		   
					   var keyword = $(".sch-key").val();  
					 if(keyword!="商品搜索"||keyword=""){
						 alert("请输入关键字！");			
					  }else{
						  location.href = "GetAllGoodsServlet?op=qureyAll&keyword="+keyword;
					  }
				  });
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
						<a class="reg" href="register.jsp">[注册]</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="header">
			<div class="head-main wrap clearfix">
				<div class="logo">
					<a href="index.jsp">零嘴小铺</a><span>官方商城</span></div>

				<div class="hd-user">
					<div class="user-search">
						
							<input class="sch-key" type="text" name="keyword" id="keyword" value="" onfocus="if (value =='商品搜索'){value =''}" onblur="if (value ==''){value='商品搜索'}">
							<input class="sch-btn" type="submit" value="">
					   
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
																<span class="mask"><a class="edit member-image" href="#">编辑头像</a></span>
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
																	<button class="save" onclick="" id="save">保存</button>

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
											<a class="current" href="#" id="noPay">待付款</a>
											<a class="no-pay" href="#" id="noReceive">待收货</a>
											<a class="no-pay" href="#" id="hasReceive">已完成</a>
											
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
<div class="col-md-4"></div>
<div class="col-md-4">
			<ul class="pagination">
				<li><a href="#" id="prevPage">Prev</a></li>
					<!-- 由jQuery进行处理 -->
					
					<%-- <%-- <c:forEach begin="1" end="${pageData.totalPage}" var="index">
			       <c:if test="${pageData.page ==index}"> --%>
			         <%--   <li class="active"> <a href="#" class="pageNo">1</a></li>
			       </c:if>
			       <c:if test="${pageData.page !=index}">
				       <li> <a href="#" class="pageNo">2</a></li>
				  </c:if>
				</c:forEach> --%>
					
				<!-- <li><a href="#">Next</a></li> -->
			</ul>
		</div>
	<div class="col-md-4"></div>	
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
			
			<input id="fileupload" type="file" style="display:none;" name="file" data-url="http://home.lppz.com/member/editMemberImage.jhtml" multiple>
		
			<!-- lay外置插件 -->
			<script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
			<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
			<link rel="stylesheet" href="layui/layer.css">
			<script src="layui/layer.js" type="text/javascript"></script>
			
			<!-- lay外置插件 -->
			<script type="text/javascript">
			$(function () {
				/* 初始化性别 */
				if(${requestScope.userInfo.USERSEX.equals("男")}){
					$("#nan").prop("checked",true);
				}
				
				if(${requestScope.userInfo.USERSEX.equals("女")}){
					$("#nv").prop("checked",true);
				} 
				
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
							  layer.msg('保存成功',{
								  time: 3000
								  
							  });
								
						}else{
							console.log("2");
							 layer.msg('保存成功',{
								  time: 3000
								  
							  });
						}
					});
					
				});
				
				
			});
		
			
		</script>
		</body>
</html>