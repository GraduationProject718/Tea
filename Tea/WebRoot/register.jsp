<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/pcreset.css" />
	<link rel="stylesheet" type="text/css" href="css/pcless.css" />
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script src="js/img_ver.js"></script>
	
	
<style>
	.bgimg{
		width:100%;
		background-image: url("img/13.png");
       	height:800px;
	}
    .bxs-row {
        margin-bottom:12px;
    }
    .logo-box {
        width:404px;
        border:1px solid #e5e5e5;
        border-radius:4px;
        box-shadow:0 4px 18px rgba(0,0,0,0.2);
        position:relative;
        overflow:hidden;
        height:800px;
    }
    .login {
        position:absolute;
        width:320px;left:0;
        top:0;
        padding: 42px 42px 36px;
        transition:all 0.8s;
    }
    .username,.password,.btn {
        height: 44px;
        width: 100%;
        padding: 0 10px;
        border: 1px solid #9da3a6;
        background: #fff;
        text-overflow: ellipsis;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        -khtml-border-radius: 4px;
        border-radius: 4px;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none;
        color: #000;
        font-size: 1em;
        font-family: Helvetica,Arial,sans-serif;
        font-weight: 400;
        direction: ltr;
        font-size:13px;
    }
    .submit {
        background-color: #0070ba;
        color:#fff;
        border:1px solid #0070ba;
    }
    .submit:hover {
        background-color:#005ea6;
    }
    .verBox {
        position:absolute;
        width:100%;
        text-align:center;
        left:404px;
        top:0;
        opacity:0;
        transition:all 0.8s;
        padding-top:55px;
    }
    .err {
        margin:12px 0 0;
        line-height:12px;
        height:12px;
        font-size:12px;
        color:red;
    }
</style>
	
  </head>
  
  <body>
	<jsp:include page="header.jsp"></jsp:include>
	<center>
	<div class="bgimg">
	<div class="logo-box">
		<div class="login" >
			<div class="bxs-row" style="text-align:center;">
				<img id="logo" src="img/logo.jpg" style="width:72px;"><span class="tips" style="color:red;">忍住不哭来段口技</span>
			</div>
			<div class="bxs-row">
				<input type="text" class="username"  name="account" id="account" placeholder="账号" value="admin" />
				<p class=" err err-username"></p>
			</div>
	
			<div class="bxs-row">
				<input type="password" class="password" name="password1" id="password1" placeholder="密码" />
				<p class="err err-password"></p>
			</div>
	
			<div class="bxs-row">
				<input type="password" class="username" name="password2" id="password2" value="密码" />
			</div>	
			
			<div class="bxs-row">
				<input type="text" class="password" name="name" id="name" value="姓名" />
			</div>
			
			<div class="bxs-row">
				<input type="text" class="password" name="info" id="info" value="个人签名" />
			</div>
			
			<div class="bxs-row">
				<input type="text" class="username" name="gender" id="gender" value="性别" />
			</div>
			
			<div class="bxs-row">
				<input type="text" class="username" name="birthday" id="birthday" value="生日" />
			</div>
			
			<div class="bxs-row">
				<input type="text" class="username" name="address"  id="address" value="地址" />
			</div>
			
			<div class="bxs-row">
				<input type="text" class="username" name="phone" id="phone" value="电话" />
			</div>
			
			<div class="bxs-row">
				<input type="submit" class="submit btn" value="注册" />
			</div>
		</div>
		
		<div class="verBox">
			<div id="imgVer" style="display:inline-block;"></div>
		</div>
	</div>
	</div>
	</center>
	<script>
        imgVer({
            el:'$("#imgVer")',
            width:'260',
            height:'116',
            img:[
                'img/ver.png',
                'img/ver-1.png',
                'img/ver-2.png',
                'img/ver-3.png'
            ],
            success:function () {
            	alert("1");
                var account = $("#account").val();
                var password = $("#password1").val();
                var name = $("#name").val();
                var info = $("#info").val();
                var gender= $("#gender").val();
                var birthday= $("#birthday").val();
                var address = $("#address").val();
                var phone = $("#phone").val();
                location="${pageContext.request.contextPath}/UserServlet?method=register&account="+account+"&password="+password+"&name="+name+"&info="+info+"&gender="+gender+"&birthday="+birthday+"&address="+address+"&phone="+phone;
                
            },
            error:function () {
                //alert('错误什么都不执行')
            }
        });
        $(".submit").on('click',function () {
            if($("#account").val() == '') {
                $(".tips").html('老兄！！你用户名呢！？？？');
            } else if($(".password1").val() != $(".password2").val()) {
                $(".tips").html('两次密码有误！');
            } else {
                $(".login").css({
                    "left":"-404px",
                    "opacity":"0"
                });
                $(".verBox").css({
                    "left":"0",
                    "opacity":"1"
                })
            }
        })
	</script>
      
	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
