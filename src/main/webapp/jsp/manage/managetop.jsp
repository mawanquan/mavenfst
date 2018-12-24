<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'maventop.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="${css}/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
	<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>

  </head>
  
 <body style="background:url(images/topbg.gif) repeat-x;">
    <div class="topleft">
    <a href="${cxt}/jsp/manage/manage.jsp" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
    <div class="topright">    
    <ul>
    <li><a href="login.html" target="_parent">退出</a></li>
    </ul>
    
    <div class="user">
    <span>admin</span>
    </div>    
    </div>
</body>
</html>
