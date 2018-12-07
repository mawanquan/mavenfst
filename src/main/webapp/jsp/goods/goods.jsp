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
<script src="<%=basePath%>js/jquery-2.0.0.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>css/bootstrap.min.js"></script>
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
	alert("???")
	    if(confirm('确实要删除吗?')) {
	$.post("<%=basePath%>/goods/deletebyid",{"id":id},
	function(data){
	            if(data =="ok"){
	                alert("删除成功！");	
	                window.location.reload();                
	            }else{
	                alert("删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
  </head>
  
  <body>
   <form action="<%=path%>/goods/selectbyother" method="post"><fieldset><legend>物资列表</legend>
		<table>
			编码<input type="password" name="goodscode"> 
			物资<input type="text" name="goodsname"> 
			类型<select name="type"><option value="0" selected="selected">请选择</option>
			<c:forEach items="${list}" var="a"><option>${a.goods.type}</option></c:forEach>
				</select>
				截止日期<input type="password">
			<input type="submit" value="查询">
			</tr>
			<tr>
				<td><input type="checkBox" id="selectall" name="case"
					onclick="cli('case')" /></td>
				<td>编号</td>
				<td>数量</td>
				<td>物资</td>
				<td>编码</td>
				<td>类型</td>
				<td>截止日期</td>
				<td > <a href="<%=path%>/jsp/goods/insert.jsp">增加</a></td>
			</tr>
			<tr>
			<c:forEach items="${list}" var="c">
				
					<td><input type="checkBox" id="case" name="case" /></td>
					<td>${c.id}</td>
					<td>${c.num}</td>
					<td>${c.goods.goodsname}</td>
					<td>${c.goods.goodscode}</td>
					<td>${c.goods.type}</td>
					<td>${c.getdate}</td>
					<td><a href="#" class="btn btn-primary btn-xs" onclick="updateC()">修改</a>
						 <a href="#" class="btn btn-danger btn-xs" onclick="deletea(${c.id})">删除</a>
				</tr>
			</c:forEach>
		</table>
		<a href="/mavenfst/goods/selectall/${1}">首页</a> 
		<a href="/mavenfst/goods/selectall/${page1.pageNum-1}">上一页</a>
        <a href="/mavenfst/goods/selectall/${page1.pageNum+1}">下一页</a>
        <a href="/mavenfst/goods/selectall/${page1.pages}">末页</a>  
        </fieldset>
	</form>
  </body>
</html>
