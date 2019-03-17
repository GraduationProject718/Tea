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
    
    <title>中国茶文化后台管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<style type="text/css">
		body{
			background: none;
		}
		.layui-form-pane{
			padding-top:20px;
			padding-left:20px;
		}
		.layui-form-pane .layui-form-label{
			background-color: #1e9fff;
			margin-left: 20px;
		}
		.layui-table td, .layui-table th{
			padding:9px;
		}
		.layui-table{
			width:95%;
			margin-left: 20px;
		}
		.layui-input{
			width:200px;
		}
		.page{
			margin:0 auto;
		}
	</style>
	
	<script type="text/javascript">
		function delTeaArticle(id){
			if(confirm("是否确认删除")){
				location="TeaArticleServlet?method=delTeaArticle&id="+id;
			}else{
				return false;
			}
		}
		
		function editTeaArticle(id){
			location="TeaArticleServlet?method=editTeaArticle&id="+id;
		}
		
		function delTeaChild(id){
			if(confirm("是否确认删除")){
				location="TeaChildServlet?method=delTeaChild&id="+id;
			}else{
				return false;
			}
		}
		
		function editTeaChild(id){
			location="TeaChildServlet?method=editTeaChild&id="+id;
		}
	</script>
  </head>
  
  <body>
	<div class="layui-form layui-form-pane">
	<div class="layui-form-item">
	<table>
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/admin/tea/addTeaParent.jsp"><button class="layui-btn layui-btn-normal">添加大分类茶叶</button></a>
			</td>
			<td>
				<a href="${pageContext.request.contextPath}/TeaChildServlet?method=addToPage"><button class="layui-btn layui-btn-normal">添加小分类茶叶</button></a>
			</td>
			<td>
				<a href="${pageContext.request.contextPath}/TeaArticleServlet?method=addToPage"><button class="layui-btn layui-btn-normal">添加茶叶相关文章</button></a>
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<c:forEach items="${teaParent}" var="tp" >
			<td>
				<div style="margin:20px;">${tp.name}</div>
			</td>
			</c:forEach>
		</tr>
	</table>	
	
  	<c:forEach items="${teaParent}" var="tp" >
  	<div style="float:left;margin:20px;">${tp.name}
  	<c:forEach items="${teaChild}" var="tc">
  		<c:if test="${tp.id == tc.parentId }">
			<div>${tc.name }<a href="javascript:editTeaChild('${tc.id }');">编辑</a><a href="javascript:delTeaChild('${tc.id }');">删除</a></div>
		</c:if>
	</c:forEach>
	</div>
	</c:forEach>

	<table class="layui-table">
	  <colgroup>
	  	<col width="50">
	  	<col width="50">
	    <col>
	    <col width="100">
	    <col width="150">
	  </colgroup>
	  <thead>
	    <tr>
	      <th>序号</th>		
	      <th>封面</th>
	      <th>标题</th>
	      <th>时间</th>
	      <th>操作</th>
	    </tr> 
	  </thead>
	  <tbody>
	    <c:forEach items="${page.list}" var="a" varStatus="status">
	    <tr>
	    	<td>${status.count}</td>
			<td><img style="width:30px;height:30px;" src="${pageContext.request.contextPath}/${a.img }"> </td>
			<td>${a.title } </td>
			<td>${a.date }</td>
			<td>
				<button class="layui-btn layui-btn-normal" onclick="editTeaArticle('${a.id}');" ><i class="layui-icon">&#xe642;</i></button>
				<button class="layui-btn layui-btn-normal" onclick="delTeaArticle('${a.id}');" ><i class="layui-icon">&#xe640;</i></button>
			</td>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
  	<jsp:include page="../pageFile.jsp"></jsp:include>
	</div>
	</div>
  </body>
</html>
