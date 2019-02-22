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

  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
   <div class="p_news clearfix">
   	昵称${user.name}
   </div>
   
   <!-- 上传视频 begin -->
   <form action="servlet/UserServlet?flag=uploadVideo" method="post" enctype="multipart/form-data">
   		文件名<input type="text" name="name" /><br />
   		介绍<input type="text" name="information" /><br />
   		<input type="file" name="video" /><br />
   		<button>提交</button>
   </form>
   <!-- 上传视频 end -->
  <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
