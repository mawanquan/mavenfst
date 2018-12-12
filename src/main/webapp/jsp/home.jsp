<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>




<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>中国招标网</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="${css}bootstrap.min.css" rel="stylesheet">
<link href="${css}my.css" rel="stylesheet">
<script src="${js}jquery-2.0.0.min.js"></script>
<script src="${js}bootstrap.min.js"></script>
<script type="text/javascript">
	function getNow() {
		var now = new Date();
		document.getElementById("time").innerHTML = now.toLocaleString();
		setTimeout(getNow, 1000);
	}
	$(function(){
		$("#1").load("/mavenfst/maindata");
		$("#2").load("/mavenfst/maindata2");
		$("#3").load("/mavenfst/maindata3");
		var date1 = new Date();

		$(".timer").each(
				function() {

					var d = new Date($(this).text());
					var times = (d.getTime() - date1.getTime()) / 1000;
					var day = 0, hour = 0, minute = 0, second = 0;//时间默认值
					if (times > 0) {
						day = Math.floor(times / (60 * 60 * 24));
						hour = Math.floor(times / (60 * 60)) - (day * 24);
						minute = Math.floor(times / 60) - (day * 24 * 60)
								- (hour * 60);
					}
					if (day <= 9) {
						day = '0' + day;
					}
					if (hour <= 9) {
						hour = '0' + hour;
					}
					if (minute <= 9) {
						minute = '0' + minute;
					}
					$(this).text(day + "天" + hour + "时" + minute + "分");

				});

	});
</script>
</head>

