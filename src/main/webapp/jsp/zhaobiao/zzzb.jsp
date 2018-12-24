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

<title>My JSP 'zzzb.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/zbstyle.css" />

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
						minute = Math.floor(times / 60) - (day * 24 * 60)- (hour * 60);
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
	function goToPage(page) {

		var title = document.getElementById("title").value;

		window.location.href = "${cxt}/${path}?page=" + page + "&title="
				+ title;
	}
	function goToPage2(page) {

		var title = document.getElementById("title").value;

		window.location.href = "${cxt}/search?page=" + page + "&title="
				+ title;
	}
</script>

</head>

<body>
	<div class="table_ss" id="zbSearch">正在招标查询</div>
	<form method="get" action="" name="fmName" id="fmName">
		<table border="0" cellspacing="0" cellpadding="0" style="text-align: center;">
			<tr style="width: 100%;">
				<td><input type="text" name="title" id="title" value="${title==null?'':title}"/></td>
				<td class="right_2"><span class="ts_div_tr1"><a
						href="javascript:goToPage2(1)"><input type="button"
							value="搜索" id="search" /></a> </span></td>
							<td><c:if test="${empty list}">
					<span>查询结果为空</span>
					</c:if></td>
			</tr>
		</table>
	</form>
	<!--搜索结果-->
	<h5>查询结果</h5>
	<div id="searchResult" class="searchResult">
		<div class="container_div2_div_ul2 clearL " id="list">
			<table class="table-striped table-hover" width="100%"
				cellspacing="0" cellpadding="0" border="0">
				<tbody>
					<tr class="table_tr">
						<td style="padding-left:120px">标题</td>
						<td style="padding-left:85px">距离标书售卖截止时间</td>
					</tr>
					<c:forEach items="${list}" var="v">

						<tr style="width:100%;" class="_data_tr_flag active">
							<td style="width:75%" align="left"><a target="_blank" href="/mavenfst/show?id=${v.id}">${v.title}</a></td>
							<td style="width:25%;padding-left:50px;">还有<span
								class="timer">${v.finishdate}</span></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
		<div class="page">
			<ul class="pagination">
				<c:if test="${pg.pageNum ne 1}">
					<li><a href="javascript:goToPage(1)">首页</a></li>
					<li><a href="javascript:goToPage(${pg.pageNum-1})"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<li><a href="javascript:goToPage(${pg.pageNum})">${pg.pageNum}</a></li>
				<c:if test="${pg.pages ne pg.pageNum}">
					<li><a href="javascript:goToPage(${pg.pageNum+1})"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
					<li><a href="javascript:goToPage(${pg.pages})">末页</a></li>
				</c:if>
			</ul>
		</div>

	</div>
</body>
</html>
