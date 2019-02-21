<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="header">
	<div class="logo">
		<img style="width:125px;height:125px;background:#EDEAE3;" src="img/icon/logo.png" />
	</div>
	<div class="nav max">
		<ul>
			<li>
				<a href="index.jsp">
					<h2>网站首页</h2>
					<h4>HOME</h4>
				</a>
			</li>
			<li>
				<a href="tea.jsp">
					<h2>茶叶</h2>
					<h4>TEA</h4>
				</a>
			</li>
			<li>
				<a href="ware.jsp">
					<h2>茶具</h2>
					<h4>WARE</h4>
				</a>
			</li>
			<li></li>
			<li>
				<a href="health.jsp">
					<h2>茶与养生</h2>
					<h4>HEALTH</h4>
				</a>
			</li>
			<li>
				<a href="art.jsp">
					<h2>茶艺茶道</h2>
					<h4>ART</h4>
				</a>
			</li>
			<li>
				<a href="history.jsp">
					<h2>茶历史</h2>
					<h4>HISTORY</h4>
				</a>
			</li>
		</ul>
	</div>
</div>
