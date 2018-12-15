<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tongji.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.min.css">
<style type="text/css">
		
		.container{
		height: 300px;
		}
		</style>



  </head>
  
  
  
	<body>
	<script src="${cxt }/code/highcharts.js"></script>
<script src="${cxt }/code/highcharts-3d.js"></script>
<script src="${cxt }/code/modules/exporting.js"></script>

<div class="container">
		<table class="table table-hover table-bordered  table-condensed">
		
			<c:forEach items="${list4}" var="v">
			<tr>
			<td>${v.address}</td>
			<td>${v.num}</td>
			</tr>
				
			</c:forEach>
			
		</table>
	</div>

<div id="container"   style="height: 400px"></div>
 

		<script type="text/javascript">

Highcharts.chart('container', {
    chart: {
        type: 'pie',
        options3d: {
            enabled: true,
            alpha: 45
        }
    },
    title: {
        text: '供货商地址统计'
    },
    subtitle: {
        text: '3D donut in Highcharts'
    },
    plotOptions: {
        pie: {
            innerSize: 100,
            depth: 45
        }
    },
    series: [{
        name: 'Delivered amount',
        data: ${list}
    }]
});
		</script>


	</body>

</html>
