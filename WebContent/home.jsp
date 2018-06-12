<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.User"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="java.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username = (String) session.getAttribute("username");
	User user = new UserDao().getUserByUsername(username);
	int comments=0;
	int likes=0;
%>
<html>
<head>
<jsp:include page="headerreference.jsp"></jsp:include>
<title>PaperManagement home</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<div class="am-cf admin-main">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">我的主页</strong> / <small>My Home Page</small>
					</div>
				</div>
				<%
				Class.forName("com.mysql.jdbc.Driver");//加载驱动  
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
						"0000");//建立连接  
				//Statement stmt = conn.createStatement();//创建执行者  
				String sql = "select * from comment,discuss where comment.discuss_id=discuss.discuss_id and discuss.user_id=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, user.getId());
				ResultSet rs = pstmt.executeQuery();//返回结果集（游标）
				while (rs.next()) {
					//if(rs.getInt(5)!=user.getId())
					++comments;
				}
				sql = "select * from likes,discuss where likes.discuss_id=discuss.discuss_id and discuss.user_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, user.getId());
				rs = pstmt.executeQuery();//返回结果集（游标）
				while (rs.next()) {
					++likes;
				}
				sql = "select * from user where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, user.getId());
				rs = pstmt.executeQuery();//返回结果集（游标）
				String following ="";
				while (rs.next()) {
					following=rs.getString(10);
				}
				int followingUserNum =0;
				if(!following.equals("")){
					String followingUser[] = following.split(",");
					followingUserNum = followingUser.length;
				}
				%>

				<ul
					class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
					<li><a href="#" class="am-text-success"><span
							class="am-icon-btn am-icon-file-text"></span><br />我的评论<br /><%=comments %></a></li>
					<li><a href="#" class="am-text-warning"><span
							class="am-icon-btn am-icon-briefcase"></span><br />我的点赞<br /><%=likes %></a></li>
					<li><a href="#" class="am-text-danger"><span
							class="am-icon-btn am-icon-recycle"></span><br />我的访客<br /><%=user.getVisited()%></a></li>
					<li><a href="#" class="am-text-secondary"><span
							class="am-icon-btn am-icon-user-md"></span><br />我的粉丝<br /><%=followingUserNum %></a></li>
				</ul>

				<!-- <div class="am-g">
					<div class="am-u-sm-12">
						<table
							class="am-table am-table-bd am-table-striped admin-content-table">
							<thead>
								<tr>
									<th>ID</th>
									<th>用户名</th>
									<th>最后成交任务</th>
									<th>成交订单</th>
									<th>管理</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>John Clark</td>
									<td><a href="#">Business management</a></td>
									<td><span class="am-badge am-badge-success">+20</span></td>
									<td>
										<div class="am-dropdown" data-am-dropdown>
											<button
												class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
												data-am-dropdown-toggle>
												<span class="am-icon-cog"></span> <span
													class="am-icon-caret-down"></span>
											</button>
											<ul class="am-dropdown-content">
												<li><a href="#">1. 编辑</a></li>
												<li><a href="#">2. 下载</a></li>
												<li><a href="#">3. 删除</a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>风清扬</td>
									<td><a href="#">公司LOGO设计</a></td>
									<td><span class="am-badge am-badge-danger">+2</span></td>
									<td>
										<div class="am-dropdown" data-am-dropdown>
											<button
												class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
												data-am-dropdown-toggle>
												<span class="am-icon-cog"></span> <span
													class="am-icon-caret-down"></span>
											</button>
											<ul class="am-dropdown-content">
												<li><a href="#">1. 编辑</a></li>
												<li><a href="#">2. 下载</a></li>
												<li><a href="#">3. 删除</a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>詹姆斯</td>
									<td><a href="#">开发一款业务数据软件</a></td>
									<td><span class="am-badge am-badge-warning">+10</span></td>
									<td>
										<div class="am-dropdown" data-am-dropdown>
											<button
												class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
												data-am-dropdown-toggle>
												<span class="am-icon-cog"></span> <span
													class="am-icon-caret-down"></span>
											</button>
											<ul class="am-dropdown-content">
												<li><a href="#">1. 编辑</a></li>
												<li><a href="#">2. 下载</a></li>
												<li><a href="#">3. 删除</a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td>云适配</td>
									<td><a href="#">适配所有网站</a></td>
									<td><span class="am-badge am-badge-secondary">+50</span></td>
									<td>
										<div class="am-dropdown" data-am-dropdown>
											<button
												class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
												data-am-dropdown-toggle>
												<span class="am-icon-cog"></span> <span
													class="am-icon-caret-down"></span>
											</button>
											<ul class="am-dropdown-content">
												<li><a href="#">1. 编辑</a></li>
												<li><a href="#">2. 下载</a></li>
												<li><a href="#">3. 删除</a></li>
											</ul>
										</div>
									</td>
								</tr>

								<tr>
									<td>5</td>
									<td>呵呵呵</td>
									<td><a href="#">基兰会获得BUFF</a></td>
									<td><span class="am-badge">+22</span></td>
									<td>
										<div class="am-dropdown" data-am-dropdown>
											<button
												class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
												data-am-dropdown-toggle>
												<span class="am-icon-cog"></span> <span
													class="am-icon-caret-down"></span>
											</button>
											<ul class="am-dropdown-content">
												<li><a href="#">1. 编辑</a></li>
												<li><a href="#">2. 下载</a></li>
												<li><a href="#">3. 删除</a></li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="am-g">
					<div class="am-u-md-6">
						<div class="am-panel am-panel-default">
							<div class="am-panel-hd am-cf"
								data-am-collapse="{target: '#collapse-panel-1'}">
								文件上传<span class="am-icon-chevron-down am-fr"></span>
							</div>
							<div class="am-panel-bd am-collapse am-in" id="collapse-panel-1">
								<ul class="am-list admin-content-file">
									<li><strong><span class="am-icon-upload"></span>
											Kong-cetian.Mp3</strong>
										<p>3.3 of 5MB - 5 mins - 1MB/Sec</p>
										<div
											class="am-progress am-progress-striped am-progress-sm am-active">
											<div class="am-progress-bar am-progress-bar-success"
												style="width: 82%">82%</div>
										</div></li>
									<li><strong><span class="am-icon-check"></span>
											好人-cetian.Mp3</strong>
										<p>3.3 of 5MB - 5 mins - 3MB/Sec</p></li>
									<li><strong><span class="am-icon-check"></span>
											其实都没有.Mp3</strong>
										<p>3.3 of 5MB - 5 mins - 3MB/Sec</p></li>
								</ul>
							</div>
						</div>
						<div class="am-panel am-panel-default">
							<div class="am-panel-hd am-cf"
								data-am-collapse="{target: '#collapse-panel-2'}">
								浏览器统计<span class="am-icon-chevron-down am-fr"></span>
							</div>
							<div id="collapse-panel-2" class="am-in">
								<table
									class="am-table am-table-bd am-table-bdrs am-table-striped am-table-hover">
									<tbody>
										<tr>
											<th class="am-text-center">#</th>
											<th>浏览器</th>
											<th>访问量</th>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="images/examples/admin-chrome.png" alt=""></td>
											<td>Google Chrome</td>
											<td>3,005</td>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="images/examples/admin-firefox.png" alt=""></td>
											<td>Mozilla Firefox</td>
											<td>2,505</td>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="images/examples/admin-ie.png" alt=""></td>
											<td>Internet Explorer</td>
											<td>1,405</td>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="images/examples/admin-opera.png" alt=""></td>
											<td>Opera</td>
											<td>4,005</td>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="images/examples/admin-safari.png" alt=""></td>
											<td>Safari</td>
											<td>505</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="am-u-md-6">
						<div class="am-panel am-panel-default">
							<div class="am-panel-hd am-cf"
								data-am-collapse="{target: '#collapse-panel-4'}">
								任务 task<span class="am-icon-chevron-down am-fr"></span>
							</div>
							<div id="collapse-panel-4" class="am-panel-bd am-collapse am-in">
								<ul class="am-list admin-content-task">
									<li>
										<div class="admin-task-meta">Posted on 25/1/2120 by John
											Clark</div>
										<div class="admin-task-bd">The starting place for
											exploring business management; helping new managers get
											started and experienced managers get better.</div>
										<div class="am-cf">
											<div class="am-btn-toolbar am-fl">
												<div class="am-btn-group am-btn-group-xs">
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-check"></span>
													</button>
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-pencil"></span>
													</button>
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-times"></span>
													</button>
												</div>
											</div>
											<div class="am-fr">
												<button type="button"
													class="am-btn am-btn-default am-btn-xs">删除</button>
											</div>
										</div>
									</li>
									<li>
										<div class="admin-task-meta">Posted on 25/1/2120 by 呵呵呵</div>
										<div class="admin-task-bd">
											基兰和狗熊出现在不同阵营时。基兰会获得BUFF，“装甲熊憎恨者”。狗熊会获得BUFF，“时光老人憎恨者”。</div>
										<div class="am-cf">
											<div class="am-btn-toolbar am-fl">
												<div class="am-btn-group am-btn-group-xs">
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-check"></span>
													</button>
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-pencil"></span>
													</button>
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-times"></span>
													</button>
												</div>
											</div>
											<div class="am-fr">
												<button type="button"
													class="am-btn am-btn-default am-btn-xs">删除</button>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div> -->

						<div class="am-panel am-panel-default">
							<div class="am-panel-hd am-cf"
								data-am-collapse="{target: '#collapse-panel-3'}">
								我的消息<span class="am-icon-chevron-down am-fr"></span>
							</div>
							<div class="am-panel-bd am-collapse am-in am-cf"
								id="collapse-panel-3">
								<ul class="am-comments-list admin-content-comment">
								<%
									int MaxNum = 3;//每页容纳的消息的最大数目
									int count = 0, firstPage = 1, lastPage, firstNum, lastNum, prePage, nextPage, pageNO;
									//firstPage表示首页，lastPage表示末页，pageNO表示第几页，
									//firstNum表示该页的起始消息的ID，lastNum表示该页的末消息的ID，
									//prePage表示前一页，nextPage表示后一页
									if (request.getParameter("pageNO") == null)
										pageNO = 0;
									else
										pageNO = Integer.parseInt(request.getParameter("pageNO"));
									Class.forName("com.mysql.jdbc.Driver");//加载驱动  
									conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
											"0000");//建立连接  
									sql = "select * from message,discuss where message.receive_username=? and message.related=discuss.discuss_id order by message.state asc,message.message_time desc";
									pstmt = conn.prepareStatement(sql);
									pstmt.setString(1, user.getUsername());
									rs = pstmt.executeQuery();//返回结果集（游标）
									while (rs.next())
										count++;
									lastPage = (int) Math.ceil((double) count / MaxNum);
									if (pageNO <= 0)
										pageNO = 1;
									if (lastPage == 0)
										lastPage = 1;
									if (pageNO > lastPage)
										pageNO = lastPage;
									firstNum = (pageNO - 1) * MaxNum;
									lastNum = pageNO * MaxNum-1;
									if (pageNO == 1)
										prePage = 1;
									else
										prePage = pageNO - 1;
									if (pageNO == lastPage)
										nextPage = pageNO;
									else
										nextPage = pageNO + 1;
									sql = "select * from message,discuss where message.receive_username=? and message.related=discuss.discuss_id order by message.state asc,message.message_time desc limit "+firstNum+","+MaxNum;
									pstmt = conn.prepareStatement(sql);
									pstmt.setString(1, user.getUsername());
									rs = pstmt.executeQuery();//返回结果集（游标）
									while (rs.next()) {
										//if(rs.getInt(5)!=user.getId())
									%>
										<li class="am-comment"><a href="#"><img
												src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96"
												alt="" class="am-comment-avatar" width="48" height="48"></a>
											<div class="am-comment-main">
												<header class="am-comment-hd">
												<div class="am-comment-meta">
												<%
													if(!username.equals(rs.getString(3))){
												%>
													<a href="personalHome.jsp?authorUsername=<%=rs.getString(3) %>" title="点击进入用户主页">
												<%
													}
												%>
												<%
													if(username.equals(rs.getString(3))){
												%>
													<a href="allDocuments.jsp" title="点击进入用户主页">
												<%
													}
												%>	
													<%=rs.getString(3) %></a> 评论您发表的
													<a href=# onclick=javascript:markIsRead(<%=rs.getInt(9) %>,<%=rs.getInt(1) %>) title="点击进入详情页面"><span style="color:blue"><%=rs.getString(10) %></span></a> 于
													<time><%=rs.getString(5).substring(0, rs.getString(5).length()-2)%></time>
													<%if(rs.getInt(6)==1){ %><span id="isRead<%=rs.getInt(1) %>">已读</span><%}%>
													<%if(rs.getInt(6)==0){ %><span id="isRead<%=rs.getInt(1) %>">未读</span><%}%>
												</div>
												</header>
												<div class="am-comment-bd">
													<a href=# onclick=javascript:markIsRead(<%=rs.getInt(9) %>,<%=rs.getInt(1) %>) title="点击进入详情页面"><p><%=rs.getString(7) %></p></a>
												</div>
											</div></li>
								<%
									}
								%>

								</ul>
								
								<form>
			<table  align="center" border=0>
				<tr>
					<td class="am-cf">
						共 <font color=red><%=count%></font> 条记录&nbsp
					</td>
					<td>
						目前页数
						<font color=red><%=pageNO%></font>
					</td>
					<td>
						总页数
						<font color=red><%=lastPage%></font>
					</td>
					<td>
						<a href=home.jsp?pageNO=1>【第一页】</a>
					</td>
					<td>
						<a href=home.jsp?pageNO=<%=prePage%>>【上一页】</a>
					</td>
					<td>
						<a href=home.jsp?pageNO=<%=nextPage%>>【下一页】</a>
					</td>
					<td>
						<a href=home.jsp?pageNO=<%=lastPage%>>【最后一页】</a>
					</td>
					<td>
						输入页次：
						<input type=text id=pageNum size=3 name=pageNO value=<%=pageNO %>>
					</td>
					<td>
						<button onclick="surePageNO()">转到</button>
					</td>
				</tr>
			</table>
		</form>
								
								<!-- <ul class="am-pagination am-fr admin-content-pagination">
									<li class="am-disabled"><a href="#">&laquo;</a></li>
									<li class="am-active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul> -->
							</div>
						</div>
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
	<script type="text/javascript">
		function markIsRead(discussId,messageId){
			var isRead = $("#isRead"+messageId).text();
			if(isRead=="未读"){
				//标记消息为“已读”
        		//新建页面请求对象
				var req = new XMLHttpRequest();
				//设置传送方式，对应的servlet或action路径，是否异步处理
		        req.open("POST", "MarkMessageReadServlet", true);
		        //如果设置数据传送方式为post，则必须设置请求头信息
		        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				var value ="messageId=" +messageId;
				req.send(value);
			}
			window.location.href="discussDetail.jsp?discuss_id="+discussId;
		}
		
		function surePageNO() {
			var num = $("#pageNum").val();
			window.location.href = "home.jsp?pageNO="+num;
		}
	</script>
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="js/jquery.min.js"></script>
	<!--<![endif]-->
	<script src="js/amazeui.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>