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

</head>

<body>
	<div class="container">
		<table class="table table-hover table-bordered  table-condensed">
			<tr>
				<td>id</td>
				<td>${complain.id }</td>
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
	
	<input onclick="window.location.href='/mavenfst/selectcomplain?page=1'"  class="btn btn-success" type="button" value="返回"  />
</body>
</html>
