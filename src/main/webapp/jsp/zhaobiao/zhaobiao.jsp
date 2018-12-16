<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>招标详情</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" /> -->
<%--  <link href="${css}my.css" rel="stylesheet"> --%>
<link rel="stylesheet" type="text/css" href="css/zbstyle.css" />
<script src="${js}bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	function getNow() {
		var now = new Date();
		document.getElementById("time").innerHTML = now.toLocaleString();
		setTimeout(getNow, 1000);
	}
	/* function clickKaibiao(obj) {
		$(obj).parent().addClass("table_tit");
		$(obj).parent().siblings().removeClass("table_tit");
		$("#zbSearch").text($(obj).text() + "查询");
	}
	 */
	$(function() {
		$(".li" + ${active}).addClass("table_tit");
	})
</script>
</head>

<body onload="getNow()">
	<!-- 头部 -->
<%-- 	<jsp:include page="/jsp/jiapage/denglu.jsp"></jsp:include> --%>
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
	<div id="total" class="container">
	

		<!-- ============================= -->

		<div id="content">
			<table class="table" width="100%" border="0" cellspacing="0"
				cellpadding="0">
				<tr>

					<td class="table_td1">
						<ul>
							<li class="li1"><a href="<%=path%>/data?page=1" id="zzai">正在招标</a></li>
							<li class="li2"><a href="<%=path%>/data2/1" id="jijiang">即将开标</a></li>
							<li class="li3"><a href="<%=path%>/data3/1" id="gongshi">正在候选人公示</a></li>
						</ul>
					</td>
					<td class="include">
						<div class="right">
							<jsp:include page="${data}"></jsp:include></div>
					<td>
				</tr>
			</table>

		</div>
		<div class="footer">
			<p>
				京ICP备05002571号 | 阳光招标公司版权所有<br> 技术支持工作时间（工作日）：上午 9：00~12：00 下午
				13：00~18:00<br>
		</div>

	</div>
</body>

</html>