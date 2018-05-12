<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" type="image/png" href="images/favicon.png">
<title>帐号重置</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />




<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">


				<!-- Start Sign In Form -->
				<form action="resetNPServlet"
					class="fh5co-form animate-box" data-animate-effect="fadeIn"
					method="post">
					<h2>帐号重置</h2>
					<div class="form-group">
						<label for="username" class="sr-only">Name</label> <input
							type="text" class="form-control" id="userid" name="userid"
							placeholder="用户id" autocomplete="off" required max
							value="<%=request.getAttribute("userid")%>">
					</div>
					<div class="form-group">
						<label for="username" class="sr-only">Name</label> <input
							type="text" class="form-control" id="username" name="username"
							placeholder="用户名" autocomplete="off" required max
							value="<%=request.getAttribute("username")%>">
					</div>
					<div class="form-group">
						<label for="email" class="sr-only">Email</label> <input
							type="email" class="form-control" id="email" name="email"
							placeholder="电子邮箱" autocomplete="off"
							value="<%=request.getAttribute("email")%>">
					</div>
					<div class="form-group">
						<label for="psw" class="sr-only">Password</label> <input
							type="password" class="form-control" id="psw" name="psw"
							placeholder="请设置登录密码" autocomplete="off">
					</div>
					<div class="form-group">
						<label for="re_psw" class="sr-only">Re-type Password</label> <input
							type="password" class="form-control" id="re_psw" name="re_psw"
							placeholder="确认密码" autocomplete="off">
					</div>
					<div class="form-group">
						<label for="remember"><input type="checkbox" id="remember">
							记住我</label>
					</div>
					<div class="form-group">
						<input type="submit" value="提 交" class="btn btn-primary">
					</div>
				</form>
				<!-- END Sign In Form -->

			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="js/main.js"></script>

</body>
</html>

