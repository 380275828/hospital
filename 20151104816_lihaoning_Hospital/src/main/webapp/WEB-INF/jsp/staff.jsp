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
				<li class="active"><a href="staff?userName=${userName}">医务人员</a></li>
				<li><a href="project?userName=${userName}">项目</a></li>
				<li><a href="contact?userName=${userName}">查看结果</a></li>
				<c:if test="${empty userName}">
					<li><a href="LoginAndRegister">登陆 | 注册</a></li>
				</c:if>
				<c:if test="${not empty userName}">
					<li>欢迎${userName}登陆</li>
				</c:if>
		</ul>
</div>
</div>
<div class="s_bg">
<div class="wrap">
<div class="cont_main">
<div class="our-staff">
		<div class="dc-grids">
				<div class="dc-head">
					<div class="dc-head-img">
						<a href="#"><img src="images/dc1.jpg" title="dc-name"></a>
					</div>
					<div class="dc-head-info">
						<h3>王医生</h3>
						<span>毕业于内蒙古医科大学</span>
					</div>
					<div class="clear"></div>
					<div class="dc-profile">
						<p>拥有丰富的临床经验和扎实的理论基础</p>
						<div class="rd_more1">
							<a href="details.html"><button class="btn btn-2 btn-2c">在线交谈</button></a>
						</div>
					</div>
				</div>
				<div class="dc-head">
					<div class="dc-head-img">
						<a href="#"><img src="images/dc3.jpg" title="dc-name"></a>
					</div>
					<div class="dc-head-info">
						<h3>王医生</h3>
						<span>毕业于内蒙古医科大学</span>
					</div>
					<div class="clear"> </div>
					<div class="dc-profile">
						<p>拥有丰富的临床经验和扎实的理论基础</p>
						<div class="rd_more1">
							<a href="details.html"><button class="btn btn-2 btn-2c">在线交谈</button></a>
						</div>
					</div>
				</div>
				<div class="dc-head">
					<div class="dc-head-img">
						<a href="#"><img src="images/dc2.jpg" title="dc-name"></a>
					</div>
					<div class="dc-head-info">
						<h3>王医生</h3>
						<span>毕业于内蒙古医科大学</span>
					</div>
					<div class="clear"> </div>
					<div class="dc-profile">
						<p>拥有丰富的临床经验和扎实的理论基础</p>
						<div class="rd_more1">
							<a href="details.html"><button class="btn btn-2 btn-2c">在线交谈</button></a>
						</div>
					</div>
				</div>
				<div class="clear"> </div>
			</div>
			<div class="dc-grids">
				<div class="dc-head">
					<div class="dc-head-img">
						<a href="#"><img src="images/dc4.jpg" title="dc-name"></a>
					</div>
					<div class="dc-head-info">
						<h3>王医生</h3>
						<span>毕业于内蒙古医科大学</span>
					</div>
					<div class="clear"> </div>
					<div class="dc-profile">
						<p>拥有丰富的临床经验和扎实的理论基础</p>
						<div class="rd_more1">
							<a href="details.html"><button class="btn btn-2 btn-2c">在线交谈</button></a>
						</div>
					</div>
				</div>
				<div class="dc-head">
					<div class="dc-head-img">
						<a href="#"><img src="images/dc5.jpg" title="dc-name"></a>
					</div>
					<div class="dc-head-info">
						<h3>王医生</h3>
						<span>毕业于内蒙古医科大学</span>
					</div>
					<div class="clear"> </div>
					<div class="dc-profile">
						<p>拥有丰富的临床经验和扎实的理论基础</p>
						<div class="rd_more1">
							<a href="details.html"><button class="btn btn-2 btn-2c">在线交谈</button></a>
						</div>
					</div>
				</div>
				<div class="dc-head">
					<div class="dc-head-img">
						<a href="#"><img src="images/dc6.jpg" title="dc-name"></a>
					</div>
					<div class="dc-head-info">
						<h3>王医生</h3>
						<span>毕业于内蒙古医科大学</span>
					</div>
					<div class="clear"> </div>
					<div class="dc-profile">
						<p>拥有丰富的临床经验和扎实的理论基础</p>
						<div class="rd_more1">
							<a href="details.html"><button class="btn btn-2 btn-2c">在线交谈</button></a>
						</div>
					</div>
				</div>
				<div class="clear"> </div>
			</div>
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