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
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/include.js"></script>
	
	<style type="text/css">
		.table_hidden { table-layout: fixed;height:400px;}
		.tr_hidden{
			height:100px;
			
		}
		.td_hidden{
			margin:0px;
			padding:0px;
			width:700px;
			height:100px;
		    overflow:hidden;
		    white-space:nowrap;
		    text-overflow:ellipsis;
		    -o-text-overflow:ellipsis;
		    -moz-text-overflow: ellipsis;
		    -webkit-text-overflow: ellipsis;
		}
		
		.layui-col-md4 li{
			width:380px;
			font-size:20px;
			padding-left:10px;
			padding-top:10px;
			white-space: nowrap;
		    text-overflow: ellipsis;
		    -o-text-overflow: ellipsis;
		    overflow: hidden;
					
		}
		.layui-col-md4 a:hover{
			color:red;
		}
		.layui-col-md4 img{
			width:150px;
			height:100px;
		}
		
	</style>
	
	
  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
 	<div class="p_news clearfix">
 	
 	<div class="i_tit2 max">

		<ul class="news_tab max clearfix" id="teaarticle_tab">
			<div class="bd">
			<div style="float:left;width:500px;">
				<div class="layui-carousel" id="test1">
					  <div carousel-item>
					   <c:forEach items="${indexTeaArticle}" var="ita" varStatus="status">
							<a href="TeaArticleServlet?method=findTeaArticleById&id=${ita.id }">
								<div style="width:500px; height:400px;" >
									<img style="height:100%;width:100%;" src="${pageContext.request.contextPath}/${ita.img }" alt="">
								</div>
							</a>
						</c:forEach>
					  </div>
					</div>
					 
					<script>
					layui.use('carousel', function(){
					  var carousel = layui.carousel;
					  //建造实例
					  carousel.render({
					    elem: '#test1'
					    ,width: '500px' //设置容器宽度
					    ,height:'400px'
					    ,arrow: 'always' //始终显示箭头
					    ,anim: 'default' //切换动画方式
					    ,indicator:'none'
					  });
					});
					</script>
				
				</div>
				<div style="float:right;width:700px;height:100px;">
				<table class="table_hidden">
					<c:forEach items="${indexTeaArticle}" var="ita" varStatus="status">
						<tr>
							<td style="width:600px;"> <a href="TeaArticleServlet?method=findTeaArticleById&id=${ita.id }"><h3><b>${ita.title}</b><span style="float:right;">${ita.date}</span></h3></a></td>
						</tr>
						<%-- <tr class="tr_hidden">
							<td class="td_hidden">${ita.content}</td>
						</tr> --%>
					
					</c:forEach>
				</table>
				</div>
			</div>
			
		</ul>
	</div>
 	
 	
  	<div class="i_tit2 max">
		<h2><a href="ArticleServlet?method=findArticleByTypeId&typeId=4&num=1">新闻资讯</a></h2>
		<ul class="news_tab max clearfix" id="news_tab">
			<div class="bd">
				<ul>
					<c:forEach items="${indexArticle}" var="ia">
					<li>
						<a href="ArticleServlet?method=findArticleById&id=${ia.id }">
							<div class="pic bigimg">
								<img style="background: url(${pageContext.request.contextPath}/${ia.img });" src="img/icon/png.png"  />
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
				<ul><li></li><li></li><li></li><li></li><li></li></ul>
				<a class="next"><img src="img/icon/right1.png" /></a>
			</div>
		</ul>
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
	</script>
	
	<div style="width:1200px;margin:0 auto;padding-bottom:10px;">
	
	<div><img style="padding-top:10px;padding-bottom:10px;width:1200px;height:200px;" src="img/zhongjian.png"></div>
	
	<div class="layui-row layui-col-space10">
		<div class="layui-col-md4">
		  <div style="margin-top:10px;padding-top:10px;height:500px;border:1px solid black;">
		  	<p style="font-size:25px;padding-left:10px;"><b>茶叶历史</b><span style="margin-left:200px;"><a href="ArticleServlet?method=findArticleByTypeId&typeId=3&num=1">更多</a></span></p>
		  	<hr style="background-color: black;" />
		  	<div style="">
			  	<ul>
			  		<c:forEach items="${historyArticle}" var="ha" varStatus="status">
			  			<li><a href="ArticleServlet?method=findArticleById&id=${ha.id }">${ha.title }</a></li>
			  			
			  		</c:forEach>
			  	</ul>
		  	</div>
		  </div>
		</div>
		
		<div class="layui-col-md4">
		  <div style="margin-top:10px;padding-top:10px;height:500px;border:1px solid black;">
		  	<p style="font-size:25px;padding-left:10px;"><b>茶艺茶道</b><span style="margin-left:200px;"><a href="ArticleServlet?method=findArticleByTypeId&typeId=2&num=1">更多</a></span></p>
		  	<hr style="background-color: black;" />
		  	<ul>
		  		<c:forEach items="${artArticle}" var="aa">
		  			<li><a href="ArticleServlet?method=findArticleById&id=${aa.id }">${aa.title }</a></li>
		  		</c:forEach>
		  	</ul>
		  </div>
		</div>
		
		<div class="layui-col-md4">
		  <div style="margin-top:10px;padding-top:10px;height:500px;border:1px solid black;">
		  	<p style="font-size:25px;padding-left:10px;"><b>茶与养生</b><span style="margin-left:200px;"><a href="ArticleServlet?method=findArticleByTypeId&typeId=1&num=1">更多</a></span></p>
		  	<hr style="background-color: black;" />
		  	<ul>
		  		<c:forEach items="${healthArticle}" var="ha">
		  			<li><a href="ArticleServlet?method=findArticleById&id=${ha.id }">${ha.title }</a></li>
		  		</c:forEach>
		  	</ul>
		  </div>
		</div>
		
	</div>
	
	</div>
	</div>
	
		<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
