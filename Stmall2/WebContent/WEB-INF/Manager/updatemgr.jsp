<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script"
	rel="stylesheet" type="text/css">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/font-awesome.css" rel="stylesheet">
<link href="assets/css/admin.css" rel="stylesheet">

<title>修改管理员密码</title>
</head>
<body>
	<div class="container">

		<div class="row">

			<div class="span2">

				<div class="main-left-col">

					<jsp:include page="menu.jsp"></jsp:include>
				</div>
				<!-- end main-left-col -->

			</div>
			<!-- end span2 -->

			<div class="span10">

				<div class="secondary-masthead">

					<ul class="nav nav-pills pull-right">
						<li><a href="#"><i class="icon-globe"></i> View Website</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"><i class="icon-user"></i>
								John Smith <b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><a href="profile.html">Your Profile</a></li>
								<li class="active"><a href="form.html">Account Settings</a>
								</li>
								<li class="divider"></li>
								<li><a href="">Logout</a></li>
							</ul></li>
					</ul>

					<ul class="breadcrumb">
						<li><a href="Manager/goodsmgr.action">后台管理</a> <span
							class="divider">/</span></li>
						<li class="active">修改密码</li>
					</ul>

				</div>

				<div class="main-area dashboard">

					<div class="alert alert-info">
						<a class="close" data-dismiss="alert" href="#">x</a>
						<h4 class="alert-heading">Information</h4>
						This template shows how forms can be laid out for editing content.
					</div>

					<div class="span10">

						<div class="slate">

							<div class="page-header">
								<h2>修改密码</h2>
							</div>

							<form class="form-horizontal" action="Manager/update.action"
								method="post" enctype="multipart/form-data">
								<fieldset>
									<div class="control-group">

										<label class="control-label">mid</label>
										<div class="controls">
											<input class="input-xlarge focused" type="text"
												value="${sessionScope.manager.mid }" name="mid"
												readonly="readonly">
										</div>
									</div>
									<div class="control-group">

										<label class="control-label">账号</label>
										<div class="controls">
											<input class="input-xlarge focused" type="text"
												value="${sessionScope.manager.mname }" name="mname"
												readonly="readonly">
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">新密码</label>
										<div class="controls">
											<input class="input-xlarge focused" type="password"
												name="mpassword" id="mpassword">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">重复密码</label>
										<div class="controls">
											<input class="input-xlarge focused" type="password"
												name="mpassword2">
										</div>
									</div>
									${error }
									<div class="control-group">

										<div class="controls">
											<input class="btn btn-info" id="fileInput" type="submit"
												value="修改密码">
										</div>
									</div>
								</fieldset>
							</form>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>