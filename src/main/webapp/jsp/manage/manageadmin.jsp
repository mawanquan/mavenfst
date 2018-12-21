<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>员工管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${css}/bootstrap.min.css">
	<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){
	$(".date").each(
				function() {

					var d = new Date($(this).text());
					$(this).text(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ d.getDate() + "日");})
	
	
	
	$("#butn").click(function(){
	var page=1;
	gotopage(page);
	
	})
	});
	function dels(id){
        if(confirm("是否删除当前用户")){
        var url="${cxt}/admin/deladmin";
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
	function gotopage(page){
    var name=$("#exampleInputName2").val();
	var brid=$("#xiala option:selected").val();
	 window.location.href="${cxt}/admin/selalluser?page="+page+"&name="+name+"&brid="+brid;
	 }
	</script>
	

  </head>
  
  <body>
  ${message}
 <div class="container-fluid">
      <table class="table table-striped table-bordered ">
      <tr >
          <td colspan="5" style="text-align: center;">
              <form class="form-inline"  method="post">
  				 <div class="form-group">
      		       <label for="exampleInputName2">姓名：</label>
     					<input type="text" class="form-control" id="exampleInputName2" value="${name}"/>
  						<select class='form-control' id='xiala' name='branchid'>
          				<option  value="0">请选择</option>
          				<c:forEach items="${lisbranch}" var="b">
              			<option  value="${b.id}" <c:if test="${b.id eq brid}">selected</c:if> >${b.branchname}</option>
          				</c:forEach>
          				
  						</select>
  				   </div>
          		<button type="button" class="btn btn-primary" id="butn">查询</button>
		    </form>
      
          </td>
      </tr>
      <tr class="info">
          <td>姓名</td>
          <td>部门类别</td>
          <td>就职状态</td>
          <td>入职日期</td>
          <td>修改</td>
      </tr>
      <c:forEach items="${lisuser}" var="v">
         <tr >
          <td>${v.adminname}</td>
          <td>${v.branch.branchname}</td>
          <td>${v.adminstart}</td>
          <td class="date">${v.admindate}</td>
          <td><button class='btn btn-primary' onclick="window.location.href='${cxt}/admin/tomanageadd?id=${v.id}'">修改</button>
            <button  id="del" onclick="dels('${v.id}')" class='btn btn-danger'>删除</button>
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
  </body>
</html>
