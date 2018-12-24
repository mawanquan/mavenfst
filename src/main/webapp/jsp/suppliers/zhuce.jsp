<%-- <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'MyJsp.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page"> --%>
<%-- <title>供应商注册</title>

<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css" />
<script src="${js}/layDate-v5.0.9/laydate/laydate.js"></script>
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	
</script> --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="${css}bootstrap.min.css" rel="stylesheet">
		<link href="${css}my.css" rel="stylesheet">
		<script src="${js}jquery-2.0.0.min.js"></script>
		<script src="${js}bootstrap.min.js"></script>
	</head>



<style>
#top {
	width: 900px;
	height: 800px;
	margin: 0px auto;
	align-content: center;
}

.daohang {
	margin-bottom: 5px;
	
}
.row{
border-bottom:3px  solid #7CBDE8;

}
</style>

</head>
<script>
	//提交 
	/*	$(".sub-btn").on("click", function() {
			var data = {};
			data.userId = $.trim($("input[name=userId]").val());
			data.password = $.trim($("input[name=password]").val());
			data.number = $.trim($("input[name=number]").val());
			data.verifyCode = $.trim($("input[name=verifyCode]").val());
			$.ajax({
				url: getBasePath() + "/register.html",
				async: true,
				type: "post",
				dataType: "json",
				data: data,
				success: function(data) {
					if(data == 'fail') {
						alert("登录失败");
						return;
					}
					alert("登录成功");
				}
			});
		})
	 */
</script>
<body>
	<!-- <div class="top-bar">
		<div class="row">
			<div class="col-xs-4">
				<div class="top-bar-1 ">
					<img src="images/img/mobile.png" />
				</div>
			</div>
		</div> -->
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
									<div class="form-group" >
										<input type="text" class="form-control" placeholder="关键字搜索">
									</div>
									<button type="submit" class="btn btn-default " >
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
									<li >
										<a href="${cxt}/jsp/home.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;首页</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/caigougonggao.jsp">招标采购公告</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/gongyingshanggonggao.jsp">供应商公告</a>
									</li>
									<li>
										<a href="tousuzhongxin.html">投诉中心</a>
									</li>
									<li >
										<a href="${cxt}/jsp/jiapage/fuwuzhongxin.jsp">服务中心</a>
									</li>
									<li class="active">
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

		<form action="${cxt }/addSupplier" method="post"
			class="form-horizontal" id="senglufrom" enctype="multipart/form-data">
			<div style="font-size: 20px;text-align: center;/* background-color: #7CBDE8;margin-top:8px;color: white;  */">
				欢&nbsp;迎&nbsp;来&nbsp;到&nbsp;供&nbsp;应&nbsp;商&nbsp;注&nbsp;册</div>

			<div id="top">

				<fieldset>
					<legend><h6><b>供应商</b></h6></legend>
					<div class="form-group daohang">
						<label for="suppliername" class="col-sm-2 control-label">登录名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="suppliername"
								placeholder="请输入登录名">
						</div>
					</div>

					<div class="form-group daohang">
						<label for="supplierspwd" class="col-sm-2 control-label">登录密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="supplierspwd"
								placeholder="请输入登录密码">
						</div>
					</div>
					<div class="form-group daohang">
						<label for="suppliersemail" class="col-sm-2 control-label">登录邮箱</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" name="suppliersemail"
								placeholder="请输入供货商邮箱">
						</div>
					</div>
					<div class="form-group daohang">
						<label for="address" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="address"
								placeholder="请输入登录地址">
						</div>
					</div>
					<div class="form-group daohang">
						<label for="supplierstel" class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-10">
							<input type="tel" class="form-control" name="supplierstel"
								placeholder="请输入供货商手机号">
						</div>
					</div>
					<div class="form-group daohang">
						<label for="aptitudesid" class="col-sm-2 control-label">资质证号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="aptitudesid"
								placeholder="请输入资质证号">
						</div>
					</div>
				</fieldset>
				<fieldset>

					<legend><h6><b>法人</b> </h6></legend>
					<div class="form-group daohang">
						<label for="farename" class="col-sm-2 control-label">姓名</label>

						<div class="col-sm-10">
							<input type="text" class="form-control" name="farename"
								placeholder="法人姓名">
						</div>
					</div>
					<div class="form-group daohang">
						<label for="farenid" class="col-sm-2 control-label">身份证号</label>

						<div class="col-sm-10">
							<input type="text" class="form-control" name="farenid"
								placeholder="请输入法人身份证号">
						</div>
					</div>
				</fieldset>
				<fieldset>

					<legend><h6><b>联系人</b> </h6></legend>
					<div class="form-group daohang">
						<label for="lianxirenname" class="col-sm-2 control-label">姓名</label>

						<div class="col-sm-10">
							<input type="text" class="form-control" name="lianxirenname"
								placeholder="联系人姓名">
						</div>
					</div>
					<div class="form-group daohang">
						<label for="lianxinrenemail" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" name="lianxinrenemail"
								placeholder="联系人邮箱">
						</div>
					</div>
					<div class="form-group daohang">
						<label for="bail" class="col-sm-2 control-label">保证金</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="bail"
								placeholder="保证金">
						</div>
					</div>
					<div class="form-group daohang">
						<label for="img" class="col-sm-2 control-label">资质照片</label>
						<div class="col-sm-10">
							<input type="file" name="img" class="form-control">

						</div>
					</div>
				</fieldset>

				<div class="form-group daohang">
					<div class="col-sm-offset-2 col-sm-20">
						<div class="col-sm-10">
							<label> <input type="checkbox"> 同意协议
							</label>
						</div>
					</div>
				</div>
				<div class="sub-btn">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn  btn-primary"
							onclick="document:senglufrom.submit()">注册</button>
					</div>
				</div>
			</div>

		</form>
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
