<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'c.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css">
	
	<script src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript">
function dtime() {
	  
		var mydate = new Date();
		alert(mydate.toLocaleDateString());
		document.getElementById("time").value = mydate.toLocaleDateString();

	}
	</script>
</head>

<body>
    <form action="${cxt}/updateproclamaltion" method="post">
	
		<div>
		     <input type="hidden" name="id"  value="${proclamation.id}" />
		</div>
		<div>
		<input type="hidden" name="number" value="${proclamation.number}">
		</div>
		<div>
		    <label>标题:</label>
		    <div><input type="text" name="title"
						value="${proclamation.title}" /></div>
		</div>
		<div>
		   <label>内容:</label>
		 <div><input type="text" name="comment"
						value="${proclamation.comment}" /></div>
		</div>
		<div>
		    <input id="time" name="time" onclick="dtime()" value="${proclamation.time}">
		</div>
		<div>
		<input type="submit" value="修改"/>
		</div>
	
	</form>
</body>
</html>
