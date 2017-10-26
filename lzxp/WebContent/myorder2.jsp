<%@page import="com.etc.lzxp.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>结算页面</title>
		<link href="css/public.css" type="text/css" rel="stylesheet"/>
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/base.css"/>
		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/checkOut.css" />	
		<link href="css/jsstyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/address.js"></script>
		<!--
        	begin：新增地址省级市区的js连接
        -->
		<link href="css/city.css" rel="external nofollow" rel="external nofollow" rel="stylesheet" type="text/css" />
		<script src="js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="js/jquery_cart.js"></script>         
		<script src="js/distpicker.data.js"></script>
		<script src="js/distpicker.js"></script>
		<!--
        	end：新增地址省级市区的js连接
        -->
        
        <!--
        	作者：offline
        	时间：2017-10-13
        	描述：订单
        -->
<link href="css/style2.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" tyle="text/css" />
<link href="css/Orders.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/jquery.reveal.js" type="text/javascript"></script>
<script src="js/jquery.sumoselect.min.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="js/jquery.jumpto.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<!-- 初始化界面进行加载 -->
<script type="text/javascript">
<!--ajax区域-->
	$(function() {
		
		/*手机号码验证  */
		
		$("#user-phone").blur(function(){
			var $phone = $(this).val();
			var  re = /^1\d{10}$/    //正则表达式
			if (!re.test($phone)) {
				//如果不满足条件
				$("#phone-msg").html("<font color='red' style='display:inline-block;margin-left:5px;'>您输入的手机号格式有误</font>");
			}
			
		});
	
		function showdata(index,data){
			var str ="<li class='user-addresslist defaultAddr'>" 
				+"<div class='address-left'>"
				+ "<div class='user DefaultAddr '>"
				+"<input type='hidden' id='ADDRESSID' value='"+data.ADDRESSID+"'>"
				+ "<span class='buy-address-detail'> <span class='buy-user'>"
				+ data.RECEIVERNAME
				+ "</span> <span class='buy-phone'>"
				+ data.RECEIVERTEL
				+ "</span></span></div>"
				+ "<div class='default-address DefaultAddr'>"
				+ "<span class='buy-line-title buy-line-title-type'>"
				+ "收货地址：</span></br> <span class='buy--address-detail'>"
				+ "<span class='street '>"
				+ data.USERADDRESS
				+ "</span></span></div>"
				+ "</div>"
				+ "<div class='address-right'><a href='address.html'>"
				+ "<span class='am-icon-angle-right am-icon-lg'>"
				+ "</span></a></div><div class='clearfix'></div>"
				+ "<div class='new-addr-btn'>"
				+ "<a href='' class='del'>删除</a>"
				+ "</div></li>";
				
				var str2 ="<li class='user-addresslist'>" 
					+"<div class='address-left'>"
					+ "<div class='user DefaultAddr '>"
					+"<input type='hidden' id='ADDRESSID' value='"+data.ADDRESSID+"'>"
					+ "<span class='buy-address-detail'> <span class='buy-user'>"
					+ data.RECEIVERNAME
					+ "</span> <span class='buy-phone'>"
					+ data.RECEIVERTEL
					+ "</span></span></div>"
					+ "<div class='default-address DefaultAddr'>"
					+ "<span class='buy-line-title buy-line-title-type'>"
					+ "收货地址：</span></br> <span class='buy--address-detail'>"
					+ "<span class='street '>"
					+ data.USERADDRESS
					+ "</span></span></div>"
					+ "</div>"
					+ "<div class='address-right'><a href='address.html'>"
					+ "<span class='am-icon-angle-right am-icon-lg'>"
					+ "</span></a></div><div class='clearfix'></div>"
					+ "<div class='new-addr-btn'>"
					+ "<a href='' class='del'>删除</a>"
					+ "</div></li>";
				if(index==0){
					$(".addressdetail").append(str);
				}else{					
					$(".addressdetail").append(str2);
				}
		}

		
		var username = $('.username').text();
		//收货地址动态生成
		$.post("AddressServlet",{"op":"queryAllAddress","UserName":username},function(listua, status) {
			$.each(listua,function(index,data) {
				showdata(index,data);
			});
			//点击选择收货地址
			 $(".user-addresslist").on("click",function() {
				$(this).addClass("defaultAddr").siblings().removeClass("defaultAddr");				
			}); 
			//删除收货地址
			$(document).on("click",'.del',function(index){
					var AddressId=$(this).parent().parent().find("#ADDRESSID").val();
					var flag=confirm("是否要删除该地址");
					if(flag){
						$.post("AddressServlet",{"op":"querydeleteAddress","UserName":username,"AddressId":AddressId},function(listua, status){
							$.each(listua,function(index,data) {
								showdata(index,data);
							});
						});
					}
				});
			//新增收货地址
			$(document).on("click",'.addaddress',function(index){
				$(".addressdetail").empty();
				var address="";
				var username = $('.username').text();
				var receivername= $("#user-name").val();
				var receivertel=$("#user-phone").val();
				var province1alert=$("#province1").val();
				var city1=$("#city1").val();
				var district1=$("#district1").val();
				var user_intro=$("#user-intro").val();
				address=province1alert+city1+district1+user_intro;
				$.post("AddressServlet",{"op":"queryAddress","UserName":username,"ReceiverName":receivername,"ReceiverTel":receivertel,"UserAddress":address},function(listua, status){
					$.each(listua,function(index,data) {
						showdata(index,data);
					});
				});
				$(document.body).css("overflow","visible");
				$('.theme-login').removeClass("selected");
				$('.item-props-can').removeClass("selected");					
				$('.theme-popover-mask').hide();
				$('.theme-popover').slideUp(200);
				$("#user-name").val("");
				$("#user-phone").val("");
				$("#user-intro").val("");	
				location.reload();
			});
		
		});
		//订单清单
		$.post("GoodsCartServlet",{"op":"queryShopCart","UserName":username},function(listgc,status){
			var goodsprice = 0;
			var sum = 0;
			$.each(listgc,function(index, data) {
				goodsprice=data.GOODSCOUNT*data.GOODSPRICE;
				var str = '<tr><td class="Product_info">'
				+ '<a href="#"><img src="'+data.GOODSPICTURE+'" width="100px" height="100px" /></a>'
				+ '<a href="#" class="product_name">'
				+ data.GOODSNAME
				+ '</a></td>'
				+ '<td class="goodprice">￥'
				+ data.GOODSPRICE.toFixed(2)
				+ '</td>'				
				+ '<td><input type="button" value="-" class="changebutton goodssub"/><input type="text" class="changetext" value="'
				+ data.GOODSCOUNT
				+'" /><input type="button" value="+" class="changebutton goodsadd"/></td>'
				+ '<td class="Moneys">￥'
				+ goodsprice.toFixed(2)
				+ '</td><td class="deletegoods"><input class="deletegoodid" type="hidden" value="'
				+ data.GOODSID
				+'" /><a class="deletes">删除</a></td></tr>';
				$("tbody").append(str);
				sum = sum + goodsprice;
			});
				var str1 = '<ul><li><label>商品总价</label>￥<span class="sumpriceup">'
					+ sum.toFixed(2)
					+ '</span></li>'
					+ '<li class="shiji_price"><label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label>￥<span class="sumpricedown">'
					+ sum.toFixed(2) + '</span></li></ul>';
				$(".right_direction").append(str1);
				
		});
				
	});
		
