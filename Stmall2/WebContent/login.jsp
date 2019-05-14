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
		<title>用户登陆</title>
		<link rel="stylesheet" type="text/css" href="css/register.css"/>
		<script type="text/javascript" src="js/jquery-2.2.4.min (2).js"></script>
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
			function refreshCode(){
				// 修改图片的属性
				$("#codeimg").removeAttr("src");
				$("#codeimg").attr("src","Customer/getCode.action?t=" + new Date().getTime());
			}
		</script>
	</head>
	<body>
		<div class="topbg">
			<div class="top">
				<img src="img/logo.png" />
				<h1>欢迎登陆</h1>
				<div class="login">
					没有账号？
					<a href="register.jsp">请注册</a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="center">
			<form action="Customer/login.action" method="post">
				<h1>用户登陆</h1>
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
					<label>验证码</label><input type="test" name="code" id="code" /><br/>
					<img id="codeimg" src="Customer/getCode.action"/>
					<a href="javascript:void(0)" onclick="refreshCode()">点击刷新</a>
				</div>
				<div id="pwdhint" class="hint"></div>
				
				<div class="error">${error }</div>
				
				<div><input type="submit" value="登陆" /> </div>
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
