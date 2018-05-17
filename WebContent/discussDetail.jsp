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
				<%
				Integer discuss_id = Integer.parseInt(request.getParameter("discuss_id"));
				Class.forName("com.mysql.jdbc.Driver");//加载驱动  
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/papermanagement", "root",
						"0000");//建立连接  
				//Statement stmt = conn.createStatement();//创建执行者  
				String sql = "select discuss.*,user.username from discuss join user on discuss.user_id = user.id where discuss.discuss_id="+discuss_id;
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();//返回结果集（游标）
				%>
				<input type="hidden" id="discuss_id" value=<%=discuss_id %>></input>
				<hr>
				<div class="am-g">
					<div class="am-u-sm-12">
					<%
						while(rs.next()){
						
					%>
					<div style="padding-left:20px">
							<span style="font-size:30px"><%=rs.getString(2) %> </span>发帖人:
							<%
							if(!username.equals(rs.getString(6))){
							%>
							<a href="personalHome.jsp?authorUsername=<%=rs.getString(6) %>" title="点击进入用户主页">
							<%
							}
							%>
							<%
							if(username.equals(rs.getString(6))){
							%>
							<a href="allDocuments.jsp" title="点击进入用户主页">
							<%
							}
							%>
							<%=rs.getString(6)%></a>&nbsp;发帖时间:<%=rs.getString(4).substring(0, rs.getString(4).length()-2) %>
										<button type="button" class="am-btn am-btn-default" style="float:right;"
											value="uploadindex" onclick=javascript:openUserAddDialog()>
											<span class="am-icon-pencil-square-o"></span> 发表评论
										</button>
    						<h4 style="padding-left:10px;padding-right:15px;"><%=rs.getString(3) %></h4>
    				</div>
    				<%
						}
    				%>
    				
    				<%
			int MaxNum = 6;//每页容纳的评论的最大数目
			int count = 0, firstPage = 1, lastPage, firstNum, lastNum, prePage, nextPage, pageNO;
			//firstPage表示首页，lastPage表示末页，pageNO表示第几页，
			//firstNum表示该页的起始贴的ID，lastNum表示该页的末帖的ID，
			//prePage表示前一页，nextPage表示后一页
			if (request.getParameter("pageNO") == null)
				pageNO = 0;
			else
				pageNO = Integer.parseInt(request.getParameter("pageNO"));
			
			sql = "select * from comment where discuss_id="+discuss_id;
			pstmt = conn.prepareStatement(sql);
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
			sql = "select comment.*,user.username from comment right join user on comment.user_id = user.id"
				+ " where comment.discuss_id="+discuss_id+" order by comment.time asc limit "+firstNum+","+MaxNum;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();//返回结果集（游标）
		%>
    				
    							<div align="center">
    								<div style="margin:20px 0 10px 0;"></div>
    								<%
    								int i = firstNum;
    								 while(rs.next()){
    									 i++;
    									 String title="";
    									 if(username.equals(rs.getString(6))){
    										 title= "第"+i+"楼"+" 来自:<a href='allDocuments.jsp' title='点击进入用户主页'>"+rs.getString(6)+"</a> 时间:"+rs.getString(4).substring(0, rs.getString(4).length()-2);
    									 }else{
    										 title= "第"+i+"楼"+" 来自:<a href='personalHome.jsp?authorUsername="+rs.getString(6)+"' title='点击进入用户主页'>"+rs.getString(6)+"</a> 时间:"+rs.getString(4).substring(0, rs.getString(4).length()-2);
    									 }
    								%>
    								<div class="easyui-panel" title="<%=title %>" style="width:950px;height:120px;padding-left:10px;padding-right:5px;" data-options="footer:'#ft'">
    								<%=rs.getString(3) %></div>
    								<%
    								 }
    								%>
    							</div>
					</div>
				</div>
				<hr />
			<table  align="center" border=0>
				<tr>
					<td class="am-cf">
						共 <font color=red><%=count %></font> 条记录&nbsp
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
						<a href=discussDetail.jsp?pageNO=1&discuss_id=<%=discuss_id %>>【第一页】</a>
					</td>
					<td>
						<a href=discussDetail.jsp?pageNO=<%=prePage %>&discuss_id=<%=discuss_id %>>【上一页】</a>
					</td>
					<td>
						<a href=discussDetail.jsp?pageNO=<%=nextPage%>&discuss_id=<%=discuss_id %>>【下一页】</a>
					</td>
					<td>
						<a href=discussDetail.jsp?pageNO=<%=lastPage%>&discuss_id=<%=discuss_id %>>【最后一页】</a>
					</td>
					<td>
						输入页次：
						<input type=text id=pageNum size=3 name=pageNO value=<%=pageNO %>>
					</td>
					<td>
						<button onclick=javascript:jumpGeilaozi()>转到</button>
					</td>
				</tr>
			</table>
		<script type="text/javascript">
		function openUserAddDialog() {
        	$("#dlg").dialog("open").dialog("setTitle", "发表评论");
    	}	
		
			function jumpGeilaozi(){
				var num = $("#pageNum").val();
				var discuss_id = document.getElementById('discuss_id').value;
				window.location.href = "discussDetail.jsp?pageNO="+num+"&discuss_id="+discuss_id;
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
		style="width: 620px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="Post">
			<table cellspacing="8px">
				<div style="margin-bottom:20px">
					<div>评论正文:</div>
					<textarea id="commentContent" cols="40" rows="4" style="width:100%;height:128px"></textarea>
				</div>
				<div>
					<a href=# onclick=javascript:submitComment() class="easyui-linkbutton" iconCls="icon-ok" style="width:100%;height:32px">提交</a>
				</div>
			</table>
		</form>
	</div>
	
						<script type="text/javascript">
						        	function submitComment() {
						        		var commentContent = document.getElementById('commentContent').value;
						        		var user_id = document.getElementById("user_id").value;
						        		var discuss_id = document.getElementById("discuss_id").value;
						        		//新建页面请求对象
										var req = new XMLHttpRequest();
										//设置传送方式，对应的servlet或action路径，是否异步处理
								        req.open("POST", "AddCommentServlet", true);
								        //如果设置数据传送方式为post，则必须设置请求头信息
								        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
										var value ="user_id=" +user_id + "&discuss_id=" + discuss_id + "&commentContent=" + commentContent;
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