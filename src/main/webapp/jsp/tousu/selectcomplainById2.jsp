<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.min.css">
	
	<link href="${css}bootstrap.min.css" rel="stylesheet">
		<link href="${css}my.css" rel="stylesheet">
		<script src="${js}jquery-2.0.0.min.js"></script>
		<script src="${js}bootstrap.min.js"></script>

</head>

<body>
<!--***********************头部************************-->
		<div class="header">
			<div class="container-fluid">
				<div class="top-bar">
					<div class="row">
						<div class="col-md-4">
							<div class="top-bar-1 ">
								<img src="images/img/mobile.png" />
							</div>
						</div>

						<div class="col-md-8">
							<div class="top-bar-3 ">
								<form class="navbar-form navbar-right ">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="关键字搜索">
									</div>
									<button type="submit" class="btn btn-default " style="">
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
									<li class="active">
										<a href="${cxt}/jsp/home.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;首页</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/caigougonggao.jsp">招标采购公告</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/gongyingshanggonggao.jsp">供应商公告</a>
									</li>
									<li>
										<a href="/mavenfst/selectcomplain?page=1">投诉中心</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/fuwuzhongxin.jsp">服务中心</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/falvshengming.jsp">法律声明</a>
									</li>
				
								</ul>

							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	<div class="container">
		<table class="table table-hover table-bordered  table-condensed">
			<tr>
				<td>id</td>
				<td>${complain.id}</td>
			</tr>
			<tr>
				<td>投诉人</td>
				<td>${complain.name }</td>
			</tr>
			<tr>
				<td>标题</td>
				<td>${complain.caption }</td>
			</tr>
			<tr>
				<td>内容</td>
				<td>${complain.content}</td>
			</tr>
			<tr>
				<td>回复人</td>
				<td>${complain.admin.adminname }</td>
			</tr>
			<tr>
				<td>回复内容</td>
				<td>${complain.answer.answercontent }</td>
			</tr>
			
			
			
		</table>
		
	</div>
	
	<input onclick="window.location.href='/mavenfst/selectcomplainBysupplierid'"  class="btn btn-success" type="button" value="返回"  />
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
