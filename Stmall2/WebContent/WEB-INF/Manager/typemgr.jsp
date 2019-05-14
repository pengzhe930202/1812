<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
    <title>分类管理</title>
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
				<a href="Manager/index.action">后台管理</a> <span class="divider">/</span>
			</li>
			<li class="active">分类管理</li>
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
							<input type="text" id="tname" class="input-large" placeholder="Keyword...">
							
							<button type="submit" class="btn btn-primary" onclick="selectType(1)">查询</button>
						</div>
					
					</div>
				
				</div>
			
			</div>
			
			<div class="row">
				
				<div class="span10 listing-buttons">
				
					<a class="btn btn-primary" href="Manager/addtypeview.action">添加</a>
					
				</div>
				
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
								<th>tid</th>
								<th><a href="form.html">名</a> </th>
								<th><span class="meta">ptid</span></th>
								<th><span class="label label-info">操作</span></th>
								
							</tr>
						</thead>
						<tbody id="typelist">
							
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
	
	selectType(1); 
	function selectType(curpage){
		var tname = $("#tname").val();
		
		//根据条件查询	
		$.ajax({
			url:"getAllType.action",
			type:"post",
			data:{"tname":tname,"curpage":curpage},
			dataType:"JSON",
			success:function(data){
			//显示数据
				var html = "";
				$.each(data.list,function(index,item){
					html +=
					"<tr>"+
					"<td>"+ item.tid +"</td>"+
					"<td><a href=\"form.html\">"+ item.tname +"</a> </td>"+
					"<td><span class=\"label label-info\">"+ item.ptid +"</span></td>"+
				
					"<td class=\"actions\">"+
					"<a class=\"btn btn-small btn-danger\" data-toggle=\"modal\" href=\"\">Remove删除</a>"+
					"<a class=\"btn btn-small btn-primary\" href=\"Manager/updatetypemgr.action?tid="+item.tid+"&ptid="+item.ptid+"&tname="+item.tname+"\">Edit修改</a>"+
					"</td>"+
					"</tr>";
				});
				$("#typelist").html(html);
				
				var pageHtml = "";
				
				if(data.curpage > 1){
					pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectType("+ (data.curpage-1) +")\">Prev</a></li>"
				}else{
					pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\">Prev</a></li>"
				}
				
				for(var i=1;i <= data.pagecount;i++){
					if(data.curpage != i){
						pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectType("+ i +")\">"+ i +"</a></li>"
					}else{
						pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\">"+ i +"</a></li>"
					}
				}
				
				if(data.curpage == data.pagecount){
					pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\" >Next</a></li>"
				}else{
					pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectType("+ (data.curpage+1) +")\">Next</a></li>"
				}
				$("#page").html(pageHtml);
			}
		});
	}
</script>

</body>
</html>