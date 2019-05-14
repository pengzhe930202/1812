<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<i class="icon-shopping-cart icon-large"></i>后台管理
	</h1>

	<ul class="side-nav">

		<li class="active"><a href="Manager/index.action"><i class="icon-home"></i>首页</a></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="collapse" data-target="#website-dropdown" href="Manager/typemgr.action"><i
				class="icon-sitemap"></i>分类管理<b class="caret"></b></a>
			</li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="collapse" data-target="#website-dropdown" href="Manager/customermgr.action"><i
				class="icon-sitemap"></i>用户管理<b class="caret"></b></a>
			</li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="collapse" data-target="#store-dropdown" href="Manager/goodsmgr.action"><i
				class="icon-shopping-cart"></i>商品管理<b class="caret"></b></a>
			</li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="collapse" data-target="#reports-dropdown" href="getAllOrder.action"><i
				class="icon-signal"></i>数据统计<b class="caret"></b></a>
				<!-- <li>
					<a href="Manager/ordermgr.action">Members</a>
				</li>
				<li>
					<a href="getAllOrder.action">User Groups</a>
				</li> -->
			</li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="collapse" data-target="#members-dropdown" href="Manager/updatemgr.action"><i
				class="icon-group"></i>修改密码<b class="caret"></b></a>
			</li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="collapse" data-target="#settings-dropdown" href="Manager/logout.action"><i
				class="icon-cogs"></i>退出登录<b class="caret"></b></a>
			</li>
		<li><a href="#"><i class="icon-bullhorn"></i> Alerts <span
				class="badge badge-warning">2</span></a></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="collapse" data-target="#help-dropdown" href="#"><i
				class="icon-info-sign"></i> Help <b class="caret"></b></a>
			</li>
	</ul>
	
</body>
</html>