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

<title>My JSP 'a.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css">
	

<script src="js/jquery-2.0.0.min.js"></script>
<style type="text/css">
   #e{
      float: right;
   };

</style>
<script type="text/javascript">
	function del(id) {
		if (confirm("是否删除")) {

			var url = "ajaxdelbyid";
			$.post(url, {
				"id" : id
			}, function(reg) {
				if (reg > 0) {
					$("#" + id).remove();
				}
			}, 'json')
		}
	}

$(function() {
$(".tdate").each(function(){
var d = new Date($(this).text());
					$(this).text(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ d.getDate() + "日");
});
					

	});
	
</script>

</head>

<body>
	<table class="table table-striped  table-striped table-bordered table-hover"
		style="text-align: center;">
		<tr>
			<td>id</td>
			<td>number</td>
			<td>title</td>
			<td>time</td>
			<td>comment</td>
			<td></td>
			<td></td>
		</tr>
		<c:forEach items="${list }" var="v">
			<tr id="${v.id}">
				<td>${v.id}</td>
				<td>${v.number}</td>
				<td>${v.title}</td>
				<td class="tdate">${v.time}</td>
				<td>${v.comment}</td>
				<td><a href="javascript:void(0)" onclick="del(${v.id})" id="ok"><input type="button" value="删除"></a></td>

				<td><a href="${cxt }/ajaxdelbyid11/${v.id}"  id="ok"><input type="button" value="修改"></a></td>
			</tr>
		</c:forEach>
		<tr id="e">
			<td ><a href="jsp/proclamation/all.jsp"><input type="button" value="添加"></a></td>
			<td><a href="jsp/proclamation/index.jsp"><input type="button" value="返回"></a></td>
		</tr>
		
	</table>
</body>
</html>
