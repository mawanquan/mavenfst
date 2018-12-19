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
	<table class="table table-hover">
		<tr>
			<td>发布人</td>
			<td class="title">标题</td>
			<td class="content">内容</td>
			<td>招标金额</td>
			<td></td>
		</tr>
		<tr>
			<td>${d.publisher}</td>
			<td>${d.title}</td>
			<td>${d.content}</td>
			<td>${d.zbmoney}</td>
			<td><a href="${cxt}/feibiaoset?id=${d.id}"><button
						type="button" class="btn btn-primary">废标</button></a></td>
		</tr>
	</table>
	<br>
	<br>
	<table class="table table-hover">
		<tr>
			<td>供货商姓名</td>
			<td>供货商电话</td>
			<td>地址</td>
			<td>供货商email</td>
			<td>联系人姓名</td>
			<td>联系人email</td>
			<td>法人姓名</td>
			<td>投标报价</td>
			<td>投标文件</td>
			<td>中标</td>
		</tr>

		<c:forEach items="${list}" var="v">
			<tr>
				<td>${v.suppliers.suppliername}</td>
				<td>${v.suppliers.supplierstel}</td>
				<td>${v.suppliers.address}</td>
				<td>${v.suppliers.suppliersemail}</td>
				<td>${v.suppliers.lianxirenname}</td>
				<td>${v.suppliers.lianxinrenemail}</td>
				<td>${v.suppliers.farename}</td>
				<td>${v.zbbj}</td>
				<td><table>
						<c:forEach items="${v.lisjoinzbfile}" var="s">
							<tr>
								<td>${s.filename}<a target="_blank"
									href="/mavenfst/houtaipreview?filepath=${s.filepath}">预览</a></td>
							</tr>
						</c:forEach>
					</table></td>
				<td><a
					href="/mavenfst/zhongbiao?id=${d.id}&hit=${v.suppliers.supplierid}"><button
							type="button" class="btn btn-primary btn-xs">中标</button></a></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>