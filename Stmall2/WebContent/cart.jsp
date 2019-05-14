<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品"/>
<meta name="description" content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>我的购物车~</title>

<link rel="stylesheet" href="css/shoppingCar.css"> 
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/carts.css">

<script type="text/javascript" src="js/jquery-2.2.4.min (2).js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>

<script type="text/javascript">
	
	$(function(){
		//页面加载完成时，读取cookie
		getCartCount();
	});
	
	function getCartCount(){
		// 先取cookie
		var ckiCart = $.cookie("cart");
		
		var cart;
		// 判断Cookie中是否有数据
		if (ckiCart == undefined){
			
			
		} else {
			
			 $(".cartBox").html('');
			// 当已有购物信息时, 获取已有的信息, 生成数组
			cart = JSON.parse(ckiCart);
			
			//遍历数组，获取每个商品的详细信息
			for(var i=0; i<cart.length; i++){
				var gid = cart[i].gid;
				var count = cart[i].count;
				//ajax获取商品的详情
				$.ajax({
					url:"goodsJSON.action",
					async:false,
					type:"post",
					data:{"gid":gid},
					dataType:"JSON",
					success:function(data){
						//获取详细信息
						var html =
						"	<div class=\"order_content\">"+
						"<ul class=\"order_lists\">"+
	                    "<li class=\"list_chk\">"+
	                    "   <input type=\"checkbox\" id=\""+data.gid+"\" value=\""+data.gid+"\" class=\"son_check\">"+
	                    "   <label for=\""+data.gid+"\"></label>"+
	                    "</li>"+
	                    "<li class=\"list_con\">"+
	                    "   <div class=\"list_img\"><a href=\"javascript:;\"><img src=\"upload/"+data.gpic+"\"alt=\"\"/></a></div>"+
	                    "   <div class=\"list_text\"><a href=\"javascript:;\">"+data.gname+"<br></a></div>"+
	                    "</li>"+
	                    "<li class=\"list_info\">"+
	                    "   <p>"+data.gdept+"</p>"+
	                    
	                    "</li>"+
	                    "<li class=\"list_price\">"+
	                    "   <p class=\"price\">￥"+data.gprice.toFixed(2)+"</p>"+
	                    "</li>"+
	                    "<li class=\"list_amount\">"+
	                    "    <div class=\"amount_box\">"+
	                    "       <a href=\"javascript:;\" class=\"reduce reSty\">-</a>"+
	                    "       <input type=\"text\" value=\""+count+"\" class=\"sum\">"+
	                    "        <a href=\"javascript:;\" class=\"plus\">+</a>"+
	                    "   </div>"+
	                    "</li>"+
	                    "<li class=\"list_sum\">"+
	                    "   <p class=\"sum_price\">￥"+(data.gprice*count).toFixed(2)+"</p>"+
	                    "</li>"+
	                    "<li class=\"list_op\">"+
	                    "    <p class=\"del\"><a href=\"javascript:;\" onclick=\"del("+data.gid+");\" class=\"delBtn\">移除商品</a></p>"+
	                    "</li>"+
	                    "</ul>"+
	                    "</div>";
	                    
						 $(".cartBox").append(html);
					}
				});
			}
			
		}
	}
	
	function del(id){
		//先取cookie
		var ckiCart = $.cookie("cart");
		
		var cart;
		if(ckiCart != undefined){
			//有购物信息就把数据获取到生成数组
			cart = JSON.parse(ckiCart);	
			//遍历这个数组
			for(var i=0;i<cart.length;i++){
				if (id == cart[i].gid){
					//从car里面删除第i个元素，删除1个
					cart.splice(i,1);
					break;
				}
			}
			// 把CAR存会cookie，转成JSON的字符串，用js提供的方法
			var str = JSON.stringify(cart);
			//保存到cookie中，cookie只能保存字符串,加上的大括号是cookie的参数
			$.cookie("cart",str);//有效期5天  ,{expires:5}	
			getCartCount();//重新执行一遍方法
		}	
	} 

	
	function subOrder(){
		//动态创建表单
		var form = $("<form action=\"Customer/subOrder.action\" method=\"post\"></form>");
		
		//获取被选中的商品
		var items = $(".order_content");
		
		var index = 0;
		items.each(function(){
			var checked = $(this).find("input[type='checkbox']").prop("checked");
			
			if(checked){
				//取商品id
				gid =  $(this).find("input[type='checkbox']").val();
				//商品的数量
				count = $(this).find("input[type='text']").val();
				
				form.append("<input type=\"text\" value=\""+gid+"\" name=\"list["+index+"].gid\"/>");
				form.append("<input type=\"text\" value=\""+count+"\" name=\"list["+index+"].gcount\"/>");
				
				index ++;
			}
		});
		$(".cartBox").append(form);
		//提交表单
		form.submit();
		del(gid);
	}