</script>

<script type="text/javascript">

	
		
		//删除商品
	$(document).on("click",'.deletes',function(index){
		var username = $('.username').text();
		var goodsprice = 0;
		var sum = 0;
		var goodsiddel=$(this).parent().find(".deletegoodid").val();
		var flag=confirm("是否要删除");
		if(flag){
			
			$.post("${path}GoodsCartServlet",{"op":"queryGoodsDelete","UserName":username,"GoodsID":goodsiddel},function(listgc,status){	
				$("tbody").empty();
				$(".right_direction").empty();
				var goodsprice = 0;
				var sum = 0;
				$.each(listgc,function(index, data) {
					goodsprice=data.GOODSCOUNT*data.GOODSPRICE;
					var str = '<tr><td class="Product_info">'
					+ '<a href="#"><img src="'+data.GOODSPICTURE+'" width="100px" height="100px" /></a>'
					+ '<a href="#" class="product_name">'
					+ data.GOODSNAME
					+ '</a></td>'
					+ '<td class="goodprice">￥'
					+ data.GOODSPRICE.toFixed(2)
					+ '</td>'				
					+ '<td><input type="button" value="-" class="changebutton goodssub"/><input type="text" class="changetext" value="'
					+ data.GOODSCOUNT
					+'" /><input type="button" value="+" class="changebutton goodsadd"/></td>'
					+ '<td class="Moneys">￥'
					+ goodsprice.toFixed(2)
					+ '</td><td class="deletegoods"><input class="deletegoodid" type="hidden" value="'
					+ data.GOODSID
					+'" /><a class="deletes">删除</a></td></tr>';
					$("tbody").append(str);
					sum = sum + goodsprice;
				});
				var str1 = '<ul><li><label>商品总价</label>￥<span class="sumpriceup">'
					+ sum.toFixed(2)
					+ '</span></li>'
					+ '<li class="shiji_price"><label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label><i>￥</i><span class="sumpricedown">'
					+ sum.toFixed(2) + '</span></li></ul>';
				$(".right_direction").append(str1);
				
		});
		}else{
			
		}
	});
