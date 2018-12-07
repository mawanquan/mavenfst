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
<title>财务审核通过,待交保证金</title>
<link rel="stylesheet" type="text/css" href="${css}/bootstrap.min.css" />
<style>
</style>

</head>

<body style="width:600px;height:800px">
	<fieldset>
		<legend>审核</legend>
<table
			class="table table-striped  table-striped table-bordered table-hover"
			style="text-align: center;">

			<tr>
				<td>供货商名称</td>
				<td>${suppliers.suppliername}</td>
				
	
			<tr>
				<td>供货商邮箱</td>
				<td>${suppliers.suppliersemail}</td>
			</tr>
			<tr>
				<td>供货商地址</td>
				<td>${suppliers.address }</td>
			</tr>
			<tr>
				<td>供货商联系电话</td>
				<td>${suppliers.supplierstel }</td>
			</tr>

			<tr>
				<td>法人姓名</td>
				<td>${suppliers.farename }</td>
			</tr>
			<tr>
				<td>法人姓名身份证号</td>
				<td>${suppliers.farenid }</td>
			</tr>
			<tr>
				<td>联系人姓名</td>
				<td>${suppliers.lianxirenname }</td>
			</tr>
			<tr>
				<td>联系人邮箱</td>
				<td>${suppliers.lianxinrenemail }</td>
			</tr>
			<tr>
				<td>保证金</td>
				<td>${suppliers.bail }</td>
			</tr>
			<tr>
			<td><a  class="btn  btn-primary" id="butjson"
					href="<%=path %>/updateSign5/${suppliers.supplierid}">审核通过</a></td>

		
			<td><a  class="btn  btn-primary" id="butjson"
					href="<%=path %>/updateSign6/${suppliers.supplierid}">审核不通过</a></td>
			
			</tr>
		</table>


	</fieldset>

</body>
</html>
