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
	
	<style type="text/css">
		.tea{
			margin-top:20px;
			font-size:25px;
		}
		.tea tr{
			padding-top:10px;
			height:50px;
		}
		.tea_name{
			width:300px;
			padding-left:10px;
			font-size:18px;
			color:black;
		}
	</style>
  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
  
	<div style="width:1200px;margin:0 auto;font-size: 25px;">
		<table class="tea">
		<c:forEach items="${teaParent}" var="tp" >
			<tr><td><b>${tp.name}</b></td></tr>
			<tr>
			  	<c:forEach items="${teaChild}" var="tc">
			  		<c:if test="${tp.id == tc.parentId }">
						<td class="tea_name"><a href="TeaArticleServlet?method=findByChildId&num=1&childId=${tc.id }">${tc.name }</a></td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
		</table>
 	</div>
  <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
