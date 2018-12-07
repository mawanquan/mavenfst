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
.myform-group {
	margin-bottom: 5px
}

.form-horizontal {
	width: 1000px;
	height: 1000px;
}
</style>

</head>
<script>
	$(function() { //发送验证码 
		$(".sendVerifyCode").on("click", function() {
			var number = $("input[name=number]").val();
			$.ajax({
				url : getBasePath() + "/sendSms.html",
				async : true,
				type : "post",
				dataType : "json",
				data : {
					"number" : number
				},
				success : function(data) {
					if (data == 'fail') {
						alert("发送验证码失败");
						return;
					}
				}
			});
		})
		//提交
		$(".sub-btn").on("click", function() {
			var data = {};
			data.userId = $.trim($("input[name=userId]").val());
			data.password = $.trim($("input[name=password]").val());
			data.number = $.trim($("input[name=number]").val());
			data.verifyCode = $.trim($("input[name=verifyCode]").val());
			$.ajax({
				url : getBasePath() + "/register.html",
				async : true,
				type : "post",
				dataType : "json",
				data : data,
				success : function(data) {
					if (data == 'fail') {
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

	<div id="" style="width: 800px;">

		<form class="form-horizontal" style="background:#EEEEEE;" action="/mavenfst/a/selectsupplierqqqq" method="post">
			<div style="font-size: 30px;text-align: center;">
				登&nbsp;&nbsp;录</div>${s.sign }
			<div class="form-group myform-group">
				<label for="supplierid" class="col-sm-2 control-label">登录名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="suppliername"
						placeholder="请输入登录账号">
				</div>
			</div>
			<div class="form-group myform-group">
				<label for="supplierspwd" class="col-sm-2 control-label">登录密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="supplierspwd"
						placeholder="请输入登录密码">
				</div>
			</div>

			<div class="form-group myform-group">
				<label for="supplierspwd" class="col-sm-2 control-label">验证码</label>
				<div class="col-sm-10">
					<input name="verifyCode">
					<button type="button" class="sendVerifyCode">获取短信验证码</button>
				</div>
			</div>

			<div class="sub-btn">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn  btn-primary">登录</button>
				</div>
			</div>
		</form>
	</div>
</body>

</html>
