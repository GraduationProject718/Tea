<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>文章浏览</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
  </head>
  
  <body>
	<jsp:include page="header.jsp"></jsp:include>
	<center><h1 style="padding:20px;font-size:30px;">${teaArticle.title }</h1>${teaArticle.date }</center>
	<div style="width:400px;height:auto;margin:0 auto;"><img src="${pageContext.request.contextPath}/${teaArticle.img }"> </div>
	<div style="float:right;padding:20px;"></div>
	<div style="padding:20px;width:80%;margin:0 auto;">${teaArticle.content }</div>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
