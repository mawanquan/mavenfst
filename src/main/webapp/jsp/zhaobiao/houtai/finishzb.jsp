<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'finishzb.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<style type="text/css">
html, html body, td {
	font: 12px/1.5 'Microsoft YaHei', '宋体', STHeiti, Verdana, Arial,
		Helvetica, sans-serif;
}
.page {
	text-align: right;
}
</style>
</head>

<body>
<div>
<h2>已完成招标项目</h2>
	<table class="table table-hover">
		<tr>
			<td>发布人</td>
			<td class="title">标题</td>
			<td class="content">内容</td>
			<td>招标金额</td>
			<td>中标公司</td>
		</tr>
		<c:forEach items="${list}" var="v">
			<tr>
				<td>${v.publisher}</td>
				<td><a href="/mavenfst/show?id=${v.id}">${v.title}</a></td>
				<td>${v.content}</td>
				<td>${v.zbmoney}</td>
				<td>${v.hit}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div class="page">
		<ul class="pagination">
			<li><a href="/mavenfst/${path}/1">首页</a></li>
			<li><a href="/mavenfst/${path}/${pg.pageNum-1}"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="/mavenfst/${path}/${pg.pageNum}">${pg.pageNum}</a></li>
			<li><a href="/mavenfst/${path}/${pg.pageNum+1}"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
			<li><a href="/mavenfst/${path}/${pg.pages}">末页</a></li>
		</ul>
	</div>
</body>
</html>
