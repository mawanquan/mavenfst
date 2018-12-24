<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="${css}bootstrap.min.css" rel="stylesheet">
		<link href="${css}my.css" rel="stylesheet">
		<script src="${js}jquery-2.0.0.min.js"></script>
		<script src="${js}bootstrap.min.js"></script>

		<title>我要投诉</title>
		
		
		<script type="text/javascript">
		function one(){
		
		alert("提交成功");
		
		}
		
		</script>
		<style>
		
			
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
  <!--***********************头部************************-->
		<div class="header">
			<div class="container-fluid">
				<div class="top-bar">
					<div class="row">
						<div class="col-md-4">
							<div class="top-bar-1 ">
								<img src="images/img/mobile.png" />
							</div>
						</div>

						<div class="col-md-8">
							<div class="top-bar-3 ">
								<form class="navbar-form navbar-right ">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="关键字搜索">
									</div>
									<button type="submit" class="btn btn-default " style="">
										<span class="glyphicon glyphicon-search"></span>	
									</button>
								</form>

							</div>
						</div>
					</div>
				</div>
				<!---------------------------头下------------------------------>
				<div class="top-bot">
					<nav class="navbar navbar-default top-bot-col">
						<div class="container-fluid ">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								        <span class="sr-only">Toggle navigation</span>
								        <span class="icon-bar"></span>
								        <span class="icon-bar"></span>
								        <span class="icon-bar"></span>
						      		</button>
							</div>
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav top-bot-1 ">
										<li  >
										<a href="${cxt}/jsp/home.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;首页</a>
									</li >
									<li >
										<a href="${cxt}/goods/selecta0">招标采购公告</a>
									</li>
									<li>
										<a href="${cxt}/select1">供应商公告</a>
									</li>
									<li  class="active">
										<a  href="/mavenfst/selectcomplain?page=1">投诉中心</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/fuwuzhongxin.jsp">服务中心</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/falvshengming.jsp">法律声明</a>
									</li>
								</ul>

							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
  
  
		<form action="/mavenfst/insertComplain" method="post">
			<div style="margin:0px auto;" class="keleyitable">
				<h2>我要投诉</h2>

				<table>
					
			
		
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
		
		<!--************************尾****************************8-->
		<div class="container-fluid ">
			<div class="tail">
				<div class="row">
					<div class="col-md-4 tail-1">
					</div>
					<div class="col-md-5 tail-2">
						<li>
							<p>京IQP备05002571号 | 热吧招标版权所有</p>
						</li>
						<li>
							<p>技术支持工作时间（工作日）：上午 9：00~12：00 下午 13：00~18:00</p>
						</li>
					</div>
					<div class="col-md-3 tail-3">
					</div>
				</div>
			</div>
		</div>
	</body>
	

	</body>
</html>
