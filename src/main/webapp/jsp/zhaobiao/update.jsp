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

<title>My JSP 'update.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="${cxt }/css/bootstrap.min.css" />
<script type="text/javascript" src="${cxt }/js/jquery-2.0.0.min.js"></script>

<style type="text/css">
.container {
	width: 50%;
}

#sub {
	background-color: #52b1dd;
	border: 0px;
}

div {
	height: 50px;
}
</style>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	$(function() {

		$(".path").each(function() {
			var d = $(this).text();
			$(this).text(d.substr(d.lastIndexOf('/') + 1));
		});
		
	});
	function delrow(t, id) {
		var b = confirm("是否删除");
		if (b) {
			//使用ajax删除
			$.get("/mavenfst/deletefile", {
				"id" : id
			}, function(data) {
				if (data=="") {
					$(t).parents("td").remove();
				}

			});
		}
	}
</script>
</head>

<body class="container">
	<div>
		<form action="${cxt}/xiugai" method="post"
			class="form-horizontal files" id="formid">
			<br> <br> <input type="hidden" name="id"
				class="form-control" value="${d.id}" />
				<input type="hidden" name="publisher" value="${d.publisher}" />
				<input type="hidden" name="sign" value="${d.sign}" />
				<input type="hidden" name="status" value="${d.status}" />
			<div class="">
				<label class="col-sm-2 control-label">标题:</label>
				<div class="col-sm-10">
					<input type="text" name="title" class="form-control"
						value="${d.title}" />
				</div>
			</div>
			<div class="">
				<label class="col-sm-2 control-label">内容:</label>
				<div class="col-sm-10">
					<input type="text" name="content" class="form-control"
						value="${d.content}" />
				</div>
			</div>
			<input id="date2" type="hidden" name="applydate" class="form-control"
				value="${d.applydate}" />

			<div class="">
				<label class="col-sm-2 control-label">截止时间:</label>
				<div class="col-sm-10">
					<input id="date2" type="datetime" name="finishdate0"
						class="form-control" value="${d.finishdate}" />
				</div>
			</div>
			<div class="">
				<label class="col-sm-2 control-label">开标时间:</label>
				<div class="col-sm-10">
					<input id="date3" type="datetime" name="opentime0"
						class="form-control" value="${d.opentime}" />
				</div>
			</div>
			<div class="">
				<label class="col-sm-2 control-label">招标金额:</label>
				<div class="col-sm-10">
					<input type="text" name="zbmoney" class="form-control"
						value="${d.zbmoney}" />
				</div>
			</div>

			<div class="">
				<label class="col-sm-2 control-label">招标文件:</label>
				<table>
				<tr>
				<c:forEach items="${listfile}" var="v" varStatus="n">
				<td>
						文件${n.count}:<span class="path">${v.filepath}</span><button  type="button" onclick="delrow(this,${v.id})">删除</button>
					</td>
				</c:forEach>
				</tr>
				</table>
			</div> 
			<div style="text-align: center;">
				<input id="sub" type="submit" value="修改" class="btn btn-primary" />
			</div>
		</form>
	</div>
</body>
</html>
