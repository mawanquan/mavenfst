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

<title>后台正在招标项目</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="${cxt }/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		var date1 = new Date();

		$(".timer").each(
				function() {

					var d = new Date($(this).text());
					var times = (d.getTime() - date1.getTime()) / 1000;
					var day = 0, hour = 0, minute = 0, second = 0;//时间默认值
					if (times > 0) {
						day = Math.floor(times / (60 * 60 * 24));
						hour = Math.floor(times / (60 * 60)) - (day * 24);
						minute = Math.floor(times / 60) - (day * 24 * 60)
								- (hour * 60);
					}
					if (day <= 9) {
						day = '0' + day;
					}
					if (hour <= 9) {
						hour = '0' + hour;
					}
					if (minute <= 9) {
						minute = '0' + minute;
					}
					$(this).text(day + "天" + hour + "时" + minute + "分");

				});
	});
</script>
<style type="text/css">
html, html body, td {
	font: 12px/1.5 'Microsoft YaHei', '宋体', STHeiti, Verdana, Arial,
		Helvetica, sans-serif;
}

.page {
	text-align: right;
}
</style>
</head>

<body>
	
	<!--搜索结果-->
	<h1>正在招标项目</h1>
	<div id="searchResult" class="searchResult">
		<div class="container_div2_div_ul2 clearL " id="list">
			<table class="table table-striped table-hover" width="100%"
				cellspacing="0" cellpadding="0" border="0">
				<tbody>
					<tr class="">
						<td style="padding-left:120px">标题</td>
						<td style="padding-left:85px">距离招标截止时间</td>
					</tr>
					<c:forEach items="${list}" var="v">
						<tr style="width:100%;" class="">
							<td style="width:75%" align="left"><a
								href="/mavenfst/show?id=${v.id}">${v.title}</a></td>
							<td style="width:25%;padding-left:50px;">还有<span
								class="timer">${v.opentime}</span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="page">
			<ul class="pagination">
				<li><a href="/mavenfst/zhengzaizb/1">首页</a></li>
				<li><a href="/mavenfst/zhengzaizb/${pg.pageNum-1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="/mavenfst/zhengzaizb/${pg.pageNum}">${pg.pageNum}</a></li>
				<li><a href="/mavenfst/zhengzaizb/${pg.pageNum+1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
				<li><a href="/mavenfst/zhengzaizb/${pg.pages}">末页</a></li>
			</ul>
		</div>
	</div>

</body>
</html>
