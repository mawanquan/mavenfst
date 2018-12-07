<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'feibiao.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript">
$(function() {
$(".date").each(
				function() {
					var d = new Date($(this).text());
					$(this).text(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ d.getDate() + "日");
					//+d.getHours()+"时"+d.getMinutes()+"分"

				});
	})
</script>
<style type="text/css">
html, html body, td {
	font: 12px/1.5 'Microsoft YaHei ', ' 宋体', STHeiti, Verdana, Arial,
		Helvetica, sans-serif;
}

.page {
	text-align: right;
}
</style>
</head>

<body>
	<div>
		<h2>废标项目</h2>
		<table class="table table-hover">
			<tr>
				<td>发布人</td>
				<td class="title">标题</td>
				<td class="content">内容</td>
				<td>发布时间</td>
				<td>截止时间</td>
				<td>开标时间</td>
				<td>招标金额</td> </tr>
				<c:forEach items="${list}" var="v">
				<tr>
					<td>${v.publisher}</td>
					<td>${v.title}</td>
					<td>${v.content}</td>
					<td><span class="date">${v.applydate}</span></td>
					<td><span class="date">${v.finishdate}</span></td>
					<td><span class="date">${v.opentime}</span></td>
					<td>${v.zbmoney}</td>
					</tr>
			</c:forEach>
		</table>

	</div>
	<div class="page">
		<ul class="pagination">
			<li><a href="/mavenfst/feibiao/1">首页</a></li>
			<li><a href="/mavenfst/feibiao/${pg.pageNum-1}"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="/mavenfst/feibiao/${pg.pageNum}">${pg.pageNum}</a></li>
			<li><a href="/mavenfst/feibiao/${pg.pageNum+1}"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
			<li><a href="/mavenfst/feibiao/${pg.pages}">末页</a></li>
		</ul>
	</div>
</body>
</html>
