<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="">
	<img style="margin-left:300px;margin-top:20px;margin-bottom:20px;" src="img/TeaCulture.png" />
	<c:if test="${empty user }">
		<a href="login.jsp">登录</a><a href="register.jsp">注册</a>
	</c:if>
	<c:if test="${not empty user }">
		<a href="user.jsp">${user.name}</a>
	</c:if>
</div>
<div class="header">
	<div class="logo">
		<img style="width:125px;height:125px;background:#EDEAE3;" src="img/icon/logo.png" />
	</div>
	<div class="nav max">
		<ul>
			<li>
				<a href="index.jsp">
					<h2>网站首页</h2>
					<h4>HOME</h4>
				</a>
			</li>
			<li>
				<a href="TeaArticleServlet?method=findAllByIndex&num=1">
					<h2>茶叶</h2>
					<h4>TEA</h4>
				</a>
			</li>
			<li>
				<a href="WareServlet?method=findAllWareByIndex&num=1">
					<h2>茶具</h2>
					<h4>WARE</h4>
				</a>
			</li>
			<li></li>
			<li>
				<a href="ArticleServlet?method=findArticleByTypeId&typeId=1&num=1">
					<h2>茶与养生</h2>
					<h4>HEALTH</h4>
				</a>
			</li>
			<li>
				<a href="ArticleServlet?method=findArticleByTypeId&typeId=2&num=1">
					<h2>茶艺茶道</h2>
					<h4>ART</h4>
				</a>
			</li>
			<li>
				<a href="ArticleServlet?method=findArticleByTypeId&typeId=3&num=1">
					<h2>茶历史</h2>
					<h4>HISTORY</h4>
				</a>
			</li>
		</ul>
	</div>
</div>
