<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>零嘴小铺商城 - 用户注册</title>
		<link href="css/global.css" rel="stylesheet">
		<link href="css/layout.css" rel="stylesheet">
		<link href="css/use.css" rel="stylesheet" type="text/css" />
		<link href="css/message.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.requiredField {
				color: red
			}
		</style>
		</style>
		<!-- Bootstrap -->
		<script src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js0/prng4.js"></script>

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script language="javascript" src="idcode/jquery.idcode.js"></script>
		<link type="text/css" rel="stylesheet" href="idcode/jquery.idcode.css" />
		<script>
			<!-- ## -->
			$(document).ready(function() {
				
				/*验证码*/
				$.idcode.setCode();

				<!-- 用户名  -->
				$("#username").focus(function() {
					$(this).removeClass("highlight");
					$(this).addClass("focus");
					$(this).next(".errors").remove();
					$(this).after('<span title=\"4-20位字符,支持汉字、字母、数字及“-”、“_”组合\" class=\"prompt\">4-20位字符,支持汉字、字母、数字及“-”、“_”组合</span>');
				});
				/* 用户名focus事件 */
				$("#username").blur(function() {
					$(this).removeClass("focus");
					$(this).next(".errors").remove();
					$(this).next(".prompt").remove();

					if($(this).val() != "") {
						/* 判断用户名格式 */
						var reg = /^[0-9]*$/;
						if(reg.test($(this).val())) {
							$(this).addClass("highlight");
							$(this).after('<span title=\"用户名不能是纯数字，请重新输入\" class=\"errors\">用户名不能是纯数字，请重新输入</span>');
							return;
						}
						var tmp_val = $(this).val().replace(/[^\x00-\xff]/g, 'xx');
						if(!(tmp_val.length >= 4 && tmp_val.length <= 20)) {
							$(this).addClass("highlight");
							$(this).after('<span title=\"用户名长度只能在4-20位字符之间\" class=\"errors\">用户名长度只能在4-20位字符之间</span>');
							return;
						}
						reg = /^[0-9a-z-_A-Z]{4,20}$/;
						if(!reg.test($(this).val().replace(/[^\x00-\xff]/g, 'xx'))) {
							$(this).addClass("highlight");
							$(this).after('<span title=\"用户名只允许包含全汉字 或 字母、数字及“-”、“_”组合\" class=\"errors\">用户名只允许包含全汉字 或 字母、数字及“-”、“_”组合</span>');
							return;
						}
						
						/* 判断用户名是已存在*/
						$.post("UsersServlet",{"op":"judgeUserName","userName":$(this).val()},function(data,status){
							if (data == true) {
								//存在
								$("#username").after('<span title=\"用户名已存在\" class=\"errors\">用户名已存在</span>');
								return;
							}
						});

					} else {
						$("#username").removeClass("correct");
					}
				});
				<!-- 用户名 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->

				<!-- 密码 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
				$("#password").focus(function() {
					$(this).removeClass("highlight");
					$(this).addClass("focus");
					$(this).next(".errors").remove();
					$(this).after('<span title=\"6-20位字符，由字母，数字和符号两种以上组合\" class=\"prompt\">6-20位字符，由字母，数字和符号两种以上组合</span>');
				});
				$("#password").blur(function() {
					$(this).removeClass("focus");
					$(this).next(".errors").remove();
					$(this).next(".prompt").remove();
					if($(this).val() != "") {
						if($("#password").val() == $("#username").val()) {
							$(this).addClass("highlight");
							$("#password").removeClass("correct");
							$(this).after('<span title=\"密码不能与用户名相同\" class=\"errors\">密码不能与用户名相同</span>');
							return;
						}
						var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-6])[!"#$%&'()*+,\-./:;<=>?@\[\\\]^_`{|}~A-Za-z0-9]{6,20}$/;
						if(!reg.test($(this).val())) {
							$(this).addClass("highlight");
							$("#password").removeClass("correct");
							$(this).after('<span title=\"密码输入不符合要求\" class=\"errors\">密码输入不符合要求</span>');
						} else {
							$("#password").addClass("correct");
						}
					} else {
						$("#password").removeClass("correct");
					}
				});
				<!-- 密码 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->

				<!-- 再次输入密码 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
				$("#rePassword").focus(function() {
					$(this).removeClass("highlight");
					$(this).addClass("focus");
					$(this).next(".errors").remove();
					$(this).after('<span title=\"请再次输入密码\" class=\"prompt\">请再次输入密码</span>');
				});
				$("#rePassword").blur(function() {
					$(this).removeClass("focus");
					$(this).next(".errors").remove();
					$(this).next(".prompt").remove();
					if($(this).val() != "") {
						if($(this).val() != $('#password').val()) {
							$(this).addClass("highlight");
							$("#rePassword").removeClass("correct");
							$(this).after('<span title=\"两次输入密码不一致\" class=\"errors\">两次输入密码不一致</span>');
						} else {
							$("#rePassword").addClass("correct");
							$("#rePassword").removeClass("highlight");
							$("#rePassword").next(".errors").remove();
							$("#rePassword").next(".prompt").remove();
						}
					} else {
						$("#rePassword").removeClass("correct");
					}
				});
				<!-- 再次输入密码 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->

				<!-- 手机号 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
				$("#mobile").focus(function() {
					$(this).removeClass("highlight");
					$(this).addClass("focus");
					$(this).next(".errors").remove();
					$(this).after('<span title=\"请输入手机号码\" class=\"prompt\">请输入手机号码</span>');
				});
				$("#mobile").blur(function() {
					$(this).removeClass("focus");
					$(this).next(".errors").remove();
					$(this).next(".prompt").remove();
					if($(this).val() != "") {
						var reg = /^1[0-9][0-9]\d{8}$/;
						if(!reg.test($(this).val())) {
							$(this).addClass("highlight");
							$("#mobile").removeClass("correct");
							$(this).after('<span title=\"手机号格式不正确\" class=\"errors\">手机号格式不正确</span>');
							return;
						}
						$.ajax({
							url: "https://reg.lppz.com/register/check_mobile.jhtml",
							type: "GET",
							data: {
								mobile: $(this).val()
							},
							dataType: "json",
							cache: false,
							async: false,
							success: function(data) {
								if(!data) {
									checkMemberStatus();
								} else {
									$("#mobile").addClass("correct");
								}
							}
						});

					} else {
						$("#mobile").removeClass("correct");
					}
				});

				<!-- 手机号 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->

				<!-- 图形验证码 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
				$(document).on("focus", "#idcode", function() {
					$(this).removeClass("highlight");
					$("#idcode").next(".errors").remove();
					$("#idcode").after('<span title=\"请输入验证码\" class=\"prompt\">请输入验证码</span>');
				});
				$(document).on("blur", "#idcode", function() {
					$(this).removeClass("focus");
					$('#idcode').next(".errors").remove();
					$('#idcode').next(".prompt").remove();
					if(!$.idcode.validateCode()) {
						/*如果验证码不正确*/
						$("#idcode").after("<span title='验证码不正确'class='errors'>验证码不正确</span>");
					}

				});

				/*$('.change-img,#imageShow').click(changeImg);*/
				<!-- 图形验证码 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
				<!-- 已阅读同意协议 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
				$("#lppz_info").click(function() {
					$("#smt-btn").prop("disabled",!$(this).attr("checked"));
					
				});
				<!-- 协议 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
			});

			/*判断文本框是否为空*/
			function smt_isnull(obj, str) {
				if(obj.val() == "") {
					//如果文本框的内容为空
					obj.after("<span title='验证码不正确'class='errors'>" + str + "</span>");
					return true;
				}
				return false;
			}
			
			$(function () {
				/* 判断各输入框是否为空 */
				$("#username").blur(function () {
					smt_isnull($("#username"), "请输入用户名");
				});
				$("#password").blur(function () {
					smt_isnull($("#password"), "请输入密码");
				});
				$("#rePassword").blur(function () {
					smt_isnull($("#rePassword"), "请确认密码");
				});
				$("#mobile").blur(function () {
					smt_isnull($("#mobile"), "请输入手机号码");
				});
				$("#image").blur(function () {
					smt_isnull($("#image"), "请输入验证码");
				});
				$("#lppz_info").blur(function () {
					smt_ischeck($("#lppz_info"), "请接受服务条款");
				});
				
			});s
			
		
		</script>
