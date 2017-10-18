<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>零嘴小铺-用户登录</title>
		<link href="css/global.css" rel="stylesheet" />
		<link href="css/use.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery.min.js"></script>
		 <script type="text/javascript">
			
			$(function(){
				/* 用cookie传递用户信息 */
				 <%
					Cookie[] cookies = request.getCookies();
					//如果不为空，给文本框赋值用户信息
					if(cookies!=null){
						 for(Cookie c:cookies){

							if("userName".equals(c.getName())){
								%>
								$("#username").val("<%=c.getValue()%>");
								<%
							}
							 if("userPwd".equals(c.getName())){
								%>
								$("#password").val("<%=c.getValue()%>");
								<%
							}
							 
						}				
					}
				%> 
				
				
				/* 
					提交按钮事件 
				*/
				//获取文本内容并传递
				//ajax
				$("#sbt-btn").click(function () {
					$.post("UsersServlet",{"op":"isLogin","userName":$("#username").val(),"userPwd":$("#password").val()},function(result,status){
						if(result == true){
							//如果登录成功,页面跳转
							location.href="http://localhost:8080/lzxp/ltype.jsp";
						}else{
							//如果失败
							$('#userNameError').show();
							$('#userPwdError').show();
						}
					});
				});
				
				/* 键盘提交监听事件 */
				$("#password").keypress(function (event) {
					if(event.keyCode == 13){
						//如果是回车键，则调用按钮提交点击事件
						$("#sbt-btn").click();
					}
				});
				/* 输入框blur事件 */
				/* 判断输入是否为空 */
				$("#username").blur(function () {
					if($(this).val()==""){
						//如果用户名为空
						$('#userNameEmp').show();
					}
				});
				$("#password").blur(function () {
					if($(this).val()==""){
						//如果用户名为空
						$('#userPwdEmp').show();
					}
				});
				
				/* 输入框focus事件 */
				/* 消除注释 */
				$("#username").focus(function () {
					if($(this).val()==""){
						//用户名注释隐藏
						$('.fill-error.username').hide();
						$('#userNameEmp').hide();
					}
				});
				$("#password").focus(function () {
					if($(this).val()==""){
						//用户名注释隐藏
						$('.fill-error.password').hide();
						$('#userPwdEmp').hide();
					}
				});
			});
		</script> 
</head>
<body>
	<form id="fm1" action="#" method="post" onsubmit="return submitForm();">

			<!-- 顶部BAR -->
			<div class="toolbar">
				<div class="toolbar-cont wrap">
					<ul class="fl">
						<li>您好，欢迎来到零嘴小铺官方商城！</li>
						<li>
							<a class="reg" href="register.html">[注册]</a>
						</li>

					</ul>

				</div>
			</div>
			<!-- LOG HEADER 适配范围：登陆、注册、绑定页面 -->
			<div class="log-header wrap">
				<div class="slogo">
					<img src="img/logo0.png" class="pic" alt="">
				</div>
				<div class="sub-tit">欢迎登录</div>
			</div>

			<!--内容部分-->
			<div class="login-main wrap clearfix">
				<div class="login-img">
					<img src="img/left_img2.jpg" alt="" class="pic" />
				</div>
				<div class="login-data">
					<div class="ldt-titlte">
						<strong class="tit">会员登录</strong><span class="reg-new">新用户，<a href="register.html" class="free-reg">免费注册></a>
					</span>
					</div>

					<ul class="ldt-form focus-bd">
						<li>
							<span class="lab">用户名/邮箱/手机号</span>
							<div class="ipt">
								<input id="username" name="username" class="tx-ipt" tabindex="1" type="text" value="" size="25" autocomplete="off" />
								<label class="fill-error username none" id="userNameError">用户名或密码有误</label>
								<label class="fill-error username none" id="userNameEmp">用户名不能为空</label>				
							</div>
						</li>
						<li>
							<span class="lab">密码</span>
							<div class="ipt">
								<input id="password" name="password" class="tx-ipt" tabindex="2" type="password" value="" size="25" autocomplete="off" />
								<label class="fill-error password none" id="userPwdError">用户名或密码有误</label>
								<label class="fill-error password none" id="userPwdEmp">密码不能为空</label>
							</div>
						</li>
						
						<li>
							<div class="smt-btn">
								<input type="button" class="log-btn d-b" accesskey="l" id="sbt-btn"value="登 录" />
							</div>
						</li>
					</ul>

				</div>
			</div>

			<!----------适配范围：登陆、注册、绑定页面的底部---------------->
			<!--底部-->
			<div class="log-footer">
				<div class="lfoot wrap">
					<div class="lfoot-link">
						<ul>
							<li>
								<a href="#" target="_blank">关于我们</a> |</li>
							<li>
								<a href="#" target="_blank">联系我们</a> |</li>
							<li>
								<a href="#" target="_blank">客户服务</a> |</li>
							<li>
								<a href="#" target="_blank">诚聘英才</a> |</li>
							<li>
								<a href="#" target="_blank">商务合作</a> |</li>
							<li>
								<a href="#" target="_blank">媒体报道</a> |</li>
							<li>
								<a href="#" target="_blank">网站地图</a> |</li>
							<li>
								<a href="#" target="_blank">快递查询</a>
							</li>
						</ul>
					</div>
					<div class="copyright">
						Copyright@2007-2017 零嘴小铺电子商务有限公司 All rights Reserved<br/>
						<a target="_blank" href="#">鄂ICP备15022981号</a>
					</div>

				</div>
			</div>
			<!--底部-->
			<script src="js/base.js"></script>
		</form>
</body>
</html>