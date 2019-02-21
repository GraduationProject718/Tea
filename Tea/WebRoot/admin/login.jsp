<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>中国茶文化网后台管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>

	<style type="text/css">
		body{
			background: url("img/banner.jpg") no-repeat center;
			overflow: hidden;
			background-size:cover;
		}
		.container{
			width:300px;
			margin:100 auto;
			background: white;
		}
		.login{
			width:60%;
			height:45px;
			background: url("img/pro-bg1.png") no-repeat center top ;
		}
	</style>

	<script type="text/javascript">
		$(function(){
			$("#login").click(function(){
				var account = $("#loginAccount").val();
				var password = $("#loginPassword").val();
				$.ajax({
						type:"POST",
						url:"servlet/AdminServlet",
						data:{"flag":"login","account":account,"password":password},
						success:function(data){
							location="admin/main.jsp";
						}
					});
			});
		});
	</script>
  </head>
  
  <body>
  <div class="container">
    <div class="layui-tab">
	  <ul class="layui-tab-title">
	    <li class="layui-this">中国茶文化网后台管理系统</li>
	  </ul>
	  <div class="layui-tab-content">
	    <div class="layui-tab-item layui-show">
			账号：<input type="text" name="loginAccount" id="loginAccount" /><br /><br />
			密码：<input type="password" name="loginPassword" id="loginPassword" /><br /><br />
			<input type="submit" class="login" name="login" id="login" value="登录" />
		</div>
	  </div>
	</div>
	</div>
  </body>
</html>
