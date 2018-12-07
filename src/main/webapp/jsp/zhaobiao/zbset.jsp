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

<title>My JSP 'zbset.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
	//删除行
	function delrow(t, id) {
		var b = confirm("是否删除");
		if (b) {
			//使用ajax删除
			$.get("/mavenfst/deletezb", {
				"id" : id
			}, function(data) {
				if (data) {
					$(t).parents("tr").remove();
				}

			});
		}
	}
</script>
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
		<h2>发布招标项目</h2>
		<table class="table table-hover">
			<tr>
				<td>发布人</td>
				<td class="title">标题</td>
				<td class="content">内容</td>
				<td>截止时间</td>
				<td>开标时间</td>
				<td>招标金额</td>
				<td class="edit">编辑</td>
			</tr>
			<c:forEach items="${list}" var="v">

				<tr>
					<td>${v.publisher}</td>
					<td>${v.title}</td>
					<td>${v.content}</td>
					<td><span class="date">${v.finishdate}</span></td>
					<td><span class="date">${v.opentime}</span></td>
					<td>${v.zbmoney}</td>
					<td><a href="<%=path%>/update?id=${v.id}"><button
								type="button" class="btn btn-primary btn-xs">修改</button></a>

						<button type="button" class="btn btn-primary btn-xs"
							onclick="delrow(this,${v.id})">删除</button></td>
					<td><a href="<%=path%>/fabuzb?id=${v.id}"><button
								type="button" class="btn btn-primary btn-xs">发布招标项目</button></a></td>
				</tr>
			</c:forEach>
		</table>

	</div>
	<div class="page">
		<ul class="pagination">
			<li><a href="/mavenfst/fabuzbset/1">首页</a></li>
			<li><a href="/mavenfst/fabuzbset/${pg.pageNum-1}"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="/mavenfst/fabuzbset/${pg.pageNum}">${pg.pageNum}</a></li>
			<li><a href="/mavenfst/fabuzbset/${pg.pageNum+1}"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
			<li><a href="/mavenfst/fabuzbset/${pg.pages}">末页</a></li>
		</ul>
	</div>
</body>
</html>
