<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
  	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"><title>中国移动网</title>
		<link rel="stylesheet" type="text/css" href="${css}/bootstrap.min.css" />
		<script src="${js}/layDate-v5.0.9/laydate/laydate.js"></script>

		<script type="text/javascript" src="${css}/jquery-2.0.0.min.js">
			/*	function showtime() {
																																																			/*日期和星期*/
			/*$('.form_datetime').datetimepicker({
				weekStart: 0, //一周从哪一天开始
				todayBtn: 1, //
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				forceParse: 0,
				showMeridian: 1
			});*/
			/*显示日期时间选择器*/
			$('#datetimepicker').datetimepicker('show');
		</script>
		<style>
			.row {
				background-color: #F3F3F4;
				width: 1300px;
				height: 80px;
				align-content: center;
			}
			
			#show {
				padding: 30px;
			}
			
			.list-unstyled {
				margin-left: 30px;
			}
			
			.daohang {
				border: 0px;
				width: 1285px;
				height: 40px;
				/*line-height: 30px;*/
				background-color: #0088CC;
			}
			
			.list-inline {
				font-family: "微软雅黑";
				font-size: 16px;
				float: left;
				margin-left: 30px;
				/*line-height: 30px;*/
			}
			
			.list-inline li {
		
			line-height: 20px;
			text-align: center;
			}
			.li {
				list-style: none;
			}
			
			.col-xs-4 {
				border-right: 1px solid#AC2925;
				width: 200px;
				height: 700px;
			}
			
			.col-xs-6 {
				width: 900px;
			}
			
			.bg-primary {
				margin-top: 5px;
			}
			
			.ziti {
				height: 30px;
				width: 1065px;
				background-color: #0088CC;
				margin-top: 5px;
			}
			
			.list-line {
				list-style: none;
				font-size: 9;
			}
		
			#bottom{
				list-style: none;
				float: left;
				height: 60px;
				width:1300px;
				background-color:  #F3F3F4;
			
			}
			.bottmo{
				list-style: none;
				text-align: center;
			}
		</style>
	</head>

	<body onload="startTime()">
		<div id="txt"></div>
		<!--头部-->
		<!-- Columns are always 50% wide, on mobile and desktop -->
		<div class="row">
			<div class="col-xs-6">
				<h4><img src="images/1.jpg" height="64px" width="142px"/>中国移动采购与招标网</h4>
			</div>
			<div class="zhong" id="show">2018-11-19星期一&nbsp;&nbsp;
				<!--搜索-->
				<input type="text" placeholder="輸入搜索内容">
				<button class="btn btn-default" type="button">搜索</button>
			</div>
		</div>
		<!--主体-->

		<div class="daohang">
			<ul class="list-inline">
				<li>
					<a href="#">
						<font color="whitesmoke">首页</font>
					</a>
				</li>
				<li>
					<a href="#">
						<font color="whitesmoke">招标采购公告</font>
					</a>
				</li>
				<li>
					<a href="#">
						<font color="whitesmoke">供应商公告</font>
					</a>
				</li>
				<li>
					<a href="#">
						<font color="whitesmoke">政策法规</font>
					</a>
				</li>
				<li>
					<a href="#">
						<font color="whitesmoke">服务中心</font>
					</a>
				</li>
				<li>
					<a href="#">
						<font color="whitesmoke">法律声明</font>
					</a>
				</li>
			</ul>
		</div>
		<div class="li">
			<div class="col-xs-4">
				<h4><b>供应商公告</b></h4><br>
				<ul class="list-line">
					<li>
						<a href="#">一采供应商</a>
					</li>
					<li>
						<a href="#">一采供应商</a>
					</li>
					<li>
						<a href="#">一采供应商</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="col-xs-6">
			<h4><img src="images/2.jpg"  height="40" width="45"/>&nbsp;&nbsp;<b>一采公告上查询</b></h4>
			<div>
				标题&nbsp;&nbsp;<input type="text" placeholder="请输入检索的内容" />&nbsp;&nbsp;时间&nbsp;&nbsp;
				<!--日历1-->
				<input type="text" class="demo-input" placeholder="请选择日期" id="test1">
				<script>
					lay('#version').html('-v' + laydate.v);

					//执行一个laydate实例
					laydate.render({
						elem: '#test1' //指定元素
					});
				</script>&nbsp;&nbsp;
				<!--日历2-->

				到&nbsp;&nbsp;&nbsp;&nbsp;

				<input type="text" class="demo-input" placeholder="请选择日期" id="test2">
				<script>
					lay('#version').html('-v' + laydate.v);

					//执行一个laydate实例
					laydate.render({
						elem: '#test2' //指定元素
					});
				</script>&nbsp;
				<!--
			<input type="text" placeholder="请输入检索的内容" />&nbsp;&nbsp;-->
				<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off">
  搜索
</button>
			</div>

			<div class="ziti">
				<a>
					<font size="3" color="whitesmoke">查询结果</font>
				</a>
			</div>
			<div>
				<table class="table">
					<td width="20%"><b>公告类型</b></td>
					<td width="50%">标题</b>
					</td>
					<td>时间</td>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>
					<tr class="" onmousemove="cursorOver(this)" onmouseout="cursorOut(this)" onclick="selectResult('1621')">
						<td style="width:80px;" align="left">一采供应商公告</td>
						<td style="width:280px;" align="left">
							<a href="#this" title="中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示（2018年）">中国移动“基站用综合机柜、网络综合机柜产品供应商信息核查”相关信息公示...</a>
						</td>
						<td style="width:100px" align="left">2018-11-16</td>
					</tr>

				</table>
				<!--分页-->
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li>
							<a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li>
							<a href="#">1</a>
						</li>
						<li>
							<a href="#">2</a>
						</li>
						<li>
							<a href="#">3</a>
						</li>
						<li>
							<a href="#">4</a>
						</li>
						<li>
							<a href="#">5</a>
						</li>
						<li>
							<a href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<div id="bottom">
			<ul class="bottmo">
				<li>中国移动有限公司</li>
				<li>手机号：1232324343</li>
				<li>技术支持工作时间（工作日）：上午 9：00~12：00 下午 13：00~18:00</li>
			</ul>
		</div>
		</div>
		</div>
	</body>

</html>
