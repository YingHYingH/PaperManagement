<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.User"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="com.ssdut.dao.PaperDao"%>
<%@ page import="bean.Paper"%>
<%
	String username = (String) session.getAttribute("username");
	User user = new UserDao().getUserByUsername(username);
	String url = (String) session.getAttribute("url");
	System.out.println(url);
	PaperDao dao = new PaperDao();
	Paper paper = dao.getPaperByurl(url);
	int user_id = user.getId();
	int paper_id = paper.getId();
%>
<html>
<head>
<jsp:include page="headerreference.jsp"></jsp:include>
<title>PaperManagement library</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="am-cf admin-main">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<form action="addPaperFavoritesServlet" data-animate-effect="fadeIn"
			class="am-form" method="post">
			<input type="hidden" name="user_id" value="<%=user.getId()%>">
			<input type="hidden" name="username" value="<%=user.getUsername()%>">
			<input type="hidden" name="paper_id" value="<%=paper.getId()%>">
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
							<li class="am-active"><a href="#tab1">基本信息</a></li>
						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<form class="am-form">
									<div class="am-g am-margin-top">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">文章标题</div>
										<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
											<input type="text" class="am-input-sm" id="title"
												name="title" placeholder="请输入论文标题"
												value="<%=paper.getTitle()%>">
										</div>
									</div>

									<div class="am-g am-margin-top">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">文章作者</div>
										<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
											<input type="text" class="am-input-sm" id="author"
												name="author">
										</div>
									</div>

									<div class="am-g am-margin-top">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">DOI</div>
										<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
											<input type="text" class="am-input-sm" id="DOI" name="DOI"
												value="<%=paper.getDOI()%>">
										</div>
									</div>

									<div class="am-g am-margin-top">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">所属类别</div>
										<div class="am-u-sm-4 am-u-md-2 am-u-end col-end">
											<input type="text" class="am-input-sm" id="classification1"
												name="classification1">
										</div>
										<div class="am-u-sm-4 am-u-md-2 am-u-end col-end">
											<input type="text" class="am-input-sm" id="classification2"
												name="classification2">
										</div>
										<div class="am-u-sm-4 am-u-md-2 am-u-end col-end">
											<input type="text" class="am-input-sm" id="classification3"
												name="classification3">
										</div>
									</div>
									<div class="am-g am-margin-top">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">内容摘要</div>
										<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
											<input type="text" class="am-input-sm" id="abs" name="abs"
												value="<%=paper.getAbs()%>">
										</div>
									</div>
									<div class="am-g am-margin-top">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">发布日期</div>
										<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
											<input type="text" class="am-input-sm" id="pubDate"
												name="pubDate" placeholder="xxxx/xx/xx">
										</div>
									</div>
								</form>


							</div>
						</div>
					</div>

					<div class="am-margin">
						<input type="submit" value="提交保存"
							class="am-btn am-btn-primary am-topbar-btn am-btn-sm">
					</div>
				</div>

				<footer class="admin-content-footer">
					<hr>
					<p class="am-padding-left">Copyright © 2018 YingHYingH. All
						rights reserved.</p>
				</footer>
			</div>
			<!-- content end -->
		</form>
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