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
	

		$(".menuson li").click(function() {
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('ul').slideUp();
			} else {
				$(this).next('ul').slideDown();
			}
		});
	});

	//分页
	function gotopage(page) {
		window.location.href = "${cxt}/premeau/selallbranch?page=" + page;
	};
	function gotopage2(page2) {
		window.location.href = "${cxt}/premeau/selallbranch?page2=" + page2;
	};

	function branchrole(id) {
		$("#hiddenid input").val(id);
		var ss = $("#hiddenid input").val();
		var url = "${cxt}/premeau/myrolebranch";
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

							var allhtm = "<span>权限列表</span>";
							for (var i = 0; i < reg.allrole.length; i++) {
								allhtm += "<div><label><input    style='display: none' checked='checked' type='checkbox' value='"+reg.allrole[i].id+"' name='allbox'>"
										+ reg.allrole[i].rolename
										+ "</label> <button  type='button' onclick=\"allchechbox("
										+ reg.allrole[i].id
										+ ",'"
										+ reg.allrole[i].rolename
										+ "')\"  class=' btn btn-info'>添加</button></div>"
							}
							$allcheckbox.append(allhtm);

							var myhtm = "<div><span>自己权限列表</span></div>";
							for (var i = 0; i < reg.myrole.length; i++) {
								myhtm += "<div id='pep"+reg.myrole[i].id+"'><label><input  style='display: none' checked='checked' type='checkbox' value='"+reg.myrole[i].id+"' name='mybox'>"
										+ reg.myrole[i].rolename
										+ "</label> <button type='button' onclick='mychechbox("
										+ reg.myrole[i].id
										+ ")'  class=' btn btn-info'>删除</button></div>"
							}
							$mycheckbox.append(myhtm);
						}, 'json')

	}

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
	
	function updaterole(id){
	var $tab=$("#uprole").children("table");
	alert($tab)
	var l=$("#uproles"+id).length;
	if(l < 1){
	alert("ok2")
	var url="${cxt}/premeau/selrolebyid";
	var htm="";
	$.post(url,
	{"id":id},
	function(reg){
	htm="<tr><td><input class='form-control' type='text' value='"+reg.rolename+"' name='rolename' id='uproles"+reg.id+"'><input type='hidden' value='"+reg.id+"' name='ids'></td></tr>";
	$tab.append(htm);
	},
	'json'
	)
	}else{
	alert("改角色已存在")
	return;
	}
	}
	function insertrole(){
	var $tab=$("#insrole").children("table");
	var htm="<tr><td><input class='form-control' type='text'  name='rolename' ></td><td><button onclick='removethis(this)' class='btn btn-primary' >移除</button></td></tr>";
	$tab.append(htm);
	}
	function removethis(reg){
	$(reg).parents("tr").remove();
	}
	function dels(id){
	 if(confirm("是否删除当前用户")){
        var url="${cxt}/premeau/delrolebyid";
        $.post(url,
        {"id":id},
        function(reg){
        reg=reg*1;
        if(reg>0){
         $("#del").parent().parent().remove();
        }
        return;
        },
        'json')
	}
	return;
	}
	
</script>

</head>

<body>
	<div class="row">
		<div class="col-md-5"  id="onediv">
			<table class="table table-striped table-bordered ">
				<tr>
					<th>部门信息</th>
				</tr>
				<c:forEach items="${lisallbranch}" var="v">
					<tr>
						<td >
							<dl class="leftmenu">
								<dd>
									<div class="title">
										<span><img src="images/leftico02.png" /></span>
										<li><cite></cite>${v.branchname}</li>
									</div>
									<ul class="menuson">
										<c:forEach items="${v.lisbranch}" var="g">
											<li><cite></cite><a data-toggle="modal" data-target="#myModal" href="javascript:void(0);" onclick="branchrole('${g.id}')">${g.branchname}</a><i></i></li>
										</c:forEach>
									</ul>
								</dd>
							</dl>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td style="text-align: center;"><nav>
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
			<form action="${cxt}/premeau/uppremeaubybranch" method="post">
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">
								<div id="allcheckbox" class="checkbox" style="border: 1px solid #DDDDDD;"></div>
								<div id="hiddenid">
									<input type="hidden" value="" name="ids">
								</div>
								<div id="mycheckbox" class="checkbox" style="border: 1px solid #DDDDDD;"></div>
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
		
		<div class="col-md-2" style="text-align: center; padding-top: 100px ">
			<div><button  class='btn btn-primary'  id="cent1">角色信息修改</button></div>
			<div style="padding-top: 50px"><button class='btn btn-primary' id="cent2">部门用户权限</button></div>
		</div>
		<div class="col-md-5" id="twodiv" >
		    <table class="table table-striped table-bordered">
		        <tr>
		            <th>角色信息</th>
		            <th>修改属性</th>
		            <th>
		                <button  class='btn btn-primary' data-toggle="modal" data-target="#myModal3">添加</button>
		            </th>
		        </tr>
		        <c:forEach items="${lisrole}" var="a">
		            <tr>
		                 <td>${a.rolename}</td>
		                 <td colspan="2">
		                     <button id="up" class='btn btn-primary' data-toggle="modal" data-target="#myModal2" onclick="updaterole(${a.id})">修改</button>
                             <button  id="del" onclick="dels('${a.id}')" class='btn btn-danger'>删除</button>
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
	</div>
<!-- Modal2 -->
<form action="${cxt}/premeau/upinsrole" method="post">
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改角色信息</h4>
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
<form action="${cxt}/premeau/upinsrole" method="post">
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加角色信息</h4>
      </div>
      <div class="modal-body">
      <div id="insrole">
      <table>
          <tr id="twotrs">
              <th> <button type="button" onclick="insertrole()" class='btn btn-primary' >添加一行</button></th>
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
