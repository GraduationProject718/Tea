<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="css/pcreset.css" />
<link rel="stylesheet" type="text/css" href="css/pcless.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<div>
	<img style="margin-left:300px;margin-top:20px;margin-bottom:20px;" src="img/TeaCulture.png" />
	<c:if test="${empty user }">
		<div style="float: right;margin-right: 60px;margin-top: 60px;"><a href="login.jsp">登录</a>/<a href="register.jsp">注册</a></div>
	</c:if>
	<c:if test="${not empty user }">
		<a href="user.jsp">${user.name}</a>
	</c:if>
</div>
<div class="header">
	<div class="nav max">
		<ul>
			<li><a href="IndexServlet"><h2>网站首页</h2></a></li>
			<li><a href="ArticleServlet?method=findArticleByTypeId&typeId=3&num=1"><h2>茶叶历史</h2></a></li>
			<li><a href="TeaArticleServlet?method=findAllByIndex&num=1"><h2>茶叶种类</h2></a></li>
			<li><a href="ArticleServlet?method=findArticleByTypeId&typeId=2&num=1"><h2>茶艺茶道</h2></a></li>
			<li><a href="ArticleServlet?method=findArticleByTypeId&typeId=1&num=1"><h2>茶与养生</h2></a></li>
			<li><a href="WareServlet?method=findAllWareByIndex&num=1"><h2>茶具知识</h2></a></li>
			<li><a href="VideosServlet?method=findAllVideosByPage&num=1"><h2>视频展示</h2></a></li>
			<li><a href="LiuYanServlet?method=findAllByIndex&num=1"><h2>在线交流</h2></a></li>
			<li><a href="ArticleServlet?method=findArticleByNews&typeId=4&num=1"><h2>新闻资讯</h2></a></li>
		</ul>
	</div>
</div>
