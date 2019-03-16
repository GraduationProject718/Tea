<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
	<link rel="stylesheet" href="layui/css/layui.css">
	
	<style type="text/css">
		.divcss5{ margin:10 auto; width:80%; overflow:hidden;border:2px solid;} 
		.divcss5 img{ float:left; width:300px; height:300px;border:2px solid;} 
		.divcss5 .content{width:auto; text-align:left} 
		.divcss5 .content h1{ height:26px; line-height:10px;font-family:"Microsoft YaHei";  
		font-size:16px; overflow:hidden;padding:20px;} 
		.divcss5 .content div{ padding-top:5px; height:80px;overflow:hidden;padding:20px;} 
		.divcss5 .content div span{color:#353535}
		.videos{
			width:300px;
			height:300px;
		} 
	</style>

  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>

	<c:forEach items="${page.list}" var="v" varStatus="status">
		<div class="divcss5"> 
		    <video src="${pageContext.request.contextPath}/${v.url}" class="videos" controls="controls"></video> 
		    <div class="content"> 
		        <h1>${v.name }</h1> 
		        <div> ${v.information }</div> 
		    </div> 
		</div>
	</c:forEach>
	<jsp:include page="pageFile.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