</head>
<body>
	<!-- header -->
		<div class="toolbar">
			<div class="toolbar-cont wrap">
				<ul class="fl">
					<li>欢迎来到零嘴小铺官方商城！</li>
					<li>
						<a class="reg" href="login.jsp">[登录]</a>
					</li>
				</ul>
			</div>
		</div>

		<!-- LOG HEADER 适配范围：登陆、注册、绑定页面 -->
		<div class="log-header wrap">
			<div class="slogo">
				<img src="img/logo0.png" class="pic" alt="">
			</div>
			<div class="sub-tit">欢迎注册</div>
		</div>

		<form id="registerForm" action="UsersServlet?op=register" method="post">
			<div class="register-main wrap clearfix" id="r1">
				<div class="reg-img"><img src="img/left_img2.jpg" class="pic" alt=""></div>
				<div class="reg-data">
					<div class="rdt-titlte"><strong class="tit">用户注册</strong><span class="to-log">已有账户，<a href="login.html" class="free-reg">在此登录></a></span></div>
					<div class="rdt-from">
						<ul class="form-data">
							<li>
								<span class="lb-txt"><b class="requiredField">* </b>用户名：</span>
								<input class="tx-ipt uname" type="text" name="username" id="username" maxlength="20" tabindex="1">
							</li>
							<li>
								<span class="lb-txt"><b class="requiredField">* </b>密　码：</span>
								<input class="tx-ipt pword" type="password" name="password" id="password" maxlength="20" tabindex="2">
							</li>
							<li>
								<span class="lb-txt"><b class="requiredField">* </b>确认密码：</span>
								<input class="tx-ipt pword" type="password" name="rePassword" id="rePassword" maxlength="20" tabindex="3">
							</li>
							<li>
								<span class="lb-txt"><b class="requiredField">* </b>手机号：</span>
								<input class="tx-ipt phone" type="text" name="mobile" id="mobile" maxlength="11" tabindex="4">
							</li>
							<li>
								<span class="lb-txt"><b class="requiredField">* </b>验证码：</span>
								<div class="ver-code">
									<span id="idcode" class="t"></span>
									<!--验证码-->
								</div>
							</li>

							<li class="clause">
								<div class="agreement"><b class="requiredField">* </b><input class="ckb-ipt" type="checkbox" name="lppz_info" id="lppz_info" checked>我已阅读并同意
									<a href="#">《零嘴小铺用户注册协议》</a>
								</div>
							</li>
							<li>
								<div class="submit"><input id="smt-btn" class="smt-btn" type="submit" value="同意协议并注册" onClick="smtBtn()"></div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</form>

		<div class="agree-popup">
			<div class="agree-tit"><span>用户注册协议</span></div>

			<!-- footer -->
			<div class="log-footer">
				<div class="lfoot wrap">

					<div class="copyright">
						Copyright@2007-2017 零嘴小铺电子商务有限公司 All rights Reserved<br/>
						<a target="_blank" href="#">闽ICP备15022981号</a>
					</div>
				</div>
			</div>
			<!--底部-->

	</body>
</body>
</html>