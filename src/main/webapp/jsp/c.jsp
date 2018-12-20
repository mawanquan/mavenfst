<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'c.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css">
	
	<script src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript">
$(function() {
$(".ddate").each(function(){
var d = new Date($(this).text());
					$(this).text(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ d.getDate() + "日");
});
					

	});
	</script>
</head>

<body>

	<table class="table table-striped  table-striped table-bordered table-hover"
		style="text-align: center;">
		<tr>
		    <td>标题</td>
		    <td>时间</td>
		    <td>内容</td>
		</tr>
		<tr>
			<td>${proclamation.title}</td>
			<td class="ddate">${proclamation.time}</td>
			<td>${proclamation.comment}</td>
			<td><a href="/mavenfst/updateproclamaltion"><input type="submit" value="修改"/></a></td>
		</tr>
		
	</table>
	
</body>
</html>