</script>


<!-- 订单提交按钮 -->
<script type="text/javascript">
$(document).on("click",'.ordersubmit',function(){
	var username = $('.username').text();
	var useraddress = $(".defaultAddr").find("#ADDRESSID").val();
	location.href="OrderServlet?op=submitOrder&UserName="+username+"&UserAddress="+useraddress;
});


</script>


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
                <li class="fl"><div class="menu_hd"><a href="#">请登录</a></div></li>
                <li class="fl"><div class="menu_hd"><a href="#">免费注册</a></div></li>
            </ul>
            <ul class="fr 1h">
                <li class="fl"><div class="menu_hd"><a href="#">我的订单</a></div></li>
            </ul>
        </div>
    </div>
    <!--顶部快捷菜单-->


     <!--顶部Logo及搜索-->
    <div class="header_2013">
        <div class="w">
            <div class="logo_v2013">
                <a href="#">
                    <img class="border_r" src="images/logo_info.png" width="200" height="100" style="margin-top: 30px;margin-left: 30px;">                    
                </a>
            </div>                      
        </div>
    </div>
    <!--顶部Logo及搜索-->
    <div style="width: 100%;height: 4px;background-color: red;">
    </div>
    
   <div class="banner_red_top"> 
  </div>  
			<div class="clear"></div>
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>
						<div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
						</div>
						<div class="clear"></div>
						<ul class="addressdetail">
						</ul>

						<div class="clear"></div>
					</div>
					
					<!--订单内容 -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
						<!--产品列表-->
     <div class="Product_List">
      <table>
       <thead><tr class="title"><td class="name">商品名称</td><td class="price">商品价格</td><td class="Quantity">购买数量</td><td class="Money">金额</td><td class="deletegood">操作</td></tr></thead>
       <tbody>
       </tbody>
      </table>
      <div class="Pay_info">
       <label>买家留言</label><input name="" type="text"  onkeyup="checkLength(this);" class="text_name " />  <span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span></span>  
      </div>
      <!--价格-->
      <div class="price_style">
      <div class="right_direction">          
      </div>
      </div>
     </div>  						
							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
										<a id="J_Go" class="btn-go ordersubmit" id="ordersubmit" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
										<a id="J_Go" class="btn-go" tabindex="0" title="点击此按钮，取消订单" style="margin-right: 15px;">取消订单</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</div>
			
    <!-- 底部 -->
    <div class="bottom-links">
        <ul class="clearfix cols">
            <li class="col" style="margin-left: 225px;">
                <div class="bottom-links-title">关于我们</div>
                <ul class="clearfix bottom-links-items">
                    <li><a href="#">招聘英才</a></li>
                    <li><a href="#">公司简介</a></li>
                    <li><a href="#">合作洽谈</a></li>
                    <li><a href="#">联系我们</a></li>
                </ul>
            </li>
            <li class="col">
                <div class="bottom-links-title">客服中心</div>
                <ul class="clearfix bottom-links-items">
                    <li><a href="#">收货地址</a></li>
                    <li><a href="#">个人资料</a></li>
                    <li><a href="#">修改密码</a></li>
                </ul>
            </li>
            <li class="col">
                <div class="bottom-links-title">售后服务</div>
                <ul class="clearfix bottom-links-items">
                    <li><a href="#">退换货政策</a></li>
                    <li><a href="#">退款说明</a></li>
                    <li><a href="#">联系卖家</a></li>
                </ul>
            </li>
            <li class="col">
                <div class="bottom-links-title">帮助中心</div>
                <ul class="clearfix bottom-links-items">
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">积分兑换</a></li>
                    <li><a href="#">积分细则</a></li>
                    <li><a href="#">已购商品</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="footer_v2013 bottom-about">
        <div class="w">
            <p class="foot_p1">
                <a href="#">首页</a>|<a href="#">招聘英才</a>|<a href="#">广告合作</a>|<a href="#">联系我们</a>|<a href="#">关于我们</a>
            </p>
                <pre>
    经营许可证：闽B2-20130223备案许可证：闽ICP备13041162号-1360网站安全检测平台
    ©2013-2014 福建云电商网络科技发展有限公司   版权所有
                </pre>
        </div>      
    </div>
    
    <div class="fixed-buttons">
        <ul>
            <li><img id="imgBtn-to-top" src="images/back_top.png" /></li>
        </ul>
    </div>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="js/unslider.min.js" type="text/javascript"></script>
    <script src="js/index.js" type="text/javascript"></script>    
    
			<!--
            	作者：offline
            	时间：2017-10-12
            	描述：新增地址模态窗
            -->
			
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="收货人">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="手机号必填" type="email" pattern="^1[0-9]{10}$">
								<span id="phone-msg"></span>
							</div>
						</div>

						
						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">所在地</label>
							<div data-toggle="distpicker">
							<div class="am-form-content address">
							  	<select class="am-form-control" id="province1"></select>
 							 	<select class="am-form-control" id="city1"></select>
 							  	<select class="am-form-control" id="district1"></select>
							</div>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
								<small>100字以内写出你的详细地址...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<div class="am-btn am-btn-danger addaddress">保存</div>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
			
			
