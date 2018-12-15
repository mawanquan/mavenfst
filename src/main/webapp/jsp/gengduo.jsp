<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'gengduo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css">
	<script src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript">
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
		</tr>
		<c:forEach items="${list }" var="v">
			<tr id="${v.id}">
				<td>${v.id}</td>
				<td>${v.number}</td>
				<td>${v.title}</td>
				<td class="tdate">${v.time}</td>
				<td>${v.comment}</td>
			
			</tr>
		</c:forEach>
		<tr>
		  <a href="mavenfst/home.jsp"><input type="button" >退出</a>
		</tr>
		</table>
  </body>
</html>
