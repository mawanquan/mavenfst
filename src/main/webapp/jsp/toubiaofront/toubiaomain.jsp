<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'toubiaomain.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/zbstyle.css" />
<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	
</script>

</head>




<body>
	<div id="total" class="container">

		<div id="header" class="nav">
			<!--头部内嵌首页-->

		</div>
		<div id="content">
			<table class="table" width="100%" border="0" cellspacing="0"
				cellpadding="0">
				<tr>

					<td class="table_td1">
						<ul>
							<li class="li1"><a href="<%=path%>/bids/zhaobiaoall?page=1" id="zzai">正在招标</a></li>
							<li class="li1"><a href="<%=path%>/bids/toubiaoall">我的投标</a></li>
							<li class="li1"><a href="<%=path%>/selectsuppliers">我的信息</a></li>
							<li class="li1"><a href="<%=path%>/lihai">我的投诉</a></li>
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
