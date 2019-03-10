<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Insert title here</title>
</head>
<body>
<div class="h_bg">
    <div class="wrap">
        <div class="header">
            <div class="logo">
                <a href="index.html"><img src="images/logo.png" alt=""></a>
            </div>
        </div>
    </div>
</div>
<div class="nav_bg">
    <div class="wrap">
        <ul class="nav">
            <li><a href="index">主页</a></li>
            <li><a href="About">相关信息</a></li>
            <li><a href="staff">医务人员</a></li>
            <li><a href="project">问卷调查</a></li>
            <li class="active"><a href="contact">查看结果</a></li>
            <c:if test="${empty userName}">
                <li><a href="LoginAndRegister">登陆 | 注册</a></li>
            </c:if>
            <c:if test="${not empty userName}">
                <li><a href="${basePath}userDetail">欢迎${userName}登陆</a></li>
            </c:if>
        </ul>
    </div>
</div>
<div class="s_bg">
    <div class="wrap">
        <div class="cont_main">
            <div class="contact">
                <div class="section group">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" disabled="disabled" value="${userName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">体制评测</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" disabled="disabled" value="${describe}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">建议</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" disabled="disabled" value="${suggest}">
                        </div>
                    </div>
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
                    <li class="active"><a href="index">主页</a></li>
                    <li><a href="About">相关信息</a></li>
                    <li><a href="staff">医务人员</a></li>
                    <li><a href="project">项目</a></li>
                    <li><a href="contact">联系我们</a></li>
                </ul>
            </div>
            <div class="copy">
                <p class="w3-link">Copyright &copy; 2014.Company name All rights reserved.More Templates <a
                        href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a
                        href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

</body>
</html>