<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";

	//折中处理一下
	pageContext.setAttribute("path", path);
%>

<!-- 
	商品列表
	
 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统后台</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />

<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.tables.js"></script>
<style>
.form-group {
	margin-bottom: 20px;
}
</style>

<!--弹框的外部包-->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- 弹框的外部包 -->

<script type="text/javascript">
	
var employee = {};

employee.property = {
    version:"v1.0",
    name:"employee",
    tableId:"example",//显示数据的容器表格的id
    
};
	$(function() {
		
		
		
		 
		
		/*$( "#example").dataTable().fnDraw(false); */
		/* start = $("#targetTable").dataTable().fnSettings()._iDisplayStart;  
		total = $("#targetTable").dataTable().fnSettings().fnRecordsDisplay();  
		window.location.reload();  
		if ((total - start) == 1) {  
		   if (start > 0) {  
		       $("#sorting-advanced").dataTable().fnPageChange('previous', true);  
		   }  
		} */
		
		/* this.table.dataTable().fnDraw(false); */
		 
		/* if (${requestScope.nowPage != null}) {
			//如果当前页面不为空
			//重绘
			$('#example').dataTable().page(currentPage).draw( '${requestScope.nowPage}' );
		}  */
		/* $('#tab2DealTable').dataTable().page(); //静态刷新不跳转  */
		

		/* 订单消息提醒 */
		setInterval(message, 1000);
		function message() {
			$.post("SellerMessageServlet",{"op":"message"},function(data,status){
				if (data) {
					//如果有消息
					$("#msg").text("您有新订单~");
				}else{
					//没消息
					$("#msg").text("");;
				}
			});
		}
		
		
		
		/* 未处理订单点击事件 */
		$("#getAllSSwcl").click(function () {
			/* 将消息提醒取消 */
			$.post("SellerMessageServlet",{"op":"cancelMessage"},function(data,status){
			});
		});
		

		/* 删除商品 */
		$(".delete")
				.click(
						function() {
							
							//获取当前页面
							 var $nowPage = $('#example').dataTable().page();
							
							//提示用户
							$
									.confirm({
										title : '删除',
										content : '是否确定要删除？',
										buttons : {
											ok : {
												text : "确定",
												btnClass : 'btn-blue',
												action : function() {
													//获取复选框对象
													var checkBox = $("input[type='checkbox']");
													//遍历复选框
													var goodsIdStr = "";

													for (var i = 1; i < checkBox
															.size(); i++) {
														if (checkBox
																.eq(i)
																.prop("checked")) {
															//如果复选框的选项被选择，则获取被选中行中隐藏的id
															var goodsId = checkBox
																	.eq(i)
																	.parents(
																			"tr")
																	.find(
																			"input")
																	.val();

															goodsIdStr += goodsId
																	+ ",";

														}
													}
													location.href = "GoodsServlet?op=deleteGoods&goodsIdStr="
															+ goodsIdStr +"&nowPage="+$nowPage ;
												}
											},
											cancel : {
												text : "取消",
												btnClass : 'btn-green',
											},
										}
									});
						});
	});
</script>

<!-- lay外置插件 -->
<script src="js/jquery-2.1.0.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="layui/layer.css">
<script src="layui/layer.js" type="text/javascript"></script>
<!-- lay外置插件 -->

