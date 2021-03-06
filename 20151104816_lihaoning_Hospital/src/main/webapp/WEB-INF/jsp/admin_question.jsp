<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="${basePath}css/zxf_page.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .nav-style {
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
            <li><a href="${basePath}admin/chat1?userId=${user.id}">在线聊天</a></li>
        </ul>
    </div>
    <ul class="nav navbar-nav navbar-right nav-style">
        <li><a href="#">欢迎你${user.userName}</a></li>
        <li><a href="${basePath}/admin/loginOut"><span class="glyphicon glyphicon-off"></span>&nbsp;注销</a></li>
    </ul>
</nav>

<div class="panel panel-default">
    <div class="panel-heading">
        <form class="form-inline" role="form">
            <h3 class="panel-title">
                题目管理&nbsp;&nbsp;
                <a
                        <c:if test="${user.role == 1}">
                            href="javascript:void(0);"
                        </c:if>
                        <c:if test="${user.role == 0}">
                            href="${basePath}add_question"
                        </c:if>
                        class="btn btn-danger btn-xs"
                        <c:if test="${user.role == 1}">
                            disabled="true"
                        </c:if>>
                    添加
                </a>
                <div class="form-group">
                    <select class="form-control" id="type">
                        <c:forEach items="${types}" var="item">
                            <option value="${item.id}" <c:if test="${qType == item.id}">selected="selected"</c:if>>${item.type}</option>
                        </c:forEach>
                    </select>
                </div>
                <a id="search" class="btn btn-success btn-xs">查询</a>
            </h3>
        </form>
    </div>
    <div class="panel-body">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>#</th>
                <th>题目</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result}" var="item" varStatus="start">
                <tr>
                    <td>${start.index+1}</td>
                    <td>${item.qName}</td>
                    <td>
                        <a
                                <c:if test="${user.role == 1}">
                                    href="javascript:void(0);"
                                </c:if>
                                <c:if test="${user.role == 0}">
                                    href="${basePath}admin/delete_question?id=${item.id}"
                                </c:if>
                                class="btn btn-danger btn-xs"
                                <c:if test="${user.role == 1}">
                                    disabled="true"
                                </c:if>>
                            删除
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="panel-footer">
        <center>
            <div class="zxf_pagediv"></div>
        </center>
    </div>
</div>

<form action="/ordering_war_exploded/admin/question_search" id="searchFrom">
    <input id="typeValue" type="hidden" name="qType">
</form>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath}js/zxf_page.js"></script>
<script type="text/javascript">
    $("#search").click(function () {
        $("#typeValue").val($("#type").val())
        $("#searchFrom").submit();
    });
    //翻页
    $(".zxf_pagediv").createPage({
        pageNum: ${page.page.totalPage},
        current: ${page.page.currentPage},
        backfun: function (e) {
            if (e.current < 1) {
                e.current = 1;
            }
            if (e.current > e.pageNum) {
                e.current = e.pageNum;
            }
            window.location.href = "${basePath}admin/question?currentPage=" + e.current;
        }
    });

</script>
</body>
</html>