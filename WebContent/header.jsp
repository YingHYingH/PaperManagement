<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="bean.User"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<header class="am-topbar am-topbar-inverse admin-header">
	<div class="am-topbar-brand">
		<strong>PM</strong> <small>学术论文管理系统</small>
	</div>

	<button
		class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
		data-am-collapse="{target: '#topbar-collapse'}">
		<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
	</button>

	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

		<ul
			class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
			<%
			String username = (String) session.getAttribute("username");
			User user = new UserDao().getUserByUsername(username);
			Class.forName("com.mysql.jdbc.Driver");//加载驱动  
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
					"0000");//建立连接  
			//Statement stmt = conn.createStatement();//创建执行者  
			String sql = "select * from message where receive_username=? and state=0";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();//返回结果集（游标）
			int i = 0;
			while(rs.next()){
				i++;
			}
			%>
			<li><a href="home.jsp"><span class="am-icon-envelope-o"></span>
					我的消息 <%if(i>0){ %><span class="am-badge am-badge-warning"><%=i %></span><%} %></a></li>
			<li class="am-dropdown" data-am-dropdown><a
				class="am-dropdown-toggle" data-am-dropdown-toggle
				href="javascript:;"> <span class="am-icon-cogs"></span> 操作 <span
					class="am-icon-caret-down"></span>
			</a>
				<ul class="am-dropdown-content">
					<li><a href="personalInfo.jsp"><span class="am-icon-user"></span>
							个人资料</a></li>
					<!-- <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li> -->
					<li><a href="login.jsp"><span class="am-icon-sign-out"></span> 注销</a></li>
				</ul></li>
			<li class="am-hide-sm-only"><a href="javascript:;"
				id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span
					class="admin-fullText">开启全屏</span></a></li>
		</ul>
	</div>
	</header>