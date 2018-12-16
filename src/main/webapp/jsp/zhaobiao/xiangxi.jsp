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

<title>My JSP 'xiangxi.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/zbstyle.css" />
<script src="${js}bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	function getNow() {
		var now = new Date();
		document.getElementById("time").innerHTML = now.toLocaleString();
		setTimeout(getNow, 1000);
	}
	$(function() {

		$(".date").each(
				function() {

					var d = new Date($(this).text());
					$(this).text(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ d.getDate() + "日");

				});
		$(".path").each(function() {
			var d = $(this).text();
			$(this).text(d.substr(d.lastIndexOf('/') + 1));
		});
	});
	/* $(function(){
		$(".path").each(
				function() {
					var d = $(this).text();
					$(this).text(d.substr(d.lastIndexOf('/')+1));
				});
	}) */
</script>
<style type="text/css">
hr {
	margin: 5px 0;
	border: 0;
	border-top: 1px solid #eee;
	border-bottom: 20px solid #fff;
}

h1 {
	text-align: center;
	margin: 50px;
}

p {
	text-indent: 2em;
}

.essay {
	
}
</style>
</head>

<body onload="getNow()">
	<div id="total" class="container">
			<!-- 头部   style="width: 70%;-->
	<!--***********************头部************************-->
	<div class="header">
		<div class="container-fluid">
			<!---------------------------头上------------------------------>
			<div class="top-bar">
				<div class="row">
					<div class="col-xs-4">
						<div class="top-bar-1 ">
							<img src="images/img/mobile.png" />
						</div>
					</div>
					<div class="col-xs-5 top-bar-2 " id="time"></div>
					<div class="col-xs-3">
						<div class="top-bar-3 ">

							<form class="navbar-form  form-inline">

								<div class="form-group"
									style="width: 20px; position: relative;left:-20px">
									<input type="text" class="form-control" placeholder="关键字搜索">
								</div>
								<button type="submit" class="btn btn-default  "
									style="position: relative;left: 160px">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</form>

						</div>
					</div>
				</div>
			</div>
			<!---------------------------头下------------------------------>
			<div class="top-bot">
				<nav class="navbar navbar-default top-bot-col">
					<div class="container-fluid ">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav  top-bot-1 ">
								<li class="active"><a href="${cxt}/jsp/home.jsp"><span
										class="glyphicon glyphicon-home"></span>&nbsp;首页</a></li>
								<li><a href="${cxt}/jsp/jiapage/caigougonggao.jsp">招标采购公告</a>
								</li>
								<li><a href="${cxt}/jsp/jiapage/gongyingshanggonggao.jsp">供应商公告</a>
								</li>
								<li><a href="/mavenfst/selectcomplain?page=1">投诉中心</a></li>
								<li><a href="${cxt}/jsp/jiapage/fuwuzhongxin.jsp">服务中心</a>
								</li>
								<li><a href="${cxt}/jsp/jiapage/falvshengming.jsp">法律声明</a>
								</li>
							</ul>

						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
		<!-- ======================================== -->
		<div id="mid" style="height:auto;">
			<table class="zb_table" width="100%" border="0" cellspacing="0"
				cellpadding="0">
				<tbody>
					<tr>
						<td colspan="2">
							<div style=" display: block; float:right;margin-bottom:10px;">
								<img src="/mavenfst/images/print.gif" onclick="printView()">
							</div>
						</td>
					</tr>
					<tr style="text-align:center">
						<td colspan="2">
							<h1>${df.title}</h1>
							<hr style="color: purple;">
						</td>
					</tr>
					<tr class="essay">
						<td style="padding: 0px 40px;"><span style="font-size: 16px;">
								<p>${df.content}</p>

						</span> <span style="font-size:16px;"><p>招标金额:￥${df.zbmoney}</p></span> <span
							style="font-size:16px;"><p>
									截止时间:<span class="date">${df.finishdate}</span>
								</p>
								<p>
									开标时间:<span class="date">${df.opentime}</span>
								</p> <c:if test="${df.sign eq 2}">中标单位:${df.hit}</c:if> </span></td>
					</tr>
					<tr class="essay">
						<td style="padding-right: 40px;">
							<div>
								<span style="font-size:12px;float:right; clear:both;">采购人/招标代理机构：中国移动通信集团湖南有限公司衡阳分公司/宁夏信友监理咨询管理股份有限公司</span>
							</div>
							<div>
								<span style="font-size:14px;float:right; clear:both;"
									class="date">${df.applydate}</span>
							</div>
						</td>
					</tr>
					<tr>
						<td style="padding: 0px 40px;font-size: 12px;"><c:forEach
								items="${listfile}" var="v" varStatus="n">
								附件${n.count}:<a target="_blank" class="path"
									href="/mavenfst/preview?id=${v.id}">${v.filepath}</a>
								<br>
							</c:forEach></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="footer">
			<p>
				京ICP备05002571号 | 中国移动通信版权所有<br> 技术支持工作时间（工作日）：上午 9：00~12：00 下午
				13：00~18:00<br>
		</div>

	</div>
</body>

</html>