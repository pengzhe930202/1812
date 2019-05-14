<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>个人注册</title>
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
				<img src="img/logo.png" />
				<h1>欢迎注册</h1>
				<div class="login">
					已有账号？
					<a href="login.jsp">登陆</a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="center">
			<form action="Customer/register.action" method="post">
				<h1>用户注册</h1>
				<div>
					<label>账号</label><input type="text" name="cname" placeholder="请输入一个账号"
						onfocus="usernameFocus()"
						onblur="usernameBlur()" ;/>
				</div>
				<div id="unhint" class="hint"></div>
				<div>
					<label>密码</label><input type="password" name="password" id="password" />
				</div>
				<div id="pwdhint" class="hint"></div>
				<div>
					<label>重复密码</label><input type="password" name="password2" />
				</div>
				<div class="hint">${error }</div>
				
				<div><input type="submit" value="注册" /> </div>
				<div class="regother">
					<div class="rege">
						<a href="#">企业用户注册</a>
				    </div>
					<div class="regg">
						<a href="#">国际站注册</a>
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
