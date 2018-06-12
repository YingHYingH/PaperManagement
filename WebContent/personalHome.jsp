<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="bean.User"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="dbhelper.DbHelper"%>
<%@ page import="dbhelper.QueryRunner"%>
<%
	String username = (String) session.getAttribute("username");
	User user = new UserDao().getUserByUsername(username);
%>

<html>
<head>
<jsp:include page="headerreference.jsp"></jsp:include>
<title>PaperManagement library allDocuments</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
	String authorUsername = request.getParameter("authorUsername");
	String allFollowUser = new UserDao().getUserById(user.getId()).getFollowed();
	int isFollow = allFollowUser.indexOf(authorUsername);
	int visited = new UserDao().getUserByUsername(authorUsername).getVisited();
	visited++;
	String sql1 = "update user set visited=? where username=?";
	Class.forName("com.mysql.jdbc.Driver");//加载驱动  
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
			"0000");//建立连接  
	PreparedStatement pstmt1 = con.prepareStatement(sql1);
	Object[] params = { visited,authorUsername };
	QueryRunner query = new QueryRunner();
	query.update(con, sql1, params);
	%>
	<div class="am-cf admin-main">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg"><%=authorUsername %>的主页</strong> / <small><%=authorUsername %>'s Home Page</small>
					</div>
					<input type=hidden id="authorUsername" value="<%=authorUsername %>"></input>
					<input type=hidden id="user_id" value="<%=user.getId() %>"></input>
					<div class="am-g">
					<div class="am-u-sm-12 am-u-md-9">
						<div class="am-btn-toolbar">
							<div class="am-btn-group am-btn-group-xs">
								<%
									if(isFollow<0){
								%>
								<button type="button" class="am-btn am-btn-default"
									value="uploadindex" onclick=javascript:follow(1)>
									<span class="am-icon-plus"></span> Follow
							    </button>
							    <%
									}
							    %>
							    
							    <%
									if(isFollow>=0){
								%>
								<button type="button" class="am-btn am-btn-default"
									value="uploadindex" onclick=javascript:follow(0)>
									<span class="am-icon-minus"></span> Unfollow
							    </button>
							    <%
									}
							    %>
							</div>
						</div>
					</div>
					</div>		
				</div>

				<hr>

				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-9">
						<div class="am-btn-toolbar">

							<div class="am-btn-group am-btn-group-xs">


								<script type="text/javascript">
									function follow(flag){
										var authorUsername = $("#authorUsername").val();
						        		var user_id = document.getElementById("user_id").value;
						        		//新建页面请求对象
										var req = new XMLHttpRequest();
										//设置传送方式，对应的servlet或action路径，是否异步处理
								        req.open("POST", "FollowUserServlet", true);
								        //如果设置数据传送方式为post，则必须设置请求头信息
								        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
										var value ="user_id=" +user_id + "&authorUsername=" + authorUsername +"&flag="+flag;
										req.send(value);
										location.reload(); 
									}
									function addToMyPage(paperId,userId){
										//新建页面请求对象
										var req = new XMLHttpRequest();
										//设置传送方式，对应的servlet或action路径，是否异步处理
								        req.open("POST", "AddToMyPageServlet", true);
								        //如果设置数据传送方式为post，则必须设置请求头信息
								        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
										var value = "paperId=" + paperId+"&userId="+userId+"&authorUsername="+authorUsername;
										req.send(value);
										location.reload();
									}
								</script>




								<!-- <button type="button" class="am-btn am-btn-default"
									value="uploadindex" onclick=javascript:jump()>
									<span class="am-icon-plus"></span> 新增
								</button> -->
								<!-- <button type="button" class="am-btn am-btn-default">
								<span class="am-icon-save"></span> 保存
							</button>
							<button type="button" class="am-btn am-btn-default">
								<span class="am-icon-archive"></span> 审核
							</button> -->
								<!-- 	<button type="button" class="am-btn am-btn-default">
									<span class="am-icon-trash-o"></span> 删除
								</button> -->
							</div>
						</div>
					</div>



					<%-- <form action="searchServlet" class="fh5co-form animate-box"
						data-animate-effect="fadeIn" method="post">
						<input type="hidden" name="user_id" value="<%=user.getId()%>">
						<div class="am-u-sm-12 am-u-md-3">
							<div class="am-input-group am-input-group-sm">
								<input type="text" class="am-form-field" id="searchKeyword"
									name="searchKeyword"> <span class="am-input-group-btn">
									<button class="am-btn am-btn-default" type="submit">搜索</button>
								</span>
							</div>
						</div>
					</form> --%>
				</div>


				<div class="am-g">
					<div class="am-u-sm-12">
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" /></th>
										<th class="table-id">ID</th>
										<th class="table-title">标题</th>
										<th class="table-author am-hide-sm-only">作者</th>
										<th class="table-DOI">DOI</th>
										<th class="table-type1">类别1</th>
										<th class="table-type2">类别2</th>
										<th class="table-type3">类别3</th>
										<th class="table-date am-hide-sm-only">上传日期</th>
										<th class="table-set">操作</th>
									</tr>
								</thead>
								<%
									Integer authorUserId = new UserDao().getUserByUsername(authorUsername).getId();
									Class.forName("com.mysql.jdbc.Driver");//加载驱动  
									Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
											"0000");//建立连接  
									//Statement stmt = conn.createStatement();//创建执行者  
									String sql = "select * from paper where user_id=?";
									PreparedStatement pstmt = conn.prepareStatement(sql);

									pstmt.setInt(1, authorUserId);
									ResultSet rs = pstmt.executeQuery();//返回结果集（游标）
								%>
								<%
								sql = "select * from paper where user_id=?";
								pstmt = conn.prepareStatement(sql);
								pstmt.setInt(1, user.getId());
								ResultSet rs1 = pstmt.executeQuery();//返回结果集（游标）
								String allUrl = "";
								while(rs1.next()){
									if (rs1.getInt(13) != 2) {
										allUrl += rs1.getString(11);
									}
								}
								%>
								<tbody>
									<%
										int i = 0;
										while (rs.next()) {
											if (rs.getInt(13) == 2) {
												continue;
											}
											++i;
									%>
									<tr>
										<td><input type="checkbox" /></td>
										<td width="5% " style="word-break: break-all;"><%=rs.getInt(1)%></td>
										<td width="10% " style="word-break: break-all;"><a
											href="paperInfo.jsp?id=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a></td>
										<td width="10% " style="word-break: break-all;"><%=rs.getString(3)%></td>
										<td width="10% " style="word-break: break-all;"><%=rs.getString(4)%></td>
										<td width="8% " style="word-break: break-all;"
											class="am-hide-sm-only"><%=rs.getString(5)%></td>
										<td width="8% " style="word-break: break-all;"
											class="am-hide-sm-only"><%=rs.getString(6)%></td>
										<td width="8% " style="word-break: break-all;"
											class="am-hide-sm-only"><%=rs.getString(7)%></td>
										<td width="14% " style="word-break: break-all;"
											class="am-hide-sm-only"><%=rs.getString(10)%></td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
												<%-- 	<%
														if (rs.getInt(13) == 0) {
													%>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-secondary">
														<span class="am-icon-star-o"></span><a
															href="FavoritesServlet?id=<%=rs.getInt(1)%>"> 收藏 
													</button>
													<%
														}
													%>
													<%
														if (rs.getInt(13) == 1) {
													%>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-secondary">
														<span class="am-icon-star"></span><a
															href="disFavoritesServlet?id=<%=rs.getInt(1)%>"> 取消收藏

														
													</button>
													<%
														}
													%> --%>
													<button
														class="am-btn am-btn-default am-btn-xs am-hide-sm-only">
														<span class="am-icon-download"></span> <a
															href="DownLoadServlet?url=<%=rs.getString(11)%>&id=<%=rs.getInt(1)%>">下载</a>
													</button>
													<%
													String hereUrl = rs.getString(11);
													int index = hereUrl.indexOf(".pdf");
													hereUrl = hereUrl.substring(0, index+4);
													if(!allUrl.contains(hereUrl)){
													%>
													<button
														onclick=javascript:addToMyPage(<%=rs.getInt(1)%>,<%=user.getId()%>)
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
														<span class="am-icon-plus"></span>Add to My Page 
													</button>
													<%
													}
													%>
												<%-- 	<%
														if (rs.getInt(17) == 0) {
													%>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
														onclick=javascript:markRead(<%=rs.getInt(1)%>) id=<%=rs.getInt(1)%> value=<%=rs.getInt(17)%>>
														<span class="am-icon-circle"></span>未读
													</button>
													<%
														}
													%>
													<%
														if (rs.getInt(17) == 1) {
													%>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
														onclick=javascript:markRead(<%=rs.getInt(1)%>) id=<%=rs.getInt(1)%> value=<%=rs.getInt(17)%>>
														<span class="am-icon-circle-o"></span>已读
													</button>
													<%
														}
													%> --%>





												</div>
											</div>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>

							<div class="am-cf">
								共<%=i%>条记录
							</div>
							<hr />
					</div>

				</div>
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