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
    <title>商品管理</title>
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
			<li class="active">商品管理</li>
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
							<input type="text" id="gname" class="input-large" placeholder="Keyword...">
							<select class="span2" id="gftype">
								<option value="0"> - 大分类 - </option>
								<option value="1"> - 手机 - </option>
							</select>
							<select class="span2" id="gstype">
								<option value="0"> - 小分类 - </option>
								<option value="2"> - 智能手机 - </option>
							</select>
							
							<button type="submit" class="btn btn-primary" onclick="selectGoods(1)">查询</button>
						</div>
					
					</div>
				
				</div>
			
			</div>
			
			<div class="row">
				
				<div class="span10 listing-buttons">
				
					<a class="btn btn-primary" href="Manager/addgoodsview.action">添加商品</a>
					
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
								<th>gid</th>
								<th><a href="form.html">商品名</a> </th>
								<th><span class="meta">描述</span></th>
								<th><span class="label label-info">价格 </span></th>
								<th><span class="label label-info">库存</span></th>	
								<th><span class="label label-info">销量 </span></th>
								<th><span class="label label-info">大分类 </span></th>
								<th><span class="label label-info">小分类</span></th>
								<th><span class="label label-info">图片 </span></th>
								<th><span class="label label-info">状态 </span></th>
								<th class="actions">
								操作
								</th>
							</tr>
						</thead>
						<tbody id="goodslist">
							
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
						<p>确实要删除此项吗？</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn" data-dismiss="modal">关闭</a>
						<a href="Manager/delete.action" class="btn btn-danger">删除</a>
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
var gname = "${param.gname}";
$(function(){
	selectGoods(1,0,0);
	getFType();
	getSType(null);
	
	
});

function getFType(){
	$.ajax({
		url:"getFType.action",
		type:"post",
		data:{},
		dataType:"JSON",
		success:function(data) {
			var html = "<option value=\"0\"> - 大分类 - </option>";
			$.each(data,function(index,item){
				
				html += "<option value=\""+item.tid+"\"> "+item.tname+" </option>";
			});
			$("#gftype").html(html);
		}
	});
}
$("#gftype").change(function(){
	//获取值
	var ftype = $("#gftype").val();
	if(ftype == 0){
		//清除小分类
		var html = "<option value=\"0\">小分类</option>";
		$("#gstype").html(html);
	}else{
		//获取该分类的 所有小分类，并显示出来
		getSType(ftype);
	}
});
function getSType(ptid){
	$.ajax({
		url:"getSType.action",
		type:"post",
		data:{"ptid":ptid},
		dataType:"JSON",
		success:function(data) {
			var html = "<option value=\"0\"> - 小分类 - </option>";
			$.each(data,function(index,item){
				html += "<option value=\""+item.tid+"\"> "+item.tname+" </option>";
			});
			$("#gstype").html(html);
		}
	});
	selectGoods(1,ptid,0);
}

	
	
	selectGoods(1); 
	function selectGoods(curpage,gftype,gstype){
		var gname = $("#gname").val();
		var gftype = $("#gftype").val();
		var gstype = $("#gstype").val();
		//根据条件查询	
		$.ajax({
			url:"getAllGoods.action",
			type:"post",
			data:{"gname":gname,"gftype":gftype,"gstype":gstype,"curpage":curpage},
			dataType:"JSON",
			success:function(data){
			//显示数据
				var html = "";
				$.each(data.list,function(index,item){
					html +=
					"<tr>"+
					"<td>"+ item.gid +"</td>"+
					"<td><a href=\"form.html\">"+ item.gname +"</a> </td>"+
					"<td><span class=\"label label-info\">"+ item.gdept +"</span></td>"+
					"<td><span class=\"meta\">"+ item.gprice +"</span></td>"+
					"<td><span class=\"meta\">"+ item.gcount +"</span></td>"+
					"<td><span class=\"meta\">"+ item.gsales +"</span></td>"+
					"<td><span class=\"meta\">"+ item.gftype +"</span></td>"+
					"<td><span class=\"meta\">"+ item.gstype +"</span></td>"+
					"<td><span class=\"meta\"><img height=\"50px\" src=\"upload/"+ item.gpic +"\"></span></td>"+
					"<td><span class=\"meta\">"+ item.gstatus +"</span></td>"+
					"<td class=\"actions\">"+
					"<a class=\"btn btn-small btn-danger\" data-toggle=\"modal\" href=\"Manager/delete.action?gid="+item.gid+"\">Remove删除</a>"+
					"<a class=\"btn btn-small btn-primary\" href=\"Manager/updategoods.action?gid="+item.gid+"&gname="+item.gname+"&gdept="+item.gdept+"&gprice="+item.gprice+"&gcount="+item.gcount+"&gsales="+item.gsales+"\">Edit修改</a>"+
					"</td>"+
					"</tr>";
				});
				$("#goodslist").html(html);
				
				var pageHtml = "";
				
				if(data.curpage > 1){
					pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectGoods("+ (data.curpage-1) +")\">Prev</a></li>"
				}else{
					pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\">Prev</a></li>"
				}
				
				for(var i=1;i <= data.pagecount;i++){
					if(data.curpage != i){
						pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectGoods("+ i +")\">"+ i +"</a></li>"
					}else{
						pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\">"+ i +"</a></li>"
					}
				}
				
				if(data.curpage == data.pagecount){
					pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\" >Next</a></li>"
				}else{
					pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectGoods("+ (data.curpage+1) +")\">Next</a></li>"
				}
				$("#page").html(pageHtml);
			}
		});
	}
</script>

</body>
</html>