<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="css/huawei.css" />
		<script type="text/javascript" src="js/jquery-2.2.4.min (2).js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript">
		
			function add(){
				var count = parseInt($("input[name='buyCount']").val());
				//count不能大于库存
				//ajax异步请求当前库存
				$.ajax({
					url:"goodsJSON.action",
					type:"post",
					data:{"gid":${param.gid}},
					dataType:"JSON",
					success:function(data){
						//当前数量小于库存时加一
						if(count < data.gcount){
							$("input[name='buyCount']").val(count+1);
						}
					}
				});
				
			}
			function sub(){
				var count = parseInt($("input[name='buyCount']").val());
				
				if(count > 1){
					$("input[name='buyCount']").val(count-1);
				}	
			}
			function countChange(){
				var count = parseInt($("input[name='buyCount']").val());
				//count不能大于库存
				//ajax异步请求当前库存
				$.ajax({
					url:"goodsJSON.action",
					type:"post",
					data:{"gid":${param.gid}},
					dataType:"JSON",
					success:function(data){
						//当前数量大于库存时，强制改成库存
						if(count > data.gcount){
							$("input[name='buyCount']").val(data.gcount);
						}
						//当count 《1 库存》0时，才能设置成1
						if(count < 1 && data.gcount > 0){
							$("input[name='buyCount']").val(1);
						}else if(data.gcount == 0){
							$("input[name='buyCount']").val(0);
						}
					}
				});
			}
			function putcart() {
				// 取到商品ID
				var gid = ${param.gid}; 
				// 取到购买数量
				var count = $("input[name='buyCount']").val();
				
				
				// 先取cookie
				var ckiCart = $.cookie("cart");
				
				var cart;
				// 判断Cookie中是否有数据
				if (ckiCart == undefined){
					// 当没有购物车信息时, 创建一个数组保存购物信息
					cart = new Array();
				} else {
					// 当已有购物信息时, 获取已有的信息, 生成数组
					cart = JSON.parse(ckiCart);
				}
				
				// 如果数组中已有, 查找到数据, 数量累加
				var exist = false;
				$.each(cart, function(index, item){
					
					if (item.gid == gid ){
						item.count = parseInt(item.count) + parseInt(count);
						
						exist = true;
					}
					
				});
				
				if (exist == false){
					// 创建一个对象
					var goods = new Object();
					goods.gid = gid;
					goods.count = count;
					
					cart.push(goods);
				}
				
				// 转成JSON字符串  {gid : 值, count : 值}  GSON
				var str = JSON.stringify(cart);
				
				/* alert(str); */
				
				// 保存到cookie中, cookie只能保存字符串
				$.cookie("cart", str);
				//$.cookie("cart", str,{expires:7});有效期为7天
				// 跳转到购物车页面
				window.location.href="cart.jsp";
				
			}
		</script>
	
		<title></title>
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
						
						<a href="javascript:;">
							<span class="phonejd"></span>
							手机京东</a>
						<span>|</span>
						<a href="javascript:;">关注京东</a>
						<span>|</span>
						<a href="javascript:;">客户服务</a>
						<span>|</span>
						<a href="javascript:;">网站导航</a>
					</div>
				</div>
				
			</div>
			<div class="logo">
				
				<div class="logoimg">
				<a href="index.jsp"><img src="img/logo3.png" /></a>	
				</div>
				<div class="type">
					<a href="javascript:;">全部分类</a>
				</div>
				<div class="search">
					<div>
						<form action="#" method="get">
							<input type="text" name="key"/><input type="submit" value="搜全站" />
						</form>
					</div>
					<div class="menu">
						<a href="javascript:;">企业购</a>
						<a href="javascript:;">企业信贷</a>
						<a href="javascript:;">直邮全球</a>
						<a href="javascript:;">企悦服务</a>
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
					<li><a class="showall" href="javascript:;">查看所有商品</a>
						<div class="p">
						<ul>							
							<li>Meta系列
								<a href="javascript:;">HUAWEI Mate 10</a>
								<a href="javascript:;">HUAWEI Mate 10 Pro</a>
								<a href="javascript:;">HUAWEI Mate 9</a>
								<a href="javascript:;">HUAWEI Mate 9 Pro</a>							
							</li>							
							<li>P系列
								<a href="javascript:;">HUAWEI P20</a>
								<a href="javascript:;">HUAWEI P20 Pro</a>
								<a href="javascript:;">HUAWEI P10</a>
								<a href="javascript:;">HUAWEI P10 Plusn</a>
								
							</li>
							<li>麦芒系列
								<a href="javascript:;">nova 3e</a>
								<a href="javascript:;">nova 2S</a>
								<a href="javascript:;">麦芒6 极光蓝</a>
								<a href="javascript:;">nova 2s樱粉金</a>
								<a href="javascript:;">HUAWEI nova 2</a>
								
							</li>
							<li>青春版畅享系列
								<a href="javascript:;">畅享8</a>
								<a href="javascript:;">畅享8 Plus</a>
								<a href="javascript:;">畅享8e </a>
								<a href="javascript:;">畅享6S</a>
								<a href="javascript:;">畅享6</a>
								<a href="javascript:;">畅享7S</a>
								<a href="javascript:;">畅享7</a>
								<a href="javascript:;">畅享7 Plus</a>
								
							</li>
							<li>穿戴设备
								<a href="javascript:;">HUAWEI WATCH 2 Pro</a>
								<a href="javascript:;">HUAWEI WATCH 2</a>
								<a href="javascript:;">华为手环B3</a>
								<a href="javascript:;">华为手环 B3 青春版华为</a>								
							</li>
							
		               </ul>
		               </div>
					</li>
					
					<li><a href="index.jsp">首页</a></li>
					<li><a href="javascript:;">Mate系列</a>
						<ul>
							<li>
								<a href="javascript:;"><img src="img/QQ图片20180622195818.png"/></a>
							</li>
							
						</ul>
					</li>
					<li><a href="javascript:;">P系列</a>
						<ul>
							<li>
								<a href="javascript:;"><img src="img/QQ图片20180622200934.jpg"/></a>
							</li>
							
						</ul>
					</li>
					<li><a href="javascript:;">麦芒系列</a>
						<ul>
							<li>
								<a href="javascript:;"><img src="img/QQ图片20180622201113.jpg"/></a>
							</li>
						</ul>
					</li>
					<li><a href="javascript:;">畅享系列</a>
						<ul>
							<li>
								<a href="javascript:;"><img src="img/QQ图片20180622201319.jpg"/></a>
							</li>
						</ul>
							
					</li>
					<li><a href="#">穿戴设备</a>
						<ul>
							<li>
								<a href="#"><img src="img/QQ图片20180622201402.jpg"/></a>
							</li>
						</ul>
					</li>
					<li><a href="#">笔记本</a>
						<ul>
							<li>
								<a href="javascript:;"><img src="img/QQ图片20180622201445.jpg"/></a>
							</li>
							
						</ul>
					</li>
					<li><a href="javascript:;">智能家具</a>
						<ul>
							<li>
								<a href="javascript:;"><img src="img/QQ图片20180622201528.png"/></a>
							</li>
							
						</ul>
					</li>
					<li><a href="javascript:;">配件</a>
						<ul>
							<li>
								<a href="javascript:;"><img src="img/QQ图片20180622200735.png"/></a>
							</li>
						</ul>
					</li>
					
				</ul>
			</div>
		</div>
		<div class="shouji">
			<a href="javascript:;">手机</a> >
			<a href="javascript:;">手机通讯</a> >
			<a href="javascript:;">手机</a> >
			<a href="javascript:;">${requestScope.goods.gname}</a>
			<span>
				<a href="javascript:;">JD自营</a>
				<a href="javascript:;">华为京东自营官方旗舰店</a>
				<a href="javascript:;">联系供应商</a>
	  			<a href="javascript:;">JIMI</a>
				<a href="javascript:;">关注店铺</a>
			</span>
		</div>
		<div class="jdapp">
			<div class="txt">
				使用京东APP<br/>
				随时随地看商品
			</div>
			<div>
				<img src="img/jdapp.png" />
			</div>
			<div class="close">
				X
			</div>
		</div>
		<img src="upload/${requestScope.goods.gpic}" />
		<div class="nei">
			<h4>${requestScope.goods.gname}  ${requestScope.goods.gdept}</h4>
			<p class="a">2K双曲面屏幕！麒麟960芯片！二代徕卡双摄像头！
			   <a href="javascript:;">华为新品全面上线，更多优惠猛戳》》</a>
			</p>
			
			<span>
				<p>京 东 价 <span><fmt:formatNumber pattern="￥.00" value="${requestScope.goods.gprice}" maxFractionDigits="2" />	
						</span><a href="javascript:;">降价通知</a></p>
				<p class="plus">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span></span>
					plus PLUS会员专享价 
					<a href="javascript:;">银牌及以上用户开通PLUS可享限时特惠 >></a></p>
				<p class="cu">促　　销 <span>满送</span>   
					满19元即赠热销商品，赠完即止
					<a href="javascript:;">详情 >></a> </p>
				<p class="cu"> 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span> 满送</span>  
					满19元即赠热销商品，赠完即止 
					<a href="javascript:;">详情 >></a></p>	
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					“满送” 仅可在购物车任选其一</p>
			</span>	
			<p>增值业务 
				<a href="javascript:;">高价回收-卖了换钱</a>   
				<a href="javascript:;">4G套餐18元起 </a> 
				<a href="javascript:;">礼品包装</a></p>
			<p class="pei">配 送 至 北京朝阳区三环以内 有货支持
	            <a href="javascript:;">99元免基础运费(20kg内) </a>
	            <a href="javascript:;">京准达</a> 
	            <a href="javascript:;">自提</a><br />
	　　			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        由  <span>京东</span> 发货, 并提供售后服务. 23:00前下单,预计明天(06月22日)送达</p>
			<p>重　　量0.54kg</p>
			<p class="yan">选择颜色
               <span>琥珀金</span>  
			      <span>银钻灰</span> 
			      <span>玫瑰金</span> </p>
			 <p class="yan">选择版本
				<span>64GB</span>	
				<span>128GB</span>	</p>  
			<p class="yan">套　　装
				<span>优惠套装1</span>	
				<span>优惠套装2</span>	
				<span>优惠套装3</span>	
				<span>优惠套装4</span>	
				<span>优惠套装5</span>	
				<span>优惠套装6</span>	</p>
			
			<form>
				增值保障	
				<select>
					<option>全保修2年 ￥229 详情>> </option> 
					<option>全保修3年￥279 详情>></option>
					<option>自营全保修￥249 详情>></option>
				</select>
				<select>
					<option>碎屏保2年 ￥159 详情>>	</option> 
					<option>碎屏保2年￥159 详情>></option>
					<option>碎屏保1年￥109 详情>></option>
					<option>意外保2年￥169 详情>></option>
				</select>
					
				<select>
					<option>自营延长保 ￥129</option>
					<option>换新保2年￥259</option>
					<option>电池换2年￥39 详情>></option>					
				</select>
				<br />
					
				京东服务
				<select>
					<option>特色服务</option>
					<option>数据恢复￥39</option>
					<option>数据删除￥4.9 详情>></option>

				</select>	
					
				<select>
					<option>原厂服务</option>
					<option>原厂换屏￥159</option>
					<option>延长质保￥258 详情>></option>

				</select>	
				<br />
				白条分期
				<select>
					<option>不分期</option>
					<option>无手续费</option>
				</select>
				<select>
					<option>￥1066.33×3期</option>
					<option>无手续费</option>
				</select>
				<select>
					<option>￥533.17×6期</option>
					<option>无手续费</option>
				</select>
				<select>
					<option>￥274.58起×12期</option>
					<!--<option>含手续费：费率0.25%起，￥7.75起×12期</option>-->
				</select>
				<select>
					<option>￥149.29起×24期</option>
					<!--<option>含手续费：费率0.5%起，￥15.5起×24期</option>-->
				</select>
			</form>
			<a href="javascript:void(0)" onclick="sub()" class="sub">-</a>
			<c:if test="${requestScope.goods.gcount>0 }">
				<input type="text" name="buyCount" value="1" onchange="countChange()"/>
			</c:if>
			<c:if test="${requestScope.goods.gcount==0 }">
				<input type="text" name="buyCount" value="0" onchange="countChange()"/>
			</c:if>
			<a href="javascript:void(0)" onclick="add()" class="add">+</a>
			
			<a href="javascript:void(0)" id="car" onclick="putcart()">加入购物车</a>

		</div>
	</body>
</html>
