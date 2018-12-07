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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.min.css">
</head>
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".date").each(
				function() {
					var d = new Date($(this).text());
					$(this).text(
							d.getFullYear() + "-" + d.getMonth() + "-"
									+ d.getDate());

				})
	});
</script>
<body>
	<div class="container">
		<table class="table table-hover table-bordered  table-condensed">
			<tr>
				<td>id</td>
				<td>回复人</td>
				<td>回复时间</td>
				<td>回复内容</td>
				<td>操作</td>

			</tr>
			<c:forEach items="${list2}" var="v">
				<tr>
					<td>${v.id}</td>
					
					<td></td>
			
					
					<td class="date">${v.answertime }</td>
					
					<td>${v.answercontent }</td>
					<td>
						<button type="button" class="btn btn-info">查看</button>
						<button type="button" class="btn btn-danger">刪除</button>
					</td>


				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<ul class="pager">
			<li><a href="/mavenfst/selectallanswer?page=1.html">首页</a></li>
			<li><a
				href="/mavenfst/selectallanswer?page=${pageInfo.pageNum-1 }">上一页</a></li>
			<li><a
				href="/mavenfst/selectallanswer?page=${pageInfo.pageNum+1 }">下一页</a></li>
			<li><a href="/mavenfst/selectallanswer?page=${pageInfo.pages }">末页</a></li>
		</ul>
	</div>


</body>
</html>
