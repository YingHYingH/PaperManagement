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
	ResultSet rs = (ResultSet) session.getAttribute("rs");
%>

<html>
<head>
<jsp:include page="headerreference.jsp"></jsp:include>
<title>PaperManagement Suggest suggestResult</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<div class="am-cf admin-main">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">推荐结果</strong> / <small>Suggest
							Result</small>
					</div>
				</div>

				<hr>
				<form action="searchServlet" class="fh5co-form animate-box"
					data-animate-effect="fadeIn" method="post">
					<input type="hidden" name="user_id" value="<%=user.getId()%>">
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
							<div class="am-btn-toolbar">

								<div class="am-btn-group am-btn-group-xs"></div>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-3">
							<div class="am-input-group am-input-group-sm">
								<input type="text" class="am-form-field" id="searchKeyword"
									name="searchKeyword"> <span class="am-input-group-btn">
									<button class="am-btn am-btn-default" type="submit">搜索</button>
								</span>
							</div>
						</div>
					</div>
				</form>

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
										<th class="table-user_id am-hide-sm-only">上传者</th>
										<th class="table-set">操作</th>
									</tr>
								</thead>








								<tbody>
									<%
										int i = 0;
										while (rs.next()) {
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
										<td width="7% " style="word-break: break-all;"
											class="am-hide-sm-only"><%=rs.getInt(12)%></td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<button
														class="am-btn am-btn-default am-btn-xs am-hide-sm-only">
														<span class="am-icon-download"></span> <a
															href="DownLoadServlet?url=<%=rs.getString(11)%>&id=<%=rs.getInt(1)%>">下载</a>
													</button>

													<%-- 	<button
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
														<span class="am-icon-trash-o"></span><a
															href="DeleteServlet?id=<%=rs.getInt(1)%>"> 删除 
													</button>
 --%>
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
							<!-- 	<table align="center">
								<tr>
									<td><input type="button" value="上一页" name="pre" id="pre"
										onclick="pre"></td>
									<td><input type="text" name="页数" id="pageNum"></td>
									<td><input type="button" value="跳转" name="skip" id="skip"
										onclick="skip"></td>
									<td><input type="button" value="下一页" name="next" id="next"
										onclick="next"></td>

								</tr>
							</table> -->




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