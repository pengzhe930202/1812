<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/jing.css"/>
		<script type="text/javascript" src="js/jquery-2.2.4.min (2).js"></script>
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
						var html = "";
						$.each(data,function(index,item){
							
							html += "<a href=\"javascript:void(0)\" onclick=\"getSType("+item.tid+")\">"+item.tname+"&nbsp&nbsp&nbsp&nbsp"+"</a>";
						});
						$("#gftype").html(html);
					}
				});
			}
			
			function getSType(ptid){
				$.ajax({
					url:"getSType.action",
					type:"post",
					data:{"ptid":ptid},
					dataType:"JSON",
					success:function(data) {
						var html = "";
						$.each(data,function(index,item){
							html += "<a href=\"javascript:void(0)\" onclick=\"selectGoods(1,0,"+item.tid+")\">"+item.tname+"&nbsp&nbsp&nbsp&nbsp"+"</a>";
						});
						$("#gstype").html(html);
					}
				});
				selectGoods(1,ptid,0);
			}
			
			
			function selectGoods(curpage,gftype,gstype){
				 /* var gname = $("#gname").val();
				var gftype = $("#gftype").val();
				var gstype = $("#gstype").val(); */
				//根据条件查询	
				$.ajax({
					url:"getAllGoods.action",
					type:"post",
					data:{"gname":gname,"gftype":gftype,"gstype":gstype,"pagerows":4,"curpage":curpage},
					dataType:"JSON",
					success:function(data){
					//显示数据
						var html = "";
						$.each(data.list,function(index,item){
							html +=
								
							"<td>"+
							"<a href=\"selectAllGoods.action?gid="+item.gid+"\"><img width=\"220px\" height=\"220px\" src=\"upload/"+ item.gpic +"\"></a><br />"+
							"￥"+ item.gprice +"<br />"+
							"<a href=\"#\">"+ item.gname +"&nbsp&nbsp&nbsp&nbsp"+ item.gdept +"</a><br /> "+
							"<a href=\"#\">"+ item.gsales +"</a><br />"+
							
							"</td>";
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
	</head>
	<body>
		<div class="jd">
			<div class="navbg">
				<div class="nav">
					<div class="state">
						送至：北京
					</div>
					
					<div class="menu">
						<!-- 当用户已经登录时, 显示 用户名和 退出 JSTL -->
					<c:if test="${sessionScope.customer !=null }">
					<a href="Customer/center.action">你好,${sessionScope.customer.cname }</a>
					<a href="Customer/logout.action">退出</a>
					</c:if>
					
					<!-- 当用户没有登录时, 显示登录和注册 -->
					<c:if test="${sessionScope.customer ==null }">
					<a href="login.jsp">你好,请登录</a>
					<a href="register.jsp">免费注册</a>
					</c:if>
						<span>|</span>
						<a href="Customer/myOrder.action">我的订单</a>
						<span>|</span>
						<a href="javascript:;">我的京东</a>
						<span>|</span>
						<a href="javascript:;">京东会员</a>
						<span>|</span>
						<a href="javascript:;">企业采购</a>
						<span>|</span>
						
						<a href="javascript:;">客户服务</a>
						<span>|</span>
						<a href="javascript:;">网站导航</a>
						<span>|</span>
						<a href="javascript:;">手机京东</a>
					</div>
				</div>
				
			</div>
			<div class="logo">
				
				<div class="logoimg">
					<img src="img/logo1.png" />
				</div>
				<div class="type">
					
				</div>
				<div class="search">
					<div>
						<form action="#" method="get">
							<input type="text" name="key"/><input type="submit" value="搜索" />
						</form>
					</div>
					<div class="menu">
						<a href="javascript:;">手机京东自营</a>
						<span>|</span>
						<a href="javascript:;">华为手机</a>
						<span>|</span>
						<a href="javascript:;">小米</a>
						<span>|</span>
						<a href="javascript:;">华为</a>
						<span>|</span>
						<a href="javascript:;">苹果</a>
						<span>|</span>
						<a href="javascript:;">vivo</a>
						<span>|</span>
						<a href="javascript:;">oppo</a>
						<span>|</span>
						<a href="javascript:;">老人手机</a>
						<span>|</span>
						<a href="javascript:;">小米8</a>
						<span>|</span>
						<a href="javascript:;">三星</a>
					</div>
				</div>
				<div class="cart">
					<span class="cartimg"></span>
					<a href="cart.jsp">我的购物车</a>
					<span class="cartnum">0</span>
				</div>
				<div class="clearfloat"></div>
			</div>
		</div>
		<div class="hw">
			<div class="hwimg">
			</div>
			<div class="menu">
				<ul>
					
					<li>
						<span>
						      <a class="showall" href="javascript:;" >全部商品分类</a>
						</span>
						<div class="p">
							<ul>
								<li>
								<a href="javascript:;">家用电器</a>
								</li><br />								
								<li>
									<a href="javascript:;">手机</a>/
									<a href="javascript:;">运营商</a>/
									<a href="javascript:;">数码</a>			  
								</li><br />
								<li>
									<a href="javascript:;">电脑</a>/
									<a href="javascript:;">办公</a>																		
								</li><br />
								<li>
									<a href="javascript:;">家居</a>/
									<a href="javascript:;">家具</a>/
									<a href="javascript:;">家装</a>
									
								</li><br />
								
								<li>
									<a href="javascript:;">男装</a>/
									<a href="javascript:;">女装</a>/
									<a href="javascript:;">童装</a>
								</li><br />
								
								<li>
									<a href="javascript:;">美妆</a>/
									<a href="javascript:;">个护清洁</a>
								</li>
								<li>
									<a href="javascript:;">女鞋</a>/
									<a href="javascript:;">箱包</a>
								</li>
							</ul>
					    </div>
					</li>
					<li><a href="javascript:;">京东服饰</a></li>
					<li><a href="javascript:;">美妆馆</a></li>
					<li><a href="javascript:;">超市</a></li>
					<li><a href="javascript:;">生鲜</a></li>
					<li><a href="javascript:;">全球购</a></li>
					<li><a href="javascript:;">闪购</a></li>
					<li><a href="javascript:;">拍卖</a></li>
					<li><a href="javascript:;">金融</a></li>
					
				</ul>
			</div>
		</div>
		<hr width="100%" color=#f30213 size=3 />
					
		<form class="jie">
			<a href="javascript:;">全部结果</a> >
			<select >
				<option>手机通讯</option>>
				
			</select>
			<select >
				<option>手机 </option> >
				
			</select>
		</form>
		<table class="biao"  width="1210" height="400px">
			<tr>
				<td rowspan="3">品牌：</td>
				<td rowspan="3" colspan="9">
					<a href="javascript:;"><img src="img/图标.jpg"/> </a>
				</td>
				
			</tr>
			<tr>
												
			</tr>
			<tr>
												
			</tr>
			<tr>
				<td>大分类：</td>
				<td colspan="9" id="gftype">
					<a href="javascript:;">8GB以下</a>&nbsp;
					<a href="javascript:;">8GB</a>&nbsp;
					<a href="javascript:;">16GB</a>&nbsp;
					<a href="javascript:;">32GB</a>&nbsp;
					<a href="javascript:;">64GB</a>&nbsp;
					<a href="javascript:;">128GB</a>&nbsp;
					<a href="javascript:;">256GB</a>&nbsp;
					<a href="javascript:;">512GB</a>&nbsp;
					<a href="javascript:;">支持内存卡</a>&nbsp;
				</td>				
			</tr>
			<tr>
				<td>小分类：</td>
				<td colspan="9" id="gstype">
					<a href="javascript:;">2GB以下</a>&nbsp;
					<a href="javascript:;">2GB</a>&nbsp;
					<a href="javascript:;">3GB</a>&nbsp;
					<a href="javascript:;">4GB</a>&nbsp;
					<a href="javascript:;">6GB</a>&nbsp;
					<a href="javascript:;">8GB</a>&nbsp;
				</td>				
			</tr>
			<tr>
				<td>CPU核数：</td>
				<td colspan="9">
					<a href="javascript:;">八核</a>&nbsp;
					<a href="javascript:;">四核</a>&nbsp;
					<a href="javascript:;">十核</a>&nbsp;
					<a href="javascript:;">功能机</a>&nbsp;
					<a href="javascript:;">单核</a>&nbsp;
					<a href="javascript:;">双四核</a>&nbsp;
					<a href="javascript:;">双核</a>&nbsp;
					<a href="javascript:;">其他</a>&nbsp;
				</td>				
			</tr>
			<tr>
				<td>高级选项：</td>
				<td colspan="9">
					<form>
						<select>
							<option>网络</option>
							<option>2G</option>
						</select>
						<select>
							<option>分辨率</option>
							<option>高清hd</option>
						</select>
						<select>
							<option>屏幕尺寸</option>
							<option>3.0英寸</option>
						</select>
						<select>
							<option>系统</option>
							<option>苹果</option>
						</select>
					</form>
				</td>				
			</tr>					
		</table>
		<form class="ping">
			<span>综合销量</span>
			<span>评论数</span>
			<span>新品价格</span>
			  
			<input type="text" value="$" /> -
			<input type="text" value="$" />
		</form>
		<form class="dizhi">
			配送至 
			<select>
				<option>北京朝阳区三环以内</option>
				<option>三环到四环之间></option>
			</select>
			<input type="checkbox" name="dz">京东物流
			<input type="checkbox" name="dz">货到付款
			<input type="checkbox" name="dz">仅显示有货
			<input type="checkbox" name="dz">可配送全球
			<input type="checkbox" name="dz">新品
			<input type="text" />
			<input type="button" value="确定" />
		</form>
		<table class="si"  width="1210" height="400px" > 
			<tr id="goodslist" >
				<td >
					<!-- <a href=""><img src="img/QQ图片20180623224057.png"></a><br />
					￥1599.00<br />
					<a href="">小米6X 全网通 4GB+64GB 曜石黑 移动联通<br />
					电信4G手机 双卡双待 智能手机 前置<br />
					16万+条评价<br />
					小米京东官方自营旗舰店</a><br /> -->

				</td>
				<td>
					
				</td>
				<td>
					
				</td>
				<td>
					
				</td>
				
			</tr>
		</table>
		<div id="page">
		
		</div>
	</body>
</html>
