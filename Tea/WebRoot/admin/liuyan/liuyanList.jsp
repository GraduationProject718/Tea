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
		function del(id){
			if(confirm("是否确认删除")){
				location="LiuYanServlet?method=del&id="+id;
			}else{
				return false;
			}
		}
		
	</script>
  </head>
  
  <body>
	<div class="layui-form layui-form-pane">
	<div class="layui-form-item">
	
	<table class="layui-table">
	  <colgroup>
	  	<col width="50">
	    <col>
	    <col width="100">
	    <col width="200">
	  </colgroup>
	  <thead>
	    <tr>
	      <th>序号</th>		
	      <th>内容</th>
	      <th>时间</th>
	      <th>操作</th>
	    </tr> 
	  </thead>
	  <tbody>
	    <c:forEach items="${page.list}" var="ly" varStatus="status">
	    <tr>
	    	<td>${status.count}</td>
			<td>${ly.content } </td>
			<td>${ly.date }</td>
			<td>
				<button class="layui-btn layui-btn-normal"  id="button1" onclick="show1()" >回复</button>
				<button class="layui-btn layui-btn-normal" onclick="del('${ly.id}');" ><i class="layui-icon">&#xe640;</i></button>
				<div style="display:none;position: absolute;left:-1200px;top:350px;" id="div1">
					<hr />
					<form action="">
						<input type="hidden" name="id" value="${ly.id }">
						<h3>请输入回复内容：</h3>
						<textarea rows="10" cols="150"></textarea><br>
						<button type="submit" style="width:80px;height:30px;float:right;margin-top:20px;">确定</button>
					</form>
				</div>
			</td>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
  	<jsp:include page="../pageFile.jsp"></jsp:include>
	</div>
	</div>
	
	
	<script>
		function show1(){
			document.getElementById("div1").style.display="block";
		};
	</script>
	
  </body>
</html>
