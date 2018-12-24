<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'branch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${css}bootstrap.min.css">
    <link href="${css}/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
	
	 $('dd').find('ul').slideUp();
	
	
	$(".menuson li").click(function() {
			$(".menusons li.active").removeClass("active")
			$(this).addClass("active");
		});
	
	});
	function caidan(re){
	

		
			var $ul = $(re).next('ul');
			$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(re).next('ul').slideUp();
			} else {
				$(re).next('ul').slideDown();
			}
	
	}
	function gotopage(page) {
		window.location.href = "${cxt}/premeau/selBranchAll2?page=" + page;
	};
	function updaterole(id){
	var $tab=$("#uprole").children("table");
	$tab.html("");
	var l=$("#uppremeaus"+id).length;
	if(l < 1){
	var url="${cxt}/premeau/selbranchbyid";
	var htm="";
	$.post(url,
	{"id":id},
	function(reg){
	if(reg.prestart==0){
	htm="<tr><td>权限名称：<input class='form-control' type='text' value='"+reg.branchname+"' name='branchname' id='uppremeaus"+reg.id+"'><input type='hidden' value='"+reg.id+"' name='ids'></td></tr>";
	$tab.append(htm);
	}else{
	htm="<tr><td>权限名称：<input class='form-control' type='text' value='"+reg.branchname+"' name='branchname' id='uppremeaus"+reg.id+"'></td><input type='hidden' value='"+reg.id+"' name='ids'></td></tr>";
	$tab.append(htm);
	}
	},
	'json'
	)
	}else{
	alert("改角色已存在")
	return;
	}
	}
	function insertrole(sta){
	      if(sta==1){
	      var url="${cxt}/premeau/selbranchbybranchnameid";
	      var $tab=$("#insrole").children("table");
        $.post(url,
        function(reg){
          var options="<option selected='selected' value='0'>请选择</option>";
         for(var i=0;i<reg.length;i++){
           options+="<option value='"+reg[i].id+"'>"+reg[i].branchname+"</option>";
         } 
         
         var htms="<tr><td><span>部门名称2222：</span><input class='form-control' type='text'  name='branchname' ></td><td><select class='form-control'  name='branchnameid'>"+options+"</select></td><td><button onclick='removethis(this)' class='btn btn-primary' >移除</button></td></tr>";
        $("#biaoge").append(htms);
        },
        'json')
	      }else{
	      var $tab=$("#insrole").children("table");
	      var htm="<tr><td><span>部门名称：</span><input class='form-control' type='text'  name='branchname2' ></td><td><button onclick='removethis(this)' class='btn btn-primary' >移除</button></td></tr>";
	      $tab.append(htm);
	      } 
	}
	function removethis(reg){
	$(reg).parents("tr").remove();
	}
	
	function dels(id){
	var sta=0;
	 if(confirm("是否删除当前用户")){
        var url="${cxt}/premeau/delbranchbyid";
        $.post(url,
        {"id":id,"sta":sta},
        function(reg){
        reg=reg*1;
        if(reg>0){
         $("#"+id).remove();
        }else{
        
         if(confirm("是否删除当前父权限以及当前父权限所有子权限")){
         sta=1;
         var url="${cxt}/premeau/delpremeaubyid";
        $.post(url,
        {"id":id,"sta":sta},
        function(reg){
        reg=reg*1;
        if(reg>0){
         $("#"+id).remove();
        }},
        'json')
         }
         return;
        }
        },
        'json')
	}
	return;
	}
	
	</script>

  </head>
  
  <body>
  <div>
    <table class="table table-striped table-bordered ">
				<tr>
					<th style="font-size: 20px">资源信息</th>
					 <th>
		                <button  class='btn btn-primary' data-toggle="modal" data-target="#myModal3">添加权限</button>
		            </th>
				</tr>
				<c:forEach items="${lisallbranch}" var="v">
					<tr id="${v.id}">
						<td colspan="2" >
							<dl class="leftmenus">
								<dd>
									<div class="titles" onclick="caidan(this)">
										<li ><cite></cite><a style="font-size: 20px">${v.branchname}</a>
										 <button id="up" class='btn btn-primary' data-toggle="modal" data-target="#myModal2" onclick="updaterole(${v.id})">修改</button>
                                         <button  id="del1" onclick="dels('${v.id}')" class='btn btn-danger'>删除</button>
                                         </li>
									</div>
									<ul class="menusons">
										<c:forEach items="${v.lisbranch}" var="g">
										<div>
											<li class="active" id="${g.id}">
											<cite></cite><input class='form-control' type='text' readonly="readonly" value="${g.branchname}"/>
											 <button id="up" class='btn btn-primary' data-toggle="modal" data-target="#myModal2" onclick="updaterole(${g.id})">修改</button>
                                             <button  id="del2" onclick="dels('${g.id}')" class='btn btn-danger'>删除</button>
											 <i></i>
										    </li>
										</div>
										</c:forEach>
									</ul>
								</dd>
							</dl>
						</td>
					</tr>
				</c:forEach>
				   <tr>
					<td colspan="3" style="text-align: center;"><nav>
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
	<form action="${cxt}/premeau/upbranch" method="post">
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改权限信息</h4>
      </div>
      <div class="modal-body">
      <div id="uprole">
      <table>
          <tr id="onetrs">
              <th><h3>修改的信息</h3></th>
          </tr>
      </table>
      </div>
      <div class="modal-footer">
      <button type="submit" class="btn btn-primary">提交</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        
      </div>
    </div>
  </div>
</div>
</form>	
</div>	
<div>
   <!-- Modal3 -->
<form action="${cxt}/premeau/insbranch" method="post">
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加权限信息</h4>
      </div>
      <div class="modal-body">
      <div id="insrole">
      <table id="biaoge">
          <tr id="twotrs">
              <th> <button type="button" onclick="insertrole(0)" class='btn btn-primary' >添加一行</button></th>
               <th> <button type="button" onclick="insertrole(1)" class='btn btn-primary' >添加一行子类</button></th>
          </tr>
      </table>
      </div>
      <div class="modal-footer">
      <button type=submit class="btn btn-primary">提交</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
  </form>
	</div>
	
  </body>
</html>
