<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath",basePath);
%>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理员登录</title>
    <link rel="stylesheet" type="text/css" href="${basePath}css/styles.css">
    <link rel="stylesheet" href="${basePath}css/jigsaw.css">
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
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab" ><span style="color:rgba(0,0,0,0.6)">管理员登陆</span></label>
            <input id="tab-2" tye="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
            <div class="login-form">
                <form id="form" action="${basePath}admin/logined" method="post">
                    <div class="sign-in-htm">
                        <div class="group">
                            <label class="label">账号</label>
                            <input id="l_phoneNum" name="phone" placeholder="手机号" type="text" class="input">
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
                            <input type="button" class="button" value="登陆" onClick="sub() ">
                        </div>
                        <div class="hr"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${basePath}js/jigsaw.js"></script>

</body>
</html>