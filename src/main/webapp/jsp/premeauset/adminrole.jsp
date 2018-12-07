<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<title>My JSP 'adminrole.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="${css}bootstrap.min.css">
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
	$("#butn").click(function(){
	var page=1;
	gotopage(page);
	
	})
	});
	function dels(id){
	    $("#hiddenid input").val(id);
        var url="${cxt}/premeau/myrole";
        var $mycheckbox= $("#mycheckbox");
            $mycheckbox.html("");
            
        var $allcheckbox= $("#allcheckbox");
            $allcheckbox.html("");
        $.post(url,
        {"id":id},
        function(reg){
        
         var allhtm="<span>权限列表</span>";
           for(var i=0;i<reg.allrole.length;i++){
            allhtm+="<div><label><input    style='display: none' checked='checked' type='checkbox' value='"+reg.allrole[i].id+"' name='allbox'>"+reg.allrole[i].rolename+"</label> <button  type='button' onclick=\"allchechbox("+reg.allrole[i].id+",'"+reg.allrole[i].rolename+"')\"  class=' btn btn-info'>添加</button></div>"
          }
         $allcheckbox.append(allhtm);                                                                                                                                                                                                                                                      
        
       var myhtm="<span>自己权限列表</span>";
           for(var i=0;i<reg.myrole.length;i++){
               myhtm+="<div id='pep"+reg.myrole[i].id+"'><label><input  style='display: none' checked='checked' type='checkbox' value='"+reg.myrole[i].id+"' name='mybox'>"+reg.myrole[i].rolename+"</label> <button type='button' onclick='mychechbox("+reg.myrole[i].id+")'  class=' btn btn-info'>删除</button></div>"
            }
           $mycheckbox.append(myhtm);
        },
        'json')
	}
	
function gotopage(page){
    var name=$("#exampleInputName2").val();
	var brid=$("#xiala option:selected").val();
	 window.location.href="${cxt}/premeau/selalladminpre?page="+page+"&name="+name+"&brid="+brid;
	 };
	 
function allchechbox(allid,name){
	var l= $("#mycheckbox  #pep"+allid).length;
	var myhtm="";
	if(l<1){
	myhtm="<div id='pep"+allid+"'><label><input  style='display: none' checked='checked' type='checkbox' value='"+allid+"' name='mybox'>"+name+"</label> <button type='button' onclick='mychechbox("+allid+")'  class=' btn btn-info'>删除</button></div>"
	$("#mycheckbox").append(myhtm);
	}else{
	alert("已存在物重复添加");
	}
	
	 }
	 
function mychechbox(myid){
     $("#pep"+myid).remove();	 
	 }
	</script>
</head>

<body>
	<div class="container-fluid">
		<form class="form-inline" method="post">
			<div class="form-group">
				<label for="exampleInputName2">姓名：</label> <input type="text"
					class="form-control" id="exampleInputName2" /> <select
					class='form-control' id='xiala' name='branchid'>
					<option value="0">请选择</option>
					<c:forEach items="${lisbranchs}" var="b">
						<option value="${b.id}">${b.branchname}</option>
					</c:forEach>
				</select>
			</div>
			<input type="checkbox" style="display: none">
			<button type="button" class="btn btn-primary" id="butn" >查询</button>
		</form>
		<table class="table table-striped table-bordered ">
			<tr class="info">
				<td>姓名</td>
				<td>部门类别</td>
				<td>就职状态</td>
				<td>入职日期</td>
				<td>修改</td>
			</tr>
			<c:forEach items="${lisadmin}" var="vm">
				<tr>
					<td>${vm.adminname}</td>
					<td>${vm.branch.branchname}</td>
					<td>${vm.adminstart}</td>
					<td>${vm.admindate}</td>
					<td>
					<div class="form-group">
					<div class="col-sm-10" id="bushudelita">
						<label>
							<button type="button" class="btn btn btn-info btn-lg required"
								data-toggle="modal" data-target="#myModal" id="del" onclick="dels('${vm.id}')" >用户权限分配</button>
						</label>
					</div>
				</div>
					</td>

				</tr>
			</c:forEach>
			 <tr><td colspan="5" style="text-align: center;">
        <nav>
     		<ul class="pagination pagination-lg">
        		<c:if test="${pageinfo.pageNum  ne 1}">
           			<li><a href="javascript:gotopage(1)">&laquo;</a></li>
	  				<li><a href="javascript:gotopage(${pageinfo.pageNum-1})">上一页</a></li>
        		</c:if>
      			 <c:if test="${pageinfo.pageNum ne pageinfo.pages}">
			 		 <li><a href="javascript:gotopage(${pageinfo.pageNum+1})">下一页</a></li>
			  		<li><a href="javascript:gotopage(${pageinfo.pages})">&raquo;</a></li>
	    		</c:if>
     		</ul>
  		
  		 </nav>
  		 </td>
      </tr>
		</table>
	</div>
<form action="${cxt}/premeau/upPremeauByAdmin" method="post">
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
						 <div id="allcheckbox" class="checkbox" style ="border: 1px solid #DDDDDD;">
                         </div>
                         <div id="hiddenid">
                         <input type="hidden" value="" name="ids">
                         </div>
						 <div id="mycheckbox" class="checkbox" style ="border: 1px solid #DDDDDD;">
						 </div>
						<div class="modal-footer">
						    <button type="submit"  class=" btn btn-info">提交</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
