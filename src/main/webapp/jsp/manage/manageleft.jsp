<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manageleft.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${css}/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
	<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	$('dd').find('ul').slideUp();
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
	
	
})	
</script>
  </head>
  
  <body style="background:#f0f9fd;">
  
  
  <div class="lefttop" style="background-image: url('images/lefttop.gif');" ><span></span>权限菜单</div>
  <c:forEach items="${lispremeau}" var="v">
    <dl class="leftmenu">
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>
    <li><cite></cite>${v.pre}</li>
    </div>
    	<ul class="menuson">
    	<c:forEach items="${v.listpremeau}" var="g">
        <li><cite></cite><a href="${cxt}${g.url}" target="rightFrame">${g.pre}</a><i></i></li>
        </c:forEach>
        </ul>    
    </dl>
    </c:forEach>
  </body>
</html>
