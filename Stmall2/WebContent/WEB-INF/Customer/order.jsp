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
<meta name="keywords" content=""/>
<meta name="description" content="">
<meta charset="utf-8">
<title>我的订单</title>

<link rel="stylesheet" href="css/order.css">
</head>

<body>
<!--页头-->
<div id="headCon">
	<div>
        <ol>
            <li>
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
            <a href="Customer/myOrder.action" class="order">我的订单</a>
            <a href="cart.jsp" class="shoppingCar">
            	<i></i>
            	<span>购物车（0）</span>
            </a>
        </ol>
    </div>
    <ul>
    	<a href="index.jsp"><li><img src="images/logo3.png" /> </li></a>
        <p>我的订单</p>
        
    </ul>
   
</div>
<!--内容-->
<div id="contentCon">
	<div class="left">
    	<div></div>
        <p>${sessionScope.customer.cname }</p>
        <a href="login.jsp">切换账号</a>
        <span></span>
        <ul>
        	<li><a href="Customer/center.action">个人信息</a></li>
            <li><a href="Customer/myOrder.action" class="my">我的订单</a></li>
            <li><a href="javascript:;">我的钱包</a></li>
            <li><a href="javascript:;">优惠特权</a></li>
            <li><a href="javascript:;">地址管理</a></li>
            <li><a href="javascript:;">账号设置</a></li>
            <li><a href="javascript:;">我的足迹</a></li>
            <li><a href="javascript:;">收藏夹</a></li>
        </ul>
    </div>
    <div class="right">
    	<ul>
        	<li class="all">全部订单</li>
            <li>待付款</li>
            <li>已发货</li>
            <li>待评价</li>
            <li>售后服务</li>
        </ul>
 
         <c:forEach items="${requestScope.list }" var="order">
         <ol>
        	<input type="checkbox">
            <p>时间：<fmt:formatDate value="${order.odate }" pattern="yyyy/MM/dd  HH:mm:ss" />
            &nbsp;&nbsp;订单号：${order.onum }
            &nbsp;&nbsp;总价：${order.oprice }</p>
            <a href="#"></a>
        </ol>
        <c:forEach items="${order.list }" var="details">
        <div>
        	<!-- <li class="pic02"></li> -->
        	
            <ul>
            
            	<li>
                	<p>商品ID：${details.gid }<p>
                   <p> 商品：${details.gname }<p>
                </li>
                <li class="price">商品单价：${details.gprice }</li>
                <li class="price">购买数量：${details.gcount }</li>
                <li>
                	<a href="javascript:;">联系我们</a>
                    <a href="javascript:;" class="text02">申请售后</a>
                </li>
                <li>
                	<a href="Customer/myOrder.action">订单详情</a>
                    <a href="javascript:;" class="text02">查看物流</a>
                </li>
                <a href="javascript:;">评价</a>
            </ul>
           
        </div>
        </c:forEach>
        </c:forEach> 
        
    </div>
    <ol>
    	<a href="javascript:;" id="left"><li>&lt;</li></a>
        <a href="javascript:;" id="NO1"><li>1</li></a>
        <a href="javascript:;"><li>2</li></a>
        <a href="javascript:;"><li>3</li></a>
        <a href="javascript:;"><li>...</li></a>
        <a href="javascript:;"><li>10</li></a>
        <a href="javascript:;" id="right"><li>&gt;</li></a>
    </ol>
    
</div>
<!--页脚-->
<div id="footCon">
	
    <ol>
    	<li>
        	<i></i>
            <a href="javascript:;">www.sweetlove.com</a>
            <div>
            	<a href="javascript:;" class="weibo"></a>
                <a href="javascript:;" class="weixin"></a>
            </div>
        </li>
        <ul>
        	<li class="text01">
            	<p>关于甜爱</p>
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
        <p>Copyright © 2016 sweetlove.com Inc.All Rights Reserved. 北京甜爱食品有限公司</p>
        <span>版权所有 京ICP备14049645号-1 增值电信业务经营许可证：京ICP证160100号</span>
    </li>
</div>
</body>
</html>
