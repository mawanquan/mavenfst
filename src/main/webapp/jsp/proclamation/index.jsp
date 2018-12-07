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
<meta charset="utf-8">
<title>系统公告</title>
<style type="text/css">


#s {
	
	float: right;
}
</style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css">
	

</head>

<body>
	<table
		class="table table-striped  table-striped table-bordered table-hover"
		style="text-align: center;">

		<tr>
			
			<td><a href="/mavenfst/selecta">管理员公告內容</a></td>

		</tr>



		<c:forEach items="${list }" var="v">
			<tr>
                
				<td><a id="ok"> ${v.title}</a></td>
				<td><a href="${cxt }/ajaxdelbyid/${v.id}"><input
						type="button" value="查看"></a></td>
			</tr>
		</c:forEach>

	
		<tr>
		<td id="s"><a href="/mavenfst/select"><input type="button"
					value="查询"></a><a href=""><input type="button" value="退出"></a></td>
			
		</tr>
	</table>
</body>
</html>
