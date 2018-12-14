<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>

		
		<style>
		
			.klyt {
				background-color: blanchedalmond;
			}
			
			.keleyitable {
				width: 600px;
				border-style: none;
			}
			
			.klytd {
				width: 100px;
				height: 30px;
				text-align: left;
			}
			
			.klytd2 {
				width: 100px;
				height: 50px;
				text-align: left;
			}
			
			.hvttd {
				width: 500px;
				height: 30px;
				text-align:left;
			}
			
			.hvttd2 {
				width: 500px;
				height: 300px;
				text-align: left;
			}
			
			.hvttd3 {
				width: 100px;
				height: 30px;
				text-align: center;
				float: right;
			}
			
			
		</style>
</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.min.css">
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
		<script type="text/javascript">
		
		$(function(){
		});
		function one(){
		
		alert("提交成功");
		
		}
		

</script>

</head>

<body class="klyt">
	<form action="/mavenfst/insertanswer">
		<div class="container">
			<table class="table table-hover table-bordered  table-condensed">

      
				
				<tr>
					<td>回复内容</td>
					<td class="hvttd2"><textarea name="answercontent" cols="60"
							rows="20"></textarea></td>
				</tr>
				<tr>
				<td>回复id</td>
				<td><input name="dlkfdkid" value='<%=request.getParameter("id") %>' > </td>
				
				
				</tr>
			</table>
			<input  class="hvttd3" type="submit" value="提交" onclick="one()" />
		</div>
		
	</form>
</body>
</html>
