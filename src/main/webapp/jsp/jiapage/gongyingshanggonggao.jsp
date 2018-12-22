<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>My JSP 'a.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css">
	

<script src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
$(function() {
$(".tdate").each(function(){
var d = new Date($(this).text());
					$(this).text(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ d.getDate() + "日");
});
					

	});
	
</script>
	<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="${css}bootstrap.min.css" rel="stylesheet">
		<link href="${css}my.css" rel="stylesheet">
		<script src="${js}jquery-2.0.0.min.js"></script>
		<script src="${js}bootstrap.min.js"></script>
		<script src="${js}layDate-v5.0.9/laydate/laydate.js"></script>

		<script type="text/javascript">
			$('#datetimepicker').datetimepicker('show');
		</script>
	</head>

	<body>
		<!--***********************头部************************-->
		<div class="header">
			<div class="container-fluid">
				<!---------------------------头上------------------------------>
				<div class="top-bar">
					<div class="row">
						<div class="col-xs-4">
							<div class="top-bar-1 ">
								<img src="images/img/mobile.png" />
							</div>
						</div>

						<div class="col-xs-8">
							<div class="top-bar-3 ">
								<form class="navbar-form navbar-right ">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="关键字搜索">
									</div>
									<button type="submit" class="btn btn-default ">
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
										<a href="${cxt}/jsp/jiapage/caigougonggao.jsp">招标采购公告</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/gongyingshanggonggao.jsp">供应商公告</a>
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
		<!--***********************主体************************-->
		<div class="container-fluid" >
			<div class="main2" style="background: ;">
				<div class="row ">
					<div class="col-xs-3 m1">
						<ul class="nav nav-pills nav-stacked m1-1" role="tablist ">
							<li> 
							<legend style="font-size: 18px; color: #737373;"><img src="images/img/m11.png"/>采供公告</legend>
							</li>
							<li role="presentation" class="active">
								<a href="#home" aria-controls="home" role="tab" data-toggle="tab"><img src="images/img/m11.png" style="" />&nbsp;&nbsp;一采公告</a>
							</li>
							<li role="presentation">
								<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">&nbsp;<img src="images/img/m11.png" style="" />&nbsp;&nbsp;二采公告</a>
							</li>
							
						</ul>
					</div>
					<div class="col-xs-9 m2">
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
								<div id="txt"></div>
								<div style="padding-left: 30px; margin-top: 0px;">
									<img src="images/img/m21.png" />
								</div>
				
								</div>

								<div class="m2-1-1 ">
									<legend>&nbsp;&nbsp;&nbsp;查询结果</legend>
								</div>
								<div>
								
									<table class="table table-striped">
									<c:forEach items="${list}" var="v">
									   
									   <tr id="${v.id}">
			                            	<td>${v.id}</td>
				                            <td>${v.number}</td>
			                              	<td>${v.title}</td>
			                               	<td class="tdate">${v.time}</td>
				                            <td>${v.comment}</td>
									</tr>
										</c:forEach>
									</table>
									<!--分页-->
									<nav aria-label="Page navigation" style="margin: 0 auto; text-align: center;">
										<ul class="pagination">
											<li>
												<a href="#" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a>
											</li>
											<li>
												<a href="#">1</a>
											</li>
											<li>
												<a href="#">2</a>
											</li>
											<li>
												<a href="#">3</a>
											</li>
											<li>
												<a href="#">4</a>
											</li>
											<li>
												<a href="#">5</a>
											</li>
											<li>
												<a href="#" aria-label="Next">
													<span aria-hidden="true">&raquo;</span>
												</a>
											</li>
										</ul>
									</nav>
								</div>
							</div>

							<div role="tabpanel" class="tab-pane" id="profile">
								2
							</div>
							
						</div>

					</div>
				</div>
			</div>
		</div>
		<!--************************尾****************************8-->
		<div class="container-fluid ">
			<div class="tail">
				<div class="row">
					<div class="col-xs-4 tail-1">
					</div>
					<div class="col-xs-5 tail-2">
						<li>
							<p>京IQP备05002571号 | 热吧招标版权所有</p>
						</li>
						<li>
							<p>技术支持工作时间（工作日）：上午 9：00~12：00 下午 13：00~18:00</p>
						</li>
					</div>
					<div class="col-xs-3 tail-3">
					</div>
				</div>
			</div>
		</div>

	</body>

</html>
