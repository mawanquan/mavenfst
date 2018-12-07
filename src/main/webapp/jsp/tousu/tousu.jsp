<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>我要投诉</title>
		
		<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
		<script type="text/javascript">
		function one(){
		
		alert("提交成功");
		
		}
		
		</script>
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
  </head>
 
  
  <body class="klyt">
		<form action="/mavenfst/insertComplain" method="post">
			<div style="margin:0px auto;" class="keleyitable">
				<h2>投诉建议</h2>

				<table>
					
					<tr>
						<td class="klytd">投诉人：</td>
						<td><input name="name" class="hvttd" type="text" /> </td>
					</tr>
					<tr>
						<td class="klytd">标题：</td>
						<td><input name="caption" class="hvttd" type="text" /> </td>
					</tr>
					<tr>
						<td class="klytd2">内容：</td>
						<td class="hvttd2"><textarea name="content" cols="60" rows="20"></textarea></td>
					</tr>

				</table>
				
				<input  class="hvttd3" type="submit" value="提交" onclick="one()" />
			</div>	
		</form>

	</body>
</html>
