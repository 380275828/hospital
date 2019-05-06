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
        <li><a href="#">欢迎你${user.userName}</a></li>
        <li><a href="${basePath}admin/loginOut"><span class="glyphicon glyphicon-off"></span>&nbsp;注销</a></li>
    </ul>
</nav>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            添加医生
        </h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label>请输入户名</label>
            <input type="text" class="form-control" id="userName" onblur="checkName()" />
            <a href="#" id="nameclass" class=""> </a>
            <div class="clear"></div></li>&nbsp;&nbsp;
            <span  style="font-size:13px" id="namespan"></span>
        </div>
        <div class="form-group">
            <label>请输入手机号</label>
            <input type="text" class="form-control" id="phone"/>
            <a href="#" id="phoneclass" class=""></a>
            <div class="clear"></div></li>&nbsp;&nbsp;
            <span style="font-size: 13px" id="phonespan"></span>
        </div>
        <div class="form-group">
            <label>请输入密码</label>
            <input type="text" class="form-control" id="passWd" onblur="checkPassword()" />
            <a href="#" id="passwordclass" class=""></a>
            <dev class="clear"></dev>&nbsp;&nbsp;
            <span  style="font-size:13px" id="passwordspan"></span>
        </div>
        <div class="form-group">
            <label>请选择性别</label>
            <select id="sex" class="form-control">
                <option value="1">男</option>
                <option value="0">女</option>
            </select>
        </div>
        <div class="form-group">
            <label>请添加描述</label>
            <input type="text" class="form-control" id="descirbe">
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

<script type="text/javascript">
    //1.检查用户名
    function checkName(){
        var name = document.getElementById("userName").value;
        var spanNode = document.getElementById("namespan");
        //用户名的规则： 昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号
        var reg = /^([\u4e00-\u9fa5]|[a-zA-Z0-9]){1,15}$/i;
        if(reg.test(name)){
            //符合规则
            spanNode.innerHTML = "正确".fontcolor("green");
            document.getElementById("nameclass").className = "icon ticker";
            return true;
        }else{
            //不符合规则
            spanNode.innerHTML = "昵称长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号".fontcolor("red");
            document.getElementById("nameclass").className = "icon into";
            return false;
        }
    }
    //2.检查密码
    function checkPassword(){
        var password = document.getElementById("passWd").value;
        var spanNode = document.getElementById("passwordspan");
        //密码的规则： 6-16，包含任意的字母、数字，不可以使用其他符号
        var reg = /^([a-zA-Z0-9]){6,16}$/i;
        if(reg.test(password)){
            //符合规则
            spanNode.innerHTML = "正确".fontcolor("green");
            document.getElementById("passwordclass").className = "icon ticker";
            return true;
        }else{
            //不符合规则
            spanNode.innerHTML = "密码长度为 6-16，包含任意的字母、数字，不可以使用其他符号".fontcolor("red");
            document.getElementById("passwordclass").className = "icon into";
            return false;
        }
    }

    //4 检查手机号正确
    var aa=0;
    jQuery("#phone").blur(function() {
        var phone = document.getElementById("phone").value;
        var spanNode = document.getElementById("phonespan");
        if (isNaN(phone)) {
            spanNode.innerHTML = "手机号码必须为数字".fontcolor("red");
            document.getElementById("phoneclass").className = "icon into";
            aa=0;
        } else if (phone.length != 11) {
            spanNode.innerHTML = "手机号码长度必须为11位".fontcolor("red");
            document.getElementById("phoneclass").className = "icon into";
            aa=0;
        } else {
            jQuery.ajax({
                url:"${basePath}admin/select",
                data:{"phoneNum":phone},
                async:false,
                success:function (data) {
                    //alert(JSON.stringify(data));
                    if (data == "1") {
                        spanNode.innerHTML = "手机号重复".fontcolor("red");
                        document.getElementById("phoneclass").className = "icon into";
                        aa=0;
                    } else {
                        //符合规则
                        spanNode.innerHTML = "可以使用".fontcolor("green");
                        document.getElementById("phoneclass").className = "icon ticker";
                        aa=1;
                    }
                }
               /* error:function (data) {
                    //alert(JSON.stringify(data)+"11111");

                }*/
            });
            /*spanNode.innerHTML = "".fontcolor("green");
            document.getElementById("phoneclass").className = "icon ticker";
            return true;*/
        }
        return aa;
    });
    jQuery("#addButton").click(function () {
        var name = checkName();
        var phone1 = jQuery("#phone").blur();
        var password1 = checkPassword();
        //alert(aa);
        if(name==true && aa==1 && password1==true){
            var sex = jQuery("#sex").val();
            var userName = jQuery("#userName").val();
            var phone = jQuery("#phone").val();
            var password = jQuery("#passWd").val();
            var describes = jQuery("#descirbe").val();
            //alert(sex+userName+phone+password+describes)
           // var re = /^1\d{10}$/;
            /*if(!re.test(phone)){
                alert("请输入正确的手机号");
                return;
            }*/
            jQuery.ajax({
                url:"${basePath}admin/add_doctor_success",
                data:{
                    "userName":userName,
                    "phone":phone,
                    "password":password,
                    "sex":sex,
                    "describes":describes
                },
                success:function(result){
                    window.location.href="${basePath}admin/doctor";
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