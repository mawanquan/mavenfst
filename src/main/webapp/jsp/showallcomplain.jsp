<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
		
		<style type="text/css">
		
		.container{
		height: 450px;
		}
		</style>
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
									<li>
										<a href="/mavenfst/jsp/home.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;首页</a>
									</li>
									<li>
										<a href="caigougonggao.html">招标采购公告</a>
									</li>
									<li>
										<a href="gongyingshanggonggao.html">供应商公告</a>
									</li>
									<li class="active">
										<a href="tousuzhongxin.html">投诉中心</a>
									</li>
									<li>
										<a href="fuwuzhongxin.html">服务中心</a>
									</li>
									<li>
										<a href="falvshengming.html">法律声明</a>
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
				<td>投诉人</td>
				<td>标题</td>
				<td>是否回复</td>
				<td>回复人</td>
				
				<td>操作</td>

			</tr>
			<c:forEach items="${list}" var="v">
				<tr>
					<td>${v.id }</td>
					<td>${v.name }</td>
					<td>${v.caption }</td>
					<td>
					<c:choose>
					<c:when test="${v.admin.adminname!=null }">已回复</c:when>
					<c:otherwise>未回复</c:otherwise>
					</c:choose>
					</td>
					<td>${v.admin.adminname }</td>
					
					<td>
						<button onclick="window.location.href='/mavenfst/selectcomplainById?id=${v.id}'" type="button" class="btn btn-info">查看</button>
					</td>


				</tr>
				
			</c:forEach>
			<tr>
				<button onclick="window.location.href='/mavenfst/jsp/tousu/tousu.jsp'" type="button" class="btn btn-success">我要投诉</button>
				</td>
				</tr>
		</table>
	</div>
	<div>
	<ul class="pager">
	<li><a href="/mavenfst/selectcomplain?page=1">首页</a></li>
		<li><a href="/mavenfst/selectcomplain?page=${pageInfo.pageNum-1 }">上一页</a></li>
		<li><a href="/mavenfst/selectcomplain?page=${pageInfo.pageNum+1 }">下一页</a></li>
		<li><a href="/mavenfst/selectcomplain?page=${pageInfo.pages }">末页</a></li>
	</ul>
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
	


</body>
</html>
