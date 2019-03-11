<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    request.setAttribute("basePath", basePath);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录注册</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" href="css/jigsaw.css">
    <style>

        #msg {
            width: 100%;
            line-height: 40px;
            font-size: 14px;
            text-align: center;
        }
    </style>

    <script>
        function sub() {
            document.getElementById("form").submit();
        }


        function $(id) {
            return document.getElementById(id)
        }

        function check() {
            var boo = $('#r_password').value == $('#r_password1').value;
            if (boo) {
                return true;
            } else {
                alert('用户名密码错误')
            }
        }
    </script>

</head>
<body>
<div class="jq22-container" style="padding-top:100px">
    <div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登陆</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
            <div class="login-form">
                <form id="form" action="LoginController" method="post">
                    <div class="sign-in-htm">
                        <div class="group">
                            <label class="label">账号</label>
                            <input id="l_phoneNum" name="phoneNum" placeholder="手机号" type="text" class="input">
                        </div>
                        <div class="group">
                            <label class="label">密码</label>
                            <input id="l_password" type="password" class="input" name="password">
                        </div>
                        <div class="group">
                            <div class="container">
                                <div id="captcha" style="position: relative"></div>
                                <div id="msg"></div>
                            </div>
                        </div>
                        <div class="group">
                            <input id="check" type="checkbox" class="check" checked>
                            <label for="check"><span class="icon"></span>保持登陆</label>
                        </div>
                        <div class="group">
                            <input type="button" class="button" value="登陆" onClick="sub() ">
                        </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <a href="index">首页</a><br/>
                            <br/>
                            <a href="#forgot">忘记密码?</a>
                        </div>
                    </div>
                </form>
                <form action="RegisterController" id="registerFrom" method="get">
                    <div class="sign-up-htm">
                        <div class="group">
                            <label class="label">用户名</label>
                            <input id="r_name" name="userName" type="text" class="input">
                        </div>
                        <div class="group">
                            <label class="label">密码</label>
                            <input id="r_password" name="password" type="password" class="input"
                                   class="onlyNumAlpha">
                        </div>
                        <div class="group">
                            <label class="label">重复密码</label>
                            <input id="r_password1" name="" type="password" class="input" class="onlyNumAlpha">
                        </div>
                        <div class="group">
                            <label class="label">手机号</label>
                            <input id="r_phone" name="phoneNum" type="text" class="input">
                        </div>
                        <div class="group">
                            <label class="label">年龄</label>
                            <input id="r_age" name="phoneNum" type="text" class="input">
                        </div>
                        <div class="form-group">
                            <label>请选择性别</label>
                            <select id="sex" class="form-control">
                                <option value="1">男</option>
                                <option value="0">女</option>
                            </select>
                        </div>
                        <div class="group">
                            <button type="button" class="button" id="submit" value="注册">注册</button>
                        </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <label for="tab-1">已注册?</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script type="text/javascript">
    function checkPhone(){
        var re = /^1\d{10}$/;
        if(!re.test($("#r_phone").val())){
            alert("请输入正确的手机号");
            return ;
        }
    }

    $("#submit").click(function () {
        var re = /^1\d{10}$/;
        if(!re.test($("#r_phone").val())){
            alert("请输入正确的手机号");
            return ;
        }
        if($("#r_password").val() != $("#r_password1").val()){
            alert("密码不一致，请重新输入");
            return;
        }
        $.ajax({
            url:"RegisterController",
            type:"post",
            data:{
                "userName":$("#r_name").val(),
                "phoneNum":$("#r_phone").val(),
                "password":$("#r_password").val(),
                "sex":$("#sex").val(),
                "age":$("#r_age").val()
            },
            success:function(result){
                window.location.href="${basePath}/index";
            },
            error(e){
                alert(JSON.parse(e));
            }
        });
    });
</script>
</body>
</html>