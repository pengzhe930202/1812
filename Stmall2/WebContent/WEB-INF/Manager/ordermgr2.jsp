<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>数据统计</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script"
	rel="stylesheet" type="text/css">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/font-awesome.css" rel="stylesheet">
<link href="assets/css/admin.css" rel="stylesheet">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

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
								<li class="active"><a href="form.html">Account Settings</a></li>
								<li class="divider"></li>
								<li><a href="">Logout</a></li>
							</ul></li>
					</ul>

					<ul class="breadcrumb">
						<li><a href="">后台管理</a> <span class="divider">/</span></li>
						<li class="active">数据统计</li>
					</ul>

				</div>

				<div class="main-area dashboard">

					<div class="alert alert-info">
						<a class="close" data-dismiss="alert" href="#">x</a>
						<h4 class="alert-heading">Information</h4>
						The listing template can be used to list content that requires
						editing, such as pages, product catalogue, settings and members.
					</div>

					<div class="row">

						<div class="span10">

							<div class="slate">

								<!-- <div class="form-inline">
									<input type="text" id="oname" class="input-large"
										placeholder="Keyword...">

									<button type="submit" class="btn btn-primary"
										onclick="selectAllOrder(1)">查询</button>
								</div> -->

							</div>

						</div>

					</div>

					<div class="row">

						<div class="span10">

							<div class="slate">

								<div class="page-header">
									<div class="btn-group pull-right">

										<ul class="dropdown-menu">
											<li><a href="">CSV123</a></li>
											<li><a href="">Excel</a></li>
											<li><a href="">PDF</a></li>
										</ul>
									</div>
									<h2>Listings</h2>
								</div>

								<table class="orders-table table">
									<thead>
										

									</thead>
									<tbody id="customerlist">
		 								<c:forEach items="${requestScope.list }" var="order">
										         <ol>
										       
										            <p>时间：<fmt:formatDate value="${order.odate }" pattern="yyyy/MM/dd  HH:mm:ss" />
										            &nbsp;&nbsp;订单号：${order.onum }
										            &nbsp;&nbsp;总价：${order.oprice }
										            &nbsp;&nbsp;cid：${order.cid }
										            &nbsp;&nbsp;地址：${order.oaddr }
										            &nbsp;&nbsp;电话：${order.ophone }
										            &nbsp;&nbsp;姓名：${order.oname }
										            </p>
										            
										        </ol>
										        <c:forEach items="${order.list }" var="details">
										        <div>
										            <ul>
										            	<p>商品ID：${details.gid }
										            	      商品：${details.gname }
													                商品单价：${details.gprice }
													                购买数量：${details.gcount }
													    </p>            
										            </ul>
										        </div>
										        </c:forEach>
										   </c:forEach> 
									</tbody>
								</table>

							</div>

						</div>

						<div class="span5">

							<div class="pagination pull-left">
								<ul id="page">

								</ul>
							</div>

						</div>



					</div>

					<div class="row">

						<div class="span10 footer">

							<p>&copy; Website Name 2014</p>

						</div>

					</div>

				</div>

			</div>
			<!-- end span10 -->

		</div>
		<!-- end row -->

	</div>
	<!-- end container -->

	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.js"></script>

		}
	</script>

</body>
</html>