</script>

</head>

<body>
<!--页头-->
<div id="headCon">
	<div>
    	
        <ol>
            <li >
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
            </li>
            <a href="Customer/myOrder.action">我的订单</a>
            <a href="cart.jsp" class="shoppingCar">
            	<i></i>
            	<span>购物车（0）</span>
            </a>
        </ol>
    </div>
    <ul>
    	<a href="index.jsp"><li><img src="images/logo3.png" /> </li></a>
        <p>我的购物车</p>
        
    </ul>
</div>
<!--内容-->
<div id="contentCon">
	<ul>
    	<li>
        	<p>我的商品</p>
            <span></span>
        </li>
    </ul>
    <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品名</li>
                <li class="list_info">商品信息</li>
                <li class="list_price">单价（元）</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">小计（元）</li>
                <li class="list_op">操作</li>
            </ul>
        </div>

        <div class="cartBox">
            <div class="shop_info">
                <!--<div class="all_check">
                    <!--店铺全选-->
                    <!--<input type="checkbox" id="shop_a" class="shopChoice">
                    <label for="shop_a" class="shop"></label>
                </div>-->
                <!--<div class="shop_name">
                    店铺：<a href="javascript:;">搜猎人艺术生活</a>
                </div>-->
            </div>
            
        </div>

      
        <!--底部-->
        <div class="bar-wrapper">
            <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                <div class="calBtn"><a onclick="subOrder()">结算</a></div>
            </div>
        </div>
    </section>
    <!-- <section class="model_bg"></section>
    <section class="my_model">
        <p class="title">删除宝贝<span class="closeModel">X</span></p>
        <p>您确认要删除该宝贝吗？</p>
        <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
    </section> -->

    <script src="js/carts.js"></script>
</div>
<!--页脚-->
<div id="footCon">
	
    <ol>
    	<li>
        	<i></i>
            <a href="index.html">www.sweetlove.com</a>
            <div>
            	<a href="http://www.weibo.com" class="weibo"></a>
                <a href="http://wx.qq.com" class="weixin"></a>
            </div>
        </li>
        <ul>
        	<li class="text01">
            	<p>关于京东</p>
                <span></span>
                <a href="javascript:;">媒体报道</a>
                <a href="javascript:;">知识产权</a>
                <a href="javascript:;">加入我们</a>
            </li>
            <li>
            	<p>帮助中心</p>
                <span></span>
                <a href="javascript:;">购物指南</a>
                <a href="javascript:;">订单管理</a>
                <a href="javascript:;">常见问题</a>
            </li>
            <li>
            	<p>服务支持</p>
                <span></span>
                <a href="javascript:;">服务保障</a>
                <a href="javascript:;">用户协议</a>
                <a href="javascript:;">售后服务</a>
            </li>
            <li>
            	<p>商业合作</p>
                <span></span>
                <a href="javascript:;">集合采购</a>
                <a href="javascript:;">品牌合作</a>
                <a href="javascript:;">媒体合作</a>
            </li>
        </ul>
        <div>
        	<p>联系我们</p>
            <h2>400-8888-000</h2>
            <span>24小时服务热线</span>
            <a href="javascript:;">在线客服</a>
        </div>
    </ol>
    <div></div>
    
    <li>
        <p>Copyright © 2016 sweetlove.com Inc.All Rights Reserved. 京东有限公司</p>
        <span>版权所有 京ICP备14049645号-1 增值电信业务经营许可证：京ICP证160100号</span>
    </li>
</div>
</body>
</html>