<script type="text/javascript">
	/* 增加商品lay窗口 */
	$(function() {
		
		/* 增、删、改操作结果 */
		if (<%=request.getAttribute("updateSucess")!=null%>) {
			if (<%=request.getAttribute("updateSucess")%>) {
				/* 增加操作成功 */
				layer.alert('操作成功', {icon: 1});
			}else{
				/* 增加操作失败 */
				layer.msg('操作失败', {icon: 5});
			}
		}
		
		/* 增加商品 */
		$("#addGoods")
				.click(
						function() {
							layer
									.open({
										type : 1,
										title : "新增商品",
										area : [ '650px', '500px' ],
										shadeClose : true,
										closeBtn : 1,//关闭按钮
										shade : [ 0.8, '#393D49' ],//颜色
										content : '<form class="form-horizontal"  method="post" action="${path}GoodsServlet?op=addGoods" enctype="multipart/form-data">'
												+ '<div class="form-group" style="text-align:center">'
												+ '商品名：<input type="text" class="form-control" id="goodsName"'+
															'name="goodsName"  style="width:300px;height:35px;"/>'
												+ '</div>'
												+ '<div class="form-group" style=" margin-left:140px">'
												+ '商品小类：<select class="form-control" id="goodsStype" name="stype" style="width:300px;height:35px;">'
												+ '<option value="default">--请选择--</option>'
												+ '<c:if test="${requestScope.stypeList != null }">'
												+

												'<c:forEach items="${requestScope.stypeList }" var="stype">'
												+ '<option value="${stype.STYPENAME}">${stype.STYPENAME}</option>'
												+ '</c:forEach>'
												+ '</c:if>'
												+ '</select>'
												+ '</div>'
												+ '<div class="form-group" style="text-align:center">'
												+ '商品价格：<input type="text" class="form-control" id="goodsPrice" name="goodsPrice" style="width:300px ;height:35px;"/>'
												+ '</div>'
												+ '<div class="form-group" style="text-align:center">'
												+ '商品描述：<textarea class="form-control" id="goodsContent"'+
															'name="goodsContent" style="width:300px "></textarea>'
												+ '</div>'
												+ '<div class="form-group"  style="text-align:center">'
												+ '商品库存：<input type="text" class="form-control" id="goodsStock"'+
															'name="goodsStock" style="width:300px;height:35px;" />'
												+ '</div>'
												+ '<div class="form-group"  style="text-align:center">'
												+ '上传图片：<input type="file"  id="goodsStock"'+
															'name="goodsImg" style="width:300px;height:35px;" />'
												+ '</div>'
												
												+'<div class="form-group" style="text-align:center">'
												+ '<button type="submit" class="btn btn-success" style="width:200px height:100px">提交</button>'
												+ '</div>' +

												'</form>'
									});
						});

		/* 修改商品layer窗口 */
		$("#update")
				.click(
						function() {
							//获取选中的复选框
							var $checkedBox = $("input[type='checkbox']");
							var $checked = 0;
							//遍历
							for (var i = 0; i < $checkedBox.size(); i++) {
								if ($checkedBox.eq(i).prop("checked")) {
									//如果该状态为选中状态,则获取
									$checked = $checkedBox.eq(i);
									break;
								}

							}

							//获取商品信息
							var $goodsId = $checked.val();
							var $goodsName = $checked.parents("tr").find("td")
									.eq(1).text();
							var $goodsStype = $checked.parents("tr").find("td")
									.eq(2).text();
							var $goodsPrice = $checked.parents("tr").find("td")
									.eq(4).text();
							var $goodsContent = $checked.parents("tr").find(
									"td").eq(5).text();
							var $goodsStock = $checked.parents("tr").find("td")
									.eq(6).text();
							/* 修改窗口 */
							layer
									.open({
										type : 1,
										title : "修改商品",
										area : [ '650px', '450px' ],
										shadeClose : true,
										closeBtn : 1,//关闭按钮
										shade : [ 0.8, '#393D49' ],//颜色
										content : '<form class="form-horizontal"  method="post" action="${path}GoodsServlet?op=updateGoods">'
												+ '<div class="form-group" style="text-align:center"><input type="hidden"  name="goodsId" value="'+$goodsId+'">'
												+ '商品名：<input type="text" class="form-control" id="goodsName"'+
														'name="goodsName"  style="width:300px;height:35px" value="'+$goodsName+'" readonly="readonly"/>'
												+ '</div>'
												+ '<div class="form-group" style=" margin-left:140px">'
												+ '商品小类：<select class="form-control" id="goodsStype" name="goodsStype" style="width:300px;height:35px">'
												+ '<option value="default">--请选择--</option>'
												+ '<c:if test="${requestScope.stypeList != null }">'
												+

												'<c:forEach items="${requestScope.stypeList }" var="stype">'
												+ '<option value="${stype.STYPENAME}">${stype.STYPENAME}</option>'
												+ '</c:forEach>'
												+ '</c:if>'
												+ '</select>'
												+ '</div>'
												+ '<div class="form-group" style="text-align:center">'
												+ '商品价格：<input type="text" class="form-control" id="goodsPrice" name="goodsPrice" style="width:300px;height:35px" value="'+$goodsPrice+'"/>'
												+ '</div>'
												+ '<div class="form-group" style="text-align:center">'
												+ '商品描述：<textarea class="form-control" id="goodsContent"'
												+'name="goodsContent" style="width:300px ">'
												+ $goodsContent
												+ '</textarea>'
												+ '</div>'
												+ '<div class="form-group"  style="text-align:center">'
												+ '商品库存：<input type="text" class="form-control" id="goodsStock"'+
														'name="goodsStock" style="width:300px;height:35px" value="'+$goodsStock+'"/>'
												+ '</div>'
												+

												'<div class="form-group" style="text-align:center">'
												+ '<button type="submit" class="btn btn-success" style="width:200px height:100px">提交</button>'
												+ '</div>' +

												'</form>'
									//这里content是一个普通的String 
									});
							//小类赋值
							$("#goodsStype").val($goodsStype);
						});

	});
