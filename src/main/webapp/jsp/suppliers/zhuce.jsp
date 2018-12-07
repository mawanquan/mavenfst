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
<title>供应商注册</title>

<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css" />
<script src="${js}/layDate-v5.0.9/laydate/laydate.js"></script>
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
	
</script>


<style>
#top {
	width: 1000px;
	height: 1000px;
	margin: 0px auto;
	align-content: center;
}

.daohang {
	margin-bottom: 5px;
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
	<form action="${cxt }/addSupplier" method="post" class="form-horizontal" id="senglufrom"  enctype="multipart/form-data">
		<div style="font-size: 30px;text-align: center;">
			欢&nbsp;迎&nbsp;来&nbsp;到&nbsp;供&nbsp;应&nbsp;商&nbsp;注&nbsp;册</div>

		<div id="top">

<fieldset>
<legend>供应商</legend>
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
			
			<legend>法人</legend>
			<div class="form-group daohang">
				<label for="farenamen" class="col-sm-2 control-label">姓名</label>

				<div class="col-sm-10">
					<input type="text" class="form-control" name="farenamen"
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
			
			<legend>联系人</legend>
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

</body>


</html>
