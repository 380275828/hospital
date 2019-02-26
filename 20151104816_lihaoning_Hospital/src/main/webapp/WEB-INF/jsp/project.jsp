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
            </c:if>
        </ul>
    </div>
</div>
<div class="s_bg">
    <div class="wrap">
        <div class="cont_main">
            <div class="boxes">
                <h2>身体健康检测问卷调查</h2>

                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-5 mt-md-0 mt-5">
                            <div class="tm-site-header-right-col">
                            </div>
                        </div>
                    </div>
                        <div class="row">
                            <c:forEach items="${result}" var="item" varStatus="qId">
                                <div class="col-12">
                                    <h2 class="tm-question-header">问题 ${qId.index+1}</h2>
                                    <p>${item.qName}</p>
                                    <div class="tm-q-choice-container">
                                        <label class="tm-q-choice">
                                            <div class="mb-3">
                                                <input class="tm-radio-group-1 with-gap ${item.qType}" name="${qId.index}" type="radio"
                                                       value="${item.qAnswer.get(0)}"/>
                                                <span>没有</span>
                                            </div>
                                        </label>
                                        <label class="tm-q-choice">
                                            <div class="mb-3">
                                                <input class="tm-radio-group-1 with-gap ${item.qType}" name="${qId.index}" type="radio"
                                                       value="${item.qAnswer.get(1)}"/>
                                                <span>很少</span>
                                            </div>
                                        </label>
                                        <label class="tm-q-choice">
                                            <div class="mb-3">
                                                <input class="tm-radio-group-1 with-gap ${item.qType}" name="${qId.index}" type="radio"
                                                       value="${item.qAnswer.get(2)}"/>
                                                <span>有时</span>
                                            </div>
                                        </label>
                                        <label class="tm-q-choice">
                                            <div class="mb-3">
                                                <input class="tm-radio-group-1 with-gap ${item.qType}" name="${qId.index}" type="radio"
                                                       value="${item.qAnswer.get(3)}"/>
                                                <span>经常</span>
                                            </div>
                                        </label>
                                        <label class="tm-q-choice">
                                            <div class="mb-3">
                                                <input class="tm-radio-group-1 with-gap ${item.qType}" name="${qId.index}" type="radio"
                                                       value="${item.qAnswer.get(4)}"/>
                                                <span>总是</span>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <!-- col-12 -->
                                <div class="col-12">
                                    <hr>
                                </div>
                            </c:forEach>
                            <div class="col-12 text-center tm-submit-container">
                                <button id="submit" class="btn btn-primary tm-btn-submit">提交问卷</button>
                            </div>
                            <div class="col-12">
                                <hr>
                            </div>
                        </div> <!-- row -->
                    <div class="row">
                        <div class="col-12">
                            <footer>
                                <p class="text-center mb-3 tm-footer-text"></p>
                            </footer>
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
                    <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="staff.html">Staff</a></li>
                    <li><a href="project.html">Projects</a></li>
                    <li><a href="contact.html">Contact</a></li>
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    $("#submit").click(function(){
        if($('input[type=radio]:checked').length != ${result.size()}){
            alert("请检查问题是否全部答完");
            return ;
        }
        var qType = [];
        var score = [];
        $.each($('input:radio'),function(){
            if(this.checked){
                var className = $(this).prop("className");
                qType.push(className.split(' ')[2]);
                score.push(parseInt($(this).val()));
            }
        });
        $.ajax({
            url:"${basePath}addScore",
            data:{
                "score":score,
                "qType":qType
            },
            type:'POST',
            success:function(result){
                window.location.href="${basePath}contact";
            },
            error(e){
                alert(e.message);
            }
        });
    });
</script>
</body>
</html>