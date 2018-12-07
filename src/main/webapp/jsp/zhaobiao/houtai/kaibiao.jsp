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

<title>My JSP 'kaibiao.jsp' starting page</title>

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
<style type="text/css">
html, html body, td {
	font: 12px/1.5 'Microsoft YaHei', '宋体', STHeiti, Verdana, Arial,
		Helvetica, sans-serif;
}

</style>
</head>

<body>
	<table class="table">
		<tr>
			<td>发布人</td>
			<td class="title">标题</td>
			<td class="content">内容</td>
			<td>招标金额</td> </tr>
		<tr>
				<td>${d.publisher}</td>
				<td>${d.title}</td>
				<td>${d.content}</td>
				<td>${d.zbmoney}</td>
			</tr>
	</table>
</body>
</html>
