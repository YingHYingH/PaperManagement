<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.User"%>
<%@ page import="java.*"%>
<%@ page import="bean.Paper"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="com.ssdut.dao.PaperDao"%>
<%
	String username = (String) session.getAttribute("username");
	User user = new UserDao().getUserByUsername(username);
%>
<html>
<head>
<jsp:include page="headerreference.jsp"></jsp:include>
<title>PaperManagement library</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<div class="am-cf admin-main">
		<input type="hidden" name="user_id" value="<%=user.getId()%>">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">库</strong> / <small>Library</small>
					</div>
				</div>

				<hr>

				<div class="am-tabs am-margin" data-am-tabs>
					<ul class="am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active"><a href="#tab1">论文上传</a></li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade am-in am-active" id="tab1">


							<div>
								<form method="post" action="UploadFavoritesServlet"
									data-animate-effect="fadeIn" enctype="multipart/form-data">
									<table align="center" width="400" height="50">
										<tr>
											<td><input type="file" name="file1" size="40"
												class="file"></td>
											<td><input type="submit" value="开始上传" class="submit"></td>
										</tr>
									</table>
								</form>


							</div>
						</div>

					</div>
				</div>

				<!-- <div class="am-margin">
					<button type="button" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
					<button type="button" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
				</div> -->
			</div>

			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">Copyright © 2018 YingHYingH. All
					rights reserved.</p>
			</footer>
		</div>
		<!-- content end -->

	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

	<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="js/jquery.min.js"></script>
	<!--<![endif]-->
	<script src="js/amazeui.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>