<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--slider-->
<link href="css/flexslider.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/jquery.flexslider.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		SyntaxHighlighter.all();
	});
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			animationLoop : false,
			itemWidth : 210,
			itemMargin : 5,
			minItems : 2,
			maxItems : 4,
			start : function(slider) {
				$('body').removeClass('loading');
			}
		});
	});
</script>
</head>
<body>
	<div class="h_bg">
		<div class="wrap">
			<div class="header">
				<div class="logo">
					<h1>
						<a href="index"><img src="images/logo.png" alt=""></a>
					</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="nav_bg">
		<div class="wrap">
			<ul class="nav">
				<li class="active"><a href="index">主页</a></li>
				<li><a href="About">相关信息</a></li>
				<li><a href="staff">医务人员</a></li>
				<li><a href="project">项目</a></li>
				<li><a href="contact">联系我们</a></li>
				<li><a href="LoginAndRegister">登陆 | 注册</a></li>
				
				</ul>
		</div>
	</div>
	<div class="h_btm_bg">
		<div class="wrap">
			<div class="h_btm">
				<div class="header-para">
					<h2>Lorem Lipsum dollar sit amet text</h2>
					<h3>Qsi turpis,pellentesque ultrices</h3>
					<p>
						There are many variations of passages of Lorem Ipsum available,
						but the majority have suffered alteration in some form, by
						injected humour, <span>randomised words which don't look
							even slightly believable. If you are going to use a passage of
							Lorem Ipsum, you need to be sure there isn't anything
							embarrassing hidden in the middle of text. All the Lorem Ipsum
							generators on the Internet tend to repeat predefined chunks as
							necessary, making this the first true generator on the Internet.
							It uses a dictionary of over 200 Latin words,</span>
					</p>
				</div>
				<div class="header-banner">
					<img src="images/banner.png" alt="">
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="s_bg">
		<div class="wrap">
			<div class="main_cont">
				<section class="slider">
					<div class="flexslider carousel">
						<ul class="slides">
							<li><img src="images/a.jpg" /></li>
							<li><img src="images/slider2.jpg" /></li>
							<li><img src="images/slider3.jpg" /></li>
							<li><img src="images/slider4.jpg" /></li>
							<li><img src="images/slider5.jpg" /></li>
							<li><img src="images/slider6.jpg" /></li>
							<li><img src="images/slider7.jpg" /></li>
							<li><img src="images/slider8.jpg" /></li>
						</ul>
					</div>
				</section>
				<div class="ribben">
					<div class="l-triangle-top"></div>
					<div class="l-triangle-bottom"></div>
					<div class="rectangle"></div>
					<div class="r-triangle-top"></div>
					<div class="r-triangle-bottom"></div>
					<div class="clear"></div>
				</div>
				<div class="tlinks">
					Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a>
				</div>
				<div class="main">
					<div class="content">
						<h2>Welcome</h2>
						<h4>
							Lorem Ipsum is simply <span>dummy text of the&nbsp;</span>printing
							and ,
						</h4>
						<p>Nam ornare vulputate risus,id volutpat elit porttitor non.
							In consequat nisi vel lectus dapibus sodales.Nam ornare vulputate
							risus, id volutpat elit porttitor non. In consequat nisi vel
							lectus dapibus sodales.Nam ornare vulputate risus, id volutpat
							elit porttitor non. In consequat nisi vel lectus dapibus
							sodales.Nam ornare vulputate risus, id volutpat elit porttitor
							non. In consequat nisi vel lectus dapibus sodales. Pellentesque
							habitant morbi tristique senectus Nam ornare vulputate risus, id
							volutpat elit porttitor non. In consequat nisi vel lectus dapibus
							sodales.</p>
						<p class="top">There are many variations of passages of Lorem
							Ipsum available, but the majority have suffered alteration in
							some form, by injected humour, or randomised words which don't
							look even slightly believable. If you are going to use a passage
							of Lorem Ipsum, you need to be sure there isn't anything
							embarrassing hidden in the middle of text. All the Lorem Ipsum
							generators on the Internet tend to repeat predefined chunks as
							necessary, making this the first true generator on the Internet.
							It uses a dictionary of over 200 Latin words, combined with a
							handful of model sentence structures,</p>
						<div class="rd_more">
							<a href="details.html"><button class="btn btn-2 btn-2c">Read
									More</button></a>
						</div>
					</div>
					<div class="sidebar">
						<h2>Recent Projects</h2>
						<div class="blog_posts">
							<div class="blog_date">
								<img src="images/blog1.jpg">
							</div>
							<div class="blog_desc">
								<div class="blog_heading">
									<p>
										<span>Lorem ipsum dolor sit amet consec.</span>
									</p>
									<p class="date">
										Posted on May 13th, 2013 by <span class="author">Finibus
											Bonorum</span>
									</p>
								</div>
								<p>There are many variations of passages of Lorem Ipsum
									available, but the majority have,,</p>
							</div>
							<div class="clear"></div>
						</div>
						<div class="blog_posts">
							<div class="blog_date">
								<img src="images/blog2.jpg">
							</div>
							<div class="blog_desc">
								<div class="blog_heading">
									<p>
										<span>Lorem ipsum dolor sit amet consec.</span>
									</p>
									<p class="date">
										Posted on May 13th, 2013 by <span class="author">Finibus
											Bonorum</span>
									</p>
								</div>
								<p>There are many variations of passages of Lorem Ipsum
									available, but the majority have,,</p>
							</div>
							<div class="clear"></div>
						</div>
						<div class="blog_posts">
							<div class="blog_date">
								<img src="images/blog3.jpg">
							</div>
							<div class="blog_desc">
								<div class="blog_heading">
									<p>
										<span>Lorem ipsum dolor sit amet consec.</span>
									</p>
									<p class="date">
										Posted on May 13th, 2013 by <span class="author">Finibus
											Bonorum</span>
									</p>
								</div>
								<p>There are many variations of passages of Lorem Ipsum
									available, but the majority have,,</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
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
				
				<div class="clear"></div>
			</div>
		</div>
	</div>

</body>
</html>