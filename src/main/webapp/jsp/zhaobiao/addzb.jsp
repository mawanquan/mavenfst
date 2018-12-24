<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'fabu.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"	href="${cxt }/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"	href="${cxt}/js/easyform/easyform.css"/>
<script type="text/javascript" src="${cxt }/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${cxt }/js/easyform/easyform.js"></script>
<script type="text/javascript" src="${cxt }/js/jquery.form.js"></script>

<style type="text/css">
.container {
	width: 50%;
}

#sub {
	background-color: #52b1dd;
	border: 0px;
}

div {
	height: 50px;
}
</style>
<script type="text/javascript">
	$(function() {
	
		$("#formid").easyform();
	
		$("#upfrmdfd").bind("submit",function() {
							$(this).ajaxSubmit(
			{
				//url: url,                 //默认是form的action
				//type: type,               //默认是form的method（get or post）
				//dataType: "json",           //html(默认), xml, script, json...接受服务端返回的类型
				//clearForm: true,          //成功提交后，清除所有表单元素的值
				resetForm : true, //成功提交后，重置所有表单元素的值
				//target : '#output', //把服务器返回的内容放入id为output的元素中
				//timeout: 3000,               //限制请求的时间，当请求大于3秒后，跳出请求
				//提交前的回调函数
				beforeSubmit : function(arr,
						$form, options) {
					//formData: 数组对象，提交表单时，Form插件会以Ajax方式自动提交这些数据，格式如：[{name:user,value:val },{name:pwd,value:pwd}]
					//jqForm:   jQuery对象，封装了表单的元素
					//options:  options对象
					//比如可以再表单提交前进行表单验证
					//$("#divdis").show();
				},
				//提交成功后的回调函数
				success : function(data,
						status, xhr, $form) {
					var simg = "<a href='${cxt}"+data.fileurl+"'><img class='dd' src='${cxt}"+data.imgurl+"'>"+data.fileName+"</a>&nbsp;<button  type='button' >删除</button>&nbsp;&nbsp;";
					var suffix  = (data.fileName).substring((data.fileName).lastIndexOf(".")+1);
					var simg2 = "<a href='${cxt}"+data.fileurl+"'><img class='dd' src='${cxt}/images/timg.jpg'>"+data.fileName+"</a>&nbsp;<button  type='button' >删除</button>&nbsp;&nbsp;";
					 if(suffix=="doc"){
					$("#appendfile").append(simg);
					}else{
					$("#appendfile").append(simg2);
					} 
					$(".files").append("<input type='hidden'  name='filess' value='"+data.fileurl+"'/>")

				},
				error : function(xhr, status,
						error, $form) {

				},
				complete : function(xhr,
						status, $form) {

				}
			});
							return false; //阻止表单默认提交
						});

	});
	function submit(){
// 在键盘按下并释放及提交后验证提交表单
	/* $("#formid").easyform(); */
	document.getElementById("sub").click();
	//alert("ok");
	}
	
</script>

<style type="text/css">
.dd {
	width: 18.5px;
	height: 23px;
}
</style>
</head>

<body>
	<div class="container">
		<h2>增加招标项目</h2>
		<form action="${cxt}/insertfabu" method="post" class="form-horizontal files" id="formid">
			<!-- <div class="">
				<label class="col-sm-2 control-label">id:</label>
				<div class="col-sm-10">
					<input type="text" name="id" class="form-control" />
				</div>
			</div> -->
			<div class="">
				<label class="col-sm-2 control-label">标题:</label>
				<div class="col-sm-10">
					<input type="text" name="title" id="title" required="required" class="form-control" data-easyform="real-time;" data-message="标题不能为空"
                           data-easytip="class:easy-blue;"/>
				</div>
			</div>
			<input type="hidden" name="publisher" value="${user.id}"/>
			<div class="">
				<label class="col-sm-2 control-label">内容:</label>
				<div class="col-sm-10">
					<textarea name="content" id="content" class="form-control" data-easyform="real-time;" data-message="内容不能为空"
                           data-easytip="class:easy-blue;"></textarea>
				</div>
			</div>
			<br>
			<div class="">
				<label class="col-sm-2 control-label">截止时间:</label>
				<div class="col-sm-10">
					<input id="date2" type="datetime-local" name="finishdate0" class="form-control" data-easyform="real-time;" data-message="截止时间不能为空" data-easytip="class:easy-blue;"/>
				</div>
			</div>
			<div class="">
				<label class="col-sm-2 control-label">开标时间:</label>
				<div class="col-sm-10">
					<input id="date3" type="datetime-local" name="opentime0" class="form-control" data-easyform="real-time;" data-message="开标时间不能为空"
                           data-easytip="class:easy-blue;"/>
				</div>
			</div>
			<div class="">
				<label class="col-sm-2 control-label">招标金额:</label>
				<div class="col-sm-10">
					<input type="text" name="zbmoney" id="zbmoney" class="form-control" data-easyform="money;real-time;" data-message="金额格式必须正确"
                           data-easytip="class:easy-blue;"/>
                           <input id="sub" type="submit" value="增加招标"  style="display: none"/>
				</div>
			</div>
		</form>

		<div class="">
			<form action="${cxt}/upload" method="post"
				enctype="multipart/form-data" id="upfrmdfd">
				<label class="col-sm-2 control-label">招标文件:</label>
				<div class="col-sm-10" id="infoLogo">
					<input type="file" name="file" id="ctn-input-file" data-easyform="real-time;" data-message="文件不能为空"
                           data-easytip="class:easy-blue;"/>
					<button id="upload">上传</button>
				</div>

				<div id="appendfile"></div>
			</form>

		</div>

<br><br><br>
		<div style="text-align: center;">
			<input id="sub2" type="button" value="增加招标" class="btn btn-primary" onclick="submit()"/>
		</div>


	</div>
</body>
</html>