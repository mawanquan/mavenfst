<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
<script type="text/javascript">

function del(id){
if(confirm("是否删除")){
alert(id);
var url="${cxt}/deleteByPrimaryKey1";
$.post(url,{
"id":id
},function(reg){
if(reg>0){
$("#"+id).remove();
	}
	},'json')

}
}


</script>

<style>
#top {
	height: 1000px;	margin: 0px auto;
	align-content: center;
}

.daohang {
	margin-bottom: 5px;
}

.img{

margin-left: 250px

}
</style>

</head>

<body>
	<form action="${cxt }/upsuppliers" method="post" class="form-horizontal" id="senglufrom" >
		<div style="font-size: 30px;text-align: center;">
			欢&nbsp;迎&nbsp;来&nbsp;到&nbsp;供&nbsp;应&nbsp;商&nbsp;修&nbsp;改</div>

		<div id="top">
		<fieldset>
			
			<legend>供货商</legend>
 <div class="form-group daohang">
				<label for="suppliername" class="col-sm-2 control-label">登录名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="suppliername" name="suppliername"  value="${suppliers.suppliername}"
						>
						<input type="hidden" name="supplierid" value="${suppliers.supplierid}">
				</div>
				
			</div>

			<div class="form-group daohang">
				<label for="supplierspwd" class="col-sm-2 control-label">登录密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="supplierspwd" id="supplierspwd" value="${suppliers.supplierspwd}"
						>
					
				</div>
			</div>
			<div class="form-group daohang">
				<label for="suppliersemail" class="col-sm-2 control-label">登录邮箱</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="suppliersemail" id="suppliersemail" value="${suppliers.suppliersemail}"
						>
				</div>
			</div>
			<div class="form-group daohang">
				<label for="address" class="col-sm-2 control-label">地址</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="address" id="address" value="${suppliers.address}"
						>
				</div>
			</div>
			<div class="form-group daohang">
				<label for="supplierstel" class="col-sm-2 control-label">手机号</label>
				<div class="col-sm-10">
					<input type="tel" class="form-control" name="supplierstel" id="supplierstel" value="${suppliers.supplierstel}"
						>
				</div>
			</div>
			
</fieldset>
			<fieldset>
			<legend>法人</legend>
			<div class="form-group daohang">
				<label for="farename" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="farename" id="farename" value="${suppliers.farename}"
						>
				</div>
			</div>
			<div class="form-group daohang">
				<label for="farenid" class="col-sm-2 control-label">身份证号</label>

				<div class="col-sm-10">
					<input type="text" class="form-control" name="farenid" id="farenid" value="${suppliers.farenid}"
						>
				</div>
			</div>
			</fieldset>
			<fieldset>
			
			<legend>联系人</legend>
			<div class="form-group daohang">
				<label for="lianxirenname" class="col-sm-2 control-label">姓名</label>

				<div class="col-sm-10">
					<input type="text" class="form-control" name="lianxirenname" id="lianxirenname" value="${suppliers.lianxirenname}"
						>
				</div>
			</div>
			<div class="form-group daohang">
				<label for="lianxinrenemail" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="lianxinrenemail" id="lianxinrenemail" value="${suppliers.lianxinrenemail}"
						>
				</div>
			</div>
			<div class="form-group daohang">
				<label for="img" class="col-sm-2 control-label">资质照片</label>
				<div class="col-sm-10">
					<input type="file" name="img" class="form-control">

				</div>
					<div class="col-sm-10">
				${suppliers.supplierid}
				
				<img class="img" src=" ${suppliers.aptitudeimg}">
				<button ><a href="javascript:void(0)"
					onclick="del(${suppliers.supplierid})" id="ok">删除</a></button>
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
				<div class="col-sm-offset-2 col-sm-3">
					<button type="submit" class="btn  btn-primary"
						>提交</button>
						
				</div>
				<div class="col-sm-offset-2col-sm-3">
					<button type="reset" class="btn  btn-primary"
						>重置</button>
						
				</div>
				
			</div>
		</div>

	</form>

</body>


</html>
