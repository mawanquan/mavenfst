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
    
    <title>My JSP 'xunjia.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="${css}bootstrap.min.css">
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
<script type="text/javascript">
	//全选
	function cli(){

     var collid = document.getElementById("all")
     var oid = document.getElementsByName("case")
     if (collid.checked){
      for(var i = 0; i < oid.length; i++)
      oid[i].checked = true;
     }else{
      for(var i = 0; i < oid.length; i++)
      oid[i].checked = false;
     }
}
	//点击发布
	
	$(function(){
	
	
	
	$("#put").click(function() {
	var oid = document.getElementsByName("case");
	var s=[];
	$("input[name='case']:checked").each(function(i){
   		s.push($(this).val());
 	});
		
		  $.get("<%=path%>/goods/addmany",
		 {"ids":s.join("&")},
		  function(data) {
			if (data == "ok") {
				alert("发布成功!");
				location.href = "<%=path%>/goods/goodsdetail";
			} else {
				alert("发布失败!");
			}
		}); 
	});
	
	})
	
</script>

  </head>
  
  <body>
   <form action="<%=path%>/goods/zengjia" method="post"><fieldset><legend class="bg-info">询价单</legend>
		<table class="table table-bordered">
			<tr>
				<td><input type="checkBox" id="all"
					onclick="cli()" /></td>
				<td>标题</td>
				<td>发布人</td>
				<td>截止日期</td>
				<td><button  type="button" id="put">批量发布</button></td>
			</tr>
			
			<c:forEach items="${list}" var="c">
				<tr>
					<td><input type="checkBox" name="case" value="${c.id}"/></td>
					<td>${c.goodstitle}</td>
					<td>${c.admin.adminname}</td>
					<td>${c.lastdate}</td>
					<td><a href="<%=path%>/goods/addxunjia/${c.id}">发布</a>
					|<a href="<%=path%>/goods/chaxun/${c.id}">明细</a>
					</td>		
				</tr>

			</c:forEach>
			
			<a href="<%=path%>/goods/adminAndGoods" style="font-size: 20px">添加</a>
		</table>
		
        </fieldset>   
        
	</form>
  </body>
</html>