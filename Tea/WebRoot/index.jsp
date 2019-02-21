<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>中国茶文化网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/pcreset.css" />
	<link rel="stylesheet" type="text/css" href="css/pcless.css" />
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/include.js"></script>
	<style type="text/css">
		.login{
			float:right;
			padding-right: 20px;
			margin-bottom: -200px;
			width:300px;
		}
		.login .submit{
			width:100%;
			height:45px;
			background: url("img/pro-bg1.png") no-repeat center top;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$("#login").click(function(){
				var account = $("#loginAccount").val();
				var password = $("#loginPassword").val();
				alert(account+password);
			});
			$("#register").click(function(){
				var account = $("#registerAccount").val();
				var password1 = $("#registerPassword1").val();
				var password2 = $("#registerPassword2").val();
				alert(account+password1+password2);
			});
		});
	</script>
  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
 	<div class="p_news clearfix">
 	<div class="login">
 	<div class="layui-tab">
	  <ul class="layui-tab-title">
	    <li class="layui-this">登录</li>
	    <li>注册</li>
	  </ul>
	  <div class="layui-tab-content">
	    <div class="layui-tab-item layui-show">
			账号：<input type="text" name="loginAccount" id="loginAccount" /><br /><br />
			密码：<input type="password" name="loginPassword" id="loginPassword" /><br /><br />
			<input type="submit" class="submit" name="login" id="login" value="登录" />
		</div>
	    <div class="layui-tab-item">
			账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="text" name="registerAccount" id="registerAccount" /><br /><br />
			密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="registerPassword1" id="registerPassword1" /><br /><br />
			密码确认：<input type="password" name="registerPassword2" id="registerPassword2" /><br /><br />
			<input type="submit" class="submit" name="register" id="register" value="注册" />
		</div>
	  </div>
	</div>
	 </div>
	<script>
	layui.use('element', function(){
	  var element = layui.element;
	});
	</script>
  	<div class="i_tit2 max">
		<h2>茶资讯</h2>
		<span>NEWS  CENTER</span>
		<p>家族传承，古法炮制！传承创新，新鲜感觉！</p>
		<hr />
		<ul class="news_tab max clearfix" id="news_tab">
			<div class="bd">
				<ul>
					<li>
						<a href="">
							<div class="pic bigimg">
								<img style="background: url(img/tea4.jpg);" src="img/icon/png.png" alt="" />
							</div>
							<h3>乾式科技研发造茶新工艺...</h3>
							<p>
								2018年5月13日，乾式科技集团董事会召开新闻发布会称，研发出造茶新工艺，将于年底上市...
							</p>
						</a>
					</li>
					<li>
						<a href="">
							<div class="pic bigimg">
								<img style="background: url(img/tea5.jpg);" src="img/icon/png.png" alt="" />
							</div>
							<h3>乾式科技研发造茶新工艺...</h3>
							<p>
								2018年5月13日，乾式科技集团董事会召开新闻发布会称，研发出造茶新工艺，将于年底上市...
							</p>
						</a>
					</li>
					<li>
						<a href="">
							<div class="pic bigimg">
								<img style="background: url(img/tea2.jpg);" src="img/icon/png.png" alt="" />
							</div>
							<h3>乾式科技研发造茶新工艺...</h3>
							<p>
								2018年5月13日，乾式科技集团董事会召开新闻发布会称，研发出造茶新工艺，将于年底上市...
							</p>
						</a>
					</li>
					<li>
						<a href="">
							<div class="pic bigimg">
								<img style="background: url(img/tea7.jpg);" src="img/icon/png.png" alt="" />
							</div>
							<h3>乾式科技研发造茶新工艺...</h3>
							<p>
								2018年5月13日，乾式科技集团董事会召开新闻发布会称，研发出造茶新工艺，将于年底上市...
							</p>
						</a>
					</li>
					<li>
						<a href="">
							<div class="pic bigimg">
								<img style="background: url(img/tea3.jpg);" src="img/icon/png.png" alt="" />
							</div>
							<h3>乾式科技研发造茶新工艺...</h3>
							<p>
								2018年5月13日，乾式科技集团董事会召开新闻发布会称，研发出造茶新工艺，将于年底上市...
							</p>
						</a>
					</li>
				</ul>
			</div>
			<div class="hd">
				<a class="prev"><img src="img/icon/left1.png" /></a>
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<a class="next"><img src="img/icon/right1.png" /></a>
			</div>
		</ul>
	</div>
		
		<div class="i_tit2 max">
			<h2>视频展示</h2>
			<span>NEWS  CENTER</span>
			<p>家族传承，古法炮制！传承创新，新鲜感觉！</p>
			<hr />
		</div>
		<div class="i_tit2 max">
			<h2>留言板</h2>
			<span>NEWS  CENTER</span>
			<p>家族传承，古法炮制！传承创新，新鲜感觉！</p>
			<hr />
		</div>
	</div>
	<script type="text/javascript">
			jQuery("#news_tab").slide({
				titCell: ".hd ul",
				mainCell: ".bd ul",
				autoPage: true,
				effect: "leftLoop",
				autoPlay: true,
				vis: 4,
				trigger: "click"
			});
		</script>
  	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
