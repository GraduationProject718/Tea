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
		table{
			margin:0 auto;
			text-align: center;
		}
		
	</style>
  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
	<table>
	<tr>
	<c:forEach items="${page.list}" var="v" varStatus="status">
		<td>
			<div style="padding-right:15px;padding-top:5px;">
		    <video src="${pageContext.request.contextPath}/${v.url}" class="videos" controls="controls"></video> 
		        <h1>${v.name }</h1> 
		       ${v.information }
		    </div>
		</td>
	</c:forEach>
	</tr>
	</table>
	<jsp:include page="pageFile.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
