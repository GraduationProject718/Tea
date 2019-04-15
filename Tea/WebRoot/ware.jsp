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


  </head>
  
  <body>
    <jsp:include page="header.jsp"></jsp:include>
	<div style="width:60%;margin:0 auto;">
	<table>
		<tr>
			<c:forEach items="${page.list}" var="w" varStatus="status">
		    	<c:if test="${status.count<4 }" >
		    		<td style="width:370px;margin-right:20px;margin-top:20px;padding-top:20px;">
		    		 <a href=""><img style="width:350px;height:300px;flaot:left;" src="${pageContext.request.contextPath}/${w.img }" /></a> 
		    		 <h1 style="text-align: center;"><a href="" ><i class="layui-icon layui-icon-read" style="font-size: 30px; color: #0D2739;"></i> ${w.name}</a></h1> 
		    		 </td>
		    	</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${page.list}" var="w" varStatus="status">
		    	<c:if test="${status.count>=4 }" >
		    		<td style="width:370px;margin-right:20px;margin-top:20px;padding-top:30px;padding-bottom: 30px;" >
		    		 <a href=""><img style="width:350px;height:300px;flaot:left;" src="${pageContext.request.contextPath}/${w.img }" /></a> 
		    		 <h1 style="text-align: center;" ><a href=""><i class="layui-icon layui-icon-read" style="font-size: 30px; color: #0D2739;"></i> ${w.name}</a></h1> 
		    		 </td>
		    	</c:if>
			</c:forEach>
		</tr>
	</table>
    
	</div> 
	<jsp:include page="pageFile.jsp"></jsp:include>
    
    
  	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
