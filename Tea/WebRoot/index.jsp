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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<jsp:include page="header.jsp"></jsp:include>
  	<div class="p_news clearfix">
	  	<div class="i_tit2 max">
			<h2>茶资讯</h2>
			<span>NEWS  CENTER</span>
			<p>家族传承，古法炮制！传承创新，新鲜感觉！</p>
			<hr />
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
  	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
