<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="css/pcreset.css" />
<link rel="stylesheet" type="text/css" href="css/pcless.css" />

  <footer class="footer">
	<table class="max" border="0" cellspacing="" cellpadding="">
		<tr>
			<td class="td1">
				<table border="0" cellspacing="" cellpadding="">
					<tr>
						<td><img src="img/icon/footer.png" /></td>
						<td>
							<span class="liuyan">在线留言</span> online message
						</td>
					</tr>
				</table>
				<form action="servlet/MessageServlet?flag=addMessage" method="post">
					<p><input type="text"  placeholder="您的姓名..." /></p>
					<p><input type="tel"  placeholder="您的电话..." /></p>
					<p><input type="email"  placeholder="您的邮箱..." /></p>
					<div class="bot clearfix">
						<textarea name="content" rows="" cols=""></textarea>
						<input type="submit" class="btn" value="提交" formnovalidate="formnovalidate" />
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