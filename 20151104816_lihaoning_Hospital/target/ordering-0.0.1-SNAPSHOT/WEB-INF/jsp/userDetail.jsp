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
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        request.setAttribute("basePath",basePath);
    %>
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
            <li><a href="index?userName=${user.userName}">主页</a></li>
            <li><a href="About?userName=${user.userName}">相关信息</a></li>
            <li><a href="staff?userName=${user.userName}">医务人员</a></li>
            <li class="active"><a href="project?userName=${user.userName}">问卷调查</a></li>
            <li><a href="contact?userName=${user.userName}">查看结果</a></li>
            <c:if test="${empty user.userName}">
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        个人信息
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label>用户名</label>
                        <input type="text" class="form-control" id="userName" value="${user.userName}">
                    </div>
                    <div class="form-group">
                        <label>手机号</label>
                        <input type="text" class="form-control" id="phone" value="${user.phoneNum}">
                    </div>
                    <div class="form-group">
                        <label>请选择性别</label>
                        <select id="sex" class="form-control">
                            <option value="1" <c:if test="${user.sex == 1}">selected="selected"</c:if>>男</option>
                            <option value="0" <c:if test="${user.sex == 0}">selected="selected"</c:if>>女</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>年龄</label>
                        <input type="text" class="form-control" id="age" value="${user.age}">
                    </div>
                </div>
                <div class="panel-footer">
                    <center>
                        <button type="button" id="addButton" class="btn btn-success btn-xs">修改</button>
                    </center>
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
            <div class="clear"></div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    $("#addButton").click(function () {
        var id = ${user.id};
        var userName = $("#userName").val();
        var phoneNum = $("#phone").val();
        var sex = $("#sex").val();
        var age = $("#age").val();
        $.ajax({
            url:"${basePath}updateUser",
            data:{
                "id":id,
                "userName":userName,
                "phoneNum":phoneNum,
                "sex":sex,
                "age":age
            },
            success:function(result){
                window.location.href="${basePath}userDetail";
            },
            error(e){
                alert(JSON.parse(e));
            }
        });
    });
</script>
</body>
</html>