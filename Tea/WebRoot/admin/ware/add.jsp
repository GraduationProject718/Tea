<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加茶具</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  
  <body>
  <form action="/Tea/WareServlet?method=addWare" method="post" enctype="multipart/form-data">
    茶具名称<input type="text" id="name" name="name" /><br /><br />
  茶具介绍<textarea rows="10" cols="100" id="desc" name="desc"></textarea><br /><br />
  茶具图片<input type="file" id="img" name="img" /> <br /><br />
  <input type="submit" value="添加"><br /><br />
  </form> 
  </body>
</html>
