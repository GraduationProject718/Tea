<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		$(document).ready(function(){
			$.ajax({
				type:"POST",
				url:"servlet/VideoServlet",
				data:{"flag":"getVideo"},
				success:function(data){
				}
			});
		});
		
		$(function(){
			$("#login").click(function(){
				var account = $("#loginAccount").val();
				var password = $("#loginPassword").val();
				$.ajax({
						type:"POST",
						url:"servlet/UserServlet",
						data:{"flag":"login","account":account,"password":password},
						success:function(data){
							location="index.jsp";
						}
					});
			});
			$("#register").click(function(){
				var account = $("#registerAccount").val();
				var password1 = $("#registerPassword1").val();
				var password2 = $("#registerPassword2").val();
				if(password1 == password2){
					$.ajax({
						type:"POST",
						url:"servlet/UserServlet",
						data:{"flag":"register","account":account,"password":password1},
						success:function(data){
							alert(data);
						}
						
					});
				}else{
					alert("密码不一致,请重新输入");
					return false;
				}
			});
		});
		
	</script>
  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
 	<div class="p_news clearfix">
 	<!-- 登录注册选项卡 begin-->
 	<div class="login">
 	<c:if test="${user.name == null}">
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
	</c:if>
	<c:if test="${user.name != null}">
		<a href="myUser.jsp" target="_self"><img style="width:100px;height:100px;float:right;" src="${user.imgUrl }"></a>
	</c:if>
	 </div>
	<script>
	layui.use('element', function(){
	  var element = layui.element;
	});
	</script>
	
	
	<!-- 登录注册选项卡 end-->
  	<div class="i_tit2 max">
		<h2><a href="news.jsp">茶资讯</a></h2>
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
			<h2><a href="video.jsp">视频展示</a></h2>
			<span>NEWS  CENTER</span>
			<p>家族传承，古法炮制！传承创新，新鲜感觉！</p>
			<hr />
			<ul class="news_tab max clearfix" id="video_tab">
				<div class="bd">
					<ul>
						<c:forEach items="${video}" var="v">
						<li>
							<div class="pic bigimg">
								<video src="${pageContext.request.contextPath}/${v.url}" style="width:280px;height:172px;" controls="controls"></video>
							</div>
							<h3>${v.name }</h3>
							<p>${v.information }</p>
						</li>
						</c:forEach>
						
					</ul>
				</div>
				
				<div class="hd">
					<a class="prev"><img src="img/icon/left1.png" /></a>
					<ul>
						<c:forEach items="${video}" var="v">
							<li></li>
						</c:forEach>
					</ul>
					<a class="next"><img src="img/icon/right1.png" /></a>
				</div>
		</ul>
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
		
		jQuery("#video_tab").slide({
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
