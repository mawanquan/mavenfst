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
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
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

</script>

  </head>
  
  <body>
   <form action="<%=path%>/goods/zengjia" method="post"><fieldset><legend class="bg-info">询价单</legend>
		<table class="table table-bordered">
			<tr>
				<td><input type="checkBox" id="selectall" name="case"
					onclick="cli('case')" /></td>
				<td>标题</td>
				<td>发布人</td>
				<td>截止日期</td>
				<td>物资</td>
				<td>数量</td>
				<td>采购时间</td>
			</tr>
			
			<c:forEach items="${list}" var="c">
				<tr>
					<td><input type="checkBox" id="case" name="case" value="${c.id}"/></td>
					<td>${c.goodstitle}</td>
					<td>${c.admin.adminname}</td>
					<td>${c.lastdate}</td>
					<td>${c.goodsdetail[0].goods.goodsname}</td>
					<td>${c.goodsdetail[0].num}</td>
					<td>${c.goodsdetail[0].getdate}</td>
					</tr>
			</c:forEach>
			
			<a href="<%=path%>/goods/adminAndGoods">添加</a>&nbsp<a href="#">发布询价</a>
		</table>
		
        </fieldset>   
	</form>
  </body>
</html>