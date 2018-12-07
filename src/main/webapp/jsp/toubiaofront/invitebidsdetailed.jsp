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
<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		$(".date").each(
				function() {

					var d = new Date($(this).text());
					$(this).text(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ d.getDate() + "日");

				});
		$(".path").each(
				function() {
					var d = $(this).text();
					$(this).text(d.substr(d.lastIndexOf('/')+1));
				});
				
				$("#uploadthis").click(function(){
				var url="";
				$.post(url,
				{},function(){
				
				})
				
				})
				
				
				
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

h1 {
	
}

p {
	text-indent: 2em;
}

.essay {
	
}
</style>
</head>

<body>
	<div id="total" class="container"
		style="width: 70%; align-content: center;">

		<div id="header" class="nav">
			<!--头部内嵌首页-->

		</div>
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
						<td style="padding: 0px 40px;font-size: 12px;">
						<c:forEach items="${listfile}" var="v" varStatus="n">
						<input type="hidden" value="${v.id}" id="hiddenid">
								附件${n.count}:<a target="_blank" class="path" href="javascript:void(0)" >${v.filepath}</a><a style="padding-left: 20px;color: navy;" href="/mavenfst/preview?id=${v.id}">浏览</a>|<a style="color: navy;"   id="uploadthis" href="/mavenfst/bids/previewupload?id=${v.id}">下载</a>
								<br>
							</c:forEach>
							</td>
							<td style="width: 100px">
							    <a style="color:navy" href="${cxt}/bids/bidsaction?id=${df.id}">参与投标</a>
							</td>
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