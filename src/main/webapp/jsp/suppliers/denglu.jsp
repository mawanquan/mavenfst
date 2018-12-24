<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<meta http-equiv="description" content="This is my page">
<title>新增供货商信息</title>
<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css" />
<script src="${js}/layDate-v5.0.9/laydate/laydate.js"></script>
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>


<style>
		#tab1{
				
				background-color:#89B8E2 ;
		}
			.myform-group {
				margin-bottom: 5px;
				
			}
			
			.form-horizontal {
				float: left;
				width: 550px;
				height: 300px;
			
			}
			.container{
			margin-left: 50px
			}
			.btn  btn-primary1{
			color: #FFFFFF;	
			border-color: #337AB7	}
		</style>

	</head>
	<script>
		$(function() { //发送验证码 
			$(".sendVerifyCode").on("click", function() {
					var number = $("input[name=val]").val(); //获取手机号码
					var url = "${cxt}/setredisdata"; //设置ajax提交路径s
					$.post(url, {
						"key": number
					}, function() {}, 'json');
				})
				//提交
			$(".sub-btn").on("click", function() {
				var data = {};
				//获取值进行比对
				data.suppliername = $.trim($("input[name=suppliername]").val());
				data.supplierspwd = $.trim($("input[name=supplierspwd]").val());
				data.val = $.trim($("input[name=val]").val());
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
		});
	</script>

	<body>

		<div id="tab1" style="width:auto;height: 600px;">
<div> <img src="images/20181215164516.png" height="101px" width="520" style="text-align: center;padding-bottom: 30px; margin: 0 auto;text-align: center; margin-left: 400px;"/>
</div>
<div class="container" >
	<div class="row">
		<div class="col-md-6">
	
	<img src="images/20181215164535.png" height="300px" width="480px"  />
</div>
			<div class="col-md-6">
				<form class="form-horizontal" style="background:#FFFFFF;" action="/mavenfst/a/selectsupplierqqqq" method="post">
				<div style="font-size: 30px;text-align: center;">
					登&nbsp;&nbsp;录</div>
					 <h5>${s.sign }</h5>
				<div class="form-group myform-group">
					<label for="supplierid" class="col-sm-2 control-label">登录名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="suppliername" placeholder="请输入登录账号">
					</div>
				</div>
				<div class="form-group myform-group">
					<label for="supplierspwd" class="col-sm-2 control-label">登录密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="supplierspwd" placeholder="请输入登录密码">
					</div>
				</div>
				<div class="form-group myform-group">
					<label for="supplierstel" class="col-sm-2 control-label">手机号</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="val" placeholder="请输入手机号">
					</div>
				</div>
<h5>${message}</h5>
				<div class="form-group myform-group">
					<%-- <div>${message}</div> --%>
					<label for="supplierspwd" class="col-sm-2 control-label">验证码</label>
					<div class="col-sm-10">
						<input name="verifyCode">
						<button type="button" class="sendVerifyCode">获取短信验证码</button>
					</div>
				</div>

				<div class="sub-btn">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn  btn-primary1"><a>登录</a></button>
						<button type="submit" class="btn  btn-primary1"><a href="/mavenfst/jsp/home.jsp">退出</a></button>
					</div>
				</div>
				
			</form></div>
	</div>
</div>
		</div>
	</body>

</html>

