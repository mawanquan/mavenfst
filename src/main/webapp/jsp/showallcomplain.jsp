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


<body>
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
						<button onclick="window.location.href='/mavenfst/jsp/tousu/answer.jsp?id=${v.id}'" type="button" class="btn btn-success">回复</button>
					</td>


				</tr>
			</c:forEach>
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


</body>
</html>
