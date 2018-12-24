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

<title>员工增加</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="${css}/bootstrap.min.css">
<link href="${css}/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){

      
     $("#ajaxbushu").click(function(){
      var ajaxdivs=$("#bushudelita").children("div").html("");
         var url ="${cxt}/admin/ajaxbranch";
         var ajaxdiv=$("#ajaxdiv").html("");
         $.post(url,
         {"branchnameid":0},
         function(reg){
          var branchname="";
         for(var i=0;i<reg.length;i++){
         var ids="nextbracnhs"+reg[i].id;
         branchname+="<div id='"+ids+"'><button class='btn btn-default' onclick='xiangxi("+reg[i].id+")' >"+reg[i].branchname+"</button></div>";
         }
         ajaxdiv.append(branchname)
         },
         'json');
         });
         
        $("form :input.required").each(function () {
        //通过jquery api：$("HTML字符串") 创建jquery对象
        var $required = $("<strong class='high'>*</strong>");
        //添加到this对象的父级对象下
        $(this).parent().append($required);
    }); 
       $("form :input").blur(function(){
       
        var $parent = $(this).parent();
            $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
            //验证姓名
            if($(this).is("#mypwd")){
                var nameVal = $.trim(this.value); 
                var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
                if(nameVal == "" || nameVal.length < 6 || regName.test(nameVal)){
                    var errorMsg = " 姓名非空，长度6位以上，不包含特殊字符！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
             if($(this).is("#mypwd2")){
                var nameVal = $.trim(this.value); 
                var mypwd=$("#mypwd").val();
                alert(mypwd)
                if(nameVal==mypwd){
                var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
                else{
                 var errorMsg = "两次输入密码不一致";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
            }
             if($(this).is("#name")){
                var nameVal = $.trim(this.value); 
                if(nameVal == "" || nameVal.length >16 ){
                    var errorMsg = " 姓名非空，长度16位以下！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
       });
        $("#send").click(function(){
            $("form .required:input").trigger("blur"); 
            var numError = $("form .onError").length;
            if(numError){
                return false;
            }
        });
        huoqu();
});
 function xiangxi(xianzhiid){
 var ajaxdivs=$("#bushudelita").children("div").html("");
      var url ="${cxt}/admin/ajaxbyid";
      var ajaxdiv=$("#bushudelita");
      var select="<div><select class='form-control' id='xiala' name='branchid'></select></div>";
      ajaxdiv.append(select)
      var options=$("#xiala") 
         $.post(url,
         {"id":xianzhiid},
         function(reg){
        var branchnames="<option 'selected='selected' value='0'>请选择</option>";
         for(var i=0;i<reg.length;i++){
       branchnames+="<option value='"+reg[i].id+"'>"+reg[i].branchname+"</option>"
         } 
         options.append(branchnames)
         },
         'json');
         }
      function huoqu(){
          var id=$("input[type='hidden']").val();
          if(id==""){
            $("#quanxian").attr("style","display: none");
          }else{
          $("#quanxian").attr("style","display: block");
          }
         }
</script>

</head>

<body>
	<div class="container-fluid" style="border:2px solid #d3d3d3;">
		<div class="alert alert-info" role="alert"><h2>部门后台管理系统</h2></div>
		<div>
		<h3>${message}</h3>
			<form class="form-horizontal" action="${cxt}/admin/addinsertadmin" method="post" >
				<div class="form-group">
					<label class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control required" id="name" name="adminname" value="${admin.adminname}">
						<input type="hidden" name="id" value="${admin.id}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label ">密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control required" id="mypwd"  name="adminpwd"
							placeholder="Password" value="${admin.adminpwd}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label ">确认密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control required" id="mypwd2"
							placeholder="Password" value="${admin.adminpwd}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">部门部署</label>
					<div class="col-sm-10" id="bushudelita">
						<label>
							<button type="button" id="ajaxbushu" class="btn btn btn-info btn-lg required"
								data-toggle="modal" data-target="#myModal">部门部署</button>
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default" id="send">提交</button>
						<button type="reset" class="btn btn-default">重置</button>
					</div>
				</div>
			</form>
			<!-- Button trigger modal -->
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">部门分配</h4>
						</div>
						<div class="modal-body" id="ajaxdiv">
						<div id="ajaxdiv2"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
