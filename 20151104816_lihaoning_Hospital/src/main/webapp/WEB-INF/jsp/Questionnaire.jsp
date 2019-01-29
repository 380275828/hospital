<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>调查问卷</title>
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
				<li class="active"><a href="index?userName=${userName}">主页</a></li>
				<li><a href="About?userName=${userName}">相关信息</a></li>
				<li><a href="staff?userName=${userName}">医务人员</a></li>
				<li><a href="project?userName=${userName}">项目</a></li>
				<li><a href="contact?userName=${userName}">联系我们</a></li>
				<li><a href="LoginAndRegister">登陆 | 注册</a></li>
				<li>欢迎${userName}登陆</li>
			</ul>
		</div>
	</div>

	<div class="h_btm_bg">
		<div class="wrap">
			<div class="h_btm">
				<div class="header-para" align="center">
					<h2>健康体制检测报告</h2>
					<h3>注：请根据自身条件认真填写，跳出见面需要重新填写</h3>

					<table class="MainArea_Content" align="center" cellspacing="0"
						cellpadding="0">
						<!-- 表头-->

						<tr align="center" valign="middle" id="TableTitle">
							<td>菜品编号</td>
							<td>菜名</td>
							<td>价格</td>
							<td>所属菜系</td>
							<td>操作</td>
						</tr>

						<!--显示数据列表 -->
						<c:if test="${questionList.size()>0}">

							<c:forEach items="${questionList }" var="questionnaire">
								<tr align="center">
									<td>${questionnaire.id }</td>
									<td>${questionnaire.sex }</td>
									<td>${questionnaire.age }</td>
									<td><input type="radio" name="sex" value="男1" checked />${questionnaire.text1 }</td>
									<td><input type="radio" name="sex" value="男1" checked />${questionnaire.text2 }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>

					<input type="radio" name="sex" value="男" checked />男 <input
						type="radio" name="sex" value="女" />女 <input type="radio"
						name="sex" value="女" />未知
				</div>
				<div class="header-banner">
					<img src="images/banner.png" alt="">
				</div>
				<div class="clear"></div>
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
</body>
</html>