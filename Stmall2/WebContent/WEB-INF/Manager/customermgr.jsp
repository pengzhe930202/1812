<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
    <title>用户管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Le styles -->
    <link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script" rel="stylesheet" type="text/css">
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
		
		</div> <!-- end main-left-col -->
	
	</div> <!-- end span2 -->
	
	<div class="span10">
		
	<div class="secondary-masthead">
	
		<ul class="nav nav-pills pull-right">
			<li>
				<a href="#"><i class="icon-globe"></i> View Website</a>
			</li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> John Smith <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="profile.html">Your Profile</a></li>
					<li class="active"><a href="form.html">Account Settings</a></li>
					<li class="divider"></li>
					<li><a href="">Logout</a></li>
				</ul>
			</li>
		</ul>

		<ul class="breadcrumb">
			<li>
				<a href="">后台管理</a> <span class="divider">/</span>
			</li>
			<li class="active">用户管理</li>
		</ul>
		
	</div>
	
	<div class="main-area dashboard">
	
			<div class="alert alert-info">
				<a class="close" data-dismiss="alert" href="#">x</a>
				<h4 class="alert-heading">Information</h4>
				The listing template can be used to list content that requires editing, such as pages, product catalogue, settings and members.
			</div>
			
			<div class="row">
			
				<div class="span10">
				
					<div class="slate">
					
						<div class="form-inline">
							<input type="text" id="cname" class="input-large" placeholder="Keyword...">
							
							<button type="submit" class="btn btn-primary" onclick="selectCustomer(1)">查询</button>
						</div>
					
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
							<tr>
								<th>cid</th>
								<th><a href="form.html">账号</a> </th>
								<th><span class="meta">密码</span></th>
								<th><span class="label label-info">电话 </span></th>
								<th><span class="label label-info">真实姓名</span></th>	
								<th><span class="label label-info">身份证号 </span></th>
								<th><span class="label label-info">地址 </span></th>
								<th><span class="label label-info">余额</span></th>
								<th><span class="label label-info">状态 </span></th>
								<th><span class="label label-info">注册时间 </span></th>
								<th class="actions">
								操作
								</th>
							</tr>
						</thead>
						<tbody id="customerlist">
							
						</tbody>
						</table>

					</div>
				
				</div>
				
				<div class="modal hide fade" id="removeItem">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h3>Remove Item</h3>
					</div>
					<div class="modal-body">
						<p>Are you sure you would like to remove this item?</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn" data-dismiss="modal">Close</a>
						<a href="#" class="btn btn-danger">Remove</a>
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
	
	</div> <!-- end span10 -->
		
	</div> <!-- end row -->
		
</div> <!-- end container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.js"></script>

<script type="text/javascript">
	
	selectCustomer(1); 
	function selectCustomer(curpage){
		var cname = $("#cname").val();
		
		//根据条件查询	
		$.ajax({
			url:"getAllCustomermgr.action",
			type:"post",
			data:{"cname":cname,"curpage":curpage},
			dataType:"JSON",
			success:function(data){
			//显示数据
				var html = "";
				$.each(data.list,function(index,item){
					html +=
					"<tr>"+
					"<td>"+ item.cid +"</td>"+
					"<td><a href=\"form.html\">"+ item.cname +"</a> </td>"+
					"<td><span class=\"label label-info\">"+ item.password +"</span></td>"+
					"<td><span class=\"meta\">"+ item.cphone +"</span></td>"+
					"<td><span class=\"meta\">"+ item.crealname +"</span></td>"+
					"<td><span class=\"meta\">"+ item.ccard +"</span></td>"+
					"<td><span class=\"meta\">"+ item.caddr +"</span></td>"+
					"<td><span class=\"meta\">"+ item.cmoney +"</span></td>"+
					"<td><span class=\"meta\">"+ item.cstatus +"</span></td>"+
					"<td><span class=\"meta\">"+ item.cregdate +"</span></td>"+
					"<td class=\"actions\">"+
					"<a class=\"btn btn-small btn-danger\" data-toggle=\"modal\" href=\"\">Remove删除</a>"+
					"<a class=\"btn btn-small btn-primary\" href=\"Manager/updatecustomermgr.action?cid="+item.cid+"\">Edit修改</a>"+
					"</td>"+
					"</tr>";
				});
				$("#customerlist").html(html);
				
				var pageHtml = "";
				
				if(data.curpage > 1){
					pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectCustomer("+ (data.curpage-1) +")\">Prev</a></li>"
				}else{
					pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\">Prev</a></li>"
				}
				
				for(var i=1;i <= data.pagecount;i++){
					if(data.curpage != i){
						pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectCustomer("+ i +")\">"+ i +"</a></li>"
					}else{
						pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\">"+ i +"</a></li>"
					}
				}
				
				if(data.curpage == data.pagecount){
					pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\" >Next</a></li>"
				}else{
					pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectCustomer("+ (data.curpage+1) +")\">Next</a></li>"
				}
				$("#page").html(pageHtml);
			}
		});
	}
</script>

</body>
</html>