</script>

</head>

<body>

	<div id="header">
	
		<h1>
			<a href="#">零嘴小铺</a>
		</h1>
		
	</div>

	<!-- 左侧菜单栏 -->
	<div id="sidebar">
		<ul>
			<li><a href="index.jsp"><i class="icon icon-home"></i> <span>后台首页</span></a></li>

			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>订单管理</span></a>
				<ul>
					<li class="" id="receiveOrder"><a  id="getAllSSycl" href="Goods_OrderServlet?op=getAllSSycl&active=1" >已接订单</a></li>
					<li class="" id="noReceiveOrder"><a href="Goods_OrderServlet?op=getAllSSwcl&active=2" id="getAllSSwcl" >未接订单</a></li>
						
				</ul></li>

			<li class="submenu active open"><a href="#"><i
					class="icon icon-th-list"></i> <span>商品管理</span></a>
				<ul>
					<li class="active"><a href="GoodsServlet?op=getAllGoods">商品列表</a></li>
					<li><a href="GoodsSortServlet?op=getAllGoodsSort">商品分类</a></li>
					<li><a href="GoodsStateServlet?op=getGoodsState">商品状态</a></li>
				</ul></li>

			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>交易记录管理</span></a>
				<ul>
					<li><a href="GoodsOrderServlet?op=getAllOrder">交易记录</a></li>
				</ul></li>

			<!-- <li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>评论管理</span></a>
				<ul>
					<li><a href="#">评论列表</a></li>
					<li><a href="#">意见反馈</a></li>
				</ul></li> -->
		</ul>
	</div>

	<div id="style-switcher">
		<i class="icon-arrow-left icon-white"></i> <span>Style:</span> <a
			href="#grey"
			style="background-color: #555555; border-color: #aaaaaa;"></a> <a
			href="#blue" style="background-color: #2D2F57;"></a> <a href="#red"
			style="background-color: #673232;"></a>
	</div>

	<div id="content">
		<div id="content-header">
			<h1>商品列表</h1>
			<!-- 消息提醒 -->
			<marquee id="msg" style="color:red; font-size:20px" direction=right behavior=alternate scrollamount=6 height=100 width=50% onmouseover=this.stop() onmouseout=this.start()></marquee>
		
			<div class="btn-group">
				<a class="btn btn-large tip-bottom " id="addGoods" title="新增商品" ><i class="icon-ok"></i></a> 
				
				<a class="btn btn-large tip-bottom delete " title="删除商品"><i class="icon-remove"></i></a> 
				
				<a class="btn btn-large tip-bottom update"  id="update" title="修改商品" ><i class="icon-pencil"></i></a>
			</div>
		</div>


		<!-- 内容 -->
		<div id="breadcrumb">
			<a href="index.jsp" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i>后台管理</a> <a href="#" class="current">商品列表</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">

					<div class="widget-box">
						<div class="widget-title">

							<h5>商品信息列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th><input type="checkbox" id="chooseAll"></th>
										<th>商品名</th>
										<th>所属小类</th>
										<th>商品图片</th>
										<th>商品价格</th>
										<th>商品描述</th>
										<th>商品库存</th>
									</tr>
								</thead>
								
								<tbody>

									<c:if test="${requestScope.list!=null}">
										<c:forEach items="${requestScope.list}" var="goodsStypePicture">

											<tr class="gradeA">
												<td><input type="checkbox"
													value="${goodsStypePicture.GOODSID}" name="GOODSID"></td>
												<td>${goodsStypePicture.GOODSNAME}</td>
												<td>${goodsStypePicture.STYPENAME}</td>
												<td><img src="http://localhost:8080/lzxp/${goodsStypePicture.PICTUREADDRESS }" style="width:50px;height:50px;"></td>
												<td>${goodsStypePicture.GOODSPRICE}</td>
												<td>${goodsStypePicture.GOODSCONTENT}</td>
												<td>${goodsStypePicture.GOODSSTOCK}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="row-fluid">
				<div id="footer" class="span12">版权所有 &copy; 2007-2017
					零嘴小铺电子商务有限公司 闽ICP备15022981号</div>
			</div>
		</div>
	</div>


	<!-- lay外置插件 -->
	<!-- 	<script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script> -->

</body>
</html>
