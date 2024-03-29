<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>后台管理</title>
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
						<li><a href="#">Admin</a> <span class="divider">/</span></li>
						<li class="active">Dashboard</li>
					</ul>

				</div>

				<div class="main-area dashboard">

					<div class="row">

						<div class="span10">

							<div class="slate clearfix">

								<a class="stat-column" href="#"> <span class="number">16</span>
									<span>Open Orders</span>

								</a> <a class="stat-column" href="#"> <span class="number">452</span>
									<span>Members</span>

								</a> <a class="stat-column" href="#"> <span class="number">$2,512</span>
									<span>Revenue</span>

								</a> <a class="stat-column" href="#"> <span class="number">348</span>
									<span>Subscribers</span>

								</a>

							</div>

						</div>

					</div>

					<div class="row">

						<div class="span5">

							<div class="slate">

								<div class="page-header">
									<h2>
										<i class="icon-signal pull-right"></i>Stats
									</h2>
								</div>
								<div id="placeholder" style="height: 297px;"></div>

							</div>

						</div>

						<div class="span5">

							<div class="slate">

								<div class="page-header">
									<h2>
										<i class="icon-shopping-cart pull-right"></i>Latest Orders
									</h2>
								</div>

								<table class="orders-table table">
									<tbody>
										<tr>
											<td><a href="">#12345 - Joe Bloggs</a> <span
												class="label label-info">Paid</span></td>
											<td>$112.00</td>
										</tr>
										<tr>
											<td><a href="">#12345 - Joe Bloggs</a> <span
												class="label label-success">Dispatched</span></td>
											<td>$112.00</td>
										</tr>
										<tr>
											<td><a href="">#12345 - Joe Bloggs</a> <span
												class="label label-important">Refunded</span></td>
											<td>$112.00</td>
										</tr>
										<tr>
											<td><a href="">#12345 - Joe Bloggs</a> <span
												class="label">Awaiting Payment</span></td>
											<td>$112.00</td>
										</tr>
										<tr>
											<td><a href="">#12345 - Joe Bloggs</a> <span
												class="label label-inverse">Failed</span></td>
											<td>$112.00</td>
										</tr>
										<tr>
											<td><a href="">#12345 - Joe Bloggs</a> <span
												class="label label-warning">Cancelled</span></td>
											<td>$112.00</td>
										</tr>
										<tr>
											<td><a href="">#12345 - Joe Bloggs</a> <span
												class="label label-info">Paid</span></td>
											<td>$112.00</td>
										</tr>
										<tr>
											<td colspan="2"><a href="">View more orders</a></td>
										</tr>
									</tbody>
								</table>

							</div>

						</div>

					</div>

					<div class="row">

						<div class="span5">

							<div class="slate">

								<div class="page-header">
									<h2>
										<a class="pull-right iconlink" href=""><i class="icon-rss"></i></a>News
									</h2>
								</div>

								<table class="orders-table table">
									<tbody>
										<tr>
											<td><a href="">News article title</a></td>
											<td class="date">Today at 12:01</td>
										</tr>
										<tr>
											<td><a href="">Another news article title</a></td>
											<td class="date">Yesterday at 16:34</td>
										</tr>
										<tr>
											<td><a href="">A third news article title</a></td>
											<td class="date">22nd June 2014</td>
										</tr>
										<tr>
											<td><a href="">This news article title spans onto
													two lines so we can see what it will look like</a></td>
											<td class="date">21st June 2014</td>
										</tr>
										<tr>
											<td><a href="">A final news article title</a></td>
											<td class="date">20th June 2014</td>
										</tr>
										<tr>
											<td colspan="2"><a href="">Read more news</a></td>
										</tr>
									</tbody>
								</table>

							</div>

						</div>

						<div class="span5">

							<div class="slate">

								<div class="page-header">
									<h2>
										<i class="icon-envelope-alt pull-right"></i>Enquiries
									</h2>
								</div>

								<table class="orders-table table">
									<tbody>
										<tr>
											<td><a href="">Customer enquiry</a> <span
												class="label label-info">New</span></td>
											<td class="date">Today at 12:01</td>
										</tr>
										<tr>
											<td><a href="">Another customer enquiry</a> <span
												class="label label-info">New</span></td>
											<td class="date">Yesterday at 16:34</td>
										</tr>
										<tr>
											<td><a href="">A third customer enquiry</a></td>
											<td class="date">22nd June 2014</td>
										</tr>
										<tr>
											<td><a href="">This customer enquiry spans onto two
													lines so we can see what it will look like</a></td>
											<td class="date">21st June 2014</td>
										</tr>
										<tr>
											<td><a href="">A final customer enquiry</a></td>
											<td class="date">20th June 2014</td>
										</tr>
										<tr>
											<td colspan="2"><a href="">View more enquiries</a></td>
										</tr>
									</tbody>
								</table>

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
	<script src="assets/js/excanvas.min.js"></script>
	<script src="assets/js/jquery.flot.min.js"></script>
	<script src="assets/js/jquery.flot.resize.js"></script>
	<script type="text/javascript">
		$(function() {
			var d1 = [];
			d1.push([ 0, 32 ]);
			d1.push([ 1, 30 ]);
			d1.push([ 2, 24 ]);
			d1.push([ 3, 17 ]);
			d1.push([ 4, 11 ]);
			d1.push([ 5, 25 ]);
			d1.push([ 6, 28 ]);
			d1.push([ 7, 36 ]);
			d1.push([ 8, 44 ]);
			d1.push([ 9, 52 ]);
			d1.push([ 10, 53 ]);
			d1.push([ 11, 50 ]);
			d1.push([ 12, 45 ]);
			d1.push([ 13, 42 ]);
			d1.push([ 14, 40 ]);
			d1.push([ 15, 36 ]);
			d1.push([ 16, 34 ]);
			d1.push([ 17, 24 ]);
			d1.push([ 18, 17 ]);
			d1.push([ 19, 17 ]);
			d1.push([ 20, 20 ]);
			d1.push([ 21, 28 ]);
			d1.push([ 22, 36 ]);
			d1.push([ 23, 38 ]);

			$.plot($("#placeholder"), [ d1 ], {
				grid : {
					backgroundColor : 'white',
					color : '#999',
					borderWidth : 1,
					borderColor : '#DDD'
				},
				colors : [ "#FC6B0A" ],
				series : {
					lines : {
						show : true,
						fill : true,
						fillColor : "rgba(253,108,11,0.4)"
					}
				}
			});
		});
	</script>


</body>
</html>