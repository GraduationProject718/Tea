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
    
    <title>个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<meta name="theme-color" content="#ffc91d"/>
    <link rel="icon" href="static/img/32.png" sizes="32x32"/>
    <link rel="icon" href="static/img/192.png" sizes="192x192"/>
    <link href="static/kico.css" rel="stylesheet" type="text/css"/>
    <link href="static/moreduo.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1"/>
 	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/bootstrap.min.js"></script>
 	<link rel="stylesheet" href="layui/css/layui.css" />
	<script src="layui/layui.js"></script>
	
	<script type="text/javascript">
		function check(){
			var oldPassword = $("#oldPassword").val(); 
			var newPassword = $("#newPassword").val(); 
			var reNewPassword = $("#reNewPassword").val(); 
			var password = $("#password").val();
			if(oldPassword != password){
				alert("输入旧密码有误！");
				return false;
			} else if(newPassword != reNewPassword){
				alert("两次密码输入不一致！");
				return false;
			}else{
				return true;
			}
		}
	</script>
  </head>
  
  <body>

  <aside class="sidebar">
    <div class="avatar">
        <img src="${pageContext.request.contextPath }/${user.img}" title="个人头像"/>
    </div>
    <nav class="nav">
        <a href=""  data-toggle="modal" data-target="#ziliao">修改个人资料</a>
        <a href="#works"  data-toggle="modal" data-target="#touxiang">更换个人头像</a>
        <a href="#skills"  data-toggle="modal" data-target="#mima">修改密码</a>
        <a href="UserServlet?method=tuichu">退出</a>
        <a href="index.jsp">返回首页</a>
    </nav>
</aside>
<main>
    <section id="info">
        <div class="wrap">
            <h2 class="title">个人资料</h2>
            <div class="row">
                <div class="col-l-4">
                    <p>昵称：${user.name }</p>
                    <p>性别：${user.gender }</p>
                    <p>生日：${user.birthday }</p>
                    <p>电话：${user.phone }</p>
                    <p>住址：${user.address }</p>
                </div>
               
                <div class="col-l-4">
                    ${user.info }
                </div>
            </div>
        </div>
    </section>
    <section id="skills">
        <div class="wrap">
            <h2 class="title">掌握的技能</h2>
            <div class="row scrollable">
                <div class="col-s-6 col-m-4 center-fixed">
                    <div class="skills-icon">
                        <i class="fa fa-html5"></i>
                    </div>
                    <div class="skills-title">
                        <h3>HTML 5</h3>
                        <p>熟悉 HTML5 网站的架构和开发</p>
                    </div>
                </div>
                <div class="col-s-6 col-m-4 center-fixed">
                    <div class="skills-icon">
                        <i class="fa fa-css3"></i>
                    </div>
                    <div class="skills-title">
                        <h3>CSS3</h3>
                        <p>熟悉使用 CSS3 写响应式网站、动画等</p>
                    </div>
                </div>
                <div class="col-s-6 col-m-4 center-fixed">
                    <div class="skills-icon">
                        <i class="fa fa-code"></i>
                    </div>
                    <div class="skills-title">
                        <h3>JavaScript</h3>
                        <p>能使用 JS 制作简单的程序、交互与特效</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- 修改个人资料 -->
<form class="form-horizontal" action="UserServlet?method=ziliao" method="post">
<div class="modal fade" id="ziliao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改个人资料
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="id" name="id" value="${user.id }" />
				
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">昵称</label>
					<div class="col-sm-10">
						<input value="${user.name }" type="text" class="form-control" id="name" name="name" placeholder="请输入昵称">
					</div>
				</div>
				
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">简介</label>
					<div class="col-sm-10">
						<input value="${user.info }"  type="text" class="form-control" id="info"   name="info" placeholder="请输入简介">
					</div>
				</div>
			
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
						<c:if test="${user.gender == '男' }">
						<label class="radio-inline">
							<input type="radio" name="gender" value="男" checked> 男
						</label>
						<label class="radio-inline">
							<input type="radio" name="gender" value="女" > 女
						</label>
						</c:if>
						<c:if test="${user.gender == '女' }">
						<label class="radio-inline">
							<input type="radio" name="gender" value="男" > 男
						</label>
						<label class="radio-inline">
							<input type="radio" name="gender" value="女" checked> 女
						</label>
						</c:if>
					</div>
				</div>
				
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">生日</label>
					<div class="col-sm-10">
						<input value="${user.birthday }"  type="text" name="birthday"  class="layui-input" placeholder="请选择生日" id="birthday">
					</div>
				</div>
				
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">地址</label>
					<div class="col-sm-10">
						<input value="${user.address }"  type="text" name="address" class="form-control" placeholder="请输入地址">
					</div>
				</div>
				
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">电话</label>
					<div class="col-sm-10">
						<input value="${user.phone }"  type="text" name="phone" class="form-control" placeholder="请输入电话">
					</div>
				</div>
				
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</form>


<!-- 更换个人头像 -->
<form action="UserServlet?method=userImg" method="post" enctype="multipart/form-data">
<div class="modal fade" id="touxiang" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					更换个人头像
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="id" name="id" value="${user.id }" />
				<input type="file" id="img" name="img" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</form>
<!-- 修改密码-->
<form  class="form-horizontal" action="UserServlet?method=userPassword" method="post" onsubmit="return check();" >
<div class="modal fade" id="mima" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="password" name="password" value="${user.password }" />
				<input type="hidden" id="id" name="id" value="${user.id }" />
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">旧密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="请输入旧密码">
					</div>
				</div>
				
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="请输入新密码">
					</div>
				</div>
				
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="reNewPassword" name="reNewPassword" placeholder="请输入新密码">
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</form>

<script src="layui/layui.js"></script>
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  laydate.render({
    elem: '#birthday' //指定元素
  });
});
</script>
<script src="static/kico.js"></script>
<script src="static/moreduo.js"></script>

  </body>
</html>
