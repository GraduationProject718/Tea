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
    
    <title>中国茶文化网后台管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/page.css" />
	<script type="text/javascript" src="js/jquery.min.js" ></script>
	<script type="text/javascript" src="js/main.js" ></script>

  </head>
  
  <body>
	<div class="left">
			<div class="bigTitle">中国茶文化后台管理系统</div>
			<div class="lines">
				<div onclick="pageClick(this)" class="active"><a href="servlet/UserServlet?flag=findUserWithPage&num=1" target="main"><img src="img/icon-1.png" />用户管理</a></div>
				<div onclick="pageClick(this)" ><a href="${pageContext.request.contextPath}/TeaArticleServlet?method=findAllByAdmin&num=1" target="main"><img src="img/icon-2.png" />茶叶管理</a></div>
				<div onclick="pageClick(this)" ><a href="${pageContext.request.contextPath}/WareServlet?method=findAllWareByAdmin&num=1" target="main"><img src="img/icon-2.png" />茶具管理</a></div>
				<div onclick="pageClick(this)" ><a href="${pageContext.request.contextPath}/ArticleServlet?method=getList&num=1" target="main"><img src="img/icon-3.png" />文章管理</a></div>
				<div onclick="pageClick(this)" ><a href="admin/message/message.jsp" target="main"><img src="img/icon-3.png" />留言管理</a></div>
				<div onclick="pageClick(this)" ><a href="${pageContext.request.contextPath}/VideosServlet?method=findAllByAdmin&num=1" target="main"><img src="img/icon-5.png" />视频管理</a></div>
			</div>
		</div>
		<div class="top">
			<div class="leftTiyle" id="flTitle">用户管理</div>
			<div class="thisUser">当前用户：${admin.account}</div>
		</div>
		<div class="content">
			<iframe src="admin/user/user.jsp" style="width:99%;height:85%;" name="main"></iframe>
		</div>
  </body>
</html>
