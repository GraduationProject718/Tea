<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
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
	<form action="TeaChildServlet?method=edit" method="post">
		子项目名:<input type="text" name="name" id="name" value="${teaChild.name }"/><br /><br />
		所属父项目:
		<select name="parentId">
		<c:forEach items="${teaParent}" var="tp">
			<c:if test="${tp.id == teaChild.parentId }">
				<option value="${tp.id }" selected="selected">${tp.name }</option>
			</c:if>
			<option value="${tp.id }">${tp.name }</option>
		</c:forEach>
		</select><br /><br />
		介绍:<textarea rows="10" cols="100" name="info" id="info" > ${teaChild.info}</textarea><br /><br />
		功能:<textarea rows="10" cols="100" name="function" id="function">${teaChild.function}</textarea><br /><br />
		<input type="hidden" value="${teaChild.id }" name="id" id="id" />
		<input type="submit" value="修改" /><br /><br />
	</form>
  </body>
</html>
