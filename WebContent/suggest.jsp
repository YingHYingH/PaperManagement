<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="bean.User"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username = (String) session.getAttribute("username");
	User user = new UserDao().getUserByUsername(username);
%>
<html>
<head>
<jsp:include page="headerreference.jsp"></jsp:include>
<title>PaperManagement suggest</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<div class="am-cf admin-main">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<form action="suggestServlet" class="am-form" method="post">
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-cf am-padding am-padding-bottom-0">
						<div class="am-fl am-cf">
							<strong class="am-text-primary am-text-lg">推荐</strong> / <small>Suggest</small>
						</div>
					</div>
					<hr>
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
							<div class="am-btn-toolbar">
								<button type="submit" value="提交" class="am-btn am-btn-default">提交</button>
							</div>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-3">
						<div class="am-input-group am-input-group-sm"></div>
					</div>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12">

						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th></th>
									<th class="table-id">ID</th>
									<th class="table-title">标题</th>
									<th class="table-author am-hide-sm-only">作者</th>
									<th class="table-DOI">DOI</th>
									<th class="table-type1">类别1</th>
									<th class="table-type2">类别2</th>
									<th class="table-type3">类别3</th>
									<th class="table-date am-hide-sm-only">上传日期</th>
								</tr>
							</thead>
							<%
								Class.forName("com.mysql.jdbc.Driver");//加载驱动  
								Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
										"0000");//建立连接  
								//Statement stmt = conn.createStatement();//创建执行者  
								String sql = "select * from paper where user_id=?";
								PreparedStatement pstmt = conn.prepareStatement(sql);

								pstmt.setInt(1, user.getId());
								ResultSet rs = pstmt.executeQuery();//返回结果集（游标）
							%>
							<tbody>
								<%
									int i = 0;
									while (rs.next()) {
										++i;
								%>
								<tr>
									<td><input type="radio" value='<%=rs.getInt(1)%>'
										name="radioPaper_id" /></td>
									<td width="5% " style="word-break: break-all;"><%=rs.getInt(1)%></td>
									<td width="15% " style="word-break: break-all;"><a
										href="#"><%=rs.getString(2)%></a></td>
									<td width="15% " style="word-break: break-all;"><%=rs.getString(3)%></td>
									<td width="15% " style="word-break: break-all;"><%=rs.getString(4)%></td>
									<td width="10% " style="word-break: break-all;"
										class="am-hide-sm-only"><%=rs.getString(5)%></td>
									<td width="10% " style="word-break: break-all;"
										class="am-hide-sm-only"><%=rs.getString(6)%></td>
									<td width="10% " style="word-break: break-all;"
										class="am-hide-sm-only"><%=rs.getString(7)%></td>
									<td class="am-hide-sm-only"><%=rs.getString(10)%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
						<input type="hidden" name="user_id" value="<%=user.getId()%>">
					</div>
				</div>
			</div>
		</form>

		<footer class="admin-content-footer">
		<hr>
		<p class="am-padding-left">Copyright © 2018 YingHYingH. All rights
			reserved.</p>
		</footer>
	</div>
	<!-- content end -->

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