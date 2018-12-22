<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- jQuery -->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script src="${js}/jquery-2.0.0.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script type="text/javascript">
	//全选
	function cli(Obj){

     var collid = document.getElementById("selectall")
     var coll = document.getElementsByName(Obj)
     if (collid.checked){
      for(var i = 0; i < coll.length; i++)
      coll[i].checked = true;
     }else{
      for(var i = 0; i < coll.length; i++)
      coll[i].checked = false;
     }
}


	// 删除
	function deletea(id) {
	    if(confirm('确实要删除吗?')) {
	$.post("<%=path%>/goods/deletebyid",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("删除成功！");	
	                window.location.reload();                
	            }else{
	                alert("删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
	
	function updateC(id){
	
	}
</script>
  </head>
  
  <body class="bg-warning">
  <div>
   <form action="<%=path%>/goods/selectbyother" method="post"><fieldset><legend class="bg-info">物资清单</legend>
		<table class="table table-bordered">
		<div style="font-size: 18px">
			编码<input type="text" name="goodscode"> 
			物资<input type="text" name="goodsname"> 
			类型<select name="type"><option value="0" selected="selected">请选择</option>
			<c:forEach items="${list1}" var="a"><option>${a.type}</option></c:forEach>
				</select>
			<input type="submit" value="查询">
			</tr>
			</div>
			<tr>
				<td><input type="checkBox" id="selectall" name="case"
					onclick="cli('case')" /></td>
				<td>编号</td>
				<td>物资</td>
				<td>编码</td>
				<td>类型</td>
				<td > <a href="<%=path%>/jsp/goods/insert.jsp">增加</a></td>
			</tr>
			
			<c:forEach items="${list}" var="c">
				<tr>
					<td><input type="checkBox" id="case" name="case" /></td>
					<td>${c.id}</td>
					<td>${c.goodsname}</td>
					<td>${c.goodscode}</td>
					<td>${c.type}</td>
					<td><a href="<%=path%>/goods/selectbyid/${c.id}" class="btn btn-primary btn-xs" >修改</a>
				</tr>
			</c:forEach>
		</table>
		<div style="font-size:20px ">
		<a href="/mavenfst/goods/selectall/${1}">首页</a> 
		<a href="/mavenfst/goods/selectall/${page1.pageNum-1}">上一页</a>
		<a href="/mavenfst/goods/selectall/${page1.pageNum+1}">下一页</a>
        <a href="/mavenfst/goods/selectall/${page1.pages}">末页</a>
        </div>
        </fieldset>
	</form>
	</div>
  </body>
</html>
