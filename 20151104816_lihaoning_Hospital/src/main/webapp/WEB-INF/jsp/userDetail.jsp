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
            <li><a href="index">主页</a></li>
            <li><a href="About">相关信息</a></li>
            <li><a href="staff">医务人员</a></li>
            <li class="active"><a href="project">问卷调查</a></li>
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        个人信息
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label>用户名</label>
                        <input type="text" class="form-control" id="userName" value="${user.userName}" onblur="checkName()" />
                        <a href="#" id="nameclass" class=""> </a>
                        <div class="clear"></div></li>&nbsp;&nbsp;
                        <span  style="font-size:13px" id="namespan"></span>
                    </div>
                    <div class="form-group">
                        <label>手机号</label>
                        <input type="text" class="form-control" id="phone" value="${user.phoneNum}" onblur="checkPhone();"/>
                        <a href="#" id="phoneclass" class=""></a>
                        <div class="clear"></div></li>&nbsp;&nbsp;
                        <span style="font-size: 13px" id="phonespan"></span>
                    </div>
                    <div class="form-group">
                        <label>年龄</label>
                        <input type="text" class="form-control" id="age" value="${user.age}" onblur="checkAge();"/>
                        <a href="#" id="ageclass" class=""></a>
                        <div class="clear"></div></li>&nbsp;&nbsp;
                        <span style="font-size: 13px" id="agespan"></span>
                    </div>
                    <div class="form-group">
                        <label>请选择性别</label>
                        <select id="sex" class="form-control">
                            <option value="1" <c:if test="${user.sex == 1}">selected="selected"</c:if>>男</option>
                            <option value="0" <c:if test="${user.sex == 0}">selected="selected"</c:if>>女</option>
                        </select>
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
                    <ul>
                        <li class="active"><a href="index">主页</a></li>
                        <li><a href="About">相关信息</a></li>
                        <li><a href="staff">医务人员</a></li>
                        <li><a href="project">问卷调查</a></li>
                        <li><a href="contact">查看结果</a></li>
                    </ul>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    //1.检查用户名
    function checkName(){
        var name = document.getElementById("userName").value;
        var spanNode = document.getElementById("namespan");
        //用户名的规则： 昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号
        var reg = /^([\u4e00-\u9fa5]|[a-zA-Z0-9]){1,15}$/i;
        if(reg.test(name)){
            //符合规则
            spanNode.innerHTML = "".fontcolor("green");
            document.getElementById("nameclass").className = "icon ticker";
            return true;
        }else{
            //不符合规则
            spanNode.innerHTML = "昵称长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号".fontcolor("red");
            document.getElementById("nameclass").className = "icon into";
            return false;
        }
    }
    //4 检查手机号正确
    function checkPhone() {
        var phone = document.getElementById("phone").value;
        var spanNode = document.getElementById("phonespan");
        if (isNaN(phone)) {
            spanNode.innerHTML = "手机号码必须为数字".fontcolor("red");
            document.getElementById("phoneclass").className = "icon into";
            return false;
        } else if (phone.length != 11) {
            spanNode.innerHTML = "手机号码长度必须为11位".fontcolor("red");
            document.getElementById("phoneclass").className = "icon into";
            return false;
        } else {
            spanNode.innerHTML = "".fontcolor("green");
            document.getElementById("phoneclass").className = "icon ticker";
            return true;
        }
    }

    function checkAge(){
        var age = document.getElementById("age").value;
        var spanNode = document.getElementById("agespan");
        if (isNaN(age)) {
            spanNode.innerHTML = "年龄必须为数字".fontcolor("red");
            document.getElementById("ageclass").className = "icon into";
            return false;
        } else if(age<1 || age>100){
            spanNode.innerHTML = "年龄必须在1-100之间".fontcolor("red");
            document.getElementById("ageclass").className = "icon into";
            return false;
        }
        else{
            spanNode.innerHTML = "".fontcolor("green");
            document.getElementById("ageclass").className = "icon ticker";
            return true;
        }
    }

    $("#addButton").click(function () {
        var name = checkName();
        var phone = checkPhone();
        var age = checkAge();
        if(name == true && phone == true && age == true){
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
        }
    });
</script>
</body>
</html>