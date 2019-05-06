<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<title>Insert title here</title>
</head>
<body>
<div class="h_bg">
<div class="wrap">
<div class="header">
		<div class="logo">
			<h1><a href="index.html"><img src="images/logo.png" alt=""></a></h1>
		</div>
	</div>
</div>
</div>
<div class="nav_bg">
	<div class="wrap">
		<ul class="nav">
			<li><a href="index?userName=${userName}">主页</a></li>
			<li><a href="About?userName=${userName}">相关信息</a></li>
			<li><a href="staff?userName=${userName}">医务人员</a></li>
			<li class="active"><a href="project?userName=${userName}">问卷调查</a></li>
			<li><a href="contact?userName=${userName}">查看结果</a></li>
			<li><a href="LoginAndRegister">登陆 | 注册</a></li>
			<c:if test="${not empty userName}">
				<li>欢迎${userName}登陆</li>
			</c:if>
		</ul>
	</div>
</div>
<div class="s_bg">
<div class="wrap">
<div class="cont_main">
<div class="boxes">
		<h2>Providing Unique And Tailored Projects for various proclinic</h2>
		   
				<ul class="lb-album">
					<li>
						<a href="#image-1">
							<img src="images/slider1.jpg" alt="">
							<span> </span>
						</a>
						<div class="lb-overlay" id="image-1">
							<img src="images/slider1.jpg" alt="">
							<a href="#page" class="lb-close"> </a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
					</li>
					<li>
						<a href="#image-2">
							<img src="images/slider2.jpg" alt="">
							<span> </span>
						</a>
						<div class="lb-overlay" id="image-2">
								<img src="images/slider2.jpg" alt=""> 
							<a href="#page" class="lb-close"> </a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
					</li>
					<li>
						<a href="#image-3">
							<img src="images/slider3.jpg" alt="">
							<span> </span>
						</a>
						<div class="lb-overlay" id="image-3">
							<img src="images/slider3.jpg" alt="image03">
							<a href="#page" class="lb-close"> </a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
					</li>
					<li>
						<a href="#image-4">
							<img src="images/slider4.jpg" alt="">
							<span> </span>
						</a>
						<div class="lb-overlay" id="image-4">
							<img src="images/slider4.jpg" alt="image04">
							<a href="#page" class="lb-close"> </a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
					</li>
				</ul>
				<ul class="lb-album">
					<li>
						<a href="#image-5">
							<img src="images/slider5.jpg" alt="">
							<span> </span>
						</a>
						<div class="lb-overlay" id="image-5">
							<img src="images/slider5.jpg" alt="image05">
							<a href="#page" class="lb-close"> </a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
					</li>
					<li>
						<a href="#image-6">
							<img src="images/slider6.jpg" alt="">
							<span> </span>
						</a>
						<div class="lb-overlay" id="image-6">
							<img src="images/slider6.jpg" alt="image06">
							<a href="#page" class="lb-close"> </a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
					</li>
					<li>
						<a href="#image-7">
							<img src="images/slider7.jpg" alt="">
							<span> </span>
						</a>
						<div class="lb-overlay" id="image-7">
							<img src="images/slider7.jpg" alt="image07"> 
							<a href="#page" class="lb-close"> </a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
					</li>
					<li>
						<a href="#image-8">
							<img src="images/slider8.jpg" alt="">
							<span> </span>
						</a>
						<div class="lb-overlay" id="image-8">
							<img src="images/slider8.jpg" alt="image08">
							<a href="#page" class="lb-close"> </a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
					</li>	
				</ul>
			
    </div>
</div>
</div>
</div>
<div class="ftr-bg">
<div class="wrap">
<div class="footer">
	<div class="f_nav">
		<ul>
			<li class="active"><a href="index.html">Home</a></li>
			<li><a href="about.html">About</a></li>
			<li><a href="staff.html">Staff</a></li>
			<li><a href="project.html">Projects</a></li>
			<li><a href="contact.html">Contact</a></li>
	    </ul>
	</div>
		<div class="copy">
			<p class="w3-link">Copyright &copy; 2014.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
		</div>
	<div class="clear"></div>
</div>
</div>
</div>


</body>
</html>