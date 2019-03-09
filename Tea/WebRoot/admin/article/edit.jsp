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
    
    <title>发布文章</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
   	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			var ue = UE.getEditor('content');
		});
	</script>
	
	<style type="text/css">
		body{
			padding:20px;
			background: none;
		}
	</style>

  </head>
  
  <body>
	<form action="${pageContext.request.contextPath}/ArticleServlet?method=editArticle" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${article.id }">
    <h3><input class="layui-btn layui-btn-normal" style="margin-bottom:5px;" value="编辑完成" data-toggle="modal" data-target="#saveArticle"></h3>
	<textarea name="content" id="content" style="width: 100%; height: 70%;margin:0 auto;">${article.content }</textarea>
  	
  	<!-- 添加 文章begin --><!-- 模态框（Modal） -->
  	
	<div class="modal fade" id="saveArticle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">添加文章</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
	 				<label>标题</label><input value="${article.title }" class="layui-input" type="text" name="title" id="title" ><br />
					<label>时间</label><input value="${article.date }" class="layui-input" type="text" name="date" id="date"><br />
					<label>封面</label><input value="${article.img }" class="layui-input" type="file" name="img" id="img" ><br />
					<img style="width:50px;height:50px;" src="${pageContext.request.contextPath}/${article.img}" /><br />
					<label>所属内容</label>
					<select name="typeId" lay-verify="required">
				      	 <c:forEach items="${articleTypeList}" var="at">
				      	 	<c:choose> 
								<c:when test="${article.typeId == at.id }">
									<option value="${at.id}" selected="selected">${at.name}</option>
								</c:when>  
								<c:otherwise>
									<option value="${at.id}">${at.name}</option>
								</c:otherwise>  
							</c:choose> 
				        </c:forEach>
				     </select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-primary" id="saveArticle" >确定</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</form>
  	<!-- 添加 文章end -->
  	
  	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script>
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	 
	  //执行一个laydate实例
	  laydate.render({
	    elem: '#date' //指定元素
	  });
	});
	</script>
  </body>
</html>
