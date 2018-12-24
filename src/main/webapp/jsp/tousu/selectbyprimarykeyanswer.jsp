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
	
	<link href="${css}bootstrap.min.css" rel="stylesheet">
		<link href="${css}my.css" rel="stylesheet">
		<script src="${js}jquery-2.0.0.min.js"></script>
		<script src="${js}bootstrap.min.js"></script>

</head>

<body>

<div class="container">
		<table class="table table-hover table-bordered  table-condensed">
			<tr>
				<td>id</td>

				<td>${answer.complain.id }</td>
			</tr>
			<tr>
				<td>投诉人</td>
				<td>${answer.complain.name }</td>
			</tr>
			<tr>
				<td>标题</td>
				<td>${answer.complain.caption }</td>
			</tr>
			<tr>
				<td>内容</td>
				<td>${answer.complain.content}</td>
			</tr>
			<tr>
				<td>回复人</td>
				<td>${answer.admin.adminname }</td>
			</tr>
			<tr>
				<td>回复内容</td>
				<td>${answer.answercontent }</td>
			</tr>
			
			
		</table>
		
	</div>
	
	<input onclick="window.location.href='/mavenfst/selectanswer?page=1'"  class="btn btn-success" type="button" value="返回"  />
<!--************************尾****************************8-->
		<div class="container-fluid ">
			<div class="tail">
				<div class="row">
					<div class="col-md-4 tail-1">
					</div>
					<div class="col-md-5 tail-2">
						<li>
							<p>京IQP备05002571号 | 热吧招标版权所有</p>
						</li>
						<li>
							<p>技术支持工作时间（工作日）：上午 9：00~12：00 下午 13：00~18:00</p>
						</li>
					</div>
					<div class="col-md-3 tail-3">
					</div>
				</div>
			</div>
		</div>

</body>


</html>
