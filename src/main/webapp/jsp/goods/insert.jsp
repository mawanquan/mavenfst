<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'insert.jsp' starting page</title>
    
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
   <form action="<%=path%>/goods/insertgoods" method="post">
   <fieldset ><legend>增加物品</legend>
   物资<input type="text" name="goodsname"><br>
  编码 <input type="text" name="goodscode"><br>
 型号<input type="text" name="type"><br>
 单位<input type="text" name="unit"><br>
  数量<input type="text" name="num"><br>
 截止日期<input type="text" name="getdate"><br>
   <input type="submit" value="提交">
   </fieldset>
   </form>
  </body>
</html>
