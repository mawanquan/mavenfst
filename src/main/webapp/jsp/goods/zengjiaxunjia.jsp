<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zengjiaxunjia.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<script type="text/javascript" src="${cxt }/js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript">
	function app(id){
	
	var tr=$("#"+id);
	var trs=tr.prop("checked");
		if(trs){
		var str="数量<input type='text'name='nums' id='num"+id+"'>";
		var str2="采购时间<input type='text'name='getdates' id='getdate"+id+"'>";
		tr.parent().append(str+str2);
		}else{
		alert("ok");
		$("#num"+id).remove();
		$("#getdate"+id).remove();
		}
	}

	
	</script>
  </head>
  
  <body class="bg-warning">
  <form action="<%=path%>/goods/zengjia" method="post">
  <fieldset><legend style="font-size: 30px;">添加</legend>
  <table class="table table-bordered">
  <tr><td>标 题:</td><td><input type="text" name="goodstitle"></td></tr>
 <tr><td>发 布 人:</td><td><select name="adminname"><option value="0" selected="selected">请选择</option> 
			<c:forEach items="${list2}" var="a"><option>${a.adminname}</option></c:forEach> 
 				</select></td></tr>
 <tr><td>截 止 日 期:</td><td><input type="text" name="lastdate"></td></tr>
 <tr><td>选择需要的物资：</td><td>
 <c:forEach items="${list}" var="c">
 <div><input type="checkbox" id="${c.id}" value="${c.id}" name="goodsname" onclick="app(${c.id})">${c.goodsname}
 </div>
 
 </c:forEach></td>
 </tr>
 <tr><td><input type="button" value="选择物资" onclick="a()"></td></tr>	
 	
 				
 				
<tr><td><input align="middle" style="font-size: 20px" type="submit" value="提交"></td></tr>
</table>

</fieldset>
</form>
  </body>
</html>
