<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
	 <base href="<%=basePath%>">
    <title>中国招标网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
		<link href="${css}bootstrap.min.css" rel="stylesheet">
		<link href="${css}my.css" rel="stylesheet">
		<script src="${js}jquery-2.0.0.min.js"></script>
		<script src="${js}bootstrap.min.js"></script>
		<script type="text/javascript">
			function getNow() {
				var now = new Date();
				document.getElementById("time").innerHTML = now.toLocaleString();
				setTimeout(getNow, 1000);
			}
		</script>
	</head>

	<body onload="getNow()">
		<!--***********************头部************************-->
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
		<!--  -->
	</body>

</html>
