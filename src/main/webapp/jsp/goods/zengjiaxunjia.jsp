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
    
    <title>My JSP 'zengjiaxunjia.jsp' starting page</title>
    
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
  
  <body style="background-color:#FFFF99 ">
  <form action="<%=path%>/goods/zengjia" method="post">
  <fieldset><legend style="font-size: 30px;">添加</legend>
  <table class="table table-bordered">
  <tr><td>标 题:</td><td><input type="text" name="goodstitle"></td></tr>
 <tr><td>发 布 人:</td><td><select name="adminname"><option value="0" selected="selected">请选择</option> 
			<c:forEach items="${list2}" var="a"><option>${a.adminname}</option></c:forEach> 
 				</select></td></tr>
 <tr><td>截 止 日 期:</td><td><input type="text" name="lastdate"></td></tr>
  <tr><td>物 资:</td><td><select name="goodsname"><option value="0" selected="selected">请选择</option> 
			<c:forEach items="${list}" var="b"><option>${b.goodsname}</option></c:forEach> 
 				</select></td></tr>
  <tr><td>数 量:</td><td><input type="text" name="num"></td></tr>
 <tr><td> 采 购 时 间:</td><td><input type="text" name="getdate"></td></tr>
<tr><td><input align="middle" style="font-size: 20px" type="submit" value="提交"></td></tr>
</table>

</fieldset>
</form>
  </body>
</html>
