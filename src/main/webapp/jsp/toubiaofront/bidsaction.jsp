<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'bidsaction.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/zbstyle.css" />
<script type="text/javascript" src="${cxt }/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${cxt }/js/jquery.form.js"></script>
<script type="text/javascript" src="${cxt }/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${cxt }/js/messages_zh.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$(".date").each(
				function() {

					var d = new Date($(this).text());
					$(this).text(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ d.getDate() + "日");})
									
		 $("#formid").validate({
                rules:{
                    
                    zbbj:{
                        required:true,
                        digits:true,
                    },
                },
                messages:{
                    zbbj:{
                        required:"报价不能为空",
                        digits:"只能是数字"
                    }
                }
            });

		 $("#upfrmdfd").validate({
                rules:{
                    
                    file:{
                        required:true,
                    },
                },
                messages:{
                    file:{
                        required:"上传文件不能为空",
                    }
                }
            });
		
		
									
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
					if(data==""){
						alert("只能上传word或者Excel")
						}
					else{
					var simg = "<a href='${cxt}"+data.fileurl+"'><img class='dd' src='${cxt}"+data.imgurl+"'>"+data.fileName+"</a>";
					var suffix  = (data.fileName).substring((data.fileName).lastIndexOf(".")+1);
					var simg2 = "<a href='${cxt}"+data.fileurl+"'><img class='dd' src='${cxt}/images/timg.jpg'>"+data.fileName+"</a>|<a  href='javascript:void(0)'>删除</a>";
					 if(suffix=="doc"){
					$("#appendfile").append(simg);
					}else{
					$("#appendfile").append(simg2);
					} 
					$(".files").append("<input type='hidden'  name='filess' value='"+data.fileurl+"'/>")

				}},
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
function submit(start){
     var zbbj=$("input[name='zbbj']");
    $("#startid").val(start);
   var num=$("input[name='filess']").length;
    if(num>0&& num<3){
    if(zbbj.val()==""){
    zbbj.after("<span>招标报价不能为空</span>");
    return;
    }else{
    document.getElementById("formid").submit();}
    }
    else{
     alert("至少上传一个文件且不能多于两个");
    }
	}
	function del(id){
         var url="${cxt}/bids/delfileurl";
         $.post(url,
         {"id":id},
         function(reg){
             if(reg>0){
             $("#filess"+id).remove();
             $("#div"+id).remove();
             }
         },
         'json');
	
	}
	
	
</script>	
<body>
	<div style="margin: 100px">
		<table class="zb_table table table-striped" >
			<tbody>
				<tr>
					<td colspan="2" style="text-align: right;" >
						<a href="${cxt}/bids/zhaobiaoall?page=1">回到主界面</a>
					</td>
				</tr>
				<tr style="text-align:center">
					<td colspan="2">
						<h4>${decl.title}</h4>
						<hr style="color: purple;">
					</td>
				</tr>
				<tr class="essay">
					<span style="font-size:16px;">
						<td>截止时间:<span class="date">${decl.finishdate}</span>
					</td>
						<td>开标时间:<span class="date">${decl.opentime}</span>
					</td>
					</span>
				</tr>
				<tr>
					<td colspan="2" style="height: 80px">
						<form action="${cxt}/bids/upload" method="post"
							enctype="multipart/form-data" id="upfrmdfd">
							<input type="hidden" value="${decl.id}" name="dfid">
							<label class="col-sm-2 control-label">上传我的文件:</label>
							<div class="col-sm-10" id="infoLogo">
								<input type="file" name="file" id="ctn-input-file" />
								<button id="upload">上传</button>
							</div>
							<div id="appendfile">
							<c:if test="${!empty decl.zbxx}">
							    <span>我的文件</span>
							    <c:forEach items="${decl.zbxx.lisjoinzbfile}" var="v">
							        <div id="div${v.id}">
							            <a href="${cxt}${v.filepath}">${v.filename}</a>|<a  onclick="del(${v.id})" href='javascript:void(0)'>删除</a>
							        </div>
							    </c:forEach>
							</c:if>
							</div>
						</form>
					</td>
				</tr>
				
				<tbody>
				   <tr>
				    <td colspan="2">
				     <form action="${cxt}/bids/insjoinzbxx" method="post" class="form-horizontal files" id="formid">
				          <c:if test="${!empty decl.zbxx}">
				              <input type="hidden" value="${decl.zbxx.id}" name="id">
				              <c:forEach items="${decl.zbxx.lisjoinzbfile}" var="g">
				                  <input type="hidden" value="${g.filepath}" name="filess" id="filess${g.id}">
				              </c:forEach>
				          </c:if>
				         <input type="hidden" value="${decl.id}" name="declareid">
				         <input type="hidden" value="" name="start" id="startid">
				         <label for="exampleInputFile">招标报价</label>
				         <input type="text" value="${decl.zbxx.zbbj}" name="zbbj" class="form-control" style="width: 200px;text-align: center;">
				     </form>
				      </td>
				    </tr>
				  </tbody>
				 <tr>
				        <td colspan="2" style="text-align: right;">
						    <button type="button" class="btn btn-primary" onclick="submit(2)">加入我的投标库</button>
						    <button type="button" class="btn btn-primary" onclick="submit(1)">直接投标</button>
					    </td>
					 </tr>   
               </div>
				
			</tbody>
		</table>
	</div>
</body>
</html>
