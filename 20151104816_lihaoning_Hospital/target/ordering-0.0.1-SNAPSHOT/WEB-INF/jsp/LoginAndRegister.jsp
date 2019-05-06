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
                            <br/>
                        </div>
                        <div class="group">
                            <input type="button" class="button" value="登陆" onClick="sub() ">
                        </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <a href="index">首页</a>
                        </div>
                    </div>
                </form>
                <form action="RegisterController" id="registerFrom" method="post" onsubmit="return checkAll()">
                    <div class="sign-up-htm">
                        <input type="hidden" name="form" value="true"/>
                        <div class="group">
                            <input id="r_name" name="userName" type="text" class="input" placeholder="用户名"
                                   maxlength="15"onblur="checkName()" />
                            <a href="#" id="nameclass" class=""> </a>
                            <div class="clear"></div></li>&nbsp;&nbsp;
                            <span  style="font-size:13px" id="namespan"></span>
                        </div>

                        <div class="group">
                            <input id="r_password" name="password" type="password" class="input" placeholder="密码"
                                   maxlength="16" onblur="checkPassword()" />
                            <a href="#" id="passwordclass" class=""></a>
                            <dev class="clear"></dev>&nbsp;&nbsp;
                            <span  style="font-size:13px" id="passwordspan"></span>
                        </div>

                        <div class="group">
                            <input id="r_password1" name="password1" type="password" class="input" placeholder="确认密码"
                                   maxlength="16" onblur="checkSame();"/>
                            <a href="#" id="passwordclass2" class=""></a>
                            <div class="clear"></div></li>&nbsp;&nbsp;
                            <span  style="font-size:13px" id="passwordspan2"></span>
                        </div>

                        <div class="group">
                            <input id="r_phone" name="phoneNum" type="text" class="input" placeholder="手机号"
                                   maxlength="11" />
                            <a href="#" id="phoneclass" class=""></a>
                            <div class="clear"></div></li>&nbsp;&nbsp;
                            <span style="font-size: 13px" id="phonespan"></span>
                        </div>

                        <div class="group">
                            <input id="r_age" name="age" type="text" class="input" placeholder="年龄"
                                   maxlength="11" onblur="checkAge();"/>
                            <a href="#" id="ageclass" class=""></a>
                            <div class="clear"></div></li>&nbsp;&nbsp;
                            <span style="font-size: 13px" id="agespan"></span>
                        </div>

                        <div class="form-group">
                            <label>请选择性别</label>
                            <select id="sex" name="sex" class="form-control">
                                <option value="1">男</option>
                                <option value="0">女</option>
                            </select>
                        </div>
                        <div class="group">
                            &nbsp;&nbsp;
                            <button type="submit" class="button" onClick="checkAll()" value="注册">注册</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    //1.检查用户名
    function checkName(){
        var name = document.getElementById("r_name").value;
        var spanNode = document.getElementById("namespan");
        //用户名的规则： 昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号
        var reg = /^([\u4e00-\u9fa5]|[a-zA-Z0-9]){1,15}$/i;
        if(reg.test(name)){
           ///符合规则
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
        var password = document.getElementById("r_password").value;
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

    //3 检查密码一致
    function checkSame(){
        var password = document.getElementById("r_password").value;
        var password2 = document.getElementById("r_password1").value;
        var spanNode = document.getElementById("passwordspan2");
        //密码的规则： 6-16，包含任意的字母、数字，不可以使用其他符号
        var reg = /^([a-zA-Z0-9]){6,16}$/i;
        //确认密码输入符合规则
        if(reg.test(password2)){
            //符合规则
            if(password==password2){
                spanNode.innerHTML = "正确".fontcolor("green");
                document.getElementById("passwordclass2").className = "icon ticker";
                return true;
            }else{
                spanNode.innerHTML = "两次输入的密码不一致！".fontcolor("red");
                document.getElementById("passwordclass2").className = "icon into";
                return false;
            }
        }
        //确认输入密码不符合规则
        else{
            spanNode.innerHTML = "密码长度为 6-16，包含任意的字母、数字，不可以使用其他符号".fontcolor("red");
            document.getElementById("passwordclass2").className = "icon into";
            return false;
        }
    }

    //4 检查手机号正确
    var aa=0;
    jQuery("#r_phone").blur(function() {
        var phone = document.getElementById("r_phone").value;
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
                url:"${basePath}LoginCheak",
                data:"phoneNum="+phone,
                dataType:"text",
                async:false,
                success:function (data) {
                    //alert(data);
                    if(data == "Flase"){
                        spanNode.innerHTML = "手机号重复".fontcolor("red");
                        document.getElementById("phoneclass").className = "icon into";
                        aa=0;
                    }else{
                        //符合规则
                        spanNode.innerHTML = "可以使用".fontcolor("green");
                        document.getElementById("phoneclass").className = "icon ticker";
                        aa=1
                    }

                }
            });
           /* spanNode.innerHTML = "".fontcolor("green");
            document.getElementById("phoneclass").className = "icon ticker";
            return true;*/
        }
    });

    //5 检查年龄
    function checkAge(){
        var age = document.getElementById("r_age").value;
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
            spanNode.innerHTML = "正确".fontcolor("green");
            document.getElementById("ageclass").className = "icon ticker";
            return true;
        }
    }

    //6 检查用户所有的输入的所有是否符合规则 并提交数据
    function checkAll(){
        var name = checkName();
        var password = checkPassword();
        var same = checkSame();
        var phone =jQuery("#r_phone").blur() ;
        var age = checkAge();
       if(name==true && password==true && same==true && aa==1 && age==true){
           return true;
       }else{
           return false;
       }
    }

    //提交表单
    function sub() {
        document.getElementById("form").submit();
    }


    function $(id) {
        return document.getElementById(id)
    }

    //检查登录密码
    function check() {
        var boo = $('#r_password').value == $('#r_password1').value;
        if (boo) {
            return true;
        } else {
            alert('用户名密码错误')
        }
    }
</script>
</body>
</html>