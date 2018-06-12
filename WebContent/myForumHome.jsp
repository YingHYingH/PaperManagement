<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="bean.User"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%
	String username = (String) session.getAttribute("username");
	User user = new UserDao().getUserByUsername(username);
%>

<html>
<head>
<meta charset="UTF-8">
<jsp:include page="headerreference.jsp"></jsp:include>
<title>欢迎来到PM学术交流论坛</title>
<script src="js/jquery.min.js"></script>
<script src="js/amazeui.min.js"></script>
<script src="js/app.js"></script>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/easyui/demo/demo.css">
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<input type="hidden" id="user_id" value=<%=user.getId()%>></input>
	<div class="am-cf admin-main">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">和谐社区，你我共建</strong> / <small>Community
						</small>
					</div>
				</div>

				<hr>

				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-9">
						<div class="am-btn-toolbar">

							<div class="am-btn-group am-btn-group-xs">


								<script type="text/javascript">
								function openUserAddDialog() {
					            	$("#dlg").dialog("open").dialog("setTitle", "发帖");
					            	url = "${pageContext.request.contextPath}/user/save.do";
					        	}
									function markRead(id){
										//新建页面请求对象
										var req = new XMLHttpRequest();
										//设置传送方式，对应的servlet或action路径，是否异步处理
								        req.open("POST", "MarkReadServlet", true);
								        //如果设置数据传送方式为post，则必须设置请求头信息
								        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
										var value = "id=" + id;
										req.send(value);
									}
								</script>

								<button type="button" class="am-btn am-btn-default">
									<a href="forumHome.jsp">所有帖子</a>
								</button>

								<button type="button" class="am-btn am-btn-default"
									value="uploadindex" onclick=javascript:openUserAddDialog()>
									<span class="am-icon-plus"></span> 发帖
								</button>

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



					<form action="searchServlet" class="fh5co-form animate-box"
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
					</form>
				</div>


				<div class="am-g">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-id">序号</th>
										<th class="table-title">主题</th>
										<th class="table-author am-hide-sm-only">发帖人</th>
										<th class="table-type1">点赞数</th>
										<th class="table-type2">评论数</th>
										<th class="table-date am-hide-sm-only">发帖时间</th>
										<th class="table-set">操作</th>
									</tr>
								</thead>
								<%
									int MaxNum = 6;//每页容纳的主题论文的最大数目
									int count = 0, firstPage = 1, lastPage, firstNum, lastNum, prePage, nextPage, pageNO;
									//firstPage表示首页，lastPage表示末页，pageNO表示第几页，
									//firstNum表示该页的起始贴的ID，lastNum表示该页的末帖的ID，
									//prePage表示前一页，nextPage表示后一页
									if (request.getParameter("pageNO") == null)
										pageNO = 0;
									else
										pageNO = Integer.parseInt(request.getParameter("pageNO"));

									Class.forName("com.mysql.jdbc.Driver");//加载驱动  
									Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
											"0000");//建立连接  
									//Statement stmt = conn.createStatement();//创建执行者  
									String sql = "select * from discuss where user_id=" + user.getId() +" and flag=1 order by time desc";
									PreparedStatement pstmt = conn.prepareStatement(sql);
									ResultSet rs = pstmt.executeQuery();//返回结果集（游标）
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
									lastNum = pageNO * MaxNum - 1;
									if (pageNO == 1)
										prePage = 1;
									else
										prePage = pageNO - 1;
									if (pageNO == lastPage)
										nextPage = pageNO;
									else
										nextPage = pageNO + 1;
									sql = "select d.*,(select count(*) from likes l where l.discuss_id = d.discuss_id),"
											+ "(select count(*) from comment c where c.discuss_id = d.discuss_id),"
											+ "(select count(*) from likes l where l.discuss_id = d.discuss_id and l.user_id="+user.getId()+")"
											+ "from (select * from discuss where user_id=? and flag=1 order by time desc) d limit " + firstNum + "," + MaxNum;
									pstmt = conn.prepareStatement(sql);
									pstmt.setInt(1, user.getId());
									rs = pstmt.executeQuery();//返回结果集（游标）
								%>

								<tbody>
									<%
										int i = 0, userId;
										String discussUsername;
										while (rs.next()) {
											userId = rs.getInt(5);
											discussUsername = new UserDao().getUserById(userId).getUsername();
											++i;
									%>
									<tr>
										<td width="8% " style="word-break: break-all;"><%=i%></td>
										<td width="20% " style="word-break: break-all;" title="点击查看详情"><a
											href="discussDetail.jsp?discuss_id=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a></td>
										<td width="10% " style="word-break: break-all;"><%=discussUsername%></td>
										<td width="10% " style="word-break: break-all;"><%=rs.getInt(7)%></td>
										<td width="8% " style="word-break: break-all;"
											class="am-hide-sm-only"><%=rs.getInt(8)%></td>
										<td width="20% " style="word-break: break-all;"
											class="am-hide-sm-only"><%=rs.getString(4).substring(0,rs.getString(4).length()-2)%></td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<%
														if (rs.getInt(9) == 0) {
													%>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-secondary">
														<span class="am-icon-heart-o"></span><a
															href=# onclick=javascript:addLike(<%=rs.getInt(1) %>)> 赞一个
													</button>
													<%
														}
													%>
													<%
														if (rs.getInt(9) != 0) {
													%>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-secondary">
														<span class="am-icon-heart"></span><a
															href=# onclick=javascript:cancelLike(<%=rs.getInt(1) %>)> 取消赞

														
													</button>
													<%
														}
													%>

													<button
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
														<span class="am-icon-pencil-square-o"></span><a
															href="discussDetail.jsp?discuss_id=<%=rs.getInt(1)%>"> 评论 
													</button>

													<button
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
														<span class="am-icon-trash-o"></span><a
															href=# onclick=javascript:deleteDiscuss(<%=rs.getInt(1) %>)> 删除 
													</button>


												</div>
											</div>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>

							<hr />
						</form>
					</div>

				</div>

				<script type="text/javascript">
			function surePageNO() {
				var num = $("#pageNum").val();
				window.location.href = "myForumHome.jsp?pageNO="+num;
			}
			function addLike(discussId){
				var user_id = document.getElementById("user_id").value;
        		//新建页面请求对象
				var req = new XMLHttpRequest();
				//设置传送方式，对应的servlet或action路径，是否异步处理
		        req.open("POST", "AddLikeServlet", true);
		        //如果设置数据传送方式为post，则必须设置请求头信息
		        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				var value ="user_id=" +user_id + "&discussId=" + discussId;
				req.send(value);
				location.reload(); 
			}
			function cancelLike(discussId){
				var user_id = document.getElementById("user_id").value;
        		//新建页面请求对象
				var req = new XMLHttpRequest();
				//设置传送方式，对应的servlet或action路径，是否异步处理
		        req.open("POST", "CancelLikeServlet", true);
		        //如果设置数据传送方式为post，则必须设置请求头信息
		        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				var value ="user_id=" +user_id + "&discussId=" + discussId;
				req.send(value);
				location.reload(); 
			}
			function deleteDiscuss(discussId){
        		if(confirm("您确定要删除这条帖子吗？")){
        			//新建页面请求对象
    				var req = new XMLHttpRequest();
    				//设置传送方式，对应的servlet或action路径，是否异步处理
    		        req.open("POST", "DeleteDiscussServlet", true);
    		        //如果设置数据传送方式为post，则必须设置请求头信息
    		        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    				var value ="discussId=" + discussId;
    				req.send(value);
    				location.reload(); 
        		}
			}
		</script>

				<form>
					<table align="center" border=0>
						<tr>
							<td class="am-cf">共 <font color=red><%=count%></font>
								条记录&nbsp
							</td>
							<td>目前页数 <font color=red><%=pageNO%></font>
							</td>
							<td>总页数 <font color=red><%=lastPage%></font>
							</td>
							<td><a href=myForumHome.jsp?pageNO=1>【第一页】</a></td>
							<td><a href=myForumHome.jsp?pageNO=<%=prePage%>>【上一页】</a></td>
							<td><a href=myForumHome.jsp?pageNO=<%=nextPage%>>【下一页】</a>
							</td>
							<td><a href=myForumHome.jsp?pageNO=<%=lastPage%>>【最后一页】</a>
							</td>
							<td>输入页次： <input type=text id=pageNum size=3 name=pageNO
								value=<%=pageNO %>>
							</td>
							<td>
								<button onclick="surePageNO()">转到</button>
							</td>
						</tr>
					</table>
				</form>

			</div>
			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">Copyright © 2018 YingHYingH. All
					rights reserved.</p>
			</footer>
		</div>
		<!-- content end -->

	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 620px; height: 350px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="Post">
			<table cellspacing="8px">
				<div style="margin-bottom:20px">
					<div>主题:</div>
					<input id="discussTitle" style="width:100%;height:32px">
				</div>
				<div style="margin-bottom:20px">
					<div>正文:</div>
					<textarea id="discussContent" cols="40" rows="4" style="width:100%;height:128px"></textarea>
				</div>
				<div>
					<a href=# onclick=javascript:submitDiscuss() class="easyui-linkbutton" iconCls="icon-ok" style="width:100%;height:32px">提交</a>
				</div>
			</table>
		</form>
	</div>
	
						<script type="text/javascript">
						        	function submitDiscuss() {
						        		var discussTitle = $("#discussTitle").val();
						        		var discussContent = document.getElementById('discussContent').value;
						        		var user_id = document.getElementById("user_id").value;
						        		//新建页面请求对象
										var req = new XMLHttpRequest();
										//设置传送方式，对应的servlet或action路径，是否异步处理
								        req.open("POST", "AddDiscussServlet", true);
								        //如果设置数据传送方式为post，则必须设置请求头信息
								        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
										var value ="user_id=" +user_id + "&discussTitle=" + discussTitle + "&discussContent=" + discussContent;
										req.send(value);
										$("#dlg").dialog("close");
										location.reload(); 
						        	}
						</script>   

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

	<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

</body>
</html>