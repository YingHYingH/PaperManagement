<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="bean.User"%>
<%@ page import="com.ssdut.dao.UserDao"%>
<%
	String username = (String) session.getAttribute("username");
	User user = new UserDao().getUserByUsername(username);
	String email = user.getEmail();
%>
<html>
<head>
<jsp:include page="headerreference.jsp"></jsp:include>
<title>PaperManagement personalInfo</title>
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
						<strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal
							information</small>
					</div>
				</div>

				<hr />

				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
						<div class="am-panel am-panel-default">
							<div class="am-panel-bd">
								<div class="am-g">
									<div class="am-u-md-4">
										<img class="am-img-circle am-img-thumbnail"
											src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/200/h/200/q/80"
											alt="" />
									</div>
									<div class="am-u-md-8">
										<!-- <p>
											你可以使用<a href="#">gravatar.com</a>提供的头像或者使用本地上传头像。
										</p> -->
										<form class="am-form">
											<div class="am-form-group">
												<input type="file" id="user-pic">
												<p class="am-form-help">请选择要上传的文件...</p>
												<button type="button"
													class="am-btn am-btn-primary am-btn-xs">保存</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>

						<!-- <div class="am-\panel am-panel-default">
							<div class="am-panel-bd">
								<div class="user-info">
									<p>等级信息</p>
									<div class="am-progress am-progress-sm">
										<div class="am-progress-bar" style="width: 60%"></div>
									</div>
									<p class="user-info-order">
										当前等级：<strong>LV8</strong> 活跃天数：<strong>587</strong> 距离下一级别：<strong>160</strong>
									</p>
								</div>
								<div class="user-info">
									<p>信用信息</p>
									<div class="am-progress am-progress-sm">
										<div class="am-progress-bar am-progress-bar-success"
											style="width: 80%"></div>
									</div>
									<p class="user-info-order">
										信用等级：正常当前 信用积分：<strong>80</strong>
									</p>
								</div>
							</div>
						</div> -->

					</div>

					<form action="personalInfoServlet" class="fh5co-form animate-box"
						data-animate-effect="fadeIn" method="post">
						<input type="hidden" name="id" value="<%=user.getId()%>">
						<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
							<div class="am-form am-form-horizontal">
								<%-- <div class="am-form-group">
									<label for="username" class="am-u-sm-3 am-form-label">用户名</label>
									<div class="am-u-sm-9">
										<input type="text" id="username" name="username"
											placeholder="请设置用户名" autocomplete="off" required max
											value="<%=username%>">
									</div>
								</div> --%>

								<div class="am-form-group">
									<label for="email" class="am-u-sm-3 am-form-label">电子邮箱</label>
									<div class="am-u-sm-9">
										<input type="email" id="email" name="email" placeholder="电子邮箱"
											autocomplete="off" required max value="<%=email%>">
									</div>
								</div>

								<!-- <div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">电话
									/ Telephone</label>
								<div class="am-u-sm-9">
									<input type="tel" id="user-phone"
										placeholder="输入你的电话号码 / Telephone">
								</div>
							</div> -->

								<!-- <div class="am-form-group">
								<label for="user-QQ" class="am-u-sm-3 am-form-label">QQ</label>
								<div class="am-u-sm-9">
									<input type="number" pattern="[0-9]*" id="user-QQ"
										placeholder="输入你的QQ号码">
								</div>
							</div> -->

								<!-- <div class="am-form-group">
								<label for="user-weibo" class="am-u-sm-3 am-form-label">微博
									/ Twitter</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-weibo"
										placeholder="输入你的微博 / Twitter">
								</div>
							</div> -->

								<div
									class="select-wrap with-icon-after icon-navigatedown am-form-group">
									<label for="academicstatus" class="am-u-sm-3 am-form-label">学术状况</label>
									<div class="am-u-sm-9">
										<select id="academicstatus" name="academicstatus">
											<option value="<%=user.getAcademicstatus()%>"><%=user.getAcademicstatus()%></option>
											<option value="Lecturer">Lecturer</option>
											<option value="Lecturer > Senior Lecturer">Lecturer
												&gt; Senior Lecturer</option>
											<option value="Librarian">Librarian</option>
											<option value="Other">Other</option>
											<option value="Professor">Professor</option>
											<option value="Professor > Associate Professor">Professor
												&gt; Associate Professor</option>
											<option value="Researcher">Researcher</option>
											<option value="Student  > Bachelor">Student &gt;
												Bachelor</option>
											<option value="Student  > Doctoral Student">Student
												&gt; Doctoral Student</option>
											<option value="Student  > Master">Student &gt;
												Master</option>
											<option value="Student  > Ph. D. Student">Student
												&gt; Ph. D. Student</option>
											<option value="Student  > Postgraduate">Student &gt;
												Postgraduate</option>
										</select>
									</div>
								</div>

								<div
									class="select-wrap with-icon-after icon-navigatedown am-form-group">
									<label for="discipline" class="am-u-sm-3 am-form-label">专业</label>
									<div class="am-u-sm-9">
										<select id="discipline" name="discipline">
											<option value="<%=user.getDiscipline()%>"><%=user.getDiscipline()%></option>
											<option value="Agricultural and Biological Sciences">Agricultural
												and Biological Sciences</option>
											<option value="Arts and Humanities">Arts and
												Humanities</option>
											<option value="Biochemistry, Genetics and Molecular Biology">Biochemistry,
												Genetics and Molecular Biology</option>
											<option value="Business, Management and Accounting">Business,
												Management and Accounting</option>
											<option value="Chemical Engineering">Chemical
												Engineering</option>
											<option value="Chemistry">Chemistry</option>
											<option value="Computer Science">Computer Science</option>
											<option value="Decision Sciences">Decision Sciences</option>
											<option value="Design">Design</option>
											<option value="Earth and Planetary Sciences">Earth
												and Planetary Sciences</option>
											<option value="Economics, Econometrics and Finance">Economics,
												Econometrics and Finance</option>
											<option value="Energy">Energy</option>
											<option value="Engineering">Engineering</option>
											<option value="Environmental Science">Environmental
												Science</option>
											<option value="Immunology and Microbiology">Immunology
												and Microbiology</option>
											<option value="Linguistics">Linguistics</option>
											<option value="Materials Science">Materials Science</option>
											<option value="Mathematics">Mathematics</option>
											<option value="Medicine and Dentistry">Medicine and
												Dentistry</option>
											<option value="Neuroscience">Neuroscience</option>
											<option value="Nursing and Health Professions">Nursing
												and Health Professions</option>
											<option
												value="Pharmacology, Toxicology and Pharmaceutical Science">Pharmacology,
												Toxicology and Pharmaceutical Science</option>
											<option value="Philosophy">Philosophy</option>
											<option value="Physics and Astronomy">Physics and
												Astronomy</option>
											<option value="Psychology">Psychology</option>
											<option value="Social Sciences">Social Sciences</option>
											<option value="Sports and Recreations">Sports and
												Recreations</option>
											<option value="Veterinary Science and Veterinary Medicine">Veterinary
												Science and Veterinary Medicine</option>
										</select>
									</div>
								</div>



								<div class="am-form-group">
									<label for="intro" class="am-u-sm-3 am-form-label">个人简介</label>
									<div class="am-u-sm-9">
										<%-- <textarea class="" rows="5" id="intro" name="intro"
											value="<%=user.getIntro()%>">
											<%=user.getIntro().trim()%>
											</textarea> --%>

										<input type="text" id="intro" name="intro"
											value="<%=user.getIntro()%>">


									</div>
								</div>

								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-3">
										<button type="submit" class="am-btn am-btn-primary">保存修改</button>
									</div>
								</div>
							</div>
						</div>
					</form>
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