<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'selectgoodsprice.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.min.css">

<style type="text/css">


.container {
	height:150px;
}
</style>

</head>

<body>

	<div class="container">
		<table class="table table-hover table-bordered  table-condensed">
			<tr>
			<td>月份</td>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>7</td>
				<td>8</td>
				<td>9</td>
				<td>10</td>
				<td>11</td>
				<td>12</td>
				
			</tr>
			<tr>
			<td>num</td>
			<c:forEach items="${list5}" var="v">
				
					<td>${v}</td>
				

			</c:forEach>
</tr>
		</table>
	</div>

	<script src="${js }/code/highcharts.js"></script>
	<script src="${js }/code/highcharts-3d.js"></script>
	<script src="${js }/code/modules/exporting.js"></script>

	<div id="container" style="height: 400px"></div>


	<script type="text/javascript">
		Highcharts
				.chart(
						'container',
						{
							chart : {
								type : 'column',
								options3d : {
									enabled : true,
									alpha : 10,
									beta : 25,
									depth : 70
								}
							},
							title : {
								text : '各月采购情况'
							},
							subtitle : {
								text : ''
							},
							plotOptions : {
								column : {
									depth : 25
								}
							},
							xAxis : {
								categories : Highcharts.getOptions().lang.shortMonths
							},
							yAxis : {
								title : {
									text : null
								}
							},
							series : [ {
								name : '数量',
								data : ${list5}
							} ]
						});
	</script>

</body>
</html>
