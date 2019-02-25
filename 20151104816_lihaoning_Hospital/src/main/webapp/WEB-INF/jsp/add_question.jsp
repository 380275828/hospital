<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <title>网站后台管理</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${basePath}css/zxf_page.css"/>
    <![endif]-->
    <style type="text/css">
        .nav-style{
            margin-right: 25px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <a href="#" class="navbar-brand">后台管理</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="${basePath}admin/adminIndex">用户管理</a></li>
            <li><a href="${basePath}admin/doctor">专家管理</a></li>
            <li><a href="${basePath}admin/question">题目管理</a></li>
        </ul>
    </div>
    <ul class="nav navbar-nav navbar-right nav-style">
        <li><a href="#">欢迎你${userName}</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-off"></span>&nbsp;注销</a></li>
    </ul>
</nav>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            添加题目
        </h3>
    </div>
    <div class="panel-body">
            <div class="form-group">
                <label for="name">请输入题目</label>
                <input type="text" class="form-control" id="name">
            </div>
    </div>
    <div class="panel-footer">
        <center>
            <button type="button" id="addButton" class="btn btn-success btn-xs">添加</button>
        </center>
    </div>
</div>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<script>
    $("#addButton").click(function () {
        var qName = $("#name").val();
        $.ajax({
            url:"${basePath}add_question_success",
            data:{
                "qName":qName
            },
            success:function(result){
                window.location.href="${basePath}admin/question";
            },
            error(e){
                alert(JSON.parse(e));
            }
        });
    });
</script>

</body>
</html>