<script type="text/javascript">
function checkLength(which) {
	var maxChars = 50; //
	if(which.value.length > maxChars){
		alert("您出入的字数超多限制!");
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
}
</script>
<!--<script>
$(function(){
	$(':input').labelauty();
});
</script>-->
<script type="text/javascript">
	$(document).on("click",'.goodssub',function(index){
		var num =$(this).next().val();
		var price = $(this).parent().parent().find(".goodprice").html().substring(1);
		var sum = 0;
		var totalsum = 0;
		if(num>0){
		$(this).next().val(parseInt(num)-1);
		num = $(this).next().val();
		sum = (num*price).toFixed(2);
		$(this).parent().parent().find(".Moneys").text("￥"+sum);
		$(".Moneys").each(function(){			
			totalsum+=+$(this).text().substring(1);			
		  });
		$(".sumpriceup").text(totalsum.toFixed(2));
		$(".sumpricedown").text(totalsum.toFixed(2));
		}else{
			
		}
	});
	
	$(document).on("click",'.goodsadd',function(index){
		var num =$(this).prev().val();
		var price = $(this).parent().parent().find(".goodprice").html().substring(1);
		var sum = 0;
		var totalsum = 0;
		$(this).prev().val(parseInt(num)+1);
		num = $(this).prev().val();
		sum = (num*price).toFixed(2);
		$(this).parent().parent().find(".Moneys").text("￥"+sum);
		$(".Moneys").each(function(){			
			totalsum+=+$(this).text().substring(1);			
		  });
		$(".sumpriceup").text(totalsum.toFixed(2));
		$(".sumpricedown").text(totalsum.toFixed(2));
	});
	
</script>
			
</body>
</html>