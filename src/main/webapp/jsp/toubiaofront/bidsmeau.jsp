<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'bidsmeau.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="${css}bootstrap.min.css">
<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#an1").click(function() {
			$("#bidsku").attr("style", "display: block");
			$("#beforebids").attr("style", "display: none");
			$("#nowbids").attr("style", "display:none");

		});
		
		$("#an2").click(function() {
			$("#bidsku").attr("style", "display: none");
			$("#beforebids").attr("style", "display: none");
			$("#nowbids").attr("style", "display: block");
			
			 var url="${cxt}/bids/selstrat1";
	         $.post(url,
	         {"start":1},
	         function(reg){
	        $("#nowbids table").html("");
	         if(reg==""){
	         $("#nowbids table").html("<tr><td>不存在现在投标记录</td></tr>");
	         }else{
	         var htm="";
	         for(var i=0;i<reg.length;i++){
	        htm+="<tr id='"+reg[i].id+"'><td><a href=''>"+reg[i].decl.title+"</a></td><td><button class='btn btn-danger' type='button' onclick='up(0,"+reg[i].id+")'>弃标</button></td>";
	             }
	              $("#nowbids table").append(htm);
	           }
	         }
	         ,'json')  

		});
		$("#an3").click(function() {
		    $("#bidsku").attr("style", "display: none");
			$("#beforebids").attr("style", "display: block");
			$("#nowbids").attr("style", "display:none");
			 $("#beforebids table tbody tr td").parent("tr").remove();
			 var url="${cxt}/bids/selstart";
			 $.post(url,{"start":0},
			 function (reg){
	          if(reg==""){
	            $("#beforebids table").html("<tr><td>不存在历史投标记录</td></tr>")
	         }else{
	           for(var i=0;i<reg.length;i++){
	               if(reg[i].start==0){
	                   var htm1="<tr  id='"+reg[i].id+"'><td><a href=''>"+reg[i].decl.title+"</a></td><td><button class='btn btn-danger' type='button' onclick='del("+reg[i].id+")'>彻底删除</button></td>";
	          		   $("#bidszero").append(htm1);
	           
	           	   }else if(reg[i].start==3){
	           		  var htm2="<tr  id='"+reg[i].id+"'><td><a href=''>"+reg[i].decl.title+"</a></td><td><button class='btn btn-danger' type='button' onclick='del("+reg[i].id+")'>彻底删除</button></td>";
	           		  $("#bidsthree").append(htm1);
	               }
	              else if(reg[i].start==4){
	                  var htm3="<tr  id='"+reg[i].id+"'><td><a href=''>"+reg[i].decl.title+"</a></td><td><button class='btn btn-danger' type='button' onclick='del("+reg[i].id+")'>彻底删除</button></td>";
	                  $("#bidsfour").append(htm1);
	                   }
	            } 
	          }
	    });
			 
	         

		});

	});
	function up(start,id){
	var url="${cxt}/bids/upJoinZbxx";
	$.post(url,
	{"start":start,"id":id},
	function(reg){
	if(reg>0){
	$("#"+id).remove();
	}
	}
	,'json'
	)
	}
	function del(id){
	var url="${cxt}/bids/delJoinZbxx";
	$.post(url,
	{"id":id},
	function(reg){
	if(reg>0){
	$("#"+id).remove();
	}
	}
	,'json'
	)
	}
	function href(id){
	window.location.href="${cxt}/bids/upjpoinzbxxzbfile?id="+id;
	}
</script>

</head>

<body>
	<div class="row" style="border-bottom: 1px solid #eaeaea">
		<div class="col-md-2">
			<button class="btn btn-default" type="button"  id="an1">我的投标库</button>
		</div>
		<div class="col-md-2">
			<button class="btn btn-default" type="button"  id="an2">正在投标</button>
		</div>
		<div class="col-md-2">
			<button class="btn btn-default" type="button" id="an3">历史投标</button>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div id="bidsku" style="display:block;">
		<table class="table table-striped table-bordered ">
			<c:forEach items="${lisdec}" var="v">
				<tr id="${v.id}">
					<td><a href="${cxt}/bids/upjpoinzbxxzbfile?id=${v.id}">${v.decl.title}</a></td>
					<td>
						<button class="btn btn-danger" type="button"
							onclick="up(0,${v.id})">弃标</button>|
						<button class="btn btn-info" type="button" onclick="up(1,'${v.id}')">投标</button>|
						<button class="btn btn-info" type="button" onclick="href(${v.id})">修改</button>
					</td>
				</tr>
			</c:forEach>


		</table>
	</div>
	<div id="nowbids" style="display:none;">
		<table class="table table-striped table-bordered">

		</table>
	</div>
	<div id="beforebids" style="display:none;">
		<table class="table table-striped table-bordered ">
		        <tr>
			        <th colspan="2">我的中标</th>
		    	</tr>
			<tbody id="bidsthree" style="border-bottom: 1px solid #eaeaea">
			</tbody>
			    <tr>
			        <th colspan="2">我的弃标</th>
		    	</tr>
			<tbody id="bidszero" style="border-bottom: 1px solid #eaeaea">
			</tbody>
			      <tr>
			        <th colspan="2">我的落标</th>
		    	</tr>
			<tbody id="bidsfour" style="border-bottom: 1px solid #eaeaea">
			     
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>
	