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
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
  </head>
  
  <body class="bg-warning" style="background-color: #00FF66">
   
   <form action="<%=path%>/goods/insertgoods" method="post">
   <fieldset ><legend style="font-size: 30px;">增加物品</legend>
  <div align="center" style="font-size: 20px;">
   物&nbsp资<input type="text" name="goodsname" style="margin: 10px"><br>
  编&nbsp码<input type="text" name="goodscode" style="margin: 10px"><br>
 型&nbsp号<input type="text" name="type" style="margin: 10px"><br>
单&nbsp位<input type="text" name="unit" style="margin: 10px"><br>
   <input type="submit" value="提交">
   </div>
   </fieldset>
   </form>
   
  </body>
</html>
