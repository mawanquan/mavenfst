<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="UTF-8">
		<title>管理员公告</title>
		<style type="text/css">
			div{
				padding: 100px;
				background-color: aquamarine;
				
			}
			#w1 li{
			   line-height=10px;
			   list-style: none;
			 
				
			}
			#w1 li a{
				
				  text-decoration: none;
			}
			#w{
				float: right;
				
			}
		</style>
		
	
    
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
     <div  id="w1">
		   	    <ul>
					<li><a href="proclamation.jsp">11.1      管理员公告1</a></li>
				</ul>
				  
				<ul>
					<li><a href="proclamation2.jsp">11.1      管理员公告2</a></li>
				</ul>
                <ul>
					<li><a href="proclamation3.jsp">11.1      管理员公告3</a></li>
				</ul>
                <ul>
					<li><a href="proclamation.jsp">11.1      管理员公告4</a></li>
				</ul>
                <ul>
					<li><a href="proclamation2.jsp">11.1      管理员公告5</a></li>
				</ul>
                <ul>
					<li><a href="proclamation3.jsp">11.1      管理员公告6</a></li>
				</ul>
                <ul id="w">
					<li><a href="">退出</a></li>
				</ul>
				</div>
  </body>
</html>