<body onload="getNow()">
	<!--***********************头部************************-->
	<div class="header">
		<div class="container-fluid">
			<!---------------------------头上------------------------------>
			<div class="top-bar">
				<div class="row">
					<div class="col-xs-4">
						<div class="top-bar-1 ">
							<img src="images/img/mobile.png" />
						</div>
					</div>
					<div class="col-xs-5 top-bar-2 " id="time"></div>
					<div class="col-xs-3">
						<div class="top-bar-3 ">

							<form class="navbar-form  form-inline">

								<div class="form-group"
									style="width: 20px; position: relative;left:-20px">
									<input type="text" class="form-control" placeholder="关键字搜索">
								</div>
								<button type="submit" class="btn btn-default  "
									style="position: relative;left: 160px">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</form>

						</div>
					</div>
				</div>
			</div>
			<!---------------------------头下------------------------------>
			<div class="top-bot">
				<nav class="navbar navbar-default top-bot-col">
					<div class="container-fluid ">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav  top-bot-1 ">
								<li class="active"><a href="${cxt}/jsp/home.jsp"><span
										class="glyphicon glyphicon-home"></span>&nbsp;首页</a></li>
								<li><a href="${cxt}/jsp/jiapage/caigougonggao.jsp">招标采购公告</a>
								</li>
								<li><a href="${cxt}/jsp/jiapage/gongyingshanggonggao.jsp">供应商公告</a>
								</li>
								<li><a href="/mavenfst/selectcomplain?page=1">投诉中心</a></li>
								<li><a href="${cxt}/jsp/jiapage/fuwuzhongxin.jsp">服务中心</a>
								</li>
								<li><a href="${cxt}/jsp/jiapage/falvshengming.jsp">法律声明</a>
								</li>
								<c:if test="${!empty supplier  }">
									<li><a href="${cxt}/bids/zhaobiaoall?page=1">我的后台</a></li>
								</c:if>
								<c:if test="${!empty supplier}">
									<li><a href="${cxt}/common/tuichu">退出</a></li>
								</c:if>
							</ul>

						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>

	<!--***********************主体************************-->
	<div class="container-fluid">
		<div class="body1">
			<div class="row">
				<div class="col-xs-9 b1">
					<!--***********************轮播图**********************-->
					<div class="container-fluid fst" style="color: white;">
						<div id="myCarousel" class="carousel slide">
							<!-- 轮播（Carousel）指标 -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>
							<!-- 轮播（Carousel）项目 -->
							<div class="carousel-inner imgs">
								<div class="item active">
									<img src="images/img/l1_4.jpg" alt="First slide">
								</div>
								<div class="item">
									<img src="images/img/l2.jpg" alt="Second slide">
								</div>
								<div class="item">
									<img src="images/img/l3.jpg" alt="Third slide">
								</div>
							</div>
							<!-- 轮播（Carousel）导航 -->
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev" style="background-image: none;"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next" style="background-image: none;">
								<span class="glyphicon glyphicon-chevron-right"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<!--***********************************************************************-->
					<div class="card-tittle">
						<span class="glyphicon glyphicon-list"></span>&nbsp;招标大厅
					</div>

					<div class="l1">
						<ul class="nav nav-tabs  ul-1" role="tablist">
							<li role="presentation" class="active"><a
								href="/mavenfst/maindata" aria-controls="1" role="tab"
								data-toggle="tab">正在招标</a></li>
							<li role="presentation"><a href="/mavenfst/maindata2"
								aria-controls="2" role="tab" data-toggle="tab">即将开标</a></li>
							<li role="presentation"><a href="/mavenfst/maindata3"
								aria-controls="3" role="tab" data-toggle="tab">正在候选人公示</a></li>

							<li
								style="padding-right: 10px; border: none;float: right;background-color: transparent;position: relative;top: -1px;">
								<a href="/mavenfst/data?page=1"
								style="font-size: 12px; color: #333;padding-top: 15px;border: none;">更多</a>
							</li>
						</ul>
						<div class="tab-content tab-1">
							<div role="tabpanel" class="tab-pane active" id="1">
								
							</div>
							<div role="tabpanel" class="tab-pane" id="2">
								
							</div>
							<div role="tabpanel" class="tab-pane" id="3">
								
							</div>

						</div>
					</div>
					<!--*******************************************************************-->
					<div class="l1">
						<ul class="nav nav-tabs  ul-1 ul-1-1" role="tablist">

							<li role="presentation" class="active"><a href="#11"
								aria-controls="11" role="tab" data-toggle="tab"><span
									class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;&nbsp;采购公告</a>
							</li>
							<li role="presentation"><a href="#22" aria-controls="22"
								role="tab" data-toggle="tab"><span
									class="glyphicon glyphicon-globe" aria-hidden="true"></span>&nbsp;&nbsp;资格预审</a>
							</li>
							<li role="presentation"><a href="#33" aria-controls="33"
								role="tab" data-toggle="tab"><span
									class=" glyphicon glyphicon-indent-left " aria-hidden="true"></span>&nbsp;&nbsp;候选人</a>
							</li>
							<li role="presentation"><a href="#44" aria-controls="44"
								role="tab" data-toggle="tab"><span
									class=" glyphicon glyphicon-indent-left " aria-hidden="true"></span>&nbsp;&nbsp;中选结果</a>
							</li>
							<li role="presentation"><a href="#55" aria-controls="55"
								role="tab" data-toggle="tab"><span
									class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;单一来源采购信息</a>
							</li>
							<li role="presentation"><a href="#66" aria-controls="66"
								role="tab" data-toggle="tab"><span
									class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;供应商信息收集</a>
							</li>
						</ul>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="11">
								<div class="l1">
									<ul class="nav nav-tabs ul-1 ul-1-2" role="tablist">
										<li role="presentation" class="active"><a href="#j1"
											aria-controls="j1" role="tab" data-toggle="tab">集团公司</a></li>
										<li role="presentation"><a href="#s1" aria-controls="s1"
											role="tab" data-toggle="tab">省公司</a></li>
										<li
											style="padding-right: 10px;background-color: transparent;position: relative;top: -1px; border: none;float: right;">
											<a href="#settings"
											style="font-size: 12px; color: #333;padding-top: 15px;">更多</a>
										</li>
									</ul>
									<div class="tab-content tab-1">
										<div role="tabpanel" class="tab-pane active" id="j1">
											<table class="table table-striped">
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
											</table>
										</div>
										<div role="tabpanel" class="tab-pane" id="s1">
											<table class="table table-striped">
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane" id="22">
								<div class="l1">
									<ul class="nav nav-tabs ul-1 ul-1-2" role="tablist">
										<li role="presentation" class="active"><a href="#j2"
											aria-controls="j2" role="tab" data-toggle="tab">集团公司</a></li>
										<li role="presentation"><a href="#s2" aria-controls="s2"
											role="tab" data-toggle="tab">省公司</a></li>
										<li
											style="padding-right: 10px; border: none;float: right;background-color: transparent;position: relative;top: -1px;">
											<a href="#settings"
											style="font-size: 12px; color: #333;padding-top: 15px;">更多</a>
										</li>
									</ul>
									<div class="tab-content tab-1">
										<div role="tabpanel" class="tab-pane active" id="j2">
											<table class="table table-striped">
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
											</table>
										</div>
										<div role="tabpanel" class="tab-pane" id="s2">
											<ul class="ul-2">
												<li><script src="html5plus://ready"></script></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane" id="33">
								<div class="l1">
									<ul class="nav nav-tabs ul-1 ul-1-2" role="tablist">
										<li role="presentation" class="active"><a href="#j3"
											aria-controls="j3" role="tab" data-toggle="tab">集团公司</a></li>
										<li role="presentation"><a href="#s3" aria-controls="s3"
											role="tab" data-toggle="tab">省公司</a></li>
										<li
											style="padding-right: 10px; border: none;float: right;background-color: transparent;position: relative;top: -1px;">
											<a href="#settings"
											style="font-size: 12px; color: #333;padding-top: 15px;">更多</a>
										</li>
									</ul>
									<div class="tab-content tab-1">
										<div role="tabpanel" class="tab-pane active" id="j3">
											<table class="table table-striped">
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
											</table>
										</div>
										<div role="tabpanel" class="tab-pane" id="s3">
											<ul class="ul-2">
												<li>s3</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane" id="44">
								<div class="l1">
									<ul class="nav nav-tabs ul-1 ul-1-2" role="tablist">
										<li role="presentation" class="active"><a href="#j4"
											aria-controls="j4" role="tab" data-toggle="tab">集团公司</a></li>
										<li role="presentation"><a href="#s4" aria-controls="s4"
											role="tab" data-toggle="tab">省公司</a></li>
										<li
											style="padding-right: 10px; border: none;float: right;background-color: transparent;position: relative;top: -1px;">
											<a href="#settings"
											style="font-size: 12px; color: #333;padding-top: 15px;">更多</a>
										</li>
									</ul>
									<div class="tab-content tab-1">
										<div role="tabpanel" class="tab-pane active" id="j4">
											<table class="table table-striped">
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
											</table>
										</div>
										<div role="tabpanel" class="tab-pane" id="s4">
											<table class="table table-striped">
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane" id="55">
								<div class="l1">
									<ul class="nav nav-tabs ul-1 ul-1-2" role="tablist">
										<li role="presentation" class="active"><a href="#j5"
											aria-controls="j5" role="tab" data-toggle="tab">集团公司</a></li>
										<li role="presentation"><a href="#s5" aria-controls="s5"
											role="tab" data-toggle="tab">省公司</a></li>
										<li
											style="padding-right: 10px; border: none;float: right;background-color: transparent;position: relative;top: -1px;">
											<a href="#settings"
											style="font-size: 12px; color: #333;padding-top: 15px;">更多</a>
										</li>
									</ul>
									<div class="tab-content tab-1">
										<div role="tabpanel" class="tab-pane active" id="j5">
											<table class="table table-striped">
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
											</table>
										</div>
										<div role="tabpanel" class="tab-pane" id="s5">
											<table class="table table-striped">
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
												<tr>
													<td><a href="#">
															浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a></td>
													<td style="">2018-11-28</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane" id="66">
								<div class="l1">
									<ul class="nav nav-tabs ul-1 ul-1-2" role="tablist">

										<li
											style="padding-right: 10px; border: none;float: right;background-color: transparent;position: relative;top: -1px;">
											<a href="#settings"
											style="font-size: 12px; color: #333;padding-top: 15px;">更多</a>
										</li>
									</ul>
									<div class="tab-content tab-1">
										<table class="table table-striped">
											<tr>
												<td><a href="#"> 浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a>
												</td>
												<td style="">2018-11-28</td>
											</tr>
											<tr>
												<td><a href="#"> 浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a>
												</td>
												<td style="">2018-11-28</td>
											</tr>
											<tr>
												<td><a href="#"> 浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a>
												</td>
												<td style="">2018-11-28</td>
											</tr>
											<tr>
												<td><a href="#"> 浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a>
												</td>
												<td style="">2018-11-28</td>
											</tr>
											<tr>
												<td><a href="#"> 浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a>
												</td>
												<td style="">2018-11-28</td>
											</tr>
											<tr>
												<td><a href="#"> 浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a>
												</td>
												<td style="">2018-11-28</td>
											</tr>
											<tr>
												<td><a href="#"> 浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a>
												</td>
												<td style="">2018-11-28</td>
											</tr>
											<tr>
												<td><a href="#"> 浙江分公司2018年11月-2019年11月促销品采购项目_比选公告</a>
												</td>
												<td style=" ">2018-11-28</td>
											</tr>
										</table>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-3 b2">
					<div class="pull-left r1">
						<h5>
							<span class=" glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;用户登录选择
						</h5>
					</div>
					<div class="r2 pull-left" style="">
						<ul class="r2-1">
							<li>
								<p class="navbar-text">
									<img src="images/img/h1.png" /> <img src="images/img/h2.png" />
									<img src="images/img/h3.png" />
								</p>
							</li>
							<li>
								<p class="navbar-text">
									<a href="${cxt}/jsp/suppliers/denglu.jsp">供应商登录</a> <a
										href="denglu.html">代理登录</a> <a href="denglu.html">专家登录</a>
								</p>
							</li>
						</ul>
						<ul class="r2-1 r2-1-1" style="">
							<li>
								<p class="navbar-text">
									<img src="images/img/h4.png" /> <img src="images/img/h5.png" />
								</p>
							</li>
							<li>
								<p class="navbar-text">
									<a href="${cxt}/admin/gologinview">员工登录</a> <a
										href="denglu.html">检测机构登录</a>
								</p>
							</li>
						</ul>
						<div class=" pull-right">
							<p style="position: relative;top: -95px;">
								<span class="small text-muted">还没有供应商账号，去</span> <a
									href="zhuce.html">【注 册】</a><br /> <span
									class="small text-muted">第三方检测机构</span> <a href="zhuce.html">【注
									册】</a>
							</p>
						</div>

					</div>
					<div style="position: relative;top: -100px;">
						<div class="pull-left r1">
							<h5>
								<span class=" glyphicon glyphicon-list "></span>&nbsp;&nbsp;&nbsp;系统通知
								<li style="padding-right: 10px; border: none;float: right;">
									<a href="/mavenfst/selecta"
									style="font-size: 12px; color: white;padding-top: 15px;">更多</a>
								</li>
							</h5>

						</div>
						<div class="r2 pull-left">
							<ul class="r2-2">
								<li><a href="#"><span
										class="glyphicon glyphicon-record" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
										class="small text-muted">2018-11-15</span> &nbsp;&nbsp;&nbsp;<span
										style="color:#333;">系统停机公告</span></a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-record" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
										class="small text-muted">2018-11-15</span> &nbsp;&nbsp;&nbsp;<span
										style="color:#333;">系统停机公告</span></a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-record" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
										class="small text-muted">2018-11-15</span> &nbsp;&nbsp;&nbsp;<span
										style="color:#333;">系统停机公告</span></a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-record" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
										class="small text-muted">2018-11-15</span> &nbsp;&nbsp;&nbsp;<span
										style="color:#333;">系统停机公告</span></a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-record" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
										class="small text-muted">2018-11-15</span> &nbsp;&nbsp;&nbsp;<span
										style="color:#333;">系统停机公告</span></a></li>

							</ul>
						</div>

						<div class="pull-left r1">
							<h5>
								<span class=" glyphicon glyphicon-list "></span>&nbsp;&nbsp;&nbsp;业务流程回答
							</h5>
						</div>
						<div class="r2 pull-left">
							<ul class="r2-1"
								style="padding-left: 30px; position: relative;top: 30px;">
								<li>
									<p class="navbar-text">
										<img src="images/img/biao.png" /> &nbsp;&nbsp;&nbsp;&nbsp; <img
											src="images/img/shu.png" />
									</p>
								</li>
								<li>
									<p class="navbar-text">
										<a href="${cxt}/jsp/jiapage/fuwuzhongxin.jsp#zb"
											style="text-decoration: none; ">招标前准备</a> <a
											href="${cxt}/jsp/jiapage/falvshengming.jsp"
											style="text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法律声明</a>

									</p>
								</li>
							</ul>
						</div>

						<div class="pull-left r1">
							<h5>
								<span class=" glyphicon glyphicon-list "></span>&nbsp;&nbsp;&nbsp;技术服务
							</h5>
						</div>
						<div class="r2   pull-left">
							<ul class="r2-3" style="height: 220px;">
								<li style="color: #00BFFF;">
									<p class="navbar-text">
										电子采购与招标投标系统技术支持 <br />（供应商注册、CA证书办理、电子招投标相关业务) <br />
										电话：400-139-0123 <br /> <a href="#"
											style="position: relative;left: -18px;">
											邮箱：support@chinamobile.com </a> <br /> <br /> 登录密码重置技术支持 <br />电话：400-139-0123
										<br /> <a href="#" style="position: relative;left: -18px;">
											邮箱：support@foxmail.com </a>
									</p>
								<li />
								<li><img src="images/img/kefu.png" />
									<button class="btn btn-default" type="submit">进入客服</button></li>

							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--***************************下载专区********************-->
	<div class="container-fluid">
		<div class="down">
			<div class="row ">
				<div class="col-xs-2 q">
					<p>
						<span class="glyphicon glyphicon-list"></span>&nbsp;下载专区
					</p>
				</div>
				<div class="col-xs-2 q">
					<a href="https://b2b.10086.cn/b2b/main/download.html?fileName=1 "><span
						class="glyphicon glyphicon-list-alt "></span>&nbsp;合作指南</a>
				</div>
				<div class="col-xs-2 q">
					<a href="# "><span class="glyphicon glyphicon-facetime-video "></span>&nbsp;培训材料视频</a>
				</div>
				<div class="col-xs-2 q">
					<a href="# "><span class="glyphicon glyphicon-book "></span>&nbsp;证书办理与安装</a>
				</div>
				<div class="col-xs-2 q">
					<a href="# "><span class="glyphicon glyphicon-wrench "></span>&nbsp;辅助投标工具</a>
				</div>
				<div class="col-xs-2 q">
					<a href="# "><span class="glyphicon glyphicon-download-alt "></span>&nbsp;软件下载</a>
				</div>

			</div>

		</div>
	</div>
	<!--************************尾****************************8-->
	<div class="container-fluid ">
		<div class="tail">
			<div class="row">
				<div class="col-xs-4 tail-1"></div>
				<div class="col-xs-5 tail-2">
					<li>
						<p>京IQP备05002571号 | 热吧招标版权所有</p>
					</li>
					<li>
						<p>技术支持工作时间（工作日）：上午 9：00~12：00 下午 13：00~18:00</p>
					</li>
				</div>
				<div class="col-xs-3 tail-3"></div>
			</div>
		</div>
	</div>

</body>

</html>
