<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		
		<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
		<script type="text/javascript" src="js/jquery-2.2.4.min (2).js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.js" ></script>
		
		<script>
			var inval;
			$(function(){
				$(".imglist img").hide();
				$("img[src='img/1.jpg']").show();
				inval= setInterval("nextImg()",3000);
				
				$(".imglist").mouseover(function(){
					clearInterval(inval);
				});
				$(".imglist").mouseout(function(){
					inval= setInterval("nextImg()",3000);
				});
				
				//计算购物车商品数量
				getCartCount();
			});
			var index=1;
						
			function lastImg(){				
				index--;
				if(index<1){
					index=4;
				}
				showImgByIndex(index);
			}
			function nextImg(){
				index++;
				if(index>4){
					index=1;
				}
				showImgByIndex(index);
			}
			function showImgByIndex(i){
				$(".imglist img").fadeOut(1000);
				if(i==1){
					$("img[src='img/1.jpg']").fadeIn(1000);
				}
				if(i==2){
					$("img[src='img/2.jpg']").fadeIn(1000);
				}
				if(i==3){
					$("img[src='img/3.jpg']").fadeIn(1000);
				}
				if(i==4){
					$("img[src='img/4.jpg']").fadeIn(1000);
				}
			}
			
			function lastImger(){				
				index--;
				if(index<1){
					index=2;
				}
				showImgByIndexer(index);
			}
			function nextImger(){
				index++;
				if(index>2){
					index=1;
				}
				showImgByIndexer(index);
			}
			function showImgByIndexer(i){
				$(".er img").fadeOut();
				if(i==1){
					$("img[src='img/QQ图片20180630231343.jpg']").fadeIn();
				}
				if(i==2){
					$("img[src='img/QQ图片20180630231539.jpg']").fadeIn();
				}
				
			}
			
			var index2=-180;
			$(function(){
//				$("#img5").animate({"left":"-180px"},1000);
//				$("#img6").animate({"left":"0px"},1000);
				setInterval(function(){
					$(".san").animate({"left":index2+"px"},1000);
					index2=(index2-180)%(180*2);
				},2000);
				
			});
			
			function getCartCount(){
				// 先取cookie
				var ckiCart = $.cookie("cart");
				
				var cart;
				// 判断Cookie中是否有数据
				if (ckiCart == undefined){
					// 当没有购物车信息时, 设置显示数量为0
					$("#cartNum").text(0);
					
				} else {
					// 当已有购物信息时, 获取已有的信息, 生成数组
					cart = JSON.parse(ckiCart);
					
					//计算数量
					var sum = 0;
					for(var i=0; i<cart.length; i++){
						sum += parseInt(cart[i].count);
					}
					$("#cartNum").text(sum);
				}
			}
		</script>
		
		
	</head>
	<body>
		<div class="navbg">
			<div class="nav">
				<div class="navleft">
					<a class="glyphicon glyphicon-map-marker" href="javascript:;">北京</a>
					<div class="citylist">
						<a href="javascript:;">北京</a>
						<a href="javascript:;">上海</a>
						<a href="javascript:;">天津</a>
						<a href="javascript:;">重庆</a>
						<a href="javascript:;">河北</a>						
					</div>
				</div>
				
				<div class="navright">
				
				
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
			<div class="clear"></div>
		</div>
		
		<div class="search">
			<a class="logo" href="#"> </a>
			<div class="searchbar">
				<div>
					<div class="searchinput">
						<form action="search.action" method="post">
						<input type="text" name="gname"/><span class="glyphicon glyphicon-camera"></span><button class="glyphicon glyphicon-search"></button>
						</form>
					</div>
					<div class="cart">
						<a class="glyphicon glyphicon-shopping-cart" href="cart.jsp">我的购物车</a>
						<span id="cartNum">0</span>
					</div>
					
				</div>
				<div class="ad">				
					<a class="active" href="javascript:;">app产品</a>
					<a href="javascript:;">坚果手机</a>
					<a href="javascript:;">2件5折</a>
					<a href="javascript:;">潮流新品</a>
					<a href="javascript:;">直降100</a>
					<a href="javascript:;">游戏手机</a>
					<a href="javascript:;">每100-40</a>
					<a href="javascript:;">家具狂欢</a>
					<a href="javascript:;">全国联保</a>
				</div>
				
				<div class="menu">
					<a href="javascript:;">秒杀</a>
					<a href="javascript:;">优惠券</a>
					<a href="javascript:;">PLUS会员</a>
					<a href="javascript:;">闪购</a>
					<a href="javascript:;">拍卖</a>
					<a href="javascript:;">京东服饰</a>
					<a href="javascript:;">京东超市</a>
					<a href="javascript:;">生鲜</a>
					<a href="javascript:;">全球购</a>
					<a href="javascript:;">京东金融</a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		
		<div class="type">
			<div class="productlist">

				<ul>
					<li> <a href="javascript:;">家用电器</a>
						<ul>
							<li>电视 曲面电视超薄电视HDR电视OLED电视4K超清电视人工智能电视55英寸65英寸电视配件</li>
						</ul>
					</li>
					<li> <a href="javascript:;">手机 /	运营商 /	数码</a></li>
					<li> <a href="javascript:;">电脑 /	办公</a></li>
					<li> <a href="javascript:;">家居 /	家具 /	家装 /	厨具</a></li>
					<li> <a href="javascript:;">男装 /	女装 /	童装 /	内衣</a></li>
					<li> <a href="javascript:;">美妆 /	个护清洁 /	宠物</a></li>
					<li> <a href="javascript:;">女鞋 /	箱包 /	钟表 /	珠宝</a></li>
					<li> <a href="javascript:;">男鞋 /	运动 /	户外</a></li>
					<li> <a href="javascript:;">房产 /	汽车 /	汽车用品</a></li>
					<li> <a href="javascript:;">母婴 /	玩具乐器</a></li>
					<li> <a href="javascript:;">食品 /	酒类 /	生鲜 /	特产</a></li>
					<li> <a href="javascript:;">艺术 /	礼品鲜花 /	农资绿植物</a></li>
					<li> <a href="javascript:;">医药保健 /	计生情趣</a></li>
					<li> <a href="javascript:;">图书 /	音像 /	电子书</a></li>
					<li> <a href="javascript:;">机票 /	酒店 /	旅游 /	生活</a></li>
					<li> <a href="javascript:;">理财 /	众筹 /	白条 /	保险</a></li>
					
				
				</ul>
			</div>
		
			<div class="imglist">
				<img src="img/1.jpg"/>
				<img src="img/2.jpg"/>
				<img src="img/3.jpg"/>
				<img src="img/4.jpg"/>
				<button onclick="lastImg()" id="butleft" class="glyphicon glyphicon-chevron-left"></button>
				<button onclick="nextImg()" id="butright" class="glyphicon glyphicon-chevron-right"></button>
			
			<div class="imgpoint">
				<i onmouseover="showImgByIndex(1)"></i>
				<i onmouseover="showImgByIndex(2)"></i>
				<i onmouseover="showImgByIndex(3)"></i>
				<i onmouseover="showImgByIndex(4)"></i>
			</div>
			</div>
			
			<div class="imgad">
				<img src="img/5b1499bbNeed3ed19.jpg"/>
				<img src="img/5b286959N03b1a195.jpg"/>
				<img src="img/5b35971eNa29f039c.jpg" />
			</div>
			
			<div class="info">
				<div class="nologo">
					<img src="img/no_login.jpg"/>
				</div>
				<div>
					<p>Hi~欢迎来到京东！</p>
					<p><a href="javascript:;">登录</a><a href="javascript:;">注册</a></p>
					
					<p><a id="xin" href="javascript:;">新人福利</a>
					   <a id="vip" href="javascript:;">plus会员</a>
					</p>
					<p>
						<a href="javascript:;">促销</a>
						<a href="javascript:;">公告</a>
						<a href="javascript:;">更多</a>
					</p>
					<p><a href="javascript:;">【推荐】答问卷赢智能梳妆镜</a></p>
					<p><a href="javascript:;">大牌手机12期免息</a></p>
					<p><a href="javascript:;">数码好物0元试用</a></p>
					<p><a href="javascript:;">小狗吸尘器 满500减50</a></p>
				</div>
			</div>
		</div>
		
		<div class="clear"></div>
		
		<div class="miao">
			<a href="javascript:;">
				<p id="j">京东秒杀</p>
				<p id="f">FLASH DEALS</p>
				<p id="s" class="glyphicon glyphicon-flash"></p>
				<p id="b">本场距离结束还剩</p>
			</a>
		</div>
		
		<div class="er">
			<img src="img/QQ图片20180630231343.jpg"/>
			<img src="img/QQ图片20180630231539.jpg" />
			<button onclick="lastImger()" id="butleft" class="glyphicon glyphicon-chevron-left"></button>
			<button onclick="nextImger()" id="butright" class="glyphicon glyphicon-chevron-right"></button>
		</div>
		<div class="san1">
			<div class="san">
				<img id="img5" src="img/5b279532Nac31d2c2.jpg"/>
				<img id="img6" src="img/5b34bf7eN802a0fdc.jpg"/>
			</div>
		</div>	
		<div class="clear"></div>
		
		<div class="dibu">
			<p>
				<a href="javascript:;">关于我们</a><span>|</span>
				<a href="javascript:;">联系我们</a><span>|</span>
				<a href="javascript:;">联系客服</a><span>|</span>
				<a href="javascript:;">合作招商</a><span>|</span>
				<a href="javascript:;">商家帮助</a><span>|</span>
				<a href="javascript:;">营销中心</a><span>|</span>
				<a href="javascript:;">手机京东</a><span>|</span>
				<a href="javascript:;">友情链接</a><span>|</span>
				<a href="javascript:;">销售联盟</a><span>|</span>
				<a href="javascript:;">京东社区</a><span>|</span>
				<a href="javascript:;">风险监测</a>				
			</p>
			<p>京公网安备 11000002000088号|京ICP证070359号|互联网药品信息服务资格证编号(京)-经营性-2014-0008|新出发京零 字第大120007号</p>
			<p>互联网出版许可证编号新出网证(京)字150号|出版物经营许可证|网络文化经营许可证京网文[2014]2148-348号|违法和不良信息举报电话：4006561155</p>
			<p>Copyright © 2004 - 2018  京东JD.com 版权所有|消费者维权热线：4006067733经营证照</p>
			<p>京东旗下网站：京东钱包|京东云</p>
		</div>
	</body>
</html>
