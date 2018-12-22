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
    
    <title>My JSP 'xiugai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
  </head>

  <body class="bg-danger">
     <form action="<%=path%>/goods/xiugai" method="post">
  <fieldset><legend class="text-info" style="font-size:20px;">修改物资</legend>
  
  <input type="hidden" name="id" value="${list.id}">
  <div align="center" style="font-size: 20px;">
  <div style="margin:15px"><span>物&nbsp资:</span><span><input type="text" name="goodsname" value="${list.goodsname}"></span></div>
    <div style="margin:15px"><span>编&nbsp码:</span><span><input type="text" name="goodscode" value="${list.goodscode}"></span></div>
  <div style="margin:15px"><span>型&nbsp号:</span><span><input type="text" name="type" value="${list.type}"></span></div>
  <div style="margin:15px"><span>单&nbsp位:</span><span><input type="text" name="unit" value="${list.unit}"></span></div>
  <input type="submit" style="margin:15px" value="确认修改">
  </div>
  </fieldset>
  </form>
  </body>
</html>
