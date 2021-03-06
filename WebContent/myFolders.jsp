<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="bean.User"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.ssdut.dao.FolderDao"%>
<%
	String username = (String) session.getAttribute("username");
	User user = new UserDao().getUserByUsername(username);
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	int folderId = Integer.valueOf(request.getParameter("folderId"));//用request得到
	String folderTitle = new FolderDao().getFolderById(folderId).getFolder_title();
%>
<html>
<head>
<jsp:include page="headerreference.jsp"></jsp:include>
<title>PaperManagement folder myFolders</title>
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
	<input type="hidden" id="folderId" value=<%=folderId %>></input>
	<input type="hidden" id="folderTitle" value=<%=folderTitle %>></input>
	<div class="am-cf admin-main">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg"><%=folderTitle %></strong> / <small>My Folders</small>
						<span class="am-icon-pencil-square-o" onclick=javascript:modifyFolder(<%=folderId %>) title="点击修改文件夹名"></span>
						<span class="am-icon-trash" onclick=javascript:deleteFolder(<%=folderId %>) title="删除该文件夹"></span>
					</div>
				</div>

				<hr>

				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-9">
						<div class="am-btn-toolbar">

							<div class="am-btn-group am-btn-group-xs">


								<script type="text/javascript">
									function markRead(id){
										//新建页面请求对象
										var req = new XMLHttpRequest();
										//设置传送方式，对应的servlet或action路径，是否异步处理
								        req.open("POST", "MarkReadServlet", true);
								        //如果设置数据传送方式为post，则必须设置请求头信息
								        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
										var value = "id=" + id;
										document.getElementById(id).value;
										req.send(value);
									}
									
						        	function modifyFolder(folderId) {
						        		    var folderTitle = document.getElementById("folderTitle").value;
									        var name = prompt("请输入文件夹名",folderTitle);  
									        if (name)//如果返回的有内容  
									        {  
									        	//新建页面请求对象
												var req = new XMLHttpRequest();
												//设置传送方式，对应的servlet或action路径，是否异步处理
										        req.open("POST", "ModifyFolderServlet", true);
										        //如果设置数据传送方式为post，则必须设置请求头信息
										        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
												var value = "name=" + name +"&folderId=" +folderId;
												req.send(value); 
												setTimeout("location.reload()",50);
									        }  
						        	}
						        	
						        	function deleteFolder(folderId) {
						        		//默认只删除文件夹，不删除其中文件
						        		var flag = 1;
						        		if(confirm("您确定要删除该文件夹？")){
						        			if(confirm("删除文件夹的同时是否删除其中文件？")){
						        				 flag = 0;
						        			}
						        			//新建页面请求对象
											var req = new XMLHttpRequest();
											//设置传送方式，对应的servlet或action路径，是否异步处理
									        req.open("POST", "DeleteFolderServlet", true);
									        //如果设置数据传送方式为post，则必须设置请求头信息
									        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
											var value = "flag=" + flag +"&folderId=" +folderId;
											req.send(value);
											window.location.href="allDocuments.jsp";
						        		}
					        	}
								</script>

								<script type="text/javascript">
									function jump() {
										var folderId = document.getElementById("folderId").value;
										window.location.href = "addPaperMyFolders.jsp?folderId="+folderId;
									}
								</script>




								<button type="button" class="am-btn am-btn-default"
									value="uploadindex" onclick=javascrtpt:jump()>
									<span class="am-icon-plus"></span> 新增
								</button>

								<!-- 		<button type="button" class="am-btn am-btn-default">
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
									<button class="am-btn am-btn-default" type="submit">
										搜索</button>
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
									Class.forName("com.mysql.jdbc.Driver");//加载驱动  
									Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
											"0000");//建立连接  
									//Statement stmt = conn.createStatement();//创建执行者  
									String sql = "select paper.* from paper inner join folder_paper on (paper.id=folder_paper.paper_id) where folder_paper.folder_id=?";
									PreparedStatement pstmt = conn.prepareStatement(sql);
									pstmt.setInt(1, folderId);
									ResultSet rs = pstmt.executeQuery();//返回结果集（游标）
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
													<%
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
													%>
													<button
														class="am-btn am-btn-default am-btn-xs am-hide-sm-only">
														<span class="am-icon-download"></span> <a
															href="DownLoadServlet?url=<%=rs.getString(11)%>&id=<%=rs.getInt(1)%>"> 下载</a>
													</button>

													<button
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
														<span class="am-icon-trash-o"></span><a
															href="DeleteFavoritesServlet?id=<%=rs.getInt(1)%>">
															删除 
													</button>
																										<%
														if (rs.getInt(17) == 0) {
													%>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
														onclick=javascript:markRead(<%=rs.getInt(1)%>) id=<%=rs.getInt(1)%> value=<%=rs.getInt(17)%>>
														<span class="am-icon-circle"></span> 未读
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
														<span class="am-icon-circle-o"></span> 已读
													</button>
													<%
														}
													%>

												</div>
											</div>
										</td>
									</tr>
									<%
										}
									%>



									<!-- <tr>
										<td><input type="checkbox" /></td>
										<td>1</td>
										<td><a href="#">Business management</a></td>
										<td>default</td>
										<td class="am-hide-sm-only">测试1号</td>
										<td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<button
														class="am-btn am-btn-default am-btn-xs am-text-secondary">
														<span class="am-icon-pencil-square-o"></span> 编辑
													</button>
													<button
														class="am-btn am-btn-default am-btn-xs am-hide-sm-only">
														<span class="am-icon-copy"></span> 复制
													</button>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
														<span class="am-icon-trash-o"></span> 删除
													</button>
												</div>
											</div>
										</td>
									</tr> -->
								</tbody>
							</table>
							<div class="am-cf">
								共<%=i%>条记录
								<!-- 		<div class="am-fr">
									<ul class="am-pagination">
										<li class="am-disabled"><a href="#">«</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">»</a></li>
									</ul>
								</div> -->
							</div>
							<hr />
						</form>
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
	
		<div id="dlg" closed="true" class="easyui-dialog" title="Toolbar and Buttons" style="width:400px;height:200px;padding:10px"
			data-options="
				iconCls: 'icon-save',
				toolbar: [{
					text:'Add',
					iconCls:'icon-add',
					handler:function(){
						alert('add')
					}
				},'-',{
					text:'Save',
					iconCls:'icon-save',
					handler:function(){
						alert('save')
					}
				}],
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						alert('ok');
					}
				},{
					text:'Cancel',
					handler:function(){
						alert('cancel');;
					}
				}]
			">
		The dialog content.
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