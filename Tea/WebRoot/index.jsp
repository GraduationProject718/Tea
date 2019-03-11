<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/include.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajaxSettings.async = false;
			$.post("${pageContext.request.contextPath}/ArticleServlet?method=getIndexArticle",{"":""},function(data){
			},"",false);
			$.post("${pageContext.request.contextPath}/VideosServlet?method=getIndexVideos",{"":""},function(data){
			},"",false);
		});
	</script>
  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
 	<div class="p_news clearfix">
  	<div class="i_tit2 max">
		<h2><a href="ArticleServlet?method=findArticleByTypeId&typeId=4&num=1">茶资讯</a></h2>
		<span>NEWS  CENTER</span>
		<p>家族传承，古法炮制！传承创新，新鲜感觉！</p>
		<hr />
		<ul class="news_tab max clearfix" id="news_tab">
			<div class="bd">
				<ul>
					<c:forEach items="${indexArticle}" var="ia">
					<li>
						<a href="ArticleServlet?method=findArticleById&id=${ia.id }">
							<div class="pic bigimg">
								<img style="background: url(${pageContext.request.contextPath}/${ia.img });" src="img/icon/png.png" alt="" />
							</div>
							<h3>${ia.title }</h3>
							<div style="height:30px;">${ia.content }</div>
						</a>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div class="hd">
				<a class="prev"><img src="img/icon/left1.png" /></a>
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<a class="next"><img src="img/icon/right1.png" /></a>
			</div>
		</ul>
	</div>
		
		<div class="i_tit2 max">
			<h2><a href="video.jsp">视频展示</a></h2>
			<span>NEWS  CENTER</span>
			<p>家族传承，古法炮制！传承创新，新鲜感觉！</p>
			<hr />
			<ul class="news_tab max clearfix" id="video_tab">
				<div class="bd">
					<ul>
						<c:forEach items="${indexVideos}" var="v">
						<li>
							<div class="pic bigimg">
								<video src="${pageContext.request.contextPath}/${v.url}" style="width:280px;height:172px;" controls="controls"></video>
							</div>
							<h3>${v.name }</h3>
							<p>${v.information }</p>
						</li>
						</c:forEach>
					</ul>
				</div>
				
				<div class="hd">
					<a class="prev"><img src="img/icon/left1.png" /></a>
					<ul>
						<c:forEach items="${video}" var="v">
							<li></li>
						</c:forEach>
					</ul>
					<a class="next"><img src="img/icon/right1.png" /></a>
				</div>
		</ul>
		</div>
		<div class="i_tit2 max">
			<h2>留言板</h2>
			<span>NEWS  CENTER</span>
			<p>家族传承，古法炮制！传承创新，新鲜感觉！</p>
			<hr />
		</div>
	</div>
	<script type="text/javascript">
		jQuery("#news_tab").slide({
			titCell: ".hd ul",
			mainCell: ".bd ul",
			autoPage: true,
			effect: "leftLoop",
			autoPlay: true,
			vis: 4,
			trigger: "click"
		});
		
		jQuery("#video_tab").slide({
			titCell: ".hd ul",
			mainCell: ".bd ul",
			autoPage: true,
			effect: "leftLoop",
			autoPlay: true,
			vis: 4,
			trigger: "click"
		});
	</script>
  	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
