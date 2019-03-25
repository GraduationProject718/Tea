<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/base.css"/>
    <link rel="stylesheet" href="css/login.css"/>
  </head>
  
  <body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div id="main">
    <div class="container">
        <div class="bgPic"><img src="img/register/b3_1.jpg" alt=""/></div>
        <div class="register">
            <div class="title">
                <span>登录</span>
                <a href="register.jsp">去注册</a>
            </div>
            <form autocomplete="off" method="post" action="UserServlet?method=login">
                <div class="default">
                    <p>请输入用户名或手机号码</p>
                    <input id="account" name="account" data-form="uname" type="text" placeholder="账号" />
                </div>
                <div class="default">
                    <p>请输入账号密码</p>
                    <input id="password" name="password" data-form="upwd" type="password" placeholder="密码"/>
                </div>
                <div class="submit">
                        <span class="notice">
                            <a href="#">忘记密码</a>
                        </span>
                    <button class="s_hover" data-form="submit">登录</button>
                </div>
            </form>
            <div class="other_login">
                <div class="log">
                    <span>社交账号登录</span>
                </div>
                <div class="icon">
                    <ul>
                        <li data-log="icon" class="i_hover">
                            <img data-icon="wx" src="img/register/wx.png" alt=""/>
                            <span class="prompt" >微信登录</span>
                        </li>
                        <li data-log="icon" class="i_hover">
                            <img data-icon="qq" src="img/register/qq.png" alt=""/>
                            <span class="prompt" >QQ登录</span>
                        </li>
                        <li data-log="icon" class="i_hover">
                            <img data-icon="wb" src="img/register/wb.png" alt=""/>
                            <span class="prompt" >微博登录</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
