<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
			<meta charset="utf-8">
		<base href="<%=basePath%>">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="${css}bootstrap.min.css" rel="stylesheet">
		<link href="${css}my.css" rel="stylesheet">
		<script src="${js}jquery-2.0.0.min.js"></script>
		<script src="${js}bootstrap.min.js"></script>
	</head>

	<body>
		<!--***********************头部************************-->
		<div class="header">
			<div class="container-fluid">
				<!---------------------------头上------------------------------>
				<div class="top-bar">
					<div class="row">
						<div class="col-xs-4">
							<div class="top-bar-1 ">
								<img src="images/img/mobile.png" />
							</div>
						</div>

						<div class="col-xs-8">
							<div class="top-bar-3 ">
								<form class="navbar-form navbar-right ">
									<div class="form-group" >
										<input type="text" class="form-control" placeholder="关键字搜索">
									</div>
									<button type="submit" class="btn btn-default " >
										<span class="glyphicon glyphicon-search"></span>	
									</button>
								</form>

							</div>
						</div>
					</div>
				</div>
				<!---------------------------头下------------------------------>
				<div class="top-bot">
					<nav class="navbar navbar-default top-bot-col">
						<div class="container-fluid ">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								        <span class="sr-only">Toggle navigation</span>
								        <span class="icon-bar"></span>
								        <span class="icon-bar"></span>
								        <span class="icon-bar"></span>
						      		</button>
							</div>
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav top-bot-1 ">
									<li>
										<a href="${cxt}/jsp/home.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;首页</a>
									</li>
									<li>
										<a href="caigougonggao.html">招标采购公告</a>
									</li>
									<li>
										<a href="gongyingshanggonggao.html">供应商公告</a>
									</li>
									<li>
										<a href="tousuzhongxin.html">投诉中心</a>
									</li>
									<li class="active">
										<a href="${cxt}/jsp/jiapage/fuwuzhongxin.jsp">服务中心</a>
									</li>
									<li>
										<a href="${cxt}/jsp/jiapage/falvshengming.jsp">法律声明</a>
									</li>
								</ul>

							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<!--***********************主体************************-->
		<div class="container-fluid">
			<div class="main4">
				<div class="row">
					<div class="col-xs-2 m1">
						<!-- Nav tabs -->
						<ul class="nav nav-pills nav-stacked m1-1" role="tablist">
							<li role="presentation" class="active success">
								<a style=" " href="#home" aria-controls="home" role="tab" data-toggle="tab"><img src="images/img/m45.png"/>&nbsp;&nbsp;下载专区</a>
							</li>
							<li role="presentation">
								<a href="#profile1" aria-controls="profile1" role="tab" data-toggle="tab">&nbsp;<img src="images/img/m46.png" />&nbsp; &nbsp;&nbsp;常见问题</a>
							</li>
							<li>
								<a name="001"href="#profile2" aria-controls="profile2" role="tab" data-toggle="tab" id="zhunbei">&nbsp;<img src="images/img/m47.png" />&nbsp; &nbsp;招标前准备</a>
							</li>

						</ul>
					</div>
					<div class="container-fluid">
						<div class="col-xs-10 m2">
							<!-- Tab panes -->
							<div class="tab-content m2-1" style="background-color: ;height: 300px;">
								<div role="tabpanel" class="tab-pane active m2-1-1" id="home">
									<table class="table table-bordered " style="">
										<tr style="">
											<td style="">
												<img src="images/img/m41.png" />
												<a href="#">&nbsp;&nbsp;&nbsp;操作手册</a>
											</td>
											<td style=""><img src="images/img/m42.png" />
												<a href="#">&nbsp;&nbsp;&nbsp;培训材料视频</a>
											</td>
										</tr>
										<tr>
											<td style=""><img src="images/img/m43.png" />
												<a href="#">&nbsp;&nbsp;&nbsp;CA证书办理及安装</a>
											</td>
											<td style=""><img src="images/img/m44.png" />
												<a href="#">&nbsp;&nbsp;&nbsp;离线投标工具安装</a>
											</td>
										</tr>
									</table>

								</div>
								<div role="tabpanel" class="tab-pane m2-1-2" id="profile1">
									<form class="form-horizontal ">
										<fieldset>
											<div id="legend">
												<legend style="">常见问题</legend>
											</div>
											<ul style="">
												<li>
													<h5>1.供应商如何登录“中国移动采购与招标网”？</h5>
												</li>
												<li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中国移动采购与招标网的访问地址为http://b2b.10086.cn。中国移动采购与招标网是中国移动通信集团公司（包括下属子公司、分公司）对外发布采购公告与结果 公示的权威门户，是全集团统一发布各类采购信息的电子化媒介
												</li>
											
											
												<li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供应商可以访问中国移动采购与招标网查看采购公告及结果公示信息，无须注册和登录。如果供应商需要参与项目投标或应答、以及签约后采购执行等操作，需要通 过中国移动采购与招标网进行注册，维护实体信息。
												</li>
												
												<li>
													<h5>2.供应商如何参与中国移动电子采购与招标投标项目？</h5></li>
												<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中国移动采购与招标网是中国移动采购业务供应商统一访问门户，供应商登录中国移动采购与招标网可以参与中国移动电子采购与招标投标项目、采购协同等操作。</li><li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供应商通过“供应商登录”链接登录到中国移动采购与招标网，选择“招投标操作”，按照系统提示信息进入相应系统，参与中国移动电子采购与招标投标项目。
												</li>
											</ul>
										</fieldset>
									</form>

								</div>
								<div  role="tabpanel" class="tab-pane m2-1-2" id="profile2" >
									<form class="form-horizontal" >
										<fieldset>
											<div>
												<legend >招标前准备</legend>
											</div>
											<ul >
												<li>1：供应商在参加中国移动的招标前，需要浏览中国移动的招标公告，并记住您期望参加投标的采购项目的“项目编号”；商家注册成为中移动的潜在供应商需要输入 采购“项目编号”；
												</li>
												<br />
												<li>2：注册成为中移动的潜在供应商；请下载供应商门户的操作手册，并用注册获得的用户名和密码，登陆到招投标业务操作平台，查看和下载更详细的供应商招投标业 务相关的资料；
												</li>
												<br />
												<li>3：注册时，准备好工商注册材料的扫描件和复印件，以便在注册成为中移动潜在供应商时，输入正确的信息。输入时必须谨慎小心，按招投标业务的填写并上传各种 工商注册资料原件的扫描件；
												</li>
												<br />
												<li>4：成功注册后，记住自己账户和密码，留心您参加的招投标项目的信息公告，按招标流程完成必需的操作。 </li>
											</ul>
										</fieldset>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!--************************尾****************************8-->
		<div class="container-fluid ">
			<div class="tail">
				<div class="row">
					<div class="col-xs-4 tail-1">
					</div>
					<div class="col-xs-5 tail-2">
						<li>
							<p>京IQP备05002571号 | 热吧招标版权所有</p>
						</li>
						<li>
							<p>技术支持工作时间（工作日）：上午 9：00~12：00 下午 13：00~18:00</p>
						</li>
					</div>
					<div class="col-xs-3 tail-3">
					</div>
				</div>
			</div>
		</div>
	</body>

</html>
