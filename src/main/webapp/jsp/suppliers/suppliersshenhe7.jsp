<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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

<title>My JSP 'MyJsp.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>黑名单企业</title>
<link rel="stylesheet" type="text/css" href="${css}/bootstrap.min.css" />
<style>
</style>

</head>

<body style="width:600px;height:800px">
	<table
		class="table table-striped  table-striped table-bordered table-hover"
		style="text-align: center;">
		<tr>
			<td>商品ID</td>

			<td>公司名称</td>

			<td>公司地址</td>

			<td>公司电话</td>
			<td>联系人姓名</td>

			<td>操作</td>
		</tr>
		<!-- 遍历商品内容 -->
		<c:forEach items="${list }" var="c">
			<tr>
				<td>${c.supplierid}</td>
				<td>${c.suppliername}</td>

				<td>${c.address }</td>
				<td>${c.supplierstel }</td>
				<td>${c.lianxirenname }</td>
				<td><a class="btn  btn-primary" id="butjson"
					href="<%=path %>/selectone/${c.supplierid}/suppliersxinxi7">查看</a>
					
			</tr>
		</c:forEach>
	</table>

</body>
</html>
