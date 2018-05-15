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
					<div class="am-u-sm-12">
					<div style="padding-left:20px">
						<span style="font-size:30px">主题 </span>作者 发帖时间
    					<h4 style="padding-left:10px">内容</h4>
    				</div>
    							<div align="center">
    								<div style="margin:20px 0 10px 0;"></div>
    								<div class="easyui-panel" title="第1楼        回复人        回复时间" style="width:950px;height:100px;" data-options="footer:'#ft'">
    								回复内容</div>
    								<div class="easyui-panel" title="第2楼        回复人        回复时间" style="width:950px;height:100px;" data-options="footer:'#ft'">
    								回复内容</div>
    								<div class="easyui-panel" title="第3楼        回复人        回复时间" style="width:950px;height:100px;" data-options="footer:'#ft'">
    								回复内容</div>
    								<div class="easyui-panel" title="第4楼        回复人        回复时间" style="width:950px;height:100px;" data-options="footer:'#ft'">
    								回复内容</div>
    								<div class="easyui-panel" title="第5楼        回复人        回复时间" style="width:950px;height:100px;" data-options="footer:'#ft'">
    								回复内容</div>
    								<div class="easyui-panel" title="第6楼        回复人        回复时间" style="width:950px;height:100px;" data-options="footer:'#ft'">
    								回复内容</div>
    							</div>
					</div>
				</div>
				<hr />
		<form>
			<table  align="center" border=0>
				<tr>
					<td class="am-cf">
						共 <font color=red>0</font> 条记录&nbsp
					</td>
					<td>
						目前页数
						<font color=red>0</font>
					</td>
					<td>
						总页数
						<font color=red>0</font>
					</td>
					<td>
						<a href=forumHome.jsp?pageNO=1>【第一页】</a>
					</td>
					<td>
						<a href=forumHome.jsp?pageNO=0>【上一页】</a>
					</td>
					<td>
						<a href=forumHome.jsp?pageNO=0>【下一页】</a>
					</td>
					<td>
						<a href=forumHome.jsp?pageNO=0>【最后一页】</a>
					</td>
					<td>
						输入页次：
						<input type=text id=pageNum size=3 name=pageNO value=1>
					</td>
					<td>
						<button onclick="surePageNO()">转到</button>
					</td>
				</tr>
			</table>
		</form>
				
				
		<script type="text/javascript">
			function surePageNO() {
				var num = $("#pageNum").val();
				window.location.href = "forumHome.jsp?pageNO="+num;
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
		</script>		
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