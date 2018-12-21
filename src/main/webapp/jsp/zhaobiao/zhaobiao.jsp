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
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />  -->
<link rel="stylesheet" type="text/css" href="css/zbstyle.css" />
<%-- <script src="${js}bootstrap.min.js"></script> --%>
<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	
	/* function clickKaibiao(obj) {
		$(obj).parent().addClass("table_tit");
		$(obj).parent().siblings().removeClass("table_tit");
		$("#zbSearch").text($(obj).text() + "查询");
	} onload="getNow()"
	 */
	$(function() {
		$(".li" + ${active}).addClass("table_tit");
	})
</script>
</head>

<body>
	<!-- 头部 -->

	<%-- <jsp:include page="/jsp/jiapage/denglu.jsp"></jsp:include> --%>
	<div id="total" class="container">
<jsp:include page="/jsp/jiapage/denglu.jsp"></jsp:include><!--引入首页头部  -->
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