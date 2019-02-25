<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<li><a href="project">问卷调查</a></li>
				<li><a href="contact">查看结果</a></li>
				<c:if test="${empty userName}">
					<li><a href="LoginAndRegister">登陆 | 注册</a></li>
				</c:if>
				<c:if test="${not empty userName}">
					<li><a href="${basePath}userDetail">欢迎${userName}登陆</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<div class="h_btm_bg">
		<div class="wrap">
			<div class="h_btm">
				<div class="header-para">
					<h2>李浩宁的中医网</h2>
					<h3>中医分析：儿童缺觉导致肥胖</h3>
					<p>
						缺觉让人精神萎靡。英国一项研究显示，缺觉还导致未成年人肥胖几率增加58%。沃里克大学研究人员整合过去42项实验的结果，涉及75499名年龄不满18岁的未成年人，他们的平均随访时间为3年。研究人员借助问卷或可穿戴设备了解研究对象的睡眠时长，并定期记录研究对象的身高体重指数，结果发现，所有缺觉的研究对象体重增加均高于同龄不缺觉者，他们体重超标或肥胖的几率平均比不缺觉者高58%。</span>
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
						<h2>欢迎来到中医网</h2>
						<p>中医（Traditional Chinese Medicine），一般指以中国汉族劳动人民创造的传统医学为主的医学，所以也称汉医。是研究人体生理、病理以及疾病的诊断和防治等的一门学科。
							中医诞生于原始社会，春秋战国时期中医理论已基本形成，之后历代均有总结发展。除此之外对汉字文化圈国家影响深远，如日本汉方医学，韩国韩医学，朝鲜高丽医学、越南东医学等都是以中医为基础发展起来的。
							</p>
						<p class="top">中医承载着中国古代人民同疾病作斗争的经验和理论知识，是在古代朴素的唯物论和自发的辨证法思想指导下，通过长期医疗实践逐步形成并发展成的医学理论体系。
							中医学以阴阳五行作为理论基础，将人体看成是气、形、神的统一体，通过“望闻问切”四诊合参的方法，探求病因、病性、病位、分析病机及人体内五脏六腑、经络关节、气血津液的变化、判断邪正消长，进而得出病名，归纳出证型，以辨证论治原则，制定“汗、吐、下、和、温、清、补、消”等治法，使用中药、针灸、推拿、按摩、拔罐、气功、食疗等多种治疗手段，使人体达到阴阳调和而康复。</p>
						<div class="rd_more">
							<a href="details.html"><button class="btn btn-2 btn-2c">Read
									More</button></a>
						</div>
					</div>
					<div class="sidebar">
						<h2>更多知识</h2>
						<div class="blog_posts">
							<div class="blog_date">
								<img src="images/blog1.jpg">
							</div>
							<div class="blog_desc">
								<div class="blog_heading">
									<p>
										<span>医学知识1</span>
									</p>
									<p class="date">
										时间是2018年9月2号 <span class="author">王医生</span>
									</p>
								</div>
								<p>中医知识啦啦啦啦</p>
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