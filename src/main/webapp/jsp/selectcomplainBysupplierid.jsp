<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'selectcomplainBysupplierid.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<div class="container">
		<table class="table table-hover table-bordered  table-condensed">
			<tr>
				<td>标题</td>
				<td>是否回复</td>
				<td>回复内容</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${list3}" var="v">
					<td>${v.caption }</td>
					<td>
					<c:choose>
					<c:when test="${v.answer.answercontent!=null }">已回复</c:when>
					<c:otherwise>未回复</c:otherwise>
					</c:choose>
					</td>
					<td>${v.answer.answercontent }</td>
					<td>
						<button onclick="window.location.href='/mavenfst/selectcomplainById?id=${v.id}'" type="button" class="btn btn-info">查看</button>
					</td>
				</tr>
				
			</c:forEach>
  </body>
</html>
