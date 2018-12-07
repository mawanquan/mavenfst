<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="${css}/bootstrap.min.css" rel="stylesheet">
		<link href="${css}/my.css" rel="stylesheet">
		<script src="${js}/jquery-2.0.0.min.js"></script>
		<script src="${js}/bootstrap.min.js"></script>
	</head>

	<body>
		<!--***********************头部************************-->
		<div class="header">
			<div class="container-fluid">
				<!---------------------------头上------------------------------>
				<div class="top-bar">
					<div class="row">
						<div class="col-md-4">
							<div class="top-bar-1 ">
								<img src="img/mobile.png" />
							</div>
						</div>

						<div class="col-md-8">
							<div class="top-bar-3 ">
								<form class="navbar-form navbar-right ">
									<div class="form-group" >
										<input type="text" class="form-control" placeholder="关键字搜索">
									</div>
									<button type="submit" class="btn btn-default " >
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
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								        <span class="sr-only">Toggle navigation</span>
								        <span class="icon-bar"></span>
								        <span class="icon-bar"></span>
								        <span class="icon-bar"></span>
						      		</button>
							</div>
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav top-bot-1 ">
									<li>
										<a href="index.html"><span class="glyphicon glyphicon-home"></span>&nbsp;首页</a>
									</li>
									<li>
										<a href="caigougonggao.html">招标采购公告</a>
									</li>
									<li>
										<a href="gongyingshanggonggao.html">供应商公告</a>
									</li>
									<li>
										<a href="tousuzhongxin.html">投诉中心</a>
									</li>
									<li>
										<a href="fuwuzhongxin.html">服务中心</a>
									</li>
									<li class="active">
										<a href="falvshengming.html">法律声明</a>
									</li>
								</ul>

							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<!--***********************主体************************-->
		<div class="container-fluid">
			<div class="main5" style="">

				<div class="row ">
					<div class="col-md-2 m1">
						<!-- Nav tabs -->
						<ul class="nav nav-pills nav-stacked m1-1" role="tablist">
							<li role="presentation" class="active">
								<a href="#home" aria-controls="home" role="tab" data-toggle="tab"><img src="img/falvshengming.png" />&nbsp;法律声明</a>
							</li>

						</ul>
					</div>
					<div class="col-md-10 m2">
						<!-- Tab panes -->
						<div class="tab-content m2-1" style="">
							<div role="tabpanel" class="tab-pane active" id="home">
								<form class="form-horizontal">
									<fieldset>
										<div id="legend" class="m2-1-1">
											<legend style="background-color:">法律声明</legend>
										</div>
										<div class="m2-1-2">
											<img src="img/shengming.jpg" style="" />
										</div>
									</fieldset>
								</form>

							</div>

						</div>

					</div>
				</div>

			</div>
		</div>
		<!--************************尾****************************8-->
		<div class="container-fluid ">
			<div class="tail">
				<div class="row">
					<div class="col-md-4 tail-1">
					</div>
					<div class="col-md-5 tail-2">
						<li>
							<p>京IQP备05002571号 | 热吧招标版权所有</p>
						</li>
						<li>
							<p>技术支持工作时间（工作日）：上午 9：00~12：00 下午 13：00~18:00</p>
						</li>
					</div>
					<div class="col-md-3 tail-3">
					</div>
				</div>
			</div>
		</div>
	</body>

</html>
