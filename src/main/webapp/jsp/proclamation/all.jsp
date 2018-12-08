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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="${js}/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	function atime() {

		var mydate = new Date();
		alert(mydate.toLocaleDateString());
		document.getElementById("time").value = mydate.toLocaleDateString();

	}
</script>
</head>
<body>
	<form action="/mavenfst/insertproclamation" method="post">
		<table>
			
			<tr>
				<td>标题：</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>时间：</td>
				<td><input name="time" id="time" onclick="atime()"></td>
			</tr>
			<tr>
				<td>公告内容：</td>
				<td><textarea rows="10" cols="20" name="comment"></textarea></td>
			</tr>
			<tr>
				<td>对应路径：</td>
				<td><input type="file" name="filepath"></td>
			</tr>
			<tr>
				<td>发布：</td>
				<td><input type="submit" value="提交"></td>
			</tr>
		</table>
	</form>

</body>

</html>
