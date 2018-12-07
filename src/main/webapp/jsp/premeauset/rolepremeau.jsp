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

<title>My JSP 'adminrole.jsp' starting page</title>

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
	$(function() {
	
	
	$("#cent1").click(function(){
	var $onediv=$("#onediv");
	
	if(typeof($onediv.attr("style"))=="undefined"){
	$onediv.attr("style","visibility: hidden");
	}else{
	$onediv.removeAttr("style");
	}
	 
	});
	$("#cent2").click(function(){
	var $onediv=$("#twodiv");
	
	if(typeof($onediv.attr("style"))=="undefined"){
	$onediv.attr("style","visibility: hidden;");
	}else{
	$onediv.removeAttr("style");
	}
	
	});	
	
	
	
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
	function branchrole(id) {
		$("#hiddenid input").val(id);
		var url = "${cxt}/premeau/myrolepremeau";
		var $mycheckbox = $("#mycheckbox");
		$mycheckbox.html("");

		var $allcheckbox = $("#allcheckbox");
		$allcheckbox.html("");
		$
				.post(
						url,
						{
							"id" : id
						},
						function(reg) {
						var fuhtm = "<h4>权限列表</h4>";
                              for(var i = 0; i < reg.allpremeau.length; i++){
                              var allhtm = "";
                              var ssdfdf=reg.allpremeau[i].listpremeau;
                                for (var j = 0; j < ssdfdf.length; j++) {
								allhtm += "<div><li class='active'><cite></cite><input    style='display: none' checked='checked' type='checkbox' value='"+ssdfdf[j].id+"' name='allbox'>"
										+ ssdfdf[j].pre
										+ "</label> <button  type='button' onclick=\"allchechbox("
										+ ssdfdf[j].id
										+ ",'"
										+ ssdfdf[j].pre
										+ "')\"  class=' btn btn-info'>添加</button><i></i></li></div>"
							}
                                  fuhtm+="<dl class='leftmenus'><dd><div class='titles'  onclick='caidan(this)'><li><cite></cite><a style='font-size: 20px'>"+reg.allpremeau[i].pre+"</a></li></div><ul class='menusons'>"+allhtm+"</ul></dd></dl>";
                              
                              }
							$allcheckbox.append(fuhtm);

							var myhtm = "<h4>自己权限列表</h4>";
							for (var i = 0; i < reg.mypremeau.length; i++) {
								myhtm += "<div id='pep"+reg.mypremeau[i].id+"'><label><input  style='display: none' checked='checked' type='checkbox' value='"+reg.mypremeau[i].id+"' name='mybox'>"
										+ reg.mypremeau[i].pre
										+ "</label> <button type='button' onclick='mychechbox("
										+ reg.mypremeau[i].id
										+ ")'  class=' btn btn-info'>删除</button></div>"
							}
							$mycheckbox.append(myhtm);
						}, 'json')
	}
//分页
	function gotopage(page) {
		window.location.href = "${cxt}/premeau/selallrole?page=" + page;
	};
	function gotopage2(page2) {
		window.location.href = "${cxt}/premeau/selallrole?page2=" + page2;
	};

	function allchechbox(allid, name) {
		var l = $("#mycheckbox  #pep" + allid).length;
		var myhtm = "";
		if (l < 1) {
			myhtm = "<div id='pep"+allid+"'><label><input  style='display: none' checked='checked' type='checkbox' value='"+allid+"' name='mybox'>"
					+ name
					+ "</label> <button type='button' onclick='mychechbox("
					+ allid + ")'  class=' btn btn-info'>删除</button></div>"
			$("#mycheckbox").append(myhtm);
		} else {
			alert("已存在物重复添加");
		}

	}

	function mychechbox(myid) {
		$("#pep" + myid).remove();
	}
	
	
	///////////
	function updaterole(id){
	var $tab=$("#uprole").children("table");
	$tab.html("");
	var l=$("#uppremeaus"+id).length;
	if(l < 1){
	var url="${cxt}/premeau/selpremeaubyid";
	var htm="";
	$.post(url,
	{"id":id},
	function(reg){
	if(reg.prestart==0){
	htm="<tr><td>权限名称：<input class='form-control' type='text' value='"+reg.pre+"' name='pre' id='uppremeaus"+reg.id+"'><input type='hidden' value='"+reg.id+"' name='ids'></td></tr>";
	$tab.append(htm);
	}else{
	htm="<tr><td>权限名称：<input class='form-control' type='text' value='"+reg.pre+"' name='pre' id='uppremeaus"+reg.id+"'></td><td>权限路径：<input class='form-control' type='text' value='"+reg.url+"' name='url'><input type='hidden' value='"+reg.id+"' name='ids'></td></tr>";
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
	      var url="${cxt}/premeau/selpremeaubyprestartid";
	      var $tab=$("#insrole").children("table");
        $.post(url,
        function(reg){
          var options="<option 'selected='selected' value='0'>请选择</option>";
         for(var i=0;i<reg.length;i++){
       options+="<option value='"+reg[i].id+"'>"+reg[i].pre+"</option>";
         } 
          var htm="<tr><td><span>权限名称：</span><input class='form-control' type='text'  name='pre' ></td><td><span>url：</span><input class='form-control' type='text'  name='url' ></td><td><select class='form-control'  name='prestart'>"+options+"</select></td><td><button onclick='removethis(this)' class='btn btn-primary' >移除</button></td></tr>";
          $tab.append(htm);
        },
        'json')
        
	   
	    
	      }else{
	      var $tab=$("#insrole").children("table");
	      var htm="<tr><td><span>权限名称：</span><input class='form-control' type='text'  name='pre2' ></td><td><button onclick='removethis(this)' class='btn btn-primary' >移除</button></td></tr>";
	      $tab.append(htm);
	      } 
	
	}
	function removethis(reg){
	$(reg).parents("tr").remove();
	}
	
	function dels(id){
	var sta=0;
	 if(confirm("是否删除当前用户")){
        var url="${cxt}/premeau/delpremeaubyid";
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
	<div class="row">
		<div class="col-md-5" id="onediv">

			<table class="table table-striped table-bordered ">
				<tr>
					<th style="font-size: 20px">角色资源</th>
				</tr>

				<c:forEach items="${lisallrole}" var="g">
					<tr>
					<td style="font-size: 20px; line-height: 40px"; >
					${g.rolename}
					</td>
						<td>
							<button type="button" onclick="branchrole('${g.id}')"
								class="btn btn-primary btn-lg" data-toggle="modal"
								data-target="#myModal">编辑权限</button>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td style="text-align: center;" colspan="2"><nav>
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
						</nav></td>
				</tr>
			</table>
			<!-- Modal -->
			<div class="row">
			
			<form action="${cxt}/premeau/uppremeaubyrole" method="post">
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">
							<div class="col-md-6">
								<div id="allcheckbox" class="checkbox"
									style="border: 1px solid #DDDDDD;"></div>
								<div id="hiddenid">
									<input type="hidden" value="" name="ids">
								</div>
								</div>
								<div class="col-md-6">
								<div id="mycheckbox" class="checkbox"
									style="border: 1px solid #DDDDDD;"></div>
							</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		
		</div>
		</div>
		<div class="col-md-2" style="text-align: center; padding-top: 100px ">
			<div><button  class='btn btn-primary'  id="cent1">信息修改</button></div>
			<div style="padding-top: 50px"><button class='btn btn-primary' id="cent2">角色部门权限</button></div>
		</div>
		<div class="col-md-5" id="twodiv" >
		   <table class="table table-striped table-bordered ">
				<tr>
					<th style="font-size: 20px">资源信息</th>
					 <th>
		                <button  class='btn btn-primary' data-toggle="modal" data-target="#myModal3">添加权限</button>
		            </th>
				</tr>
				<c:forEach items="${lisallpremeau}" var="v">
					<tr id="${v.id}">
						<td colspan="2" >
							<dl class="leftmenus">
								<dd>
									<div class="titles" onclick="caidan(this)">
										<li ><cite></cite><a style="font-size: 20px">${v.pre}</a>
										 <button id="up" class='btn btn-primary' data-toggle="modal" data-target="#myModal2" onclick="updaterole(${v.id})">修改</button>
                                         <button  id="del1" onclick="dels('${v.id}')" class='btn btn-danger'>删除</button>
                                         </li>
									</div>
									<ul class="menusons">
										<c:forEach items="${v.listpremeau}" var="g">
										<div>
											<li class="active" id="${g.id}">
											<cite></cite><input class='form-control' type='text' readonly="readonly" value="${g.pre}"/>
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
							<c:if test="${pageinfo2.pageNum  ne 1}">
								<li><a href="javascript:gotopage2(1)">&laquo;</a></li>
								<li><a href="javascript:gotopage2(${pageinfo2.pageNum-1})">上一页</a></li>
							</c:if>
							<c:if test="${pageinfo2.pageNum ne pageinfo2.pages}">
								<li><a href="javascript:gotopage2(${pageinfo2.pageNum+1})">下一页</a></li>
								<li><a href="javascript:gotopage2(${pageinfo2.pages})">&raquo;</a></li>
							</c:if>
						</ul>
						</nav>
						
						</td>
				</tr>
			</table>
	</div>
<!-- Modal2 -->
<form action="${cxt}/premeau/upinspremeau2" method="post">
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
<form action="${cxt}/premeau/upinspremeau" method="post">
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加权限信息</h4>
      </div>
      <div class="modal-body">
      <div id="insrole">
      <table>
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
