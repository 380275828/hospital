<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
            <li><a href="index">主页</a></li>
            <li><a href="About">相关信息</a></li>
            <li class="active"><a href="staff">医务人员</a></li>
            <li><a href="project">问卷调查</a></li>
            <li><a href="contact">查看结果</a></li>
            <c:if test="${empty userName}">
                <li><a href="LoginAndRegister">登陆 | 注册</a></li>
            </c:if>
            <c:if test="${not empty userName}">
                <li><a href="${basePath}userDetail">欢迎${userName}登陆</a></li>
                <li><a href="${basePath}userLogin">注销</a></li>
            </c:if>
        </ul>
    </div>
</div>
<div class="s_bg">
    <div class="wrap">
        <div class="cont_main">
            <div class="our-staff">
                <c:forEach items="${result}" var="item" varStatus="doc">
                    <c:if test="${(doc.index + 1) % 3 == 1}">
                        <div class="dc-grids">
                    </c:if>
                    <div class="dc-head">
                        <div class="dc-head-img">
                            <a href="#"><img src="images/dc1.png" title="dc-name"></a>
                        </div>
                        <div class="dc-head-info">
                            <h3>${item.userName}医生</h3>
                        </div>
                        <div class="clear"></div>
                        <div class="dc-profile">
                            <p>${item.describes}</p>
                            <div class="rd_more1">
                                <a href="${basePath}/chat?userId=${userId}&doctorId=${item.id}">
                                    <button class="btn btn-2 btn-2c">在线交谈</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <c:if test="${(doc.index + 1) % 3 == 0}">
                        <div class="clear"></div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</body>
</html>