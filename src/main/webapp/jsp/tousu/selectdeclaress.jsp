<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<title>My JSP 'selectdeclaress.jsp' starting page</title>

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
	height: 150px;
}
</style>
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>

<script type="text/javascript">
function aaa(){
$("option").each(function() {
	if($(this).prop("selected")){
	window.location.href="${cxt}/selectdeclare?year="+$(this).val();
	}
	
})
}


</script>
</head>

<body>
<td>选择查询的年份</td>
	<select>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
	</select>
	<input onclick="aaa()" type="button" value="提交" />
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

	<script src="${js }/code/modules/exporting.js"></script>

	<div id="container"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>



	<script type="text/javascript">
		Highcharts
				.chart(
						'container',
						{
							chart : {
								type : 'column'
							},
							title : {
								text : '各月招标统计'
							},
							subtitle : {
								text : ''
							},
							xAxis : {
								categories : [ '1', '2', '3', '4',
										'5', '6', '7', '8', '9',
										'10', '11', '12' ],
								crosshair : true
							},
							yAxis : {
								min : 0,
								title : {
									text : 'num'
								}
							},
							tooltip : {
								headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
								pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
										+ '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
								footerFormat : '</table>',
								shared : true,
								useHTML : true
							},
							plotOptions : {
								column : {
									pointPadding : 0.2,
									borderWidth : 0
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
