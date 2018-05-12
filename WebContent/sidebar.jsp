<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.User"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%
	String username = (String) session.getAttribute("username");
	User user = new UserDao().getUserByUsername(username);
%>
<!-- sidebar start -->
<input  type="hidden"  id="userId" value="<%=user.getId()%>"></input>
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
	<div class="am-offcanvas-bar admin-offcanvas-bar">
		<ul class="am-list admin-sidebar-list">
			<li><a href="home.jsp"><span class="am-icon-home"></span> 首页</a></li>
			<li class="admin-parent"><a class="am-cf"
				data-am-collapse="{target: '#collapse-nav'}"><span
					class="am-icon-file"></span> 页面模块 <span
					class="am-icon-angle-right am-fr am-margin-right"></span></a>
				<ul class="am-list am-collapse admin-sidebar-sub am-in"
					id="collapse-nav">
					<li><a href="personalInfo.jsp" class="am-cf"><span
							class="am-icon-check"></span> 个人资料</a></li>
					<li><a href="help.jsp"><span class="am-icon-puzzle-piece"></span>
							帮助页</a></li>
					<!-- <li><a href="admin-gallery.html"><span class="am-icon-th"></span>
							相册页面<span
							class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
					<li><a href="admin-log.html"><span
							class="am-icon-calendar"></span> 系统日志</a></li>
					<li><a href="admin-404.html"><span class="am-icon-bug"></span>
							404</a></li> -->
				</ul></li>




			<li class="admin-parent"><a class="am-cf"
				data-am-collapse="{target: '#collapse-nav1'}"><span
					class="am-icon-file"></span> Library（库） <span
					class="am-icon-angle-right am-fr am-margin-right"></span></a>
				<ul class="am-list am-collapse admin-sidebar-sub am-in"
					id="collapse-nav1">
					<li><a href="allDocuments.jsp" class="am-cf"><span
							class="am-icon-file-text"></span> All Documents</a></li>
					<li><a href="favorites.jsp"><span class="am-icon-star"></span>
							Favorites</a></li>
					<li><a href="recentlyAdded.jsp"><span class="am-icon-star"></span>
							recentlyAdded</a></li>
				</ul></li>
								<%
									Class.forName("com.mysql.jdbc.Driver");//加载驱动  
									Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
											"0000");//建立连接  
									//Statement stmt = conn.createStatement();//创建执行者  
									String sql = "select * from folder where user_id=?";
									PreparedStatement pstmt = conn.prepareStatement(sql);

									pstmt.setInt(1, user.getId());
									ResultSet rs = pstmt.executeQuery();//返回结果集（游标）
								%>
				<li class="admin-parent"><a class="am-cf"
				data-am-collapse="{target: '#addFolder'}" title="新增文件夹"><span
					class="am-icon-file"></span> Folder <span
					class="am-icon-angle-right am-fr am-margin-right"></span></a>
				<ul class="am-list am-collapse admin-sidebar-sub am-in"
					id="addFolder">
					<%
					    while (rs.next()) {
					%>
					<li><a href="myFolders.jsp?folderId=<%=rs.getInt(1)%>" class="am-cf"><span
							class="am-icon-file-text"></span><%=rs.getString(2)%></a></li>
					<%
						}
					%>
					<li><a onclick=javascript:addFolder() class="am-cf" title="点此新建文件夹"><span
							class="am-icon-pencil-square-o"></span>new</a></li>
				</ul></li>
				
				<li class="admin-parent"><a class="am-cf"
				data-am-collapse="{target: '#collapse-nav2'}"><span
					class="am-icon-file"></span> Community <span
					class="am-icon-angle-right am-fr am-margin-right"></span></a>
				<ul class="am-list am-collapse admin-sidebar-sub am-in"
					id="collapse-nav2">
					<li><a href="forumHome.jsp" class="am-cf"><span
							class="am-icon-calendar"></span> Forum</a></li>
				</ul></li>
				
								<script type="text/javascript"> 
							    function addFolder() {  
							        var name = prompt("请输入文件夹名", "");  
							        if (name)//如果返回的有内容  
							        {  
							        	//新建页面请求对象
										var req = new XMLHttpRequest();
										//设置传送方式，对应的servlet或action路径，是否异步处理
								        req.open("POST", "AddFolderServlet", true);
								        //如果设置数据传送方式为post，则必须设置请求头信息
								        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
								        var userId = document.getElementById("userId").value;
										var value = "name=" + name +"&userId=" +userId;
										req.send(value); 
										setTimeout("location.reload()",50);
							        }  
							  
							    }
								</script>

			<!-- <li><a href="library.jsp"><span class="am-icon-table"></span>
					Library（库）</a></li> -->
			<li><a href="suggest.jsp"><span
					class="am-icon-pencil-square-o"></span> Suggest（推荐）</a></li>
			<li><a href="exit.jsp"><span class="am-icon-sign-out"></span>
					注销</a></li>
		</ul>

		<div class="am-panel am-panel-default admin-sidebar-panel">
			<div class="am-panel-bd">
				<p>
					<span class="am-icon-bookmark"></span> 公告
				</p>
				<p>时光静好，与君语；细水流年，与君同。—— Amaze UI</p>
			</div>
		</div>

		<div class="am-panel am-panel-default admin-sidebar-panel">
			<div class="am-panel-bd">
				<p>
					<span class="am-icon-tag"></span> wiki
				</p>
				<p>Welcome to the Amaze UI wiki!</p>
			</div>
		</div>
	</div>
</div>
<!-- sidebar end -->