<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>个人中心</title>
		<link rel="stylesheet" type="text/css" href="css/register.css"/>
		<script>
			function usernameFocus(){
				//console.log("获取节点")
				document.getElementById("unhint").innerText="账号有字母,数字,_组成,首字母必须是字母";
			}
			function usernameBlur(){
				//console.log("失去节点")
				document.getElementById("unhint").innerText="";
			}
			window.onload=function(){
				var password=document.getElementById("password");
				password.onfocus=function(){
					document.getElementById("pwdhint").innerText="密码有字母,数字,_组成";
					
				}
				password.onblur=function(){
					document.getElementById("pwdhint").innerText="";
				}
		 }
		</script>
	</head>
	<body>
		<div class="topbg">
			<div class="top">
				<a href="index.jsp"><img src="img/logo.png" /></a>
				
				
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="center">
			<form action="Customer/update.action" method="post">
				<h1>用户信息</h1>
				<div>
					<label>账号</label><input type="text" value="${sessionScope.customer.cname }" name="cname" readonly="readonly"/>
				</div>
				<div id="unhint" class="hint"></div>
				<div>
					<label>密码</label><input type="password" name="password" id="password" />
				</div>
				<div id="pwdhint" class="hint"></div>
				<div>
					<label>重复密码</label><input type="password"  name="password2" />
				</div>
				
				<div  class="hint"></div>
				<div>
					<label>电话</label><input type="text" value="${sessionScope.customer.cphone }" name="cphone" />
				</div>
				
				<div  class="hint"></div>
				<div>
					<label>真实姓名</label><input type="text" value="${sessionScope.customer.crealname }" name="crealname" />
				</div>
				
				<div  class="hint"></div>
				<div>
					<label>身份证号</label><input type="text" value="${sessionScope.customer.ccard }" name="ccard" />
				</div>
				
				<div  class="hint"></div>
				<div>
					<label>地址</label><input type="text" value="${sessionScope.customer.caddr }" name="caddr" />
				</div>
				
				<div  class="hint"></div>
				<div>
					<label>账户余额</label><input type="text" value="${sessionScope.customer.cmoney }元"  readonly="readonly"/>
				</div>
				
				<div  class="hint"></div>
				<div>
					<label>账号状态</label><c:if test="${sessionScope.customer.cstatus == 0}"><input type="text" value="正常"  readonly="readonly"/>
					</c:if>
				</div>
				
				<div  class="hint"></div>
				<div>
					<label>注册时间</label><input type="text" value="<fmt:formatDate value="${sessionScope.customer.cregdate }" pattern="yyyy/MM/dd  HH:mm:ss" />"  readonly="readonly"/>
					
				</div>
				<div class="hint">${error }</div>
				
				<div><input type="submit" value="修改" /> </div>
				<div class="regother">
					<div class="rege">
						<a href="javascript:;">企业用户注册</a>
				    </div>
					<div class="regg">
						<a href="javascript:;">国际站注册</a>
					</div>
				</div>
			</form>
		</div>
		
		<div class="bottom">
			<div class="about">
				<a href="javascript:;">关于我们</a>
				<span>|</span>
				<a href="javascript:;">联系我们</a>
				<span>|</span>
				<a href="javascript:;">人才招聘</a>
				<span>|</span>
				<a href="javascript:;">商家入驻</a>
				<span>|</span>
				<a href="javascript:;">广告服务</a>
				<span>|</span>
				<a href="javascript:;">手机京东</a>
				<span>|</span>
				<a href="javascript:;">友情链接</a>
				<span>|</span>
				<a href="javascript:;">销售联盟</a>
				<span>|</span>
				<a href="javascript:;">京东社区</a>
				<span>|</span>
				<a href="javascript:;">京东公益</a>
				<span>|</span>
				<a href="javascript:;">English Site</a>
				
			</div>
			<div class="copyright">Copyright©2004-2018  京东JD.com 版权所有</div>
		</div>
	</body>
</html>
