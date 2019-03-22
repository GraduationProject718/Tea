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
    <link rel="stylesheet" href="css/register.css"/>
	
  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
  
  <div id="main">
       <div class="container">
           <div class="bgPic"><img src="img/register/b2_1.jpg" alt=""/></div>
           <div class="register">
               <div class="title">
                   <span>注册</span>
                   <a href="login.jsp">去登录</a>
               </div>
               <form autocomplete="off">
                   <div class="default">
                       <p>用户名由3~10个数字和英文字符组成</p>
                       <input id="uname" name="uname" data-form="uname" type="text" />
                       <label for="uname">用户名</label>
                   </div>
                   <div class="default">
                       <p>密码由8~10个数字和英文字符组成</p>
                       <input id="upwd" name="upwd" data-form="upwd" type="password"/>
                       <label for="upwd">密码</label>
                   </div>
                   <div class="default">
                       <p>请确认两次输入密码一致</p>
                       <input id="upwd_2" data-form="upwd_2" type="password"/>
                       <label for="upwd_2">确认密码</label>
                   </div>
                   <div class="default">
                       <p>请输入中国大陆手机号码</p>
                       <input id="phone" name="phone" data-form="phone" type="text"/>
                       <label for="phone">手机</label>
                   </div>
                   <div class="submit">
                       <span class="notice">点击"注册"代表您同意遵守
                           <a href="#">用户协议</a>
                           和
                           <a href="#">隐私条款</a>
                       </span>
                       <button class="s_hover" data-form="submit">注册</button>
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
