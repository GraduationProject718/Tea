<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="css/pcreset.css" />
<link rel="stylesheet" type="text/css" href="css/pcless.css" />
<script type="text/javascript">
function check(){
	var id=$("#id").val();
	if(id=="" || id==null){
		alert("请登录后再留言！");
		location="login.jsp";
		return false;
	}
	return true;
	
}
</script>
  <footer class="footer">
	<table class="max" border="0" cellspacing="" cellpadding="">
		<tr>
			<td class="td1">
				<table border="0" cellspacing="" cellpadding="">
					<tr>
						<td><img src="img/icon/footer.png" /></td>
						<td>
							<span class="liuyan"><a href="LiuYanServlet?method=findAllByIndex&num=1">在线留言</a></span> online message
						</td>
					</tr>
				</table>
				<form action="LiuYanServlet?method=add" method="post" onclick="return check();" >
					<div class="bot clearfix">
						<textarea name="content" rows="" cols=""></textarea>
						<input type="submit" class="btn" value="提交" formnovalidate="formnovalidate" />
						<input type="hidden" name="id" id="id" value="${user.id }" /> 
					</div>
				</form>
			</td>
			<td class="td2">
				<table class="table1" border="0" cellspacing="" cellpadding="">
					<tr>
						<td class="logo"><img src="img/icon/footer-logo.png" /></td>
						<td>
							<div class="top">
								<h3>站主个人资料</h3>
							</div>
							<div class="txt">
								住址：湖南省XXXXXXXXXXXX<br /> QQ号码：358392229<br /> 电子邮箱：358392229@qq.com
								<br />
							</div>
							<table border="0" cellspacing="" cellpadding="">
								<tr>
									<td><img src="img/icon/footer-tel.png" /></td>
									<td>
										<div class="tel">
											咨询电话：
											<span>18888888888</span>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td class="td3">
				<img  src="img/icon/QQ.png" /><br /> 杨涛QQ二维码
			</td>
		</tr>
		<tr>
			<td colspan="3" class="copyright">
				@2019  版权所有：计本1501杨涛 学号：201508110046  
			</td>
		</tr>
	</table>
</